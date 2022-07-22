package service;

import java.util.List;

import dto.Criteria;
import dto.NoticeDto;

public interface NoticeService {
	
	//게시글 조회
	public NoticeDto getRead(int notice_code);
	
	//게시글 검색
	public List<NoticeDto> getSearchList(Criteria cri);
	
	//게시글 검색 총 글개수
	public int getSearchListCount(Criteria cri);
}
