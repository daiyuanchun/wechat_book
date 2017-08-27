package com.yuxudong.service;

import java.util.List;

import com.yuxudong.po.Book;
import com.yuxudong.po.BorrowingrecordCustom;
import com.yuxudong.po.Preset;
import com.yuxudong.po.Province;
import com.yuxudong.po.SearchVO;
import com.yuxudong.po.Type;
import com.yuxudong.po.UserCustom;

public interface BookCustomService {
	public List<Book> searchVOBook(SearchVO searchVO)throws Exception;
	public long getBooksCount(SearchVO searchVO) throws Exception;
	public List<Type> selectAllType() throws Exception;
	public List<Province> selectAllProvince() throws Exception;
	public List<Book> selectSome()throws Exception;
	public List<Book> searchBookByKeywords(String str)throws Exception;
	public Book findBookByISBN(String id)throws Exception;
	public void importBooks(Book book)throws Exception;
	public List<Book> selectRelevantBook(Integer typeId)throws Exception;
	public void insertPreset(Preset preset)throws Exception;
	public void insertBorrowingrecord(BorrowingrecordCustom borrowingrecordCustom)throws Exception;
	public Integer selectPresetForBorrowBook(Preset preset)throws Exception;
	public List<BorrowingrecordCustom> findTodayBorrowBookRecord(BorrowingrecordCustom record)throws Exception;
	public void deleteBorrowRecord(BorrowingrecordCustom borrowingrecordCustom)throws Exception;
	public void deletePresetRecord(Preset preset)throws Exception;
	public List<BorrowingrecordCustom> selectBorrowRecordForReturnBooks(BorrowingrecordCustom borrowingrecordCustom)throws Exception;
	public void returnBooks(BorrowingrecordCustom borrowingrecordCustom)throws Exception;
	public List<BorrowingrecordCustom> selectNotPay(UserCustom userCustom)throws Exception;
	public List<Preset> presetMessage(UserCustom userCustom)throws Exception;
	public List<BorrowingrecordCustom> borrowMessage(UserCustom userCustom)throws Exception;
	public void deleteOnePreset(Preset preset)throws Exception;
	public List<String> selectPresetISBN(UserCustom userCustom)throws Exception;
	public List<String> selectBorrowrecordISBN(UserCustom userCustom)throws Exception;
	public Integer selectRestNumByIsbn(String isbn)throws Exception;
	public void  addOrReduceRestNumByIsbn(Book book)throws Exception;
	public List<BorrowingrecordCustom> selectBorrowRecordForReturnBookRemind(BorrowingrecordCustom borrowingrecordCustom)throws Exception;
}
