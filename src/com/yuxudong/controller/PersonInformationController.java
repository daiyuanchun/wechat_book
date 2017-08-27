package com.yuxudong.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yuxudong.po.Province;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.PersonInformationService;
import com.yuxudong.service.UserCustomService;
import com.yuxudong.util.MD5_Encoding;

@Controller
public class PersonInformationController {
	@Autowired
	private PersonInformationService personInformationService;
	@Autowired
	private UserCustomService userCustomService;

	@RequestMapping("/updatePersonImage")
	public ModelAndView updatePersonImage(HttpServletRequest request, MultipartFile upimg) throws Exception {
		String id = request.getParameter("idForImg");
		String tel = request.getParameter("telForImg");
		UserCustom userCustom = new UserCustom();
		userCustom.setId(id);
		userCustom.setTel(tel);
		// 原始名称
		String originalFilename = upimg.getOriginalFilename();
		// 上传图片
		if (upimg != null && originalFilename != null && originalFilename.length() > 0) {
			// 存储图片的物理路径(我一开始写成了D:\\picture,然后一直报错！！！！！)
			String pic_path = "D:\\picture\\";
			// 新的图片名称
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			// 新图片
			File newFile = new File(pic_path + newFileName);
			// 将内存中的数据写入磁盘
			upimg.transferTo(newFile);
			// 将新图片名称写到itemsCustom中
			userCustom.setImage(newFileName);
		}
		personInformationService.updatePersonImage(userCustom);
		UserCustom user = userCustomService.findUserByIdAndTel(userCustom);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("personInformation");
		return modelAndView;
	}
	
	@RequestMapping("/updatePersonBasicMessage")
	public ModelAndView updatePersonBasicMessage(HttpServletRequest request) throws Exception {
		String email = request.getParameter("email").trim();
		String id = request.getParameter("idForProvince");
		String tel = request.getParameter("telForProvince");
		Integer province = Integer.parseInt(request.getParameter("personProvince"));
		String sex = request.getParameter("sex");
		String major = request.getParameter("major").trim();
		String qq = request.getParameter("qq").trim();
		UserCustom userCustom=new UserCustom();
		userCustom.setId(id);
		userCustom.setEmail(email);
		userCustom.setTel(tel);
		userCustom.setProvince(province);
		userCustom.setSex(sex);
		userCustom.setMajor(major);
		userCustom.setQq(qq);
		personInformationService.updatePersonBasicMessage(userCustom);
		
		UserCustom user = userCustomService.findUserByIdAndTel(userCustom);
		Integer provinceId=user.getProvince();
		Province province1=userCustomService.selectProvinceById(provinceId);
		String province2=province1.getProvince();
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setAttribute("province2", province2);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("personInformation");
		return modelAndView;
	}
	
	@RequestMapping("/updatePassword")
	public ModelAndView updatePassword(HttpServletRequest request) throws Exception {
		String id=request.getParameter("id");
		String tel=request.getParameter("tel");
		String password=request.getParameter("password");
		String newPassword=request.getParameter("newpssword");
		String repassword=request.getParameter("repassword");
		UserCustom userCustom=new UserCustom();
		userCustom.setId(id);
		userCustom.setTel(tel);
		UserCustom user1 = userCustomService.findUserByIdAndTel(userCustom);
		String md5Password=user1.getPassword();
		MD5_Encoding md5 = new MD5_Encoding();
		if(newPassword==repassword){
		if((md5.getMD5ofStr(password)).equals(md5Password)){
			userCustom.setPassword(md5.getMD5ofStr(newPassword));
			personInformationService.updatePassword(userCustom);
		}else{
			System.out.println("您输入的旧密码不正确！");
		}
		}else{
			System.out.println("新密码和确认密码不一致！");
		}
		UserCustom user = userCustomService.findUserByIdAndTel(userCustom);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("personInformation");
		return modelAndView;
	}
	@RequestMapping("/updateTel")
	public ModelAndView updateTel(HttpServletRequest request) throws Exception {
		String id=request.getParameter("id");
		String tel=request.getParameter("tel");
		String password=request.getParameter("password").trim();
		String myTel=request.getParameter("tel").trim();
		String newTel=request.getParameter("newTel").trim();
		UserCustom userCustom=new UserCustom();
		userCustom.setId(id);
		userCustom.setTel(tel);
		UserCustom user2 = userCustomService.findUserByIdAndTel(userCustom);
		String md5Password=user2.getPassword();
		MD5_Encoding md5 = new MD5_Encoding();
		if(myTel==tel){
		if((md5.getMD5ofStr(password)).equals(md5Password)){
			userCustom.setNewTel(newTel);
			personInformationService.updateTel(userCustom);
		}else{
			System.out.println("您输入的账号密码不正确！");
		}
		}else{
			System.out.println("您输入的旧手机号不正确！");
		}
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("personInformation");
		return modelAndView;
	}
	
}
