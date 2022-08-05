package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.SalesTotalDto;

@Repository
public class SalesDaoImpl implements SalesDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public String getTitleMovie() {
		String sql = "select movie_title from movie limit 1";
		String title = jdbcTemplate.queryForObject(sql, String.class);
		return title;
	}

	@Override
	public int getToday(String movie_title) {
		String sql = "select ifnull(sum(ticket.tic_payment),0) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') = curdate()";
		Integer today = jdbcTemplate.queryForObject(sql, Integer.class);
		return today;
	}
	
	@Override
	public int getYesday(String movie_title) {
		String sql = "select ifnull(sum(ticket.tic_payment),0) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') = curdate() - interval 1 day";
		Integer yesday = jdbcTemplate.queryForObject(sql, Integer.class);
		return yesday;
	}
	
	@Override
	public int getWeek(String movie_title) {
		String sql = "select ifnull(sum(ticket.tic_payment),0) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') between DATE_ADD(now(), interval -1 week ) and now()";
		Integer week = jdbcTemplate.queryForObject(sql, Integer.class);
		return week;
	}
	
	@Override
	public int getMonth(String movie_title) {
		String sql = "select ifnull(sum(ticket.tic_payment),0) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') between DATE_ADD(now(), interval -1 month ) and now()";
		Integer month = jdbcTemplate.queryForObject(sql, Integer.class);
		return month;
	}
	
	@Override
	public int getTotal(String movie_title) {
		String sql = "select ifnull(sum(ticket.tic_payment),0) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		Integer total = jdbcTemplate.queryForObject(sql, Integer.class);
		return total;
	}
	
	@Override
	public List<Integer> getTodaySeat(String movie_title) {
		String sql = "select length(scr_seat) - length(replace(scr_seat, ',', '')) + 1 from screen join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and screen.scr_date = curdate()";
		List<Integer> today = jdbcTemplate.queryForList(sql,Integer.class);
		
		if (today.isEmpty()) {
			today.add(0);
			return today;
		} else {
			return today;  
		}
	}
		
	@Override
	public List<Integer> getTotalSeat(String movie_title) {
		String sql = "select length(scr_seat) - length(replace(scr_seat, ',', '')) + 1 from screen join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and scr_flag = false";
		List<Integer> total = jdbcTemplate.queryForList(sql,Integer.class);
		if (total.isEmpty()) {
			total.add(0);
			return total;
		} else {
			return total;  
		}
	}
	
	@Override
	public int getViewCount(String movie_title) {
		String sql = "select ifnull(sum(length(tic_seat) - length(replace(tic_seat, ',', '')) + 1),0) from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		int viewCount = jdbcTemplate.queryForObject(sql, Integer.class);
		return viewCount;
	}
	
	@Override
	public int getManCount(String movie_title) {
		String sql = "select ifnull(sum(length(tic_seat) - length(replace(tic_seat, ',', '')) + 1),0) from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and substr(user.user_jumin, 8,1) = '1'";
		int manList = jdbcTemplate.queryForObject(sql, Integer.class);
		return manList;
	}
	
	@Override
	public float getAvgAge(String movie_title) {
		String sql = "select avg(year(now()) - (if(mid(user_jumin, 8, 1) = '1' or mid(user_jumin, 8, 1) = '2', 1900, 2000) + left(user_jumin, 2)) + 1) as age from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		Float avgAge = jdbcTemplate.queryForObject(sql, Float.class);
		
		return avgAge == null ? 0 : avgAge;
	}
	
//	전체 수익 관리
	
	@Override
	public List<SalesTotalDto> getMovieTitle() {
		String sql ="select movie_title from movie";
		List<SalesTotalDto> list = jdbcTemplate.query(sql, new RowMapper<SalesTotalDto>(){
			@Override
			public SalesTotalDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				SalesTotalDto dto = new SalesTotalDto();
				dto.setSales_title(rs.getString("movie_title"));
				return dto;
			}
		});
		return list;
	}
	
	@Override
	public List<Map<String, Integer>> getTodayList() {
		String sql = "select movie.movie_title, sum(ticket.tic_payment) as sum from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where date_format(tic_paytime,'%Y-%m-%d') = curdate() group by movie_title";
		List<Map<String, Integer>> list = jdbcTemplate.query(sql, new RowMapper<Map<String, Integer>>(){
			@Override
			public Map<String, Integer> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put(rs.getString("movie_title"), rs.getInt("sum"));
				return map;
			}
		});
		return list;
	}
	
	@Override
	public List<Map<String, Integer>> getTotalList() {
		String sql = "select movie.movie_title, sum(ticket.tic_payment) as sum from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie group by movie_title";
		List<Map<String, Integer>> list = jdbcTemplate.query(sql, new RowMapper<Map<String, Integer>>(){
			@Override
			public Map<String, Integer> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put(rs.getString("movie_title"), rs.getInt("sum"));
				return map;
			}
		});
		return list;
	}
	
	@Override
	public List<Map<String, Integer>> getViewCount() {
		String sql ="select movie.movie_title, sum(length(tic_seat) - length(replace(tic_seat, ',', '')) + 1) as seat from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie group by movie_title";
		List<Map<String, Integer>> list = jdbcTemplate.query(sql, new RowMapper<Map<String, Integer>>(){
			@Override
			public Map<String, Integer> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put(rs.getString("movie_title"), rs.getInt("seat"));
				return map;
			}
		});
		return list;
	}
	@Override
	public List<Map<String, Integer>> getJuminCount(int jumin) {
		String sql = "select movie_title, sum(length(tic_seat) - length(replace(tic_seat, ',', '')) + 1) as jumin from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where substr(user.user_jumin, 8,1) = '"+jumin+"' group by movie_title";
		List<Map<String, Integer>> list = jdbcTemplate.query(sql, new RowMapper<Map<String, Integer>>(){
			@Override
			public Map<String, Integer> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put(rs.getString("movie_title"), rs.getInt("jumin"));
				return map;
			}
		});
		return list;
	}
	@Override
	public List<Map<String, Integer>> getTotalSeatList() {
		String sql = "select movie.movie_title, count(*) as total from screen join movie on movie.movie_code = screen.scr_movie group by movie_title";
		List<Map<String, Integer>> list = jdbcTemplate.query(sql, new RowMapper<Map<String,Integer>>(){
			@Override
			public Map<String, Integer> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put(rs.getString("movie_title"), rs.getInt("total"));
				return map;
			}
		});
		return list;
	}
}
