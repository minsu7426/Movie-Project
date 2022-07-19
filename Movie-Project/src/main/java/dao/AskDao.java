package dao;

import java.util.List;

import dto.AskDto;

public interface AskDao {
	
	public void setInsertAsk();
	
	public List<AskDto> getAllList();
}
