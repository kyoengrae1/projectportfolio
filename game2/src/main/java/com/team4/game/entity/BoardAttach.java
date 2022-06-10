package com.team4.game.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class BoardAttach {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "attach_id")
	private Long id;
	
	private String savefolder;
	private String originfile;
	private String savefile;
	private String filetype;
	
	@ManyToOne
	@JoinColumn(name = "board_id")
	private Board board;
}
