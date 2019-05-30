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
public class Order {

    private String orderid;
    private String movieTitle;
    private int ordernum;
    private String memberName;
    private String memberEmail;
    private String orderStatus;

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public int getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(int ordernum) {
        this.ordernum = ordernum;
    }
    
    

    
    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }
    
    

    public Order(){}

    public Order(String ID,String title, String email,int ordernum,String status){
        this.orderid = ID;
        this.movieTitle = title;
        this.ordernum = ordernum;
        this.memberEmail = email;
        this.orderStatus = status; 
    }


    @Override
    public String toString(){
        return "id: "+orderid+"| movie's title: "+movieTitle+"| order num: "+ordernum+"| member's name "+memberName+" | member's email "+memberEmail+" | status: "+orderStatus;
    }




}
