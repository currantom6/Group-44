/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.dao;

import java.sql.Connection;

/**
 *
 * @author chenyizhe
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";//replace empty-string with jdbc:derby local host url
    protected String db = "omsdb";//name of the database
    protected String dbuser = "isduser";//db root user
    protected String dbpass = "admin"; //db root password
    protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}
