package me.codz.bbs.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Notes entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notes")
public class Notes implements java.io.Serializable {

	// Fields

	public static int PAGE_SIZE = 7;
	private Integer noteId;
	private Users users;
	private String title;
	private String content;
	private Timestamp pubTime;
	private Set<Replys> replyses = new HashSet<Replys>(0);

	// Constructors

	/** default constructor */
	public Notes() {
	}

	/** full constructor */
	public Notes(Users users, String title, String content, Timestamp pubTime,
			Set<Replys> replyses) {
		this.users = users;
		this.title = title;
		this.content = content;
		this.pubTime = pubTime;
		this.replyses = replyses;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "noteId", unique = true, nullable = false)
	public Integer getNoteId() {
		return this.noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "title", length = 50)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "pubTime", length = 19)
	public Timestamp getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(Timestamp pubTime) {
		this.pubTime = pubTime;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "notes")
	public Set<Replys> getReplyses() {
		return this.replyses;
	}

	public void setReplyses(Set<Replys> replyses) {
		this.replyses = replyses;
	}

}