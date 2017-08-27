package com.yuxudong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yuxudong.po.Province;
import com.yuxudong.po.Type;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.BookCustomService;
import com.yuxudong.service.UserCustomService;
import com.yuxudong.util.MD5_Encoding;

@Controller
public class UserCustomController {
	@Autowired
	private UserCustomService userCustomService;
	@Autowired
	private BookCustomService bookCustomService;
	
	@RequestMapping("/findUserByIdAndTel")
	public ModelAndView findUserByIdAndTel(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id").trim();
		String tel = request.getParameter("tel").trim();
		String email = request.getParameter("email").trim();
		UserCustom userCustom = new UserCustom();
		userCustom.setId(id);
		userCustom.setTel(tel);
		userCustom.setEmail(email);
		UserCustom userCustom1 = userCustomService.findUserByIdAndTel(userCustom);
		Map<String, String> model = new HashMap<String, String>();
		if (userCustom1 == null) {
			// model.put("success","success");
			userCustomService.insertUserOfBeforeRegist(userCustom);
			model.put("id", id);
			model.put("tel", tel);
			ModelAndView modelAndView = new ModelAndView("regist", model);
			return modelAndView;
		} else {
			model.put("error", "error");
			ModelAndView modelAndView = new ModelAndView("beforeRegist", model);
			return modelAndView;
		}
	}

	@RequestMapping("/insertUserOfBeforeRegist")
	public ModelAndView insertUserOfBeforeRegist(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id").trim();
		String tel = request.getParameter("tel").trim();
		String email = request.getParameter("email").trim();
		UserCustom userCustom = new UserCustom();
		userCustom.setId(id);
		userCustom.setTel(tel);
		userCustom.setEmail(email);
		ModelAndView modelAndView = new ModelAndView();
		userCustomService.insertUserOfBeforeRegist(userCustom);
		modelAndView.addObject("userCustom", userCustom);
		modelAndView.setViewName("regist");
		return modelAndView;

	}

	@RequestMapping("/updateUserOfRegist")
	public ModelAndView updateUserOfRegist(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id").trim();
		String tel = request.getParameter("tel").trim();
		String name = request.getParameter("name").trim();
		String idcard = request.getParameter("idcard").trim();
		MD5_Encoding md5 = new MD5_Encoding();
		String password = request.getParameter("password").trim();
		UserCustom userCustom = new UserCustom();
		userCustom.setId(id);
		userCustom.setTel(tel);
		userCustom.setName(name);
		userCustom.setIdcard(idcard);
		userCustom.setPassword(md5.getMD5ofStr(password));
		ModelAndView modelAndView = new ModelAndView();
		userCustomService.updateUserOfRegist(userCustom);
		modelAndView.setViewName("login");
		return modelAndView;

	}

	@RequestMapping("/selectUserForLogin")
	public String selectUserForLogin(HttpServletRequest request) throws Exception {
		String userType = request.getParameter("user_type").trim();
		String id = request.getParameter("id").trim();
		String tel = request.getParameter("tel").trim();
		String password = request.getParameter("password").trim();
		if (userType.equals("person")) {
			UserCustom userCustom = new UserCustom();
			userCustom.setId(id);
			userCustom.setTel(tel);
			MD5_Encoding md5 = new MD5_Encoding();
			String md5UserPass = md5.getMD5ofStr(password);
			userCustom.setPassword(md5UserPass);
			UserCustom user = userCustomService.selectUserForLogin(userCustom);
			if ((user != null)) {
				List<Province> provinceList = bookCustomService.selectAllProvince();
				HttpSession session = request.getSession();
				Integer idForProvince = user.getProvince();
				Province personProvince = userCustomService.selectProvinceById(idForProvince);
				session.setAttribute("user", user);
				session.setAttribute("provinceList", provinceList);
				session.setAttribute("personProvince", personProvince);
				return  "forward:someBooks.action";
			} else {
				return "login";
			}
		}
		if (userType.equals("mana")){
			if((id.equals("daiyuanchun")) && (tel.equals("17862925489")) && (password.equals("123456"))) {
				List<Type> typeList = bookCustomService.selectAllType();
				List<Province> provinceList = bookCustomService.selectAllProvince();
				HttpSession session = request.getSession();
				session.setAttribute("manager","right");
				session.setAttribute("provinceList", provinceList);
				session.setAttribute("typeList", typeList);
				return "importBookMessage";
			} else {
				return "login";
			}
		} else {
			return "login";
		}
	}
	
	
	//loginForManagerScan
	@RequestMapping("/loginForManagerScan")
	public String loginForManagerScan(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id").trim();
		String tel = request.getParameter("tel").trim();
		String user_id = request.getParameter("user_id").trim();
		String user_tel = request.getParameter("user_tel").trim();
		String password = request.getParameter("password").trim();
		if((id.equals("daiyuanchun")) && (tel.equals("17862925489")) && (password.equals("123456"))) {
			HttpSession session = request.getSession();
			session.setAttribute("manager","right");
			return "redirect:findBorrowRecordForManager.action?id="+user_id+"&tel="+user_tel;
		} else {
			return "loginForManagerScan";
		}
	}
	
	
}
