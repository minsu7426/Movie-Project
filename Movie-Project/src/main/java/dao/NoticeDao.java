package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dto.Criteria;
import dto.NoticeDto;

public interface NoticeDao {
	
	//조회
	public List<NoticeDto> getList(Criteria cri);
	
	//조회수 증가
	public void setHit();
	
	//게시글 수 가져오기
	public int getListCount();
	
	//게시글 조회
	public NoticeDto getRead(int notice_code);
}
