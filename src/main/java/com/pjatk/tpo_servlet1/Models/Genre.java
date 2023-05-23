package com.pjatk.tpo_servlet1.Models;

public class Genre {
    public String name;
    public boolean isCurrentlyPopular;

    public Genre(String name, boolean isCurrentlyPopular) {
        this.name = name;
        this.isCurrentlyPopular = isCurrentlyPopular;
    }
}
