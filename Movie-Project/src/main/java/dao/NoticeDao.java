package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dto.NoticeDto;

public interface NoticeDao {
	
	//조회
	public List<NoticeDto> getList();
	
	//조회수 증가
	public void setHit();
}
