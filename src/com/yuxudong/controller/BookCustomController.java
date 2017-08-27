package com.yuxudong.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yuxudong.po.Book;
import com.yuxudong.po.BorrowingrecordCustom;
import com.yuxudong.po.Comment;
import com.yuxudong.po.Preset;
import com.yuxudong.po.Province;
import com.yuxudong.po.SearchVO;
import com.yuxudong.po.Type;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.BookCustomService;
import com.yuxudong.service.CommentCustomService;
import com.yuxudong.util.GetAfter45Day;
import com.yuxudong.util.MD5_Encoding;
import com.yuxudong.util.QRCode;
import com.yuxudong.util.UUIDUtil;

@Controller
public class BookCustomController {
	@Autowired
	private BookCustomService bookCustomService;
	@Autowired
	private CommentCustomService commentCustomService;
	
	@RequestMapping("/searchVOBook")
	public ModelAndView searchVOBook(HttpServletRequest request) throws Exception {
		SearchVO searchVO = new SearchVO(1, null, null, null, 0);
		if (request.getParameter("typeId") != null && !"-1".equals(request.getParameter("typeId"))) {
			int typeId = Integer.parseInt(request.getParameter("typeId"));
			searchVO.setTypeId(typeId);
		}
		if (request.getParameter("provinceId") != null && !"-1".equals(request.getParameter("provinceId"))) {
			int provinceId = Integer.parseInt(request.getParameter("provinceId"));
			searchVO.setProvinceId(provinceId);
		}
		if (request.getParameter("cityId") != null && !"-1".equals(request.getParameter("cityId"))) {
			int cityId = Integer.parseInt(request.getParameter("cityId"));
			searchVO.setCityId(cityId);
		}
		List<Type> typeList = bookCustomService.selectAllType();
		List<Province> provinceList = bookCustomService.selectAllProvince();
		ModelAndView modelAndView = new ModelAndView();

		// 分页
		long recordCount = bookCustomService.getBooksCount(searchVO);
		Integer pageCount = (int) ((recordCount - 1) / 5 + 1);
		if (request.getParameter("page") != null && !"1".equals(request.getParameter("page"))) {
			// 当前用户有指定页码
			Integer page = Integer.parseInt(request.getParameter("page"));
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			searchVO.setPage(page);
			searchVO.setStartPos((page - 1) * 5);
		}
		// 保存了分页的数据
		modelAndView.addObject("recordCount", recordCount);
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.addObject("page", searchVO.getPage());

		System.out.println("pageCount:" + pageCount + "???????????????????????????");
		System.out.println("recordCount:" + recordCount + "???????????????????????????");
		List<Book> bookList = bookCustomService.searchVOBook(searchVO);
		modelAndView.addObject("typeList", typeList);
		modelAndView.addObject("provinceList", provinceList);
		modelAndView.addObject("bookList", bookList);
		modelAndView.setViewName("searchBookByType");
		return modelAndView;
	}

