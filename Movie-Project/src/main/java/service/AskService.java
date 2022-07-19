package service;

import java.util.List;

import dto.AskDto;

public interface AskService {
	
	// 1:1문의 등록
	public void setInsertAsk();
	// 모든 문의 가져오기
	public List<AskDto> getAllList();
}
