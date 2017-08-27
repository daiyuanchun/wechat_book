package com.yuxudong.mapper;

import java.util.List;

import com.yuxudong.po.Presetmessageremind;
import com.yuxudong.po.UserCustom;

public interface PresetmessageremindMapperCustom {
	public Integer findRestNumNotEqual0(String isbn)throws Exception;
	public void insertSystemPresetRemind1(Presetmessageremind presetmessageremind)throws Exception;
	public List<Presetmessageremind> selectSystemMessageByUserCustom(UserCustom userCustom)throws Exception;
	
}