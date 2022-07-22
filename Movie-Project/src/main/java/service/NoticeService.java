package service;

import java.util.List;

import dto.Criteria;
import dto.NoticeDto;

public interface NoticeService {
	
	//게시글 조회
	public NoticeDto getRead(int notice_code);
	
	//게시글 검색
	public List<NoticeDto> getList(Criteria cri);
	
	//게시글 검색 총 글개수
	public int getListCount(Criteria cri);
	
	//게시물 등록
	public void setInsert(NoticeDto noticeDto);
	
	//게시물 삭제
	public void setDelete(int notice_code);
	
	//게시물 업데이트
	public void setUpdate(NoticeDto noticeDto);
}
