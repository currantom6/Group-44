/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xml;

/**
 *
 * @author chenyizhe
 */

import oms.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class ReadXml {

    //public static String pathUrl= "";
    public static String path =null;

    public  Members readMembers(){
        try{
            //File file =  new File(path+"/members.xml");
            File file =  new File(path+"/members.xml");
            if(!file.exists()){
                file.createNewFile();
            }
            Members members;
            JAXBContext context = JAXBContext.newInstance(Members.class);
            Unmarshaller u = context.createUnmarshaller();
            members = (Members)u.unmarshal(file);
            return members;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return null;
        }
    }
    
    public static Staffs readStaffs(){
        try{
            //File file =  new File(path+"/staffs.xml");
            File file =  new File(path+"/staffs.xml");
            if(!file.exists()){
                file.createNewFile();
            }
            Staffs staffs;
            JAXBContext context = JAXBContext.newInstance(Staffs.class);
            Unmarshaller u = context.createUnmarshaller();
            staffs = (Staffs)u.unmarshal(file);
            return staffs;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return null;
        }
    }
    
    public static Movies readMovies(){
        try{
            //File file =  new File(path+"/movies.xml");
            File file =  new File(path+"/movies.xml");
            if(!file.exists()){
                file.createNewFile();
            }
            Movies movies;
            JAXBContext context = JAXBContext.newInstance(Movies.class);
            Unmarshaller u = context.createUnmarshaller();
            movies = (Movies)u.unmarshal(file);
            return movies;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return null;
        }
    }
    // read orders from xml
    public static Orders readOrders(){
        try{
            
            File file =  new File(path+"/orders.xml");
            if(!file.exists()){
                file.createNewFile();
            }
            Orders orders;
            JAXBContext context = JAXBContext.newInstance(Orders.class);
            Unmarshaller u = context.createUnmarshaller();
            orders = (Orders)u.unmarshal(file);
            return orders;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return null;
        }
    }

    

    
}

