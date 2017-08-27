package com.yuxudong.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;

public class DateTest {

	@Test
	public void test1() throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		String d = "2016-09-01";
		System.out.println(dateFormat.parse(d));
	}
	
}
