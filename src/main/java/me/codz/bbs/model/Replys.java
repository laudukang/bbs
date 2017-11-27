package me.codz.bbs.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Replys entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "replys" )
public class Replys implements java.io.Serializable {

	// Fields

	private Integer replyId;
	private Notes notes;
	private String replyContent;
	private Timestamp replyTime;
	private Integer replyUserId;
	private String replyTitle;
	private String head;
	private String replyUserName;
	private Timestamp replyUserRegTime;

	// Constructors

	/** default constructor */
	public Replys() {
	}

	/** full constructor */
	public Replys(Notes notes, String replyContent, Timestamp replyTime,
			Integer replyUserId, String replyTitle, String head,
			String replyUserName, Timestamp replyUserRegTime) {
		this.notes = notes;
		this.replyContent = replyContent;
		this.replyTime = replyTime;
		this.replyUserId = replyUserId;
		this.replyTitle = replyTitle;
		this.head = head;
		this.replyUserName = replyUserName;
		this.replyUserRegTime = replyUserRegTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "replyId", unique = true, nullable = false)
	public Integer getReplyId() {
		return this.replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "noteId")
	public Notes getNotes() {
		return this.notes;
	}

	public void setNotes(Notes notes) {
		this.notes = notes;
	}

	@Column(name = "replyContent")
	public String getReplyContent() {
		return this.replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	@Column(name = "replyTime", length = 19)
	public Timestamp getReplyTime() {
		return this.replyTime;
	}

	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}

	@Column(name = "replyUserId")
	public Integer getReplyUserId() {
		return this.replyUserId;
	}

	public void setReplyUserId(Integer replyUserId) {
		this.replyUserId = replyUserId;
	}

	@Column(name = "replyTitle", length = 50)
	public String getReplyTitle() {
		return this.replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	@Column(name = "head")
	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Column(name = "replyUserName")
	public String getReplyUserName() {
		return this.replyUserName;
	}

	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}

	@Column(name = "replyUserRegTime", length = 19)
	public Timestamp getReplyUserRegTime() {
		return this.replyUserRegTime;
	}

	public void setReplyUserRegTime(Timestamp replyUserRegTime) {
		this.replyUserRegTime = replyUserRegTime;
	}

}