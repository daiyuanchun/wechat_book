package com.yuxudong.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuxudong.po.Comment;
import com.yuxudong.service.CommentCustomService;

@Controller
public class CommentCustomController {
@Autowired
private CommentCustomService commentCustomService;

@RequestMapping("/insertComment")
public ModelAndView insertComment(HttpServletRequest request)throws Exception{
	String id=request.getParameter("id");
	String tel=request.getParameter("tel");
	String isbn=request.getParameter("isbn");
	String type=request.getParameter("type");
	String name=request.getParameter("name");
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.addObject("id",id);
	modelAndView.addObject("tel",tel);
	modelAndView.addObject("isbn",isbn);
	modelAndView.addObject("type",type);
	modelAndView.addObject("name",name);
	modelAndView.setViewName("comment");
	return modelAndView;
}

@RequestMapping("/insertCommentContext")
public ModelAndView insertCommentContext(HttpServletRequest request)throws Exception{
	String id=request.getParameter("id");
	String tel=request.getParameter("tel");
	String isbn=request.getParameter("isbn");
	String type=request.getParameter("type");
	String name=request.getParameter("name");
	String comment=request.getParameter("commentContext");
	String context=request.getParameter("anonymous");
	Date date=new Date();
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String time=format.format(date);
	Integer anonymous=0;
	if(context==null){
		anonymous=0;
	}else{
		anonymous=Integer.parseInt(context);
	}
	ModelAndView modelAndView=new ModelAndView();
	Comment commentCustom=new Comment();
	commentCustom.setWechatid(id);
	commentCustom.setTel(tel);
	commentCustom.setIsbn(isbn);
	commentCustom.setComment(comment);
	commentCustom.setAnonymous(anonymous);
	commentCustom.setType(type);
	commentCustom.setName(name);
	commentCustom.setTime(time);
	commentCustomService.insertComment(commentCustom);
	modelAndView.addObject("message","success");
	modelAndView.setViewName("comment");
	return modelAndView;
}



}
