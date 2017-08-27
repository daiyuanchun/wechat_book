package com.yuxudong.util;

public class FileNameUtil {
	
	public static String getRealFileName(String head){
	//head = form-data; name="userImg"; filename="personal-com-01.png"
		return head.substring(head.lastIndexOf("=")+2,head.length()-1);
	}
	
	public static String getFileType(String fileName){
		return fileName.substring(fileName.lastIndexOf("."));
	}
}
