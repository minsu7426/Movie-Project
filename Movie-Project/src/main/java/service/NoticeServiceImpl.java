package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NoticeDao;
import dto.Criteria;
import dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeDto> getList(Criteria cri) {
		return noticeDao.getList(cri);
	}

	@Override
	public int getListCount() {
		return noticeDao.getListCount();
	}

	@Override
	public NoticeDto getRead(int notice_code) {
		return noticeDao.getRead(notice_code);
	}
	
}
