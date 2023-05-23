package com.pjatk.tpo_servlet1.Services;

import com.pjatk.tpo_servlet1.Models.Author;
import com.pjatk.tpo_servlet1.Models.Game;
import com.pjatk.tpo_servlet1.Models.Genre;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DatabaseService {
    private Connection connection;
    public static DatabaseService instance = DatabaseService.createInstance("jdbc:postgresql://localhost:5432/postgres", "postgres", "soSecure");

    private DatabaseService(Connection connection) {
        this.connection = connection;
    }

    public static DatabaseService createInstance(String connection, String username, String password) {
        if(instance != null)
            throw new RuntimeException("DatabaseService instance already exists!");

        try {
            Class.forName("org.postgresql.Driver");
            instance = new DatabaseService(DriverManager.getConnection(connection, username, password));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return instance;
    }
    public Connection getConnection() {
        return connection;
    }

    public ArrayList<Game> getGames(String sortByVal, String gameName, String gameAuthor, String gameGenre, String companySize, String[] additionalSettings) {
        var games = new ArrayList<Game>();
        boolean sortByName = false, sortByAuthor = false, sortByGenre = false;

        var query = "SELECT \"Games\".\"GameId\", \"Games\".\"Name\", \"Games\".\"HasMultiplayer\", \"Games\".\"IsForAdults\", A.\"AuthorId\", G.\"GenreId\", A.\"Name\" AS Author, A.\"IsBiggerCompany\" as IsAuthorBiggerCompany, G.\"Name\" AS Genre, G.\"IsCurrentlyPopular\" AS IsCurrentlyPopular, \"Games\".\"SteamAppId\" as SteamId FROM \"Games\" INNER JOIN \"Author\" A on A.\"AuthorId\" = \"Games\".\"AuthorId\" INNER JOIN \"Genre\" G on G.\"GenreId\" = \"Games\".\"GenreId\"";

        var useANDinsteadOfWHERE = false;
        if(companySize.equals("indie"))
        {
            query += " WHERE A.\"IsBiggerCompany\" = false";
            useANDinsteadOfWHERE = true;
        }
        else if(companySize.equals("corpo"))
        {
            query += " WHERE A.\"IsBiggerCompany\" = true";
            useANDinsteadOfWHERE = true;
        }

        if(gameName != null && !gameName.isEmpty())
            if(useANDinsteadOfWHERE)
                query += " AND \"Games\".\"Name\" LIKE ?";
            else
            {
                query += " WHERE \"Games\".\"Name\" LIKE ?";
                useANDinsteadOfWHERE = true;
            }

        if(gameAuthor != null && !gameAuthor.isEmpty())
            if(useANDinsteadOfWHERE)
                query += " AND A.\"Name\" LIKE ?";
            else
            {
                query += " WHERE A.\"Name\" LIKE ?";
                useANDinsteadOfWHERE = true;
            }

        if(gameGenre != null && !gameGenre.isEmpty())
            if(useANDinsteadOfWHERE)
                query += " AND G.\"Name\" LIKE ?";
            else
            {
                query += " WHERE G.\"Name\" LIKE ?";
                useANDinsteadOfWHERE = true;
            }

        if(additionalSettings != null)
        {
            var additionalSettingsToArrayList = new ArrayList<String>();
            for(var x : additionalSettings)
                additionalSettingsToArrayList.add(x);

            if(!(additionalSettingsToArrayList.contains("onlymultiplayer") && additionalSettingsToArrayList.contains("onlysingleplayer")))
            {
                if (additionalSettingsToArrayList.contains("onlymultiplayer"))
                {
                    if (useANDinsteadOfWHERE)
                        query += " AND \"Games\".\"HasMultiplayer\" = true";
                    else
                    {
                        query += " WHERE \"Games\".\"HasMultiplayer\" = true";
                        useANDinsteadOfWHERE = true;
                    }
                }
                else if (additionalSettingsToArrayList.contains("onlysingleplayer"))
                {
                    if (useANDinsteadOfWHERE)
                        query += " AND \"Games\".\"HasMultiplayer\" = false";
                    else
                    {
                        query += " WHERE \"Games\".\"HasMultiplayer\" = false";
                        useANDinsteadOfWHERE = true;
                    }
                }
            }

            if(!(additionalSettingsToArrayList.contains("onlytrending") && additionalSettingsToArrayList.contains("onlyniche")))
            {
                if(additionalSettingsToArrayList.contains("onlytrending"))
                {
                    if(useANDinsteadOfWHERE)
                        query += " AND G.\"IsCurrentlyPopular\" = true";
                    else
                    {
                        query += " WHERE G.\"IsCurrentlyPopular\" = true";
                        useANDinsteadOfWHERE = true;
                    }
                }
                else if(additionalSettingsToArrayList.contains("onlyniche"))
                {
                    if(useANDinsteadOfWHERE)
                        query += " AND G.\"IsCurrentlyPopular\" = false";
                    else
                    {
                        query += " WHERE G.\"IsCurrentlyPopular\" = false";
                        useANDinsteadOfWHERE = true;
                    }
                }
            }

            if(!(additionalSettingsToArrayList.contains("onlyadult") && additionalSettingsToArrayList.contains("onlynonadult")))
            {
                if(additionalSettingsToArrayList.contains("onlyadult"))
                {
                    if(useANDinsteadOfWHERE)
                        query += " AND \"Games\".\"IsForAdults\" = true";
                    else
                    {
                        query += " WHERE \"Games\".\"IsForAdults\" = true";
                        useANDinsteadOfWHERE = true;
                    }
                }
                else if(additionalSettingsToArrayList.contains("onlynonadult"))
                {
                    if(useANDinsteadOfWHERE)
                        query += " AND \"Games\".\"IsForAdults\" = false";
                    else
                    {
                        query += " WHERE \"Games\".\"IsForAdults\" = false";
                        useANDinsteadOfWHERE = true;
                    }
                }
            }
        }

        if(sortByVal.equals("name"))
            query += " ORDER BY \"Games\".\"Name\"";
            // sortByName = true;
        else if(sortByVal.equals("author"))
            query += " ORDER BY A.\"Name\"";
            // sortByAuthor = true;
        else if(sortByVal.equals("genre"))
            query += " ORDER BY G.\"Name\"";
            // sortByGenre = true;
        else
            throw new RuntimeException("Invalid sortByVal value!");


        try (var statement = connection.createStatement())
        {
            statement.execute("SET search_path TO servlet_tpo_1;");

            var index = 1;
            var preparedStatement = connection.prepareStatement(query);
            if(gameName != null && !gameName.isEmpty())
                preparedStatement.setString(index++, "%" + gameName + "%");

            if(gameAuthor != null && !gameAuthor.isEmpty())
                preparedStatement.setString(index++, "%" + gameAuthor + "%");

            if(gameGenre != null && !gameGenre.isEmpty())
                preparedStatement.setString(index++, "%" + gameGenre + "%");

            var result = preparedStatement.executeQuery();

            while(result.next())
            {
                var game = new Game(
                        result.getInt("GameId"),
                        result.getString("Name"),
                        result.getBoolean("HasMultiplayer"),
                        result.getBoolean("IsForAdults"),
                        result.getInt("SteamId"),
                        new Author(
                                result.getString("Author"),
                                result.getBoolean("IsAuthorBiggerCompany")
                        ),
                        new Genre(
                                result.getString("Genre"),
                                result.getBoolean("IsCurrentlyPopular")
                        )
                );

                games.add(game);
            }

            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return games;
    }

}
