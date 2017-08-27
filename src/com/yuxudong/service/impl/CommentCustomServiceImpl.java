package com.yuxudong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.yuxudong.mapper.CommentMapperCustom;
import com.yuxudong.po.Comment;
import com.yuxudong.service.CommentCustomService;

public class CommentCustomServiceImpl implements CommentCustomService{
@Autowired
private CommentMapperCustom commentMapperCustom;
	@Override
	public void insertComment(Comment comment) throws Exception {
		commentMapperCustom.insertComment(comment);
	}
	@Override
	public List<Comment> findCommentByIsbn(String isbn) throws Exception {
		List<Comment> commentList=commentMapperCustom.findCommentByIsbn(isbn);
		return commentList;
	}


}
