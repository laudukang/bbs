package me.codz.bbs.dao;

import me.codz.bbs.model.Replys;
import java.util.List;

public interface ReplyDao {
	
	public void addReply(Replys reply);

	public List<Replys> getReplyById(int noteId);

	public void deleteReply(int replyId);
}
