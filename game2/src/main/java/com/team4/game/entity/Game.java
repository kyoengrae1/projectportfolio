package com.team4.game.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.team4.game.constant.Category;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Game {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="game_id")
	private Long id;
	
	private String gname;
	
	private Long price;
	
	private Long sellCount;
	
	private String developer;
	//수정할것
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date regdate;
	
	private String mainContent;
	
	private String subContent;
	
	@OneToMany(mappedBy = "game",fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("game") // 무한참조 방지
	private List<GameReply> gameReply;
	
	@OrderBy("id desc")
	@OneToMany(mappedBy = "game",fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("game") // 무한참조 방지
	private List<GameAttach> gameAttachs;
	
	@Enumerated(EnumType.STRING)
	private Category category;
	
	@PrePersist
	public void prePersist() {
		this.sellCount= this.sellCount==null? 0 : this.sellCount;
	}
	
}
