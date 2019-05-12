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
import javax.xml.bind.Marshaller;
import java.io.File;


public class WriteXml {

    public static String path = null;

    //create member xml
    public boolean writeMembers(Members members){
        try{
            //File file = new File(path+"/test.xml");
            File file = new File(path+"/members.xml");
            JAXBContext context = JAXBContext.newInstance(Members.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.marshal(members,file);
            return true;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return false;
        }
    }
    
    //create staff xml
    public  boolean writeStaffs(Staffs staffs){
        try{
            //File file = new File(path+"/staffs.xml");
            File file = new File(path+"/staffs.xml");
            JAXBContext context = JAXBContext.newInstance(Staffs.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.marshal(staffs,file);
            return true;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return false;
        }
    }
    //create movies xml
    public  boolean writeMovies(Movies movies){
        try{
            //File file = new File(path+"/movies.xml");
            File file = new File(path+"/movies.xml");
            JAXBContext context = JAXBContext.newInstance(Movies.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.marshal(movies,file);
            return true;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return false;
        }
    }
    //create order xml
    public boolean writeOrders(Orders orders){
        try{
            //File file = new File(path+"\\orders.xml");
            File file = new File(path+"/orders.xml");
            JAXBContext context = JAXBContext.newInstance(Orders.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.marshal(orders,file);
            return true;
        }catch (Exception ex){
            System.out.println(ex.toString());
            return false;
        }
    }
    
    

}

