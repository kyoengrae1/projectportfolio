package com.team4.game.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.team4.game.entity.Board;


public interface BoardRepository extends JpaRepository<Board, Long> {


	Page<Board> findByTitleContaining(String keyword, Pageable pageable);

	Page<Board> findByWriterContaining(String keyword, Pageable pageable);

	Page<Board> findByContentContaining(String keyword, Pageable pageable);
	
	Page<Board> findByTitleContainingOrWriterContainingOrContentContaining(String keyword, String keyword1, String keyword2 ,Pageable pageable);

	void deleteByUserId(Long id);

}
