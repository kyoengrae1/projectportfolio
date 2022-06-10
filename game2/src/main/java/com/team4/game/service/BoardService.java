package com.team4.game.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.team4.game.entity.Board;
import com.team4.game.entity.BoardAttach;
import com.team4.game.entity.BoardReply;
import com.team4.game.entity.User;



public interface BoardService {
	
	public void insert(Board board,User user);
	
	void insertBoardAndFile(Board board, User user, List<BoardAttach> attachList);
	
	public List<Board> boardList();
	
	public Board findById(Long id);
	
	public void update(Board board);
	public void delete(Long id);

	public Long count();
	
	public void insetReply(BoardReply reply);
	
	public List<BoardReply> replyList(Long bno);
	
	public void replyDelete(Long id);

	public Page<Board> findAll(Pageable pageable);	
	
	public Page<Board> findList(String field, String keyword, Pageable pageable);


}
