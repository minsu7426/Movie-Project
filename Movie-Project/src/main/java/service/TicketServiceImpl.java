package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TicketDao;
import dto.Criteria;
import dto.TicketDto;

@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	private TicketDao ticketDao;
	
	@Override
	public List<TicketDto> getTicketList(Criteria cri) {
		return ticketDao.getTicketList(cri);
	}
	
	@Override
	public int getTicketCount(Criteria cri) {
		return ticketDao.getTicketCount(cri);
	}
	
	@Override
	public void setTicketDelete(int tic_num) {
		ticketDao.setTicketDelete(tic_num);
	}
}
