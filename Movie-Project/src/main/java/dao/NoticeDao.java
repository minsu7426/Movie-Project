package dao;

import java.util.List;

import dto.NoticeDto;

public interface NoticeDao {
	
	//조회
	public List<NoticeDto> list();
}
