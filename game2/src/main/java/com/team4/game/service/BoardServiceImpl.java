package com.team4.game.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.team4.game.entity.Board;
import com.team4.game.entity.BoardAttach;
import com.team4.game.entity.BoardReply;
import com.team4.game.entity.Game;
import com.team4.game.entity.GameAttach;
import com.team4.game.entity.User;
import com.team4.game.repository.BoardAttachRepository;
import com.team4.game.repository.BoardReplyRepository;
import com.team4.game.repository.BoardRepository;



@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private BoardReplyRepository replyRepository;
	
	@Autowired
	private BoardAttachRepository boardAttachRepository;
	
	@PersistenceContext
	EntityManager em;


	@Transactional
	@Override
	public void insert(Board board, User user) {
		// TODO Auto-generated method stub
		board.setUser(user);
		boardRepository.save(board);
	}
	
	//게임, 파일 동시에 등록
		@Transactional
		@Override
		public void insertBoardAndFile(Board board, User user, List<BoardAttach> attachList) {
			// TODO Auto-generated method stub
			board.setUser(user);
			Board board2=boardRepository.save(board);
			System.out.println(board2);
			if(attachList.size()>0) {
				for(BoardAttach boardAttach:attachList) {
					boardAttach.setBoard(board2);
					boardAttachRepository.save(boardAttach);
				}
			}
		}

	@Override
	public Page<Board> findList(String field, String keyword, Pageable pageable) {
		System.out.println("field......"+field +"keyword......"+keyword);
		// TODO Auto-generated method stub
		Page<Board> boardList=null;
		if(field.equals("") || field==null) {
			boardList= boardRepository.findAll(pageable);
		}
		else if(field.equals("title")) {
			boardList= boardRepository.findByTitleContaining(keyword, pageable);
		}else if(field.equals("writer")) {
			boardList= boardRepository.findByWriterContaining(keyword, pageable);
		}else if(field.equals("content")) {
			boardList= boardRepository.findByContentContaining(keyword, pageable);
		}else if(field.equals("cwt")) {
			boardList= boardRepository.findByTitleContainingOrWriterContainingOrContentContaining(keyword, keyword, keyword, pageable);
		}else {
			boardList= boardRepository.findAll(pageable);
		}
		return boardList;
	}
	
	@Override
	public List<Board> boardList() {
		// TODO Auto-generated method stub
		return boardRepository.findAll();
	}
	
	@Override
	public Page<Board> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return boardRepository.findAll(pageable);
	}

	@Transactional
	@Override
	public Board findById(Long id) {
		// TODO Auto-generated method stub
		Board board=boardRepository.findById(id).get();
		board.setHitcount(board.getHitcount()+1);
		return board;
	}

	@Transactional
	@Override
	public void update(Board board) {
		// TODO Auto-generated method stub
		//boardRepository.save(board);
		// 더티 체킹
		Board b=boardRepository.findById(board.getId()).get();
		b.setTitle(board.getTitle());
		b.setContent(board.getContent());
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		boardRepository.deleteById(id);
	}

	@Override
	public Long count() {
		// TODO Auto-generated method stub
		return boardRepository.count();
	}

	@Override
	public void insetReply(BoardReply reply) {
		replyRepository.save(reply);
	}

	@Override
	public List<BoardReply> replyList(Long bno) {
		// TODO Auto-generated method stub
		System.out.println("service........"+bno);
		return replyRepository.boardReplyList(bno);
	}

	@Override
	public void replyDelete(Long id) {
		// TODO Auto-generated method stub
		replyRepository.deleteById(id);
	}

	
}
