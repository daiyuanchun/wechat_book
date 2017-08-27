package com.yuxudong.mapper;

import com.yuxudong.po.Province;
import com.yuxudong.po.UserCustom;

public interface UserMapperCustom {
	public UserCustom findUserByIdAndTel(UserCustom user) throws Exception;
	public void insertUserOfBeforeRegist(UserCustom userCustom)throws Exception;
	public void updateUserOfRegist(UserCustom userCustom)throws Exception;
	public UserCustom selectUserForLogin(UserCustom userCustom)throws Exception;
	public Province selectProvinceById(Integer id)throws Exception;
}
