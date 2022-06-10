package com.team4.game.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.team4.game.constant.Category;
import com.team4.game.entity.Game;

public interface GameRepository extends JpaRepository<Game, Long>{
	
	Page<Game> findByCategory(Category category, Pageable pageable);
	
	Page<Game> findByCategoryAndGnameContaining(Category Category ,String keyword, Pageable pageable);
	
	Page<Game> findByCategoryAndDeveloperContaining(Category Category ,String keyword, Pageable pageable);
	
	Page<Game> findByCategoryAndGnameContainingOrCategoryAndDeveloperContaining(Category Category1 ,String keyword1, Category Category2,String keyword2, Pageable pageable);
	
	Page<Game> findByCategoryAndPriceLessThanEqualOrderByPriceDesc(Category Category ,Long price, Pageable pageable);
	
	Page<Game> findByGnameContaining(String keyword, Pageable pageable);
	
	Page<Game> findByDeveloperContaining(String keyword, Pageable pageable);
	
	Page<Game> findByGnameContainingOrDeveloperContaining(String keyword1, String keyword2, Pageable pageable);
	
	Page<Game> findByPriceLessThanEqualOrderByPriceDesc(Long price, Pageable pageable);
	
}
