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

public class Staff {
    
    private String ID;
    private String name;
    private String email;
    private String password;
    private String birthday;
    private String position;
    private int phone;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    

    public Staff(String ID,String name,String email,String password,String date,String position,int phone){
        this.ID = ID;
        this.name = name;
        this.password =password;
        this.email = email;
        this.birthday = date;
        this.position = position;
        this.phone = phone;
    }

    public Staff(){}

}

