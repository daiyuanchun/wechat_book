package com.yuxudong.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.yuxudong.mapper.PersonInformationMapper;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.PersonInformationService;

public class PersonInformationServiceImpl implements PersonInformationService {
	@Autowired
	private PersonInformationMapper personInformationMapper;

	@Override
	public void updatePersonImage(UserCustom userCustom) throws Exception {
		personInformationMapper.updatePersonImage(userCustom);
	}

	@Override
	public void updatePersonBasicMessage(UserCustom userCustom) throws Exception {
		personInformationMapper.updatePersonBasicMessage(userCustom);
	}

	@Override
	public void updatePassword(UserCustom userCustom) throws Exception {
		personInformationMapper.updatePassword(userCustom);
	}

	@Override
	public void updateTel(UserCustom userCustom) throws Exception {
		personInformationMapper.updateTel(userCustom);
	}
}
