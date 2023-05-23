CREATE SCHEMA SERVLET_TPO_1;

create table "Author"
(
    "AuthorId"        serial
        constraint "Author_pk"
            primary key,
    "Name"            varchar(120),
    "IsBiggerCompany" boolean
);

alter table "Author"
    owner to postgres;

create table "Genre"
(
    "GenreId"            serial
        constraint "Genre_pk"
            primary key,
    "Name"               varchar(120),
    "IsCurrentlyPopular" boolean
);

alter table "Genre"
    owner to postgres;

create table "Games"
(
    "GameId"         serial
        constraint "Games_pk"
            primary key,
    "Name"           varchar(120),
    "HasMultiplayer" boolean,
    "IsForAdults"    boolean,
    "AuthorId"       integer
        constraint "AuthorId_FK"
            references "Author",
    "GenreId"        integer
        constraint "GenreId_FK"
            references "Genre",
    "SteamAppId"     integer
);

alter table "Games"
    owner to postgres;

INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (1, 'Guerrilla', true);
INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (2, 'Rockstar Games', true);
INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (3, 'Paradox Interactive', false);
INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (4, 'Dani', false);
INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (5, 'CD Projekt Red', true);
INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (6, 'Electronic Arts', true);
INSERT INTO servlet_tpo_1."Author" ("AuthorId", "Name", "IsBiggerCompany") VALUES (7, 'Naughty Dog', true);

INSERT INTO servlet_tpo_1."Genre" ("GenreId", "Name", "IsCurrentlyPopular") VALUES (1, 'RPG', true);
INSERT INTO servlet_tpo_1."Genre" ("GenreId", "Name", "IsCurrentlyPopular") VALUES (2, 'FPS', false);
INSERT INTO servlet_tpo_1."Genre" ("GenreId", "Name", "IsCurrentlyPopular") VALUES (3, 'Grand Strategy', true);
INSERT INTO servlet_tpo_1."Genre" ("GenreId", "Name", "IsCurrentlyPopular") VALUES (4, 'Battle Royal', true);
INSERT INTO servlet_tpo_1."Genre" ("GenreId", "Name", "IsCurrentlyPopular") VALUES (5, 'Adventure', false);

INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (1, 'Horizon Zero Dawn', false, true, 1151640, 1, 1);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (2, 'Grand Theft Auto V', true, true, 271590, 2, 1);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (3, 'Grand Theft Auto IV', true, true, 12210, 2, 1);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (4, 'Europa Universalis IV', true, false, 236850, 3, 3);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (5, 'Crusader Kings III', true, false, 1158310, 3, 3);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (6, 'KARLSON', true, false, 1228610, 4, 2);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (7, 'Crab Game', true, false, 1782210, 4, 4);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (8, 'Apex Legeneds', true, false, 1172470, 6, 4);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (9, 'Cyberpunk 2077', false, true, 1091500, 5, 1);
INSERT INTO servlet_tpo_1."Games" ("GameId", "Name", "HasMultiplayer", "IsForAdults", "SteamAppId", "AuthorId", "GenreId") VALUES (10, 'The Last of Us Part I', false, true, 1888930, 7, 5);
