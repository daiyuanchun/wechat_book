package com.yuxudong.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetAfter45Day {
	public static Date getdate(int i)  //获取前后日期 i为正数 向后推迟i天，负数时向前提前i天
	 {
	 Date dat = null;
	 Calendar cd = Calendar.getInstance();
	 cd.add(Calendar.DATE, i);
	 dat = cd.getTime();
	 SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 Timestamp date = Timestamp.valueOf(dformat.format(dat));
	 return date;
	 }
}
