package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AskDao;
import dto.AskDto;
import dto.Criteria;

@Service
public class AskServiceImpl implements AskService {

	@Autowired
	private AskDao askDao;
	
	@Override
	public void setInsertAsk(AskDto askDto) {
		askDto.setAsk_hit(0);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ask_date = formatter.format(new Date());
		askDto.setAsk_date(ask_date);
		askDao.setInsertAsk(askDto);
	}

	@Override
	public List<AskDto> getAllList(String search_item, String text, Criteria cri) {
		return askDao.getAllList(search_item, text, cri);
	}
	
	@Override
	public List<AskDto> getListById(String id, Criteria cri) {
		return askDao.getListById(id, cri);
	}
	
	@Override
	public AskDto getAskByCode(String code) {
		return askDao.getAskByCode(code);
	}
	
	@Override
	public void setUpdateHit(String code) {
		askDao.setUpdateHit(code);
	}
	@Override
	public void setAnswer(AskDto askDto) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ask_re_date = formatter.format(new Date());
		askDto.setAsk_re_date(ask_re_date);
		askDao.setAnswer(askDto);
	}
	
	@Override
	public int getSearchListCountById(String ask_id) {
		return askDao.getSearchListCountById(ask_id);
	}
	
	@Override
	public int getAllCount(String search_item, String text) {
		return askDao.getAllCount(search_item, text);
	}
}
