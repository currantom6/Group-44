/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms;

/**
 *
 * @author chenyizhe
 */
import java.io.Serializable;
import java.util.Date;

public class Movie implements Serializable{
    private String title;
    private String genre;
    private int price;
    private int rating;
    private int copies;
    private int year;
    private String description;
    private String url;
    
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    

    private boolean status;

    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getCopies() {
        return copies;
    }

    public void setCopies(int copies) {
        this.copies = copies;
    }
    
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Movie(String title,String genre,int price,int rating,int copies,int year,String description,String url){
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.copies = copies;
        this.rating = rating;
        this.year = year;
        this.description = description;
        this.url = url;
        this.status = true;
    }

    public Movie(){}

}
