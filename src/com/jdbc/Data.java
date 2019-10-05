package com.jdbc;


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
public class Data {
    /**
     * 时间
     */
    public String time;
    /**
     * 功率
     */
    public String power;

    /**
     * 设置时间
     * @param time 时间
     */
    public void setTime(String time){
        this.time = time;
    }

    /**
     * 获取时间
     * @return 时间
     */
    public String getTime(){
        return this.time;
    }

    /**
     * 设置功率
     * @param power 功率
     */
    public void setPower(String power){
        this.power = power;
    }

    /**
     * 获取功率
     * @return 功率
     */
    public String getPower(){
        return this.power;
    }
}
