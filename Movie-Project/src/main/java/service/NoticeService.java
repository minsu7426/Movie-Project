package service;

import java.util.List;

import dto.Criteria;
import dto.NoticeDto;

public interface NoticeService {
	
	//게시글조회
	public List<NoticeDto> getList(Criteria cri);
	
	//게시글 수
	public int getListCount();
	
	//게시글 조회
	public NoticeDto getRead(int notice_code);
}
