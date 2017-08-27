package com.yuxudong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yuxudong.mapper.HistorysearchrecordMapperCustom;
import com.yuxudong.po.Book;
import com.yuxudong.po.Historysearchrecord;
import com.yuxudong.po.UserCustom;
import com.yuxudong.po.UserCustomVO;
import com.yuxudong.service.HistorysearchrecordCustomService;

public class HistorysearchrecordCustomServiceImpl implements HistorysearchrecordCustomService{
@Autowired 
private HistorysearchrecordMapperCustom historysearchrecordMapperCustom;
	@Override
	public void insertHistorysearchrecord(Historysearchrecord record) throws Exception {
		historysearchrecordMapperCustom.insertHistorysearchrecord(record);
	}
	@Override
	public List<String> selectHistorySearchRecord(UserCustom userCustom) throws Exception {
		List<String> historyIsbn=historysearchrecordMapperCustom.selectHistorySearchRecord(userCustom);
		return historyIsbn;
	}
	@Override
	public List<Integer> selectTypeIdAccordingIsbnList(UserCustomVO userCustomVO) throws Exception {
		List<Integer> typeIdList=historysearchrecordMapperCustom.selectTypeIdAccordingIsbnList(userCustomVO);
		return typeIdList;
	}
	@Override
	public List<Book> selectBookAccordingTyeIdList(UserCustomVO userCustomVO) throws Exception {
		List<Book> bookList=historysearchrecordMapperCustom.selectBookAccordingTyeIdList(userCustomVO);
		return bookList;
	}
	@Override
	public void updateUserRecommendFrequency(UserCustom userCustom) throws Exception {
		historysearchrecordMapperCustom.updateUserRecommendFrequency(userCustom);
	}
	@Override
	public Integer selectUserRecommendFrequency(UserCustom userCustom) throws Exception {
	    Integer id=historysearchrecordMapperCustom.selectUserRecommendFrequency(userCustom);
		return id;
	}

}
