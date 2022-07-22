package service;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	public NoticeDto getRead(int notice_code) {
		noticeDao.setHit(notice_code);
		return noticeDao.getRead(notice_code);
	}

	@Override
	public int getListCount(Criteria cri) {
		return noticeDao.getListCount(cri);
	}
	
	@Override
	public void setInsert(NoticeDto noticeDto) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String notice_date = formatter.format(new Date());
		noticeDto.setNotice_date(notice_date);
		noticeDao.setInsert(noticeDto);
	}
	
	@Override
	public void setDelete(int notice_code) {
		noticeDao.setDelete(notice_code);
	}
	
	@Override
	public void setUpdate(NoticeDto noticeDto) {
		noticeDao.setUpdate(noticeDto);
	}
	
	
}
