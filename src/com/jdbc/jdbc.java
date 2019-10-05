package com.jdbc;

import com.jdbc.Data;

import java.io.UnsupportedEncodingException;
import java.sql.*;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */

public class jdbc {

    /**
     * 数据库用户名
     */
	final static String USERNAME = "root";
    /**
     * 数据库密码
     */
	final static String PASSWORD = "";
    /**
     * JDBC驱动
     */
	final static String DRIVER = "com.mysql.jdbc.Driver";
    /**
     * 连接的url
     */
	final static String URL = "jdbc:mysql://localhost:3306/fog?useUnicode=true&characterEncoding=utf8";
    /**
     * jdbc连接
     */
	static Connection connection;

    /**
     * jdbc构造方法，自动连接数据库
     * @throws SQLException
     */
	public jdbc() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Register driver success");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Register driver failure");
		}
		connection=getConnection();
	}

    /**
     * 获取jdbc连接
     * @return jdbc连接
     */
	public static Connection getConnection() {

		try {
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("Connection sucess !");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Connection exception !");
		}

		return connection;

	}

    /**
     * 获取查询机器能耗数据
     * @param sql sql语句
     * @return 机器能耗
     * @throws SQLException
     */
	public static ArrayList<Data> getData(String sql) throws SQLException{
		ArrayList<Data> result = new ArrayList<Data>();
		Statement statement=null;
		statement=connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		Data time  = null;
		while(rs.next()) {
			time= new Data();
			time.time=rs.getString("time");
			time.power=rs.getString("power");

			result.add(time);
		}
		return result;
	}

    /**
     * 查询机器参数
     * @param sql sql语句
     * @return 机器参数
     * @throws SQLException
     */
	public static ArrayList<Canshu> getData_canshu(String sql) throws SQLException{
		ArrayList<Canshu> result = new ArrayList<Canshu>();
		Statement statement=null;
		statement=connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		Canshu c  = null;
		while(rs.next()) {
			c = new Canshu();
			c.n=rs.getString("n");
			c.f=rs.getString("f");
			c.ae = rs.getString("ae");
			c.ap = rs.getString("ap");
			result.add(c);
		}
		return result;
	}

    /**
     * 获取系统日志
     * @param sql sql查询语句
     * @return 系统日志
     * @throws SQLException
     */
	public static ArrayList<loggingData> getDataLog(String sql) throws SQLException{
		ArrayList<loggingData> result = new ArrayList<loggingData>();
		Statement statement=null;
		statement=connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		loggingData c  = null;
		while(rs.next()) {
			c = new loggingData();
			c.setLog(rs.getString("log"));
			c.setMachineId(rs.getString("machineId"));
			c.setTime(rs.getString("time"));
			result.add(c);
		}
		return result;
	}


    /**
     * 插入机器能耗数据
     * @param power 机器能耗
     * @param temp 温度
     * @param hum 湿度
     */
	public void Insert(String power, String temp, String hum){
		int i = 0;
		String sql = "insert into table1 (power,Temperature,Humidity,DATE1) values(  ?,?,?,?)";
		PreparedStatement pstmt;
		try {
			java.util.Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			pstmt = (PreparedStatement) connection.prepareStatement(sql);
			pstmt.setString(1, power);
			pstmt.setString(2, temp);
			pstmt.setString(3, hum);
			pstmt.setString(4, sdf.format(d));
			i = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

    /**
     * 插入实时能耗
     * @param power 实时能耗
     * @param machineId 机器号
     */
	public void InsertRealTimePower(String power, String machineId){
	    int i = 0;
	    String sql = "insert into table"+ machineId +"(power,DATE1) values(?, ?)";
	    PreparedStatement pstmt;
        try {
            java.util.Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            pstmt = (PreparedStatement) connection.prepareStatement(sql);
            pstmt.setString(1, power);
            pstmt.setString(2, sdf.format(d));
			i = pstmt.executeUpdate();
			System.out.println(pstmt);
            pstmt.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 插入日志
     * @param machineId 机器号
     * @param log 日志信息
     */
	public void Insertlog(String machineId, String log){
		int i = 0;

		String sql = "insert into log(machineId, log) values(?, ?)";
		PreparedStatement pstmt;
		try {
			java.util.Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            log.getBytes("utf-8");
			pstmt = (PreparedStatement) connection.prepareStatement(sql);
			pstmt.setString(1, machineId);
			pstmt.setString(2, log);
			System.out.println( pstmt + " " + machineId + " " + log);
			i = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
	}

    /**
     * 插入机器参数
     * @param n 进给率
     * @param f 主轴转速
     * @param ap 切割深度
     * @param ae 切割宽度
     * @param machineId 机器号
     */
    public void InsertMachineParameter(String n, String f, String ap, String ae,String machineId){
        int i = 0;
	    String sql = "insert into canshu"+machineId+"(n, f, ap, ae) values(?, ?, ?, ?)";
        PreparedStatement pstmt;
        try {
            java.util.Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            pstmt = (PreparedStatement) connection.prepareStatement(sql);
            pstmt.setString(1, n);
            pstmt.setString(2, f);
            pstmt.setString(3, ap);
            pstmt.setString(4, ae);
            i = pstmt.executeUpdate();
            pstmt.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
