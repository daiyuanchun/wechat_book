package com.yuxudong.mapper;

import com.yuxudong.po.UserCustom;

public interface PersonInformationMapper {
	public void updatePersonImage(UserCustom userCustom)throws Exception;
	public void updatePersonBasicMessage(UserCustom userCustom)throws Exception;
	public void updatePassword(UserCustom userCustom)throws Exception;
	public void updateTel(UserCustom userCustom)throws Exception;
}
