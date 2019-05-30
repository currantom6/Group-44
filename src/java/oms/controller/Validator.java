/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.controller;

/**
 *
 * @author chenyizhe
 */
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator implements Serializable{
    private String emailPattern = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";   
    private String namePattern = "^[a-zA-Z]+(([\\'\\,\\.\\- ][a-zA-Z ])?[a-zA-Z]*)*$";    
    private String passwordPattern = "^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$";   
    private String IDPattern = "[0-9]{5,6}"; 
    private String phonePattern = "^\\d{9}$";
    //positive integer
    private String moviePattern = "^\\d+$";
    //rating score less than 10
    private String ratingPattern = "^([0-9]|10)";
   
    public Validator(){}
    
    public boolean validate(String pattern, String input){
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }    
    public boolean checkEmpty(String email, String password){
        return  email.isEmpty() || password.isEmpty();
    }
    public boolean validateEmail(String email){                
        return validate(emailPattern,email);
    } 
    public boolean validateID(String ID){                
        return validate(IDPattern,ID);
    } 
    public boolean validateName(String name){        
        return validate(namePattern,name);
    }    
    public boolean validatePassword(String password){        
        return validate(passwordPattern,password);
    }
    public boolean validatePhone(String phone){        
        return validate(phonePattern,phone);
    }
    public boolean validateMovie(String movie){        
        return validate(moviePattern,movie);
    }   
    public boolean validateMovieRating(String rating){        
        return validate(ratingPattern,rating);
    }  
    
    
}