package com.jdbc;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
public class Canshu {
    /**
     * 数控机床参数：进给率
     */
    public String n;
    /**
     * 数控机床参数：转速
     */
    public String f;
    /**
     * 数控机床参数：切割深度
     */
    public String ap;
    /**
     * 数控机床参数：切割宽度
     */
    public String ae;

    /**
     * 设置进给率
     * @param n 进给率
     */
    public void setN(String n){
        this.n = n;
    }


    /**
     * 获取进给率
     */
    public String getN(){
        return this.n;
    }

    /**
     * 设置主轴转速
     * @param f 主轴转速
     */
    public void setF(String f){
        this.f = f;
    }

    /**
     * 获取主轴转速
     */
    public String getF(){
        return this.f;
    }

    /**
     * 设置切割深度
     * @param ap 切割深度
     */
    public void setAp(String ap){
        this.ap = ap;
    }

    /**
     * 获取进切割深度
     */
    public String getAp(){
        return this.ap;
    }

    /**
     * 设置切割宽度
     * @param ae 切割宽度
     */
    public void setAe(String ae){
        this.ae = ae;
    }

    /**
     * 获取切割宽度
     */
    public String getAe() {
        return this.ae;
    }

    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        System.out.println(sdf.format(new Date(new File("G:\\a.txt").lastModified())));
    }
}
