package me.codz.bbs.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "users" )
public class Users implements java.io.Serializable {

	// Fields

	private Integer userId1;
	private String userName;
	private String password;
	private String head;
	private Timestamp regTime;
	private Short gender;
	private Set<Notes> noteses = new HashSet<Notes>(0);

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** full constructor */
	public Users(String userName, String password, String head,
			Timestamp regTime, Short gender, Set<Notes> noteses) {
		this.userName = userName;
		this.password = password;
		this.head = head;
		this.regTime = regTime;
		this.gender = gender;
		this.noteses = noteses;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userId1", unique = true, nullable = false)
	public Integer getUserId1() {
		return this.userId1;
	}

	public void setUserId1(Integer userId1) {
		this.userId1 = userId1;
	}

	@Column(name = "userName", length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "password", length = 20)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "head", length = 20)
	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Column(name = "regTime", length = 19)
	public Timestamp getRegTime() {
		return this.regTime;
	}

	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}

	@Column(name = "gender")
	public Short getGender() {
		return this.gender;
	}

	public void setGender(Short gender) {
		this.gender = gender;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Notes> getNoteses() {
		return this.noteses;
	}

	public void setNoteses(Set<Notes> noteses) {
		this.noteses = noteses;
	}

}