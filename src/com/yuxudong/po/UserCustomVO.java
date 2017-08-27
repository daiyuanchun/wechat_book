package com.yuxudong.po;

import java.util.List;

public class UserCustomVO {
private List<String> isbnList;
private List<Integer> typeIdList;
private UserCustom userCustom;
public List<String> getIsbnList() {
	return isbnList;
}
public void setIsbnList(List<String> isbnList) {
	this.isbnList = isbnList;
}
public UserCustom getUserCustom() {
	return userCustom;
}
public void setUserCustom(UserCustom userCustom) {
	this.userCustom = userCustom;
}
public List<Integer> getTypeIdList() {
	return typeIdList;
}
public void setTypeIdList(List<Integer> typeIdList) {
	this.typeIdList = typeIdList;
}
}
