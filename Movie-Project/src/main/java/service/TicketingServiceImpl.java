package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ScreenDao;
import dao.TicketingDao;
import dto.Criteria;
import dto.ReserveCompleteDto;
import dto.ScreenDto;
import dto.TicketDto;
import dto.TicketingDto;

@Service
public class TicketingServiceImpl implements TicketingService {

	@Autowired
	private TicketingDao ticketingDao;

	@Override
	public List<ScreenDto> getSelectByMovie(String tic_code, String date) {
		return ticketingDao.getSelectByMovie(tic_code, date);
	}

	@Override
	public List<String> getDateByMovie(String tic_code) {
		return ticketingDao.getDateByMovie(tic_code);
	}

	@Override
	public List<String> getScreenByMovieDate(String tic_code, String date) {
		return ticketingDao.getScreenByMovieDate(tic_code, date);
	}

	@Override
	public ScreenDto getScreenByCode(String scr_code) {
		return ticketingDao.getScreenByCode(scr_code);
	}

	@Override
	public synchronized void setTicket(TicketDto ticketDto, String code) {
		ScreenDto screen = ticketingDao.getScreenByCode(code);
		String[] screen_seat = screen.getScr_seat().split(",");
		String[] ticket_seat = ticketDto.getTic_seat().split(",");

		List<String> list1 = new ArrayList<String>();
		Collections.addAll(list1, screen_seat);

		Iterator it = list1.iterator();
		while (it.hasNext()) {
			String n = (String) it.next();
			for (int i = 0; i < ticket_seat.length; i++) {
				if (n.equals(ticket_seat[i])) {
					it.remove();
				}
			}
		}
		String seat = String.join(",", list1);
		ticketingDao.setScreenUpdate(code, seat);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String tic_date = formatter.format(new Date());
		ticketDto.setTic_paytime(tic_date);
		ticketingDao.setTicket(ticketDto, code);
	}

	@Override
	public ReserveCompleteDto getReserveComplete(String code, String seat, String id) {
		return ticketingDao.getReserveComplete(code, seat, id);
	}

	@Override
	public int getTicketingListCount(Criteria cri, String id) {
		return ticketingDao.getTicketingListCount(cri, id);
	}

	@Override
	public List<TicketingDto> getTicketingList(Criteria cri, String id) {
		return ticketingDao.getTicketingList(cri, id);
	}
}
