package com.yuxudong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yuxudong.mapper.BookMapperCustom;
import com.yuxudong.po.Book;
import com.yuxudong.po.BorrowingrecordCustom;
import com.yuxudong.po.Preset;
import com.yuxudong.po.Province;
import com.yuxudong.po.SearchVO;
import com.yuxudong.po.Type;
import com.yuxudong.po.UserCustom;
import com.yuxudong.service.BookCustomService;

public class BookCustomServiceImpl implements BookCustomService {
	@Autowired
	private BookMapperCustom bookMapperCustom;
	
	
	@Override
	public List<Book> searchVOBook(SearchVO searchVO) throws Exception {
		List<Book> bookList=bookMapperCustom.searchVOBook(searchVO);
		return bookList;
	}

	@Override
	public List<Type> selectAllType() throws Exception {
		List<Type> typeList=bookMapperCustom.selectAllType();
		return typeList;
	}

	@Override
	public List<Province> selectAllProvince() throws Exception {
		List<Province> provinceList=bookMapperCustom.selectAllProvince();
		return provinceList;
	}

	@Override
	public long getBooksCount(SearchVO searchVO) throws Exception {
		long count=bookMapperCustom.getBooksCount(searchVO);
		return count;
	}

	@Override
	public List<Book> selectSome() throws Exception {
		List<Book> someBooks=bookMapperCustom.selectSome();
		return someBooks;
	}

	@Override
	public List<Book> searchBookByKeywords(String str) throws Exception {
		List<Book> searchBookByKeywords=bookMapperCustom.searchBookByKeywords(str);
		return searchBookByKeywords;
	}

	@Override
	public Book findBookByISBN(String id) throws Exception {
		Book bookWithBLOBs=bookMapperCustom.findBookByISBN(id);
		return bookWithBLOBs;
	}

	@Override
	public void importBooks(Book book) throws Exception {
		bookMapperCustom.importBooks(book);
	}

	@Override
	public List<Book> selectRelevantBook(Integer typeId) throws Exception {
		List<Book> relevantBookList=bookMapperCustom.selectRelevantBook(typeId);
		return relevantBookList;
	}

	@Override
	public void insertPreset(Preset preset) throws Exception {
		bookMapperCustom.insertPreset(preset);
	}

	@Override
	public void insertBorrowingrecord(BorrowingrecordCustom borrowingrecordCustom) throws Exception {
		bookMapperCustom.insertBorrowingrecord(borrowingrecordCustom);
	}

	@Override
	public Integer selectPresetForBorrowBook(Preset preset) throws Exception {
		Integer count=bookMapperCustom.selectPresetForBorrowBook(preset);
		return count;
	}

	@Override
	public List<BorrowingrecordCustom> findTodayBorrowBookRecord(BorrowingrecordCustom record) throws Exception {
		List<BorrowingrecordCustom> borrowingrecordCustom=bookMapperCustom.findTodayBorrowBookRecord(record);
		return borrowingrecordCustom;
	}

	@Override
	public void deleteBorrowRecord(BorrowingrecordCustom borrowingrecordCustom) throws Exception {
		bookMapperCustom.deleteBorrowRecord(borrowingrecordCustom);
	}

	@Override
	public void deletePresetRecord(Preset preset) throws Exception {
		bookMapperCustom.deletePresetRecord(preset);
	}

	@Override
	public List<BorrowingrecordCustom> selectBorrowRecordForReturnBooks(BorrowingrecordCustom borrowingrecordCustom) throws Exception {
		List<BorrowingrecordCustom> recordList=bookMapperCustom.selectBorrowRecordForReturnBooks(borrowingrecordCustom);
		return recordList;
	}

	@Override
	public void returnBooks(BorrowingrecordCustom borrowingrecordCustom) throws Exception {
		bookMapperCustom.returnBooks(borrowingrecordCustom);
	}

	@Override
	public List<BorrowingrecordCustom> selectNotPay(UserCustom userCustom) throws Exception {
	 List<BorrowingrecordCustom> list=bookMapperCustom.selectNotPay(userCustom);
		return list;
	}

	@Override
	public List<Preset> presetMessage(UserCustom userCustom) throws Exception {
		List<Preset> presetList=bookMapperCustom.presetMessage(userCustom);
		return presetList;
	}

	@Override
	public List<BorrowingrecordCustom> borrowMessage(UserCustom userCustom) throws Exception {
		List<BorrowingrecordCustom> borrowList=bookMapperCustom.borrowMessage(userCustom);
		return borrowList;
	}

	@Override
	public void deleteOnePreset(Preset preset) throws Exception {
		bookMapperCustom.deleteOnePreset(preset);
	}

	@Override
	public List<String> selectPresetISBN(UserCustom userCustom) throws Exception {
		List<String> presetIsbnList=bookMapperCustom.selectPresetISBN(userCustom);
		return presetIsbnList;
	}

	@Override
	public List<String> selectBorrowrecordISBN(UserCustom userCustom) throws Exception {
		List<String> borrowIsbnList=bookMapperCustom.selectBorrowrecordISBN(userCustom);
		return borrowIsbnList;
	}

	@Override
	public Integer selectRestNumByIsbn(String isbn) throws Exception {
		Integer restnum=bookMapperCustom.selectRestNumByIsbn(isbn);
		return restnum;
	}

	@Override
	public void addOrReduceRestNumByIsbn(Book book) throws Exception {
		bookMapperCustom.addOrReduceRestNumByIsbn(book);
	}

	@Override
	public List<BorrowingrecordCustom> selectBorrowRecordForReturnBookRemind(
			BorrowingrecordCustom borrowingrecordCustom) throws Exception {
		List<BorrowingrecordCustom> borrowingrecordCustomsList=bookMapperCustom.selectBorrowRecordForReturnBookRemind(borrowingrecordCustom);
		return borrowingrecordCustomsList;
	}
	

	
}
