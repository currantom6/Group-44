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
public class Log {
    private String email;
    private String logDate;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogDate() {
        return logDate;
    }

    public void setLogDate(String logDate) {
        this.logDate = logDate;
    }

    public Log(String email, String logDate) {
        this.email = email;
        this.logDate = logDate;
    }

    public Log() {
    }
    
    @Override
    public String toString(){
        return "email: "+email+"| logDate: "+logDate;
    }
}
