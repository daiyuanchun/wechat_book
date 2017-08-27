package com.yuxudong.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuxudong.po.Book;
import com.yuxudong.po.Historysearchrecord;
import com.yuxudong.po.UserCustom;
import com.yuxudong.po.UserCustomVO;
import com.yuxudong.service.HistorysearchrecordCustomService;

@Controller
public class HistorysearchrecordCustomController {
@Autowired
private HistorysearchrecordCustomService historysearchrecordCustomService;

@RequestMapping("/insertHistorysearchrecord")
public String  insertHistorysearchrecord(HttpServletRequest request)throws Exception{
	HttpSession session=request.getSession();
	UserCustom userCustom=(UserCustom) session.getAttribute("user");
	String isbn=request.getParameter("isbn");
	Date time=new Date();
	DateFormat longDateFormat = DateFormat.getDateTimeInstance
       		(DateFormat.LONG,DateFormat.LONG);
	Historysearchrecord historysearchrecord=new Historysearchrecord();
	historysearchrecord.setId(userCustom.getId());
	historysearchrecord.setIsbn(isbn);
	historysearchrecord.setTel(userCustom.getTel());
	historysearchrecord.setTime(longDateFormat.format(time));
	historysearchrecordCustomService.insertHistorysearchrecord(historysearchrecord);
	return "bookMessage";
}
@RequestMapping("/selectHistorySearchRecord")
public ModelAndView  selectHistorySearchRecord(HttpServletRequest request)throws Exception{
	HttpSession session=request.getSession();
	UserCustom userCustom=(UserCustom) session.getAttribute("user");
	List<String> isbnList=historysearchrecordCustomService.selectHistorySearchRecord(userCustom);
    UserCustomVO userCustomVO=new UserCustomVO();
    userCustomVO.setIsbnList(isbnList);
    List<Integer> typeIdList=historysearchrecordCustomService.selectTypeIdAccordingIsbnList(userCustomVO);
    UserCustomVO userCustomVO1=new UserCustomVO();
    userCustomVO1.setTypeIdList(typeIdList);
    List<Book> recommendList=historysearchrecordCustomService.selectBookAccordingTyeIdList(userCustomVO1);
    session.setAttribute("recommendList",recommendList);
    ModelAndView modelAndView=new ModelAndView();
    modelAndView.setViewName("recommend");
    return modelAndView;
}
@RequestMapping("/updateUserRecommendFrequency")
public ModelAndView  updateUserRecommendFrequency(HttpServletRequest request)throws Exception{
	Integer recommentFrequency=Integer.parseInt(request.getParameter("recommendFrequency"));
	HttpSession session=request.getSession();
	UserCustom userCustom=(UserCustom) session.getAttribute("user");
	userCustom.setRecommendfrequency(recommentFrequency);
	historysearchrecordCustomService.updateUserRecommendFrequency(userCustom);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.addObject("updateSuccess", "updateSuccess");
	Integer frequency=historysearchrecordCustomService.selectUserRecommendFrequency(userCustom);
	session.setAttribute("frequency",frequency);
	modelAndView.setViewName("recommend");
	return modelAndView;
}

}
