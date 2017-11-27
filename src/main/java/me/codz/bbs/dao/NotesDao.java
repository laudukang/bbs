package me.codz.bbs.dao;


import me.codz.bbs.model.Notes;

import java.util.List;

public interface NotesDao {
	
	public void addNote(Notes note);

	public List<Notes> getAllNotes();

	public Notes getNoteById(int noteId);

	public List<Notes> getNoteList(int page);

	public List<Notes> getNoteSearch(String search,int page);

	public void deleteNote(int noteId);
	
	public Number getNotesCount();
	
	public Number getNotesLimitCount(String search);
}
