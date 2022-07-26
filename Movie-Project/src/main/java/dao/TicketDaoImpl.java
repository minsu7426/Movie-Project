package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
import dto.TicketDto;

@Repository
public class TicketDaoImpl implements TicketDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<TicketDto> getTicketList(Criteria cri) {
		String title = cri.getSearch_item();
		String text = "'%" + cri.getText() + "%'";
		String sql;
		
		if(cri.getSearch_item() == null || cri.getSearch_item().equals("")) {
			sql = "select movie.movie_title, ticket.tic_num, ticket.tic_code, ticket.tic_id, ticket.tic_seat, ticket.tic_payment, ticket.tic_paytime from ticket join screen on ticket.tic_code = screen.scr_code join movie on screen.scr_movie = movie.movie_code order by ticket.tic_paytime desc limit ?, ?";
		} else {
			sql = "select movie.movie_title, ticket.tic_num, ticket.tic_code, ticket.tic_id, ticket.tic_seat, ticket.tic_payment, ticket.tic_paytime from ticket join screen on ticket.tic_code = screen.scr_code join movie on screen.scr_movie = movie.movie_code where "+ title +" like "+ text +" order by ticket.tic_paytime desc limit ?, ?";
		}
		
		List<TicketDto> list = jdbcTemplate.query(sql, new RowMapper<TicketDto>() {
			@Override
			public TicketDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				TicketDto dto = new TicketDto();
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setTic_num(rs.getInt("tic_num"));
				dto.setTic_code(rs.getInt("tic_code"));
				dto.setTic_id(rs.getString("tic_id"));
				dto.setTic_seat(rs.getString("tic_seat"));
				dto.setTic_payment(rs.getInt("tic_payment"));
				dto.setTic_paytime(rs.getString("tic_paytime"));
				return dto;
			}
		}, cri.getPageStart(), cri.getPerPageNum());
		return list;
	}
	
	@Override
	public int getTicketCount(Criteria cri) {
		String title = cri.getSearch_item();
		String text = "'%" + cri.getText() + "%'";
		String sql;
		
		if(cri.getSearch_item() == null || cri.getSearch_item().equals("")) {
			sql = "select count(*) from ticket join screen on ticket.tic_code = screen.scr_code join movie on screen.scr_movie = movie.movie_code";
		} else {
			sql = "select count(*) from ticket join screen on ticket.tic_code = screen.scr_code join movie on screen.scr_movie = movie.movie_code where "+ title + " like " + text;
		}
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return count;
	}
	
	@Override
	public void setTicketDelete(int tic_num) {
		String sql = "delete from ticket where tic_num = "+tic_num;
		jdbcTemplate.update(sql);
	}
	
}
