package com.jdbc;


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
public class loggingData {
     /**
      * 日志
      */
     private  String log = null;
     /**
      * 机器号
      */
     private  String machineId = null;
     /**
      * 时间
      */
     private  String time = null;

     /**
      * 获取日志信息
      * @return 日志信息
      */
     public String getLog(){return this.log;}

     /**
      * 设置日志信息
      * @param log 日志信息
      */
     public void setLog(String log){this.log = log;}

     /**
      * 获取机器号
      * @return 机器号
      */
     public String getMachineId(){return this.machineId;}

     /**
      * 设置机器号
      * @param machienId 机器号
      */
     public void setMachineId(String machienId){this.machineId = machienId;}

     /**
      * 获取当前时间
      * @return 当前时间
      */
     public String getTime(){return this.time;}

     /**
      * 设置当前时间
      * @param time 当前时间
      */
     public void setTime(String time){this.time = time;}
}
