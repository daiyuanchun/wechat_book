package com.yuxudong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuxudong.po.Book;
import com.yuxudong.po.Presetmessageremind;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.BookCustomService;
import com.yuxudong.service.PresetMessageRemindCustomService;

@Controller
public class SystemRemindController {
	@Autowired
	private PresetMessageRemindCustomService presetMessageRemindCustomService;
	@Autowired
	private BookCustomService bookCustomService;

	@RequestMapping("/insertSystemPresetRemind")
	public ModelAndView findUserByIdAndTel(HttpServletRequest request) throws Exception {
		String isbn = request.getParameter("isbn");
		HttpSession session = request.getSession();
		UserCustom userCustom = (UserCustom) session.getAttribute("user");
		String wechatId = userCustom.getId();
		String tel = userCustom.getTel();
		Presetmessageremind presetmessageremind = new Presetmessageremind();
		presetmessageremind.setIsbn(isbn);
		presetmessageremind.setWechatid(wechatId);
		presetmessageremind.setTel(tel);
		presetMessageRemindCustomService.insertSystemPresetRemind1(presetmessageremind);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("success", "success");
		modelAndView.setViewName("presetForm");
		return modelAndView;
	}
    
	//有书提醒
	@RequestMapping("/findRestNumNotEqual0")
	public ModelAndView findRestNumNotEqual0(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserCustom userCustom = (UserCustom) session.getAttribute("user");
		List<Presetmessageremind> list = presetMessageRemindCustomService.selectSystemMessageByUserCustom(userCustom);
		Integer size = list.size();
		List<Book> booksListOfSystemRemind = new ArrayList<Book>();
		for (int i = 0; i < size; i++) {
			Presetmessageremind presetmessageremind = list.get(i);
			String isbn = presetmessageremind.getIsbn();
			Integer restNumForSystemMessage = presetMessageRemindCustomService.findRestNumNotEqual0(isbn);
			if (restNumForSystemMessage > 0) {
				Book book = bookCustomService.findBookByISBN(isbn);
				booksListOfSystemRemind.add(book);
			}
		}
		if(booksListOfSystemRemind.size()>0){
			session.setAttribute("systemOfPreset","have");
		}
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("booksListOfSystemRemind", booksListOfSystemRemind);
		modelAndView.setViewName("systemRemind");
		return modelAndView;
	}
	
	
}
