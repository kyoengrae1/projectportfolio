package com.team4.game.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team4.game.entity.BoardReply;



public interface BoardReplyRepository extends JpaRepository<BoardReply, Long>{

	@Query("select r from BoardReply r join fetch r.board where board_id=?1")
	public List<BoardReply> boardReplyList(Long boardId);

}
