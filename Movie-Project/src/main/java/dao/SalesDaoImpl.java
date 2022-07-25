package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.SalesDto1;

@Repository
public class SalesDaoImpl implements SalesDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int getToday(String movie_title) {
		String sql = "select sum(ticket.tic_payment) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and ticket.tic_paytime = curdate()";
		Integer today = jdbcTemplate.queryForObject(sql, Integer.class);
		return today;
	}
	
	@Override
	public int getYesday(String movie_title) {
		String sql = "select sum(ticket.tic_payment) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') = curdate() - interval 1 day";
		Integer yesday = jdbcTemplate.queryForObject(sql, Integer.class);
		return yesday;
	}
	
	@Override
	public int getWeek(String movie_title) {
		String sql = "select sum(ticket.tic_payment) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') between DATE_ADD(now(), interval -1 week ) and now()";
		Integer week = jdbcTemplate.queryForObject(sql, Integer.class);
		return week;
	}
	
	@Override
	public int getMonth(String movie_title) {
		String sql = "select sum(ticket.tic_payment) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and date_format(tic_paytime,'%Y-%m-%d') between DATE_ADD(now(), interval -1 month ) and now()";
		Integer month = jdbcTemplate.queryForObject(sql, Integer.class);
		return month;
	}
	
	@Override
	public int getTotal(String movie_title) {
		String sql = "select sum(ticket.tic_payment) from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		Integer total = jdbcTemplate.queryForObject(sql, Integer.class);
		return total;
	}
	
	@Override
	public List<Integer> getTodaySeat(String movie_title) {
		String sql = "select length(scr_seat) - length(replace(scr_seat, ',', '')) + 1 from screen join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and screen.scr_date = curdate()";
		List<Integer> today = jdbcTemplate.queryForList(sql,Integer.class);
		return today;
	}
	
	@Override
	public List<Integer> getTotalSeat(String movie_title) {
		String sql = "select length(scr_seat) - length(replace(scr_seat, ',', '')) + 1 from screen join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		List<Integer> total = jdbcTemplate.queryForList(sql,Integer.class);
		return total;
	}
	
	@Override
	public int getViewCount(String movie_title) {
		String sql = "select count(*) from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		int viewCount = jdbcTemplate.queryForObject(sql, Integer.class);
		return viewCount;
	}
	
	@Override
	public int getManCount(String movie_title) {
		String sql = "select count(*) from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"' and substr(user.user_jumin, 8,1) = '1'";
		int manList = jdbcTemplate.queryForObject(sql, Integer.class);
		return manList;
	}
	
	@Override
	public float getAvgAge(String movie_title) {
		String sql = "select avg(substr(user.user_jumin, 1,2)) from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '"+movie_title+"'";
		Float avgAge = jdbcTemplate.queryForObject(sql, Float.class);
		return avgAge;
	}
	
	@Override
	public List<SalesDto1> getSalesMovieList() {

		String sql = "select movie.movie_title as sales_movie, ticket.tic_payment as sales_payment, screen.scr_date as sales_date, ticket.tic_paytime as sales_paytime, user.user_jumin as sales_jumin, screen.scr_seat as sales_seat from ticket join user on user.user_id = ticket.tic_id join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where movie.movie_title = '헤어질 결심';";


		List<SalesDto1> list = jdbcTemplate.query(sql, new RowMapper<SalesDto1>() {
			@Override
			public SalesDto1 mapRow(ResultSet rs, int rowNum) throws SQLException {
				SalesDto1 dto = new SalesDto1();
				dto.setSales_movie(rs.getString("sales_movie"));
				dto.setSales_payment(rs.getInt("sales_payment"));
				dto.setSales_date(rs.getString("sales_date"));
				dto.setSales_paytime(rs.getString("sales_paytime").substring(0,10));
				dto.setSales_jumin(rs.getString("sales_jumin"));
				dto.setSales_seat(rs.getString("sales_seat"));
				return dto;
			}
		});
		return list;
	}
}
