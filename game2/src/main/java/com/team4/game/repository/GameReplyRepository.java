package com.team4.game.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team4.game.entity.BoardReply;
import com.team4.game.entity.GameReply;

public interface GameReplyRepository extends JpaRepository<GameReply, Long>{

	@Query("select r from GameReply r join fetch r.game where game_id=?1")
	public List<GameReply> gameReplyList(Long gameId);
	
	@Query("select AVG(grade) from GameReply r where gno = ?1")
	Double findOneAvg(Long gameId);

	public void deleteByUserId(Long id);
}
