package com.yuxudong.service;

import java.util.List;

import com.yuxudong.po.Presetmessageremind;
import com.yuxudong.po.UserCustom;

public interface PresetMessageRemindCustomService {
	public Integer findRestNumNotEqual0(String isbn)throws Exception;
	public void insertSystemPresetRemind1(Presetmessageremind presetmessageremind)throws Exception;
	public List<Presetmessageremind> selectSystemMessageByUserCustom(UserCustom userCustom)throws Exception;
	
}