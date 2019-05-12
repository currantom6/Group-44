/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

/**
 *
 * @author chenyizhe
 */

import oms.*;
import xml.ReadXml;
import xml.WriteXml;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Util {

    //login
    public static Object login(String email,String password){
        Member m = getMemberbyEmail(email);
        if (m!= null ) {
            if (m.getPassword().equals(password)){
                return m;
            }else {
                return "password is wrong";
            }
        }
        Staff s = getStaffbyEmail(email);
        if (s!=null){
            if (s.getPassword().equals(password)){
                return s;
            }else {
                return "password is wrong";
            }
        }
        return "The user does not exist";
    }
    // get member by email
    public static Member getMemberbyEmail(String email){
        Members members =  new ReadXml().readMembers();
        if (members != null && members.getMemberList().size() >= 0){
            for(Member m: members.getMemberList()){
                if (m.getEmail().equals(email)){
                    return m;
                }
            }
        }
        return null;
    }
    
    // get staff by email
    public static Staff getStaffbyEmail(String email){
        Staffs staffs = ReadXml.readStaffs();
        if (staffs != null && staffs.getStaffList().size() > 0){
            for (Staff s:staffs.getStaffList()){
                if (s.getEmail().equals(email)){
                    return s;
                }
            }
        }
        return null;
    }
    
    // get all movies
    public static List<Movie> getMovie(String title, String genre, int price, int rating, int year, Boolean status,String url){
        Movies movies = ReadXml.readMovies();
        if (movies == null){
            return null;
        }
        if (title == null && genre == null && status == null && price == 0 && rating == 0 && year == 0){
            return movies.getMovieList();
        }else {
            List<Movie> movieList = new ArrayList<Movie>();
            for (Movie o:movies.getMovieList()){
                if (title != null && !title.equals(o.getTitle())){
                    continue;
                }
                if (genre != null && !genre.equals(o.getGenre())){
                    continue;
                }
                if (price != 0 && price != o.getPrice()){
                    continue;
                }
                if (rating != 0 && rating != o.getRating()){
                    continue;
                }
                if (year != 0 && year != o.getYear()) {
                    continue;
                }
                if (status != null && status != o.isStatus()){
                    continue;
                }
                if (url != null && !url.equals(o.getUrl())){
                    continue;
                }
                movieList.add(o);
            }
            return movieList;
        }
    }
    
    //edit member by name, password
    public static void editMember(String email,String name,String password){
        Members members =  new ReadXml().readMembers();
        if (members != null && members.getMemberList().size() >= 0){
            for(Member m: members.getMemberList()){
                if (m.getEmail().equals(email)){
                    if (name != null)
                        m.setName(name);
                    if (password != null)
                        m.setPassword(password);
                    break;
                }
            }
            new WriteXml().writeMembers(members);
        }
    }
    
    //edit staff by name, password
    public static void editStaff(String email,String name,String password){
        Staffs staffs = ReadXml.readStaffs();
        if (staffs != null && staffs.getStaffList().size() > 0){
            for (Staff s:staffs.getStaffList()){
                if (s.getEmail().equals(email)){
                     if (name != null){
                         s.setName(name);
                     }
                     if (password != null){
                         s.setPassword(password);
                     }
                     break;
                }
            }
            new WriteXml().writeStaffs(staffs);
        }
    }
    //delete member account
    public static String deleteMemberAccount(String email){
        // delete account while also set 'active' status as 'cancelled'
        Orders orders = ReadXml.readOrders();
        if (orders != null){
            for (Order order:orders.getOrderList()){
                if (order.getOrderStatus().equals(OrderStatus.active) && order.getMemberEmail().equals(email)){
                    cancelOrder(email,order.getMovieTitle());
                }
            }
        }
        
        Members members =  new ReadXml().readMembers();
        Member member = null;
        if (members != null){
            for(Member m:members.getMemberList()){
                if (m.getEmail().equals(email)){
                    member = m;
                    break;
                }
            }
            if (member != null){
                members.getMemberList().remove(member);
                new WriteXml().writeMembers(members);
                return "Sucess";
            }
        }
        return "Fail";
    }
    //delete staff account
    public static String deleteStaffAccount(String email){
        
        Staffs staffs =  ReadXml.readStaffs();
        Staff staff = null;
        if (staffs != null){
            for(Staff s:staffs.getStaffList()){
                if (s.getEmail().equals(email)){
                    staff = s;
                    break;
                }
            }
            if (staff != null){
                staffs.getStaffList().remove(staff);
                new WriteXml().writeStaffs(staffs);
                return "Sucess";
            }
        }
        return "Fail";
    }
    
    //create a book
    public static boolean createOrder(String memberEmail,String movieTitle){
        Movies movies = ReadXml.readMovies();
        Members members =  new ReadXml().readMembers();
        if (movies == null || members == null || movies.getMovieList().size()==0 || members.getMemberList().size()==0){
            return false;
        }else {
            Movie v  = null;
            Member m = null;
            for(Movie movie:movies.getMovieList()){
                if (movie.getTitle().equals(movieTitle) && movie.isStatus()){
                    v = movie;
                    break;
                }
            }
            for(Member member:members.getMemberList()){
                if (member.getEmail().equals(memberEmail)){
                    m = member;
                    break;
                }
            }
            if (m==null || v==null){
                return false;
            }else {
                v.setStatus(false);
                new WriteXml().writeMovies(movies);
                Orders orders = ReadXml.readOrders();
                if (orders == null){
                    orders = new Orders();
                    orders.setOrderList(new ArrayList<Order>());
                }
                oms.Order order = new oms.Order(orders.getOrderList().size()+1,m,v);
                orders.getOrderList().add(order);
                new WriteXml().writeOrders(orders);
                return true;
            }
        }
    }
    
    //cancel book
    public static boolean cancelOrder(String memberEmail,String movieTitle){
        Movies movies = ReadXml.readMovies();
        Members members =  new ReadXml().readMembers();
        if (movies == null || members == null || movies.getMovieList().size()==0 || members.getMemberList().size()==0) {
            return false;
        }else {
            Movie v  = null;
            Member m = null;
            for(Movie movie:movies.getMovieList()){
                if (movie.getTitle().equals(movieTitle)){
                   v = movie;
                    break;
                }
            }
            for(Member member:members.getMemberList()){
                if (member.getEmail().equals(memberEmail)){
                    m = member;
                    break;
                }
            }
            if (m==null || v==null){
                return false;
            }else {
                v.setStatus(true);
                new WriteXml().writeMovies(movies);
                Orders orders = ReadXml.readOrders();
                if (orders==null){
                    orders = new Orders();
                    orders.setOrderList(new ArrayList<Order>());
                }
                for(Order order:orders.getOrderList()){
                    if (order.getMovieTitle().equals(v.getTitle()) && order.getMemberEmail().equals(m.getEmail()) && order.getOrderStatus().equals(OrderStatus.active)){
                        order.setOrderStatus(OrderStatus.cancelled);
                        break;
                    }
                }
                new WriteXml().writeOrders(orders);
                return true;
            }
        }
    }
    
    //view all orders - member
    public static List<Order> getAllOrdersMember(String memberEmail){
        Orders orders = ReadXml.readOrders();
        if (orders == null || orders.getOrderList().size()==0){
            return null;
        }else {
            List<Order> orderList = new ArrayList<Order>();
            for(oms.Order order : orders.getOrderList()){
                if (order.getMemberEmail().equals(memberEmail)){
                    orderList.add(order);
                }
            }
            return orderList;
        }
    }

    
 }


