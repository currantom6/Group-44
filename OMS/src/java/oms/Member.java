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

public class Member implements Serializable {

    private String ID;
    private String name;
    private String birthday;
    private String email;
    private String password;
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
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


    public Member(String ID,String name,String email,String password,String date,int phone){
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.birthday = date;
        this.phone = phone;
    }

    public Member(){}
}

