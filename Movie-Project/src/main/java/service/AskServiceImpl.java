package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AskDao;
import dto.AskDto;

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
	public List<AskDto> getAllList() {
		return askDao.getAllList();
	}
	
	@Override
	public List<AskDto> getListById(String id) {
		return askDao.getListById(id);
	}
}
