package com.yuxudong.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.yuxudong.mapper.UserMapperCustom;
import com.yuxudong.po.Province;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.UserCustomService;

public class UserCustomServiceImpl implements UserCustomService {
	@Autowired
	private UserMapperCustom userMapperCustom;
	
	@Override
	public UserCustom findUserByIdAndTel(UserCustom user) throws Exception {
		UserCustom userCustom = userMapperCustom.findUserByIdAndTel(user);
		return userCustom;
	}

	@Override
	public void insertUserOfBeforeRegist(UserCustom userCustom) throws Exception {
		userMapperCustom.insertUserOfBeforeRegist(userCustom);
	}

	@Override
	public void updateUserOfRegist(UserCustom userCustom) throws Exception {
		userMapperCustom.updateUserOfRegist(userCustom);
	}

	@Override
	public UserCustom selectUserForLogin(UserCustom userCustom) throws Exception {
		UserCustom userCustom1=userMapperCustom.selectUserForLogin(userCustom);
		return userCustom1;
	}

	@Override
	public Province selectProvinceById(Integer id) throws Exception {
		Province province=userMapperCustom.selectProvinceById(id);
		return province;
	}

	

	
}

