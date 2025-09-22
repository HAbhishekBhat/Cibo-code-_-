/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

/**
 *
 * @author User
 */
public class Meal {
    private String date;
    private String recipe;
    private String time;

    public Meal(String date, String recipe, String time) {
        this.date = date;
        this.recipe = recipe;
        this.time = time;
    }

    // Getters
    public String getDate() { return date; }
    public String getRecipe() { return recipe; }
    public String getTime() { return time; }
}
