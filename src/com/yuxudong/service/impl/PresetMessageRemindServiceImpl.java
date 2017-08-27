package com.yuxudong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yuxudong.mapper.PresetmessageremindMapperCustom;
import com.yuxudong.po.Presetmessageremind;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.PresetMessageRemindCustomService;

public class PresetMessageRemindServiceImpl implements PresetMessageRemindCustomService{
@Autowired
private  PresetmessageremindMapperCustom presetmessageremindMapperCustom;
	@Override
	public Integer findRestNumNotEqual0(String isbn) throws Exception {
		Integer restNum=presetmessageremindMapperCustom.findRestNumNotEqual0(isbn);
		return restNum;
	}
	@Override
	public void insertSystemPresetRemind1(Presetmessageremind presetmessageremind) throws Exception {
		presetmessageremindMapperCustom.insertSystemPresetRemind1(presetmessageremind);
	}
	@Override
	public List<Presetmessageremind> selectSystemMessageByUserCustom(UserCustom userCustom) throws Exception {
		List<Presetmessageremind> list=presetmessageremindMapperCustom.selectSystemMessageByUserCustom(userCustom);
		return list;
	}

}
