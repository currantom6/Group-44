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

    private int orderid;
    private String movieTitle;
    private int moviePrice;
    private String memberName;
    private String memberEmail;
    private OrderStatus orderStatus;

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }
    
    public int getMoviePrice() {
        return moviePrice;
    }

    public void setMoviePrice(int moviePrice) {
        this.moviePrice = moviePrice;
    }   

    
    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }
    
    

    public Order(){}

    public Order(int id,Member m,Movie o){
        this.orderid = id;
        this.movieTitle = o.getTitle();
        this.moviePrice = o.getPrice();
        this.memberName = m.getName();
        this.memberEmail = m.getEmail();
        this.orderStatus = OrderStatus.active; 
    }


    @Override
    public String toString(){
        return "id: "+orderid+"| movie's title: "+movieTitle+"| movie Price: "+moviePrice+"| member's name "+memberName+" | member's email "+memberEmail+" | status: "+orderStatus;
    }




}
