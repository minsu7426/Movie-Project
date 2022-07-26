package dao;

import java.util.List;

import dto.Criteria;
import dto.TicketDto;

public interface TicketDao {

	//전체 예매 리스트 조회
	public List<TicketDto> getTicketList(Criteria cri);
	
	//전체 예매 수 조회
	public int getTicketCount(Criteria cri);
	
	//예매내역 삭제
	public void setTicketDelete(int tic_num);
}
