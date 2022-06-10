package com.team4.game.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.team4.game.entity.User;
import com.team4.game.repository.BoardReplyRepository;
import com.team4.game.repository.BoardRepository;
import com.team4.game.repository.CartRepository;
import com.team4.game.repository.GameReplyRepository;
import com.team4.game.repository.MyGameRepository;
import com.team4.game.repository.UserRepository;

import lombok.extern.java.Log;

@Service
@Log
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private MyGameRepository mygameRepository;
	
	@Autowired
	private GameReplyRepository gameReplyRepository;
	
	@Transactional
	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		boardRepository.deleteByUserId(id);
		gameReplyRepository.deleteByUserId(id);
		cartRepository.deleteByUserId(id);
		mygameRepository.deleteByUserId(id);
		userRepository.deleteById(id);
	}
	
	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}
	@Override
	public Page<User> findAll(Pageable pageable){
		return userRepository.findAll(pageable);
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return userRepository.count();
	}

	@Transactional
	@Override
	public User update(User user) {
		// TODO Auto-generated method stub
		User originUser = userRepository.findById(user.getId()).get();
		originUser.setEmail(user.getEmail());
		originUser.setAddress(user.getAddress());
		originUser.setTel(user.getTel());
		if(!user.getPassword().equals("")) {
			originUser.setPassword(user.getPassword());
		}
		return originUser;
	}
	
	

}
