package com.yuxudong.mapper;

import java.util.List;

import com.yuxudong.po.Comment;

public interface CommentMapperCustom {
	public void insertComment(Comment comment)throws Exception;
	public List<Comment> findCommentByIsbn(String isbn)throws Exception;
}