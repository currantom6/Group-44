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
import oms.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@XmlRootElement(name="logs")
public class Logs {
    private List<Log> logList;

    public List<Log> getLogList() {
        return logList;
    }

    public void setLogList(List<Log> logList) {
        this.logList = logList;
    }

}
