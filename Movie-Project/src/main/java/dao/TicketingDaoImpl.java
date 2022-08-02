package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
import dto.ReserveCompleteDto;
import dto.ScreenDto;
import dto.TicketDto;
import dto.TicketingDto;

@Repository
public class TicketingDaoImpl implements TicketingDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<ScreenDto> getSelectByMovie(String scr_code, String date) {
		String sql = "select * from screen where scr_movie = ? and scr_date = ? order by scr_time asc";
		
		List<ScreenDto> results = jdbcTemplate.query(sql, new RowMapper<ScreenDto>() {

			@Override
			public ScreenDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScreenDto dto = new ScreenDto();
				dto.setScr_code(rs.getInt("scr_code"));
				dto.setScr_movie(rs.getInt("scr_movie"));
				dto.setScr_seat(rs.getString("scr_seat"));
				dto.setScr_screen(rs.getString("scr_screen"));
				dto.setScr_time(rs.getString("scr_time").substring(0, 5));
				dto.setScr_date(rs.getString("scr_date"));
				return dto;
			}
			
		}, scr_code, date);
		
		return results;
	}
	
	@Override
	public List<String> getDateByMovie(String scr_code) {
		String sql = "select distinct scr_date from screen where scr_movie = ?";
		List<String> results = jdbcTemplate.queryForList(sql, String.class, scr_code);
		return results;
	}
	
	@Override
	public List<String> getScreenByMovieDate(String scr_code, String date) {
		String sql = "select distinct scr_screen from screen where scr_movie = ? and scr_date = ?";
		List<String> list = jdbcTemplate.queryForList(sql, String.class, scr_code, date);
		return list;
	}
	
	@Override
	public ScreenDto getScreenByCode(String scr_code) {
		String sql = "select * from screen where scr_code = ?";
		List<ScreenDto> results = jdbcTemplate.query(sql, new RowMapper<ScreenDto>() {

			@Override
			public ScreenDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScreenDto screen = new ScreenDto();
				screen.setScr_code(rs.getInt("scr_code"));
				screen.setScr_movie(rs.getInt("scr_movie"));
				screen.setScr_seat(rs.getString("scr_seat"));
				screen.setScr_screen(rs.getString("scr_screen"));
				screen.setScr_time(rs.getString("scr_time"));
				screen.setScr_date(rs.getString("scr_date"));
				return screen;
			}
			
		},scr_code);
		return results.isEmpty() ? null : results.get(0);
	}
	
	@Override
	public void setTicket(TicketDto ticketDto, String code) {
		String sql = "insert into ticket(tic_code, tic_id, tic_seat, tic_payment, tic_paytime) value (?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, code,
					ticketDto.getTic_id(),
					ticketDto.getTic_seat(),
					ticketDto.getTic_payment(),
					ticketDto.getTic_paytime()
				);
	}
	
	@Override
	public void setScreenUpdate(String scr_code, String seat) {
		String sql = "update screen set scr_seat = ? where scr_code = ?";
		jdbcTemplate.update(sql, seat, scr_code);
	}
	
	@Override
	public ReserveCompleteDto getReserveComplete(String code, String seat, String id) {
		String sql = "select ticket.tic_num, ticket.tic_payment, ticket.tic_seat, screen.scr_screen, screen.scr_time, screen.scr_date, movie.movie_title, movie.movie_img from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where scr_code = ? and tic_seat = ? and tic_id = ?";
		List<ReserveCompleteDto> results = jdbcTemplate.query(sql, new RowMapper<ReserveCompleteDto>() {

			@Override
			public ReserveCompleteDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReserveCompleteDto rcDto = new ReserveCompleteDto();
				rcDto.setRc_date(rs.getString("scr_date"));
				rcDto.setRc_img(rs.getString("movie_img"));
				rcDto.setRc_num(rs.getInt("tic_num"));
				rcDto.setRc_pay(rs.getInt("tic_payment"));
				rcDto.setRc_screen(rs.getInt("scr_screen"));
				rcDto.setRc_seat(rs.getString("tic_seat"));
				rcDto.setRc_time(rs.getString("scr_time").substring(0, 5));
				rcDto.setRc_title(rs.getString("movie_title"));
				return rcDto;
			}
			
		},code, seat, id);
		return results.isEmpty() ? null : results.get(0);
	}
	
	@Override
	public int getTicketingListCount(Criteria cri, String id) {
		String sql;
		if(cri.getText() == null || cri.getText().equals("")) {
			sql = "select count(*) from ticket where tic_id = '"+id+"'";
		} else {
			sql = "select count(*) from ticket where tic_id = '"+id+"' and date_format((tic_paytime),'%Y-%m-%d') > now() - interval "+cri.getText()+" day";
		}
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	@Override
	public List<TicketingDto> getTicketingList(Criteria cri, String id) {
		String sql;
		if(cri.getText() == null || cri.getText().equals("")) {
			sql = "select ticket.tic_paytime, ticket.tic_num, movie.movie_title, concat(screen.scr_date,' ', screen.scr_time) as scr_datetime, screen.scr_screen, ticket.tic_seat, ticket.tic_payment from ticket join screen on ticket.tic_code = screen.scr_code join movie on screen.scr_movie = movie.movie_code where tic_id = '"+id+"' order by tic_paytime asc limit ?, ?";
		} else {
			sql = "select ticket.tic_paytime, ticket.tic_num, movie.movie_title, concat(screen.scr_date,' ', screen.scr_time) as scr_datetime, screen.scr_screen, ticket.tic_seat, ticket.tic_payment from ticket join screen on ticket.tic_code = screen.scr_code join movie on screen.scr_movie = movie.movie_code where tic_id = '"+id+"' and date_format((tic_paytime),'%Y-%m-%d') > now() - interval "+cri.getText()+" day order by tic_paytime asc limit ?, ?";
		}
		List<TicketingDto> list = jdbcTemplate.query(sql, new RowMapper<TicketingDto>() {
			@Override
			public TicketingDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				TicketingDto dto = new TicketingDto();
				dto.setTic_paytime(rs.getString("tic_paytime"));
				dto.setTic_num(rs.getString("tic_num"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setScr_datetime(rs.getString("scr_datetime"));
				dto.setScr_screen(rs.getInt("scr_screen"));
				dto.setTic_seat(rs.getString("tic_seat"));
				dto.setTic_payment(rs.getInt("tic_payment"));
				return dto;
			}
		}, cri.getPageStart(), cri.getPerPageNum());
		return list;
	}
}
