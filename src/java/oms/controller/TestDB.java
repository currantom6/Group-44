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
import oms.dao.DBManager;
import oms.dao.DBConnector;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class TestDB {
    private static Scanner in = new Scanner(System.in);
    
    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector(); //Create a connection and initialize DB conn-field
            Connection conn = connector.openConnection(); //Get the protected connection instance from DB superclass to share for the application classes
            DBManager db = new DBManager(conn); //DBManger instance provide users with access to CRUD operations
            
            int key = (new Random()).nextInt(999999);
            String ID = "" + key; 
            System.out.print("Member name: ");
            String name = in.nextLine();
            System.out.print("Member birthday: ");
            String birthday = in.nextLine();
            System.out.print("Member email: ");
            String email = in.nextLine();
            System.out.print("Member password: ");
            String password = in.nextLine();
            System.out.print("Member password: ");
            int phone = Integer.parseInt(in.nextLine());
            
            db.addMember(ID,name, birthday, email, password,phone); //This method must be completed in DBManager class
            System.out.println("!!!!!Member is added to the database.");
            connector.closeConnection(); //Professional practice is to close connection to database once operations are finalized
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
