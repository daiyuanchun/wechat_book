package com.yuxudong.service;

import java.util.List;

import com.yuxudong.po.Comment;

public interface CommentCustomService {
	public void insertComment(Comment comment)throws Exception;
	public List<Comment> findCommentByIsbn(String isbn)throws Exception;
}
