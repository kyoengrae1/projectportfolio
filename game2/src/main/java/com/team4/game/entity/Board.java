package com.team4.game.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="board_id")
	private Long id;
	
	private String title;
	private String writer;
	private String content;
	
	private Long hitcount;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date regdate;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedate;
	
	@OneToMany(mappedBy = "board",fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("board") // 무한참조 방지
	private List<BoardReply> boardReply;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@OrderBy("id desc")
	@OneToMany(mappedBy = "board",fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("board") // 무한참조 방지
	private List<BoardAttach> boardAttachs;
	
	@PrePersist
	public void prePersist() {
		this.hitcount= this.hitcount==null? 0 : this.hitcount;
	}
	
}
