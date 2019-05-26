/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import oms.*;

/**
 *
 * @author chenyizhe
 * 
 * DBManager is the primary DAO class to interact with the database and perform CRUD operations with the db.
 * Firstly, complete the existing methods and implement them into the application.
 * 
 * So far the application uses the Read and Create operations in the view.
 * Secondly, improve the current view to enable the Update and Delete operations.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    //!!!!! remember single+double quote for String, 
    //!!!!! use only double quote for int
    
//Add a member-data into the database
    public void addMember(String ID, String name, String birthday, String email, String password, int phone) throws SQLException {        
        st.executeUpdate("INSERT INTO MEMBERS VALUES ('"+ID+"','"+name+"','"+email+"','"+password+"','"+birthday+"',"+phone+")");
    }
//Add a staff-data into the database
    public void addStaff(String ID, String name, String email, String password, String birthday, String position, int phone) throws SQLException {        
        st.executeUpdate("INSERT INTO STAFFS VALUES ('"+ID+"','"+name+"','"+email+"','"+password+"','"+birthday+"','"+position+"',"+phone+")");
    }
//Add a movie-data into the database
    public void addMovie(String title, String genre, int price, int rating, int copies, int movieyear, String description, String url) throws SQLException {        
        st.executeUpdate("INSERT INTO MOVIES VALUES ('"+title+"','"+genre+"',"+price+","+rating+","+copies+","+movieyear+",'"+description+"','"+url+"')");
    }
//Add a Logbook-data into the database
    public void addLog(String email, String datestr) throws SQLException {        
        st.executeUpdate("INSERT INTO LOGS VALUES ('"+email+"','"+datestr+"')");
    }
//Add a movie-data into the database
    public void addOrder(String ID, String movieTitle, String memberEmail, int moviePrice, String status) throws SQLException {        
        st.executeUpdate("INSERT INTO ORDERS VALUES ('"+ID+"','"+movieTitle+"','"+memberEmail+"',"+moviePrice+",'"+status+"')");
        //st.executeUpdate("UPDATE MOVIES SET COPIES= "+ copies +" WHERE TITLE='"+ title +"'");
    }

//delete a student from the database
    public void deleteMemberAccount(String email) throws SQLException{
        //code for delete-operation
        st.executeUpdate("DELETE FROM MEMBERS WHERE EMAIL='" + email + "'");
    }
//delete a staff from the database
    public void deleteStaffAccount(String email) throws SQLException{
        //code for delete-operation
        st.executeUpdate("DELETE FROM STAFFS WHERE EMAIL='" + email + "'");
    }
//delete a movie from the database
    public void deleteMovie(String title) throws SQLException{
        //code for delete-operation
        st.executeUpdate("DELETE FROM MOVIES WHERE TITLE='" + title + "'");
    }
//delete a movie from the database
    public void deleteLog(String logdate) throws SQLException{
        //code for delete-operation
        st.executeUpdate("DELETE FROM LOGS WHERE LOGDATE='" + logdate + "'");
    }
    
//update a member details in the database
    public void updateMember(String email, String name, String password, String birthday, int phone) throws SQLException {
        //code for update-operation
        st.executeUpdate("UPDATE MEMBERS SET NAME= '"+ name +"',PASSWORD= '"+ password +"',BIRTHDAY = '"+ birthday+"',PHONE = "+ phone +" WHERE EMAIL='"+ email +"'");
    }
//update a staff details in the database
    public void updateStaff(String email, String name, String password, String birthday, int phone) throws SQLException {
        //code for update-operation
        st.executeUpdate("UPDATE STAFFS SET NAME= '"+ name +"',PASSWORD= '"+ password +"',BIRTHDAY = '"+ birthday+"',PHONE = "+ phone +" WHERE EMAIL='"+ email +"'");
    }
//update a movie details in the database
    public void updateMovie(String title, String genre, int price, int rating, int copies, int movieyear, String description, String url) throws SQLException {        
        st.executeUpdate("UPDATE MOVIES SET GENRE= '"+ genre +"',PRICE= "+ price +",RATING= "+ rating +",COPIES= "+ copies +",MOVIEYEAR= "+ movieyear +",DESCRIPTION= '"+ description +"',URL= '"+ url +"' WHERE TITLE='"+ title +"'");
    }
//update a movie details in the database
    public void cancelOrder(String title, String status) throws SQLException {        
        st.executeUpdate("UPDATE ORDERS SET STATUS= '"+ status +"' WHERE MOVIETITLE='"+ title +"'");
    }
    

//Login - Find member by ID in the database
    public Member findMember(String email, String password) throws SQLException {
        Member member;
        //setup the select sql query string
        String sql = "SELECT * FROM MEMBERS WHERE EMAIL='"+ email +"' AND PASSWORD ='"+ password +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
            String ID = rs.getString("id");
            String name = rs.getString("name");
            String birthday = rs.getString("birthday");
            int phone = rs.getInt("PHONE");
            
            //return member with correct values
            return member = new Member(ID,name,email,password,birthday,phone);
        }
        
        return null;
    }
    //admin staff can edit member
    public Member editMember(String email) throws SQLException {
        Member member;
        //setup the select sql query string
        String sql = "SELECT * FROM MEMBERS WHERE EMAIL='"+ email +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
            String ID = rs.getString("id");
            String name = rs.getString("name");
            String password = rs.getString("PASSWORD");
            String birthday = rs.getString("birthday");
            int phone = rs.getInt("PHONE");
            
            //return member with correct values
            return member = new Member(ID,name,email,password,birthday,phone);
        }
        
        return null;
    }
//Login - Find staff by ID in the database
    public Staff findStaff(String email, String password) throws SQLException {
        Staff staff;
        //setup the select sql query string
        String sql = "SELECT * FROM STAFFS WHERE EMAIL='"+ email +"' AND PASSWORD ='"+ password +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
            String ID = rs.getString("id");
            String name = rs.getString("name");
            String birthday = rs.getString("birthday");
            String position = rs.getString("position");
            int phone = rs.getInt("PHONE");
            
            //return member with correct values
            return staff = new Staff(ID,name,email,password,birthday,position,phone);
        }
        
        return null;
    }
    //find movie by title
    public Movie findMovie(String title) throws SQLException {
        Movie movie;
        //setup the select sql query string
        String sql = "SELECT * FROM MOVIES WHERE TITLE='"+ title +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
           String genre = rs.getString("genre");
            int price = rs.getInt("PRICE");
            int rating = rs.getInt("RATING");
            int copies = rs.getInt("COPIES");
            int movieyear = rs.getInt("MOVIEYEAR");
            String des = rs.getString("DESCRIPTION");
            String url = rs.getString("URL");
            
            //return movie with correct values
            return movie = new Movie(title,genre,price,rating,copies,movieyear,des,url);
        }
        
        return null;
    }
    
    //check - check member in the database
    public Member checkMember(String email) throws SQLException {
        Member member;
        //setup the select sql query string
        String sql = "SELECT * FROM MEMBERS WHERE EMAIL='"+ email +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
            String ID = rs.getString("id");
            String name = rs.getString("name");
            String password = rs.getString("password");
            String birthday = rs.getString("birthday");
            int phone = rs.getInt("PHONE");
            
            //return member with correct values
            return member = new Member(ID,name,email,password,birthday,phone);
        }
        
        return null;
    }
    //check - check movie in the database
    public Movie checkMovie(String title) throws SQLException {
        Movie movie;
        //setup the select sql query string
        String sql = "SELECT * FROM MOVIES WHERE TITLE='"+ title +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
            String genre = rs.getString("genre");
            int price = rs.getInt("PRICE");
            int rating = rs.getInt("RATING");
            int copies = rs.getInt("COPIES");
            int movieyear = rs.getInt("MOVIEYEAR");
            String des = rs.getString("DESCRIPTION");
            String url = rs.getString("URL");
            
            //return movie with correct values
            return movie = new Movie(title,genre,price,rating,copies,movieyear,des,url);
        }
        
        return null;
    }
    //check - check staff in the database
    public Staff checkStaff(String email) throws SQLException {
        Staff staff;
        //setup the select sql query string
        String sql = "SELECT * FROM STAFFS WHERE EMAIL='"+ email +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            
            //retrieve other key details (ID and password already collected from parameters)
            String ID = rs.getString("id");
            String name = rs.getString("name");
            String password = rs.getString("password");
            String birthday = rs.getString("birthday");
            String position = rs.getString("POSITION");
            int phone = rs.getInt("PHONE");
            
            //return staff with correct values
            return staff = new Staff(ID,name,email,password,birthday,position,phone);
        }
        
        return null;
    }
    
    
    
//List all movies from movie list
    public List<Movie> listAllMovies() throws SQLException {
        List<Movie> listMovie = new ArrayList<>();
         
        String sql = "SELECT * FROM MOVIES";
         
        ResultSet rs = st.executeQuery(sql);
         
        while (rs.next()) {
            String title = rs.getString("TITLE");
            String genre = rs.getString("genre");
            int price = rs.getInt("PRICE");
            int rating = rs.getInt("RATING");
            int copies = rs.getInt("COPIES");
            int movieyear = rs.getInt("MOVIEYEAR");
            String des = rs.getString("DESCRIPTION");
            String url = rs.getString("URL");
            
            Movie movie = new Movie(title,genre,price,rating,copies,movieyear,des,url);
            listMovie.add(movie);
        }
         
        return listMovie;
    }
//List all orders from movie list
    public List<Order> listAllOrders(String email) throws SQLException {
        List<Order> listOrder = new ArrayList<>();
         
        String sql = "SELECT * FROM ORDERS WHERE MEMBEREMAIL ='"+ email +"'";
         
        ResultSet rs = st.executeQuery(sql);
         
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String title = rs.getString("MOVIETITLE");
            int price = rs.getInt("MOVIEPRICE");
            String status = rs.getString("STATUS");
            
            Order order = new Order(ID,title,email,price,status);
            listOrder.add(order);
        }
        return listOrder;
    }
 //Search - Find movie by title and genre in the database
    public List<Movie> findMovies(String title, String genre) throws SQLException {
        Movies movies;
        List<Movie> findMovies = new ArrayList<>();
        //setup the select sql query string
        String sql = "SELECT * FROM MOVIES WHERE TITLE ='"+ title +"' OR GENRE ='"+ genre +"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            //retrieve other key details (already collected from parameters)
            //String title = rs.getString("TITLE");
            String vtitle = rs.getString("TITLE");
            String vgenre = rs.getString("GENRE");
            int price = rs.getInt("PRICE");
            int rating = rs.getInt("RATING");
            int copies = rs.getInt("COPIES");
            int movieyear = rs.getInt("MOVIEYEAR");
            String des = rs.getString("DESCRIPTION");
            String url = rs.getString("URL");
            
            //return movie with correct values
            Movie movie = new Movie(vtitle,vgenre,price,rating,copies,movieyear,des,url);
            findMovies.add(movie);
        }
        
        return findMovies;
    }
//Search - Find member  in the database
    public List<Member> findMembers(String name, String ID) throws SQLException {
        Members members;
        List<Member> findMembers = new ArrayList<>();
        //setup the select sql query string
        String sql = "SELECT * FROM MEMBERS WHERE NAME ='"+ name +"' OR ID = '"+ID+"'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(sql); 
        //search the ResultSet for a student using the parameters
        while (rs.next()) { //rs.next() moves cursor to next row (if any)
            //retrieve other key details (already collected from parameters)
            String mID = rs.getString("ID");
            String mname = rs.getString("NAME");
            String email = rs.getString("EMAIL");
            String password = rs.getString("PASSWORD");
            String birthday = rs.getString("birthday");
            int phone = rs.getInt("phone");
            
            //return movie with correct values
            Member member = new Member(mID,mname,email,password,birthday,phone);
            findMembers.add(member);
        }
        return findMembers;
    }
//List all orders from movie list
    public List<Log> listAllLogs(String email) throws SQLException {
        List<Log> listLog = new ArrayList<>();
         
        String sql = "SELECT * FROM LOGS WHERE EMAIL ='"+ email +"'";
         
        ResultSet rs = st.executeQuery(sql);
         
        while (rs.next()) {
            String logdate = rs.getString("LOGDATE");
            
            Log log = new Log(email,logdate);
            listLog.add(log);
        }
        return listLog;
    }
    //List all movies from movie list
    public List<Member> listAllMembers() throws SQLException {
        List<Member> listMember = new ArrayList<>();
         
        String sql = "SELECT * FROM MEMBERS";
         
        ResultSet rs = st.executeQuery(sql);
         
        while (rs.next()) {
            String ID = rs.getString("ID");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String password = rs.getString("password");
            String birthday = rs.getString("birthday");
            int phone = rs.getInt("PHONE");
            
            Member member = new Member(ID, name, email,password,birthday,phone);
            listMember.add(member);
        }
         
        return listMember;
    }
    

}

