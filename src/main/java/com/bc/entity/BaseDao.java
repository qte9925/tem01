package com.bc.entity;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class BaseDao {
	public static Date setDate(String time){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		Date date = null;
	    try {
			date = sdf.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return date;
	}
	public static Date getDate(){
		Date date = new Date();//当前日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ds = sdf.format(date);
		Date dd=null;
		try {
			dd = sdf.parse(ds);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dd;
	}
	public static Timestamp getNewDate(){
		Date date = new Date();//当前日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ds = sdf.format(date);
		Date dd=null;
		try {
			dd = sdf.parse(ds);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp Time= new Timestamp(dd.getTime());
		return Time;
	}
}
