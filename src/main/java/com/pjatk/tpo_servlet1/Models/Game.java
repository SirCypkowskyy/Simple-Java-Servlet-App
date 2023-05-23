package com.pjatk.tpo_servlet1.Models;

public class Game {
    public int gameId;
    public String name;
    public boolean hasMultiplayer;
    public boolean isForAdults;

    public int steamId;
    public Author author;
    public Genre genre;

    public Game(int gameId, String name, boolean hasMultiplayer, boolean isForAdults, int steamId, Author author, Genre genre) {
        this.gameId = gameId;
        this.name = name;
        this.hasMultiplayer = hasMultiplayer;
        this.isForAdults = isForAdults;
        this.author = author;
        this.genre = genre;
        this.steamId = steamId;
    }
}
