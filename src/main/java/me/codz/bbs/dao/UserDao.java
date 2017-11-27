package me.codz.bbs.dao;

import me.codz.bbs.model.Notes;
import me.codz.bbs.model.Users;

import java.util.List;


public interface UserDao {
	public Users findUser(int userId);

	public Users findUser(int userId, String password);

	public void addUser(Users user);

	public List<Notes> getUserSearch(String search, int page);
	
	public Number getSearchPageCount(String search);
}