	@RequestMapping("/someBooks")
	public ModelAndView someBooks(HttpServletRequest request) throws Exception {
		List<Book> someBooks = bookCustomService.selectSome();
		long num = someBooks.size();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("someBooks", someBooks);
		modelAndView.addObject("num", num);
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@RequestMapping("/searchBookByKeywords")
	public ModelAndView searchBookByKeywords(HttpServletRequest request) throws Exception {
		String str = request.getParameter("search").trim();
		List<Book> someBooks = bookCustomService.searchBookByKeywords(str);
		long num = someBooks.size();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("someBooks", someBooks);
		modelAndView.addObject("num", num);
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@RequestMapping("/bookAllMessage")
	public String bookAllMessage(HttpServletRequest request) throws Exception {
		String isbn = request.getParameter("isbn");
		Book book = bookCustomService.findBookByISBN(isbn);
		List<Comment> commentList=commentCustomService.findCommentByIsbn(isbn);
		HttpSession session = request.getSession();
		session.setAttribute("book", book);
		session.setAttribute("commentList",commentList);
		return "forward:insertHistorysearchrecord.action";
	}

	@RequestMapping("/importBooks")
	public ModelAndView importBooks(HttpServletRequest request, MultipartFile catalog, MultipartFile cover,
			MultipartFile miniature, MultipartFile QRCode) throws Exception {
		String isbn = request.getParameter("isbn").trim();
		String name = request.getParameter("name").trim();
		String allname = request.getParameter("allname").trim();
		String title = request.getParameter("title").trim();
		String author = request.getParameter("author").trim();
		String press = request.getParameter("press").trim();// 出版社
		String version = request.getParameter("version").trim();
		Integer typeId = Integer.parseInt(request.getParameter("typeId").trim());
		Integer provinceId = Integer.parseInt(request.getParameter("provinceId").trim());
		String city = request.getParameter("city").trim();
		Integer cityId = Integer.parseInt(request.getParameter("cityId").trim());
		String sequence = request.getParameter("sequence").trim();
		String content = request.getParameter("content").trim();
		String guidance = request.getParameter("guidance").trim();
		Integer number = Integer.parseInt(request.getParameter("number").trim());
		Integer flag = Integer.parseInt(request.getParameter("flag").trim());
		Book book = new Book();
		book.setIsbn(isbn);
		book.setAuthor(author);
		book.setAllname(allname);
		book.setCity(city);
		book.setCityid(cityId);
		book.setContent(content);
		book.setFlag(flag);
		book.setGuidance(guidance);
		book.setName(name);
		book.setNumber(number);
		book.setRestnum(number);
		book.setPress(press);
		book.setProvinceid(provinceId);
		book.setSequence(sequence);
		book.setTitle(title);
		book.setTypeid(typeId);
		book.setVersion(version);
		// 上传图片

		// 原始名称    
		String originalFilename1 = catalog.getOriginalFilename();
		// 上传文件
		if (catalog != null && originalFilename1 != null && originalFilename1.length() > 0) {
			// 存储文件的物理路径(我一开始写成了D:\\picture,然后一直报错！！！！！)
			String pic_path1 = "D:\\catalog\\";
			// 新的文件名称
			String newFileName1 = UUID.randomUUID() + originalFilename1.substring(originalFilename1.lastIndexOf("."));
			// 新文件
			File newFile1 = new File(pic_path1 + newFileName1);
			// 将内存中的数据写入磁盘
			catalog.transferTo(newFile1);
			// 将新图片名称写到itemsCustom中
			book.setCatalog(newFileName1);
		}

		// 原始名称
		String originalFilename2 = cover.getOriginalFilename();
		// 上传图片
		if (cover != null && originalFilename2 != null && originalFilename2.length() > 0) {
			// 存储图片的物理路径(我一开始写成了D:\\picture,然后一直报错！！！！！)
			String pic_path2 = "D:\\cover\\";
			// 新的图片名称
			String newFileName2 = UUID.randomUUID() + originalFilename2.substring(originalFilename2.lastIndexOf("."));
			// 新图片
			File newFile2 = new File(pic_path2 + newFileName2);
			// 将内存中的数据写入磁盘
			cover.transferTo(newFile2);
			// 将新图片名称写到BOOK中
			book.setCover(newFileName2);
		}

		String originalFilename3 = miniature.getOriginalFilename();
		if (miniature != null && originalFilename3 != null && originalFilename3.length() > 0) {
			String pic_path3 = "D:\\miniature\\";
			String newFileName3 = UUID.randomUUID() + originalFilename3.substring(originalFilename3.lastIndexOf("."));
			File newFile3 = new File(pic_path3 + newFileName3);
			miniature.transferTo(newFile3);
			book.setMiniature(newFileName3);
		}
		String originalFilename4 = QRCode.getOriginalFilename();
		if (QRCode != null && originalFilename4 != null && originalFilename4.length() > 0) {
			String pic_path4 = "D:\\QRCode\\";
			String newFileName4 = UUID.randomUUID() + originalFilename4.substring(originalFilename4.lastIndexOf("."));
			File newFile4 = new File(pic_path4 + newFileName4);
			QRCode.transferTo(newFile4);
			book.setQrcode(newFileName4);
		}
		bookCustomService.importBooks(book);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("importBookMessage");
		return modelAndView;
	}

	@RequestMapping("/selectRelevantBook")
	public ModelAndView selectRelevantBook(HttpServletRequest request) throws Exception {
		String typeId1 = request.getParameter("typeId");
		Integer typeId = Integer.parseInt(typeId1);
		List<Book> relevantBookList = bookCustomService.selectRelevantBook(typeId);
		Integer num = relevantBookList.size();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("relevantBookList", relevantBookList);
		modelAndView.addObject("num", num);
		modelAndView.setViewName("relevantBooks");
		return modelAndView;
	}

	@RequestMapping("/insertPreset")
	public ModelAndView insertPreset(HttpServletRequest request) throws Exception {
		String isbn = request.getParameter("isbn");
		String type=request.getParameter("type");
		String title = request.getParameter("title");
		String cover=request.getParameter("cover");
		String position=request.getParameter("position");
	    String id=request.getParameter("id");
	    String tel=request.getParameter("tel");
	    String author=request.getParameter("author");
		String password = request.getParameter("password");
		String idCard = request.getParameter("idCard").trim();
		String name = request.getParameter("name").trim();
		String getTime = request.getParameter("getTime").trim();
		HttpSession session=request.getSession();
		UserCustom user = (UserCustom) session.getAttribute("user");
		ModelAndView modelAndView = new ModelAndView();
		MD5_Encoding md5 = new MD5_Encoding();
		String md5UserPass = md5.getMD5ofStr(password);
		if ((user.getPassword()).equals(md5UserPass)) {
			if ((user.getIdcard()).equals(idCard) && (user.getName()).equals(name)) {
				Date date = new Date();
				Preset preset = new Preset();
				preset.setIsbn(isbn);
				preset.setTel(tel);
				preset.setTitle(title);
				preset.setCover(cover);
				preset.setType(type);
				preset.setPosition(position);
				preset.setWechatid(id);
				preset.setPresettime(date);
				preset.setGettime(getTime);
				preset.setAuthor(author);
				bookCustomService.insertPreset(preset);
				Integer restnum=bookCustomService.selectRestNumByIsbn(isbn);
				if(restnum<=0){
				modelAndView.addObject("message",0);
				}else{
				restnum=restnum-1;
				Book book=new Book();
				book.setIsbn(isbn);
				book.setRestnum(restnum);
				bookCustomService.addOrReduceRestNumByIsbn(book);
				modelAndView.addObject("presetMessage", "success");
				}
			} else {
				modelAndView.addObject("presetMessage", "error");
			}
		} else {
			modelAndView.addObject("presetMessage", "passwordError");
		}
		modelAndView.setViewName("presetForm");
		return modelAndView;
	}

	// 借书
	@RequestMapping("/findBookandinsertBorrowBook")
	public ModelAndView findBookByIsbnForBorrowBook(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		UserCustom userCustom = (UserCustom) session.getAttribute("user");
		// 检查用户是否存在
		if (userCustom == null) {
			// 用户未登录
			modelAndView.addObject("borrowBookMessage", "notLogin");
			modelAndView.setViewName("login");
		} else {
			// 取出当天的借书记录，不能超过两本
			BorrowingrecordCustom record = new BorrowingrecordCustom();
			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			record.setBorrowtime(format.format(date));
			record.setFlag(0);
			record.setWechatid(userCustom.getId());
			record.setTel(userCustom.getTel());
			List<BorrowingrecordCustom> todayRecordForNum = bookCustomService.findTodayBorrowBookRecord(record);
			if (todayRecordForNum.size() == 2) {
				modelAndView.addObject("borrowBookMessage", "beyondNum");
				modelAndView.setViewName("borrowBook");
				List<BorrowingrecordCustom> todayRecord = bookCustomService.findTodayBorrowBookRecord(record);
				modelAndView.addObject("todayRecord", todayRecord);
			} else {
				// 检查用户是否预订此图书
				String id = request.getParameter("id").trim();
				Preset preset = new Preset();
				preset.setIsbn(id);
				preset.setTel(userCustom.getTel());
				preset.setWechatid(userCustom.getId());
				Integer count = bookCustomService.selectPresetForBorrowBook(preset);
				if (count == 0) {
					modelAndView.addObject("borrowBookMessage", "no"); // 用户未预订此书
					modelAndView.setViewName("borrowBook");
				} else {
					Book borrowBook = bookCustomService.findBookByISBN(id);
					// 录入借阅记录
					BorrowingrecordCustom borrowingrecordCustom = new BorrowingrecordCustom();
					borrowingrecordCustom.setIsbn(borrowBook.getIsbn());
					borrowingrecordCustom.setName(borrowBook.getName());
					borrowingrecordCustom.setNum(borrowBook.getNumber());
					borrowingrecordCustom.setAuthor(borrowBook.getAuthor());
					borrowingrecordCustom.setCover(borrowBook.getCover());
					borrowingrecordCustom.setPosition(borrowBook.getProvince().getProvince() + borrowBook.getCity());
					borrowingrecordCustom.setType(borrowBook.getType().getType());
					borrowingrecordCustom.setBorrowtime(format.format(date));
					borrowingrecordCustom.setFlag(0);
					borrowingrecordCustom.setReturntime(GetAfter45Day.getdate(45));
					borrowingrecordCustom.setTel(userCustom.getTel());
					borrowingrecordCustom.setWechatid(userCustom.getId());
					borrowingrecordCustom.setUuid(UUIDUtil.getUUID());
					bookCustomService.insertBorrowingrecord(borrowingrecordCustom);
					List<BorrowingrecordCustom> todayRecord = bookCustomService.findTodayBorrowBookRecord(record);
					modelAndView.addObject("todayRecord", todayRecord);
				}
				modelAndView.setViewName("borrowBook");
			}
		}

		return modelAndView;
	}

	// 删除借书记录
	@RequestMapping("/deleteBorrowRecord")
	public ModelAndView deleteBorrowRecord(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		String isbn = request.getParameter("isbn");
		String uuid = request.getParameter("uuid");
		BorrowingrecordCustom borrowingrecordCustom = new BorrowingrecordCustom();
		borrowingrecordCustom.setWechatid(id);
		borrowingrecordCustom.setTel(tel);
		borrowingrecordCustom.setIsbn(isbn);
		borrowingrecordCustom.setUuid(uuid);
		bookCustomService.deleteBorrowRecord(borrowingrecordCustom);
		BorrowingrecordCustom record = new BorrowingrecordCustom();
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		record.setBorrowtime(format.format(date));
		record.setFlag(0);
		record.setWechatid(id);
		record.setTel(tel);
		ModelAndView modelAndView = new ModelAndView();
		List<BorrowingrecordCustom> todayRecord = bookCustomService.findTodayBorrowBookRecord(record);
		modelAndView.addObject("todayRecord", todayRecord);
		modelAndView.setViewName("borrowBook");
		return modelAndView;
	}

	// 删除预订记录,并生成用户的借书二维码
	@RequestMapping("/deletePresetRecord")
	public ModelAndView deletePresetRecord(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		UserCustom user = (UserCustom) session.getAttribute("user");
		List<String> borrowIsbnList=bookCustomService.selectBorrowrecordISBN(user);
		List<String> presetIsbnList=bookCustomService.selectPresetISBN(user);
		int borrowIsbnSize=borrowIsbnList.size();
		int presetIsbnSize=presetIsbnList.size();
		for(int i=0;i<presetIsbnSize;i++){
			String presetIsbn=presetIsbnList.get(i);
			for(int j=0;j<borrowIsbnSize;j++){
				String borrowIsbn=borrowIsbnList.get(j);
				if(!(presetIsbn.equals(borrowIsbn))){
					Integer restnum=bookCustomService.selectRestNumByIsbn(presetIsbn);
				    restnum=restnum+1;
				    Book book=new Book();
				    book.setIsbn(presetIsbn);
				    book.setRestnum(restnum);
				    bookCustomService.addOrReduceRestNumByIsbn(book);
				}
			}
		}
		Preset preset = new Preset();
		preset.setWechatid(user.getId());
		preset.setTel(user.getTel());
		bookCustomService.deletePresetRecord(preset);
		QRCode.createQRCode(user);
		modelAndView.setViewName("myBorrowBookQrcode");
		return modelAndView;
	}

	// 管理员通过自己的管理app的扫码功能扫描用户出示的二维码调出用户的借书单
	@RequestMapping("/findBorrowRecordForManager")
	public ModelAndView findBorrowRecordForManager(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		String message=(String)session.getAttribute("manager");
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		if(message!=null&&message.equals("right")){
		BorrowingrecordCustom borrowingrecordCustom = new BorrowingrecordCustom();
		borrowingrecordCustom.setWechatid(id);
		borrowingrecordCustom.setTel(tel);
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		borrowingrecordCustom.setBorrowtime(format.format(date));
		borrowingrecordCustom.setFlag(0);
		List<BorrowingrecordCustom> todayRecordOfUser = bookCustomService.findTodayBorrowBookRecord(borrowingrecordCustom);
		modelAndView.addObject("todayRecordOfUser", todayRecordOfUser);
		modelAndView.addObject("id",id);
		modelAndView.addObject("tel",tel);
		modelAndView.addObject("borrowTime",format.format(date));
		modelAndView.setViewName("borrowBookRecordForManager");
		}else{
			modelAndView.addObject("borrowBookMessage","notLogin");
			modelAndView.addObject("user_id", id);
			modelAndView.addObject("user_tel", tel);
			modelAndView.setViewName("loginForManagerScan");
		}
		return modelAndView;
	}

	@RequestMapping("/selectBorrowRecordForReturnBooks")
	public ModelAndView  selectBorrowRecordForReturnBooks(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		String borrowTime = request.getParameter("borrowTime");
		BorrowingrecordCustom recordForReturn=new BorrowingrecordCustom();
		recordForReturn.setWechatid(id);
		recordForReturn.setTel(tel);
		recordForReturn.setBorrowtime(borrowTime);
		List<BorrowingrecordCustom> borrowRecord=bookCustomService.selectBorrowRecordForReturnBooks(recordForReturn);
	    for(int i=0;i<borrowRecord.size();i++){
	    	BorrowingrecordCustom record=borrowRecord.get(i);
	        Date returnTime=record.getReturntime();
	        Date endDate = new Date();
	        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        long day=0;
	        if(endDate.getTime()-returnTime.getTime()>0){
			day=(endDate.getTime()-returnTime.getTime())/(24*60*60*1000);
	        }
			System.out.println("相隔的天数="+day);
			Double pay=day*0.2;  //图书逾期，每册每天收取0.2元。
			BorrowingrecordCustom borrowingrecordCustom=new BorrowingrecordCustom();
			borrowingrecordCustom.setRealtime(format.format(endDate));
			borrowingrecordCustom.setPay(pay);
			borrowingrecordCustom.setFlag(1);
			borrowingrecordCustom.setWechatid(id);
			borrowingrecordCustom.setTel(tel);
			bookCustomService.returnBooks(borrowingrecordCustom);
	    }
	    UserCustom userCustom=new UserCustom();
	    userCustom.setId(id);
	    userCustom.setTel(tel);
	    List<BorrowingrecordCustom> borrowRecordForReturnBooks=bookCustomService.selectNotPay(userCustom);
	    if(borrowRecordForReturnBooks.size()==0){
	    	modelAndView.addObject("length",0);
	    }
	    modelAndView.addObject("borrowRecordForReturnBooks", borrowRecordForReturnBooks);
	    modelAndView.setViewName("returnBook_PayMessage");
	    return modelAndView;
	}
	
	//当加载个人中心时，查找用户的预订订单和借书订单
	@RequestMapping("/presetAndBorrowMessage")
	public ModelAndView  presetAndBorrowMessage(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		UserCustom userCustom=(UserCustom) session.getAttribute("user");
		List<Preset> presetList=bookCustomService.presetMessage(userCustom);
		List<BorrowingrecordCustom> borrowList=bookCustomService.borrowMessage(userCustom);
		session.setAttribute("presetList",presetList);
		session.setAttribute("borrowList",borrowList);
		modelAndView.setViewName("personInformation");
		return modelAndView;
	}
	
	//用户点击取消预定时，删除对应的一条预订记录
	@RequestMapping("/deleteOnePreset")
	public String  deleteOnePreset(HttpServletRequest request) throws Exception {
		String isbn=request.getParameter("isbn");
		HttpSession session=request.getSession();
		UserCustom userCustom=(UserCustom) session.getAttribute("user");
		String wechatId=userCustom.getId();
		String tel=userCustom.getTel();
		Preset preset=new Preset();
		preset.setIsbn(isbn);
		preset.setWechatid(wechatId);
		preset.setTel(tel);
		bookCustomService.deleteOnePreset(preset);
		return "redirect:presetAndBorrowMessage.action";
	}
	
	//还书提醒   根据用户信息和距离还书时间倒计时1周查询借阅记录 
	//每次登录检测一次是否到还书时间了
	@RequestMapping("/selectBorrowRecordForReturnBookRemind")
	public void  selectBorrowRecordForReturnBookRemind(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		UserCustom userCustom=(UserCustom) session.getAttribute("user");
		BorrowingrecordCustom borrowingrecordCustom1=new BorrowingrecordCustom();
		borrowingrecordCustom1.setWechatid(userCustom.getId());
		borrowingrecordCustom1.setTel(userCustom.getTel());
		borrowingrecordCustom1.setReturntime(GetAfter45Day.getdate(7));
		List<BorrowingrecordCustom> returnBookRemindList= bookCustomService.selectBorrowRecordForReturnBookRemind(borrowingrecordCustom1);
		if(returnBookRemindList!=null){
			session.setAttribute("returnBookRemindList",returnBookRemindList);
			session.setAttribute("returnBookRemind","have");
		}
	}
}