package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.AskDto;

public interface AskService {
	// 1:1문의 등록
	public void setInsertAsk(AskDto askDto);
	
	// 모든 1:1문의 가져오기
	public List<AskDto> getAllList(String search_item, String text);
	
	// 해당 id 문의 가져오기
	public List<AskDto> getListById(String id);
	
	// 해당 코드 문의 가져오기
	public AskDto getAskByCode(String code);

	// 조회수 +1 증가
	public void setUpdateHit(String code);
	
	// 답변
	public void setAnswer(AskDto askDto);
	
}
