package com.yuxudong.service;

import java.util.List;

import com.yuxudong.po.Book;
import com.yuxudong.po.Historysearchrecord;
import com.yuxudong.po.UserCustom;
import com.yuxudong.po.UserCustomVO;

public interface HistorysearchrecordCustomService {
	public void insertHistorysearchrecord(Historysearchrecord record)throws Exception;
	public List<String> selectHistorySearchRecord(UserCustom userCustom)throws Exception;
    public List<Integer> selectTypeIdAccordingIsbnList(UserCustomVO userCustomVO)throws Exception;
    public List<Book> selectBookAccordingTyeIdList(UserCustomVO userCustomVO)throws Exception;
    public void  updateUserRecommendFrequency(UserCustom userCustom)throws Exception;
    public Integer selectUserRecommendFrequency(UserCustom userCustom)throws Exception;
}
