package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.ScheduleDto;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<ScheduleDto> getScheduleDate() {
		String sql = "select movie.*, screen.* from screen join movie on movie.movie_code = screen.scr_movie where scr_flag = 1 and scr_date > date_add(now(), interval -1 day) group by scr_date";
		List<ScheduleDto> results = jdbcTemplate.query(sql, new RowMapper<ScheduleDto>() {

			@Override
			public ScheduleDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScheduleDto schedule = new ScheduleDto();
				schedule.setSch_screendate(rs.getString("scr_date"));
				return schedule;
			}
			
		});
		return results;
	}
	
	@Override
	public List<ScheduleDto> getScheduleMovie(String date) {
		String sql = "select movie.*, screen.* from screen join movie on movie.movie_code = screen.scr_movie where scr_flag = 1 and scr_date > date_add(now(), interval -1 day) and scr_date = ? group by movie_title";
		List<ScheduleDto> results = jdbcTemplate.query(sql, new RowMapper<ScheduleDto>() {

			@Override
			public ScheduleDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScheduleDto schedule = new ScheduleDto();
				schedule.setSch_code(rs.getInt("movie_code"));
				schedule.setSch_title(rs.getString("movie_title"));
				schedule.setSch_genre(rs.getString("movie_genre"));
				schedule.setSch_grade(rs.getInt("movie_grade"));
				schedule.setSch_time(rs.getInt("movie_time"));
				schedule.setSch_date(rs.getString("movie_date"));
				schedule.setSch_img(rs.getString("movie_img"));
				return schedule;
			}
			
		},date);
		return results;
	}
	
	@Override
	public List<ScheduleDto> getScheduleScreen(String date) {
		String sql = "select movie.*, screen.* from screen join movie on movie.movie_code = screen.scr_movie where scr_flag = 1 and scr_date > date_add(now(), interval -1 day) and scr_date = ? group by scr_screen, movie_title";
		List<ScheduleDto> results = jdbcTemplate.query(sql, new RowMapper<ScheduleDto>() {

			@Override
			public ScheduleDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScheduleDto schedule = new ScheduleDto();
				schedule.setSch_title(rs.getString("movie_title"));
				schedule.setSch_screen(rs.getInt("scr_screen"));
				schedule.setSch_code(rs.getInt("movie_code"));
				return schedule;
			}
			
		},date);
		return results;
	}
	
	@Override
	public List<ScheduleDto> getScheduleSeat(String date) {
		String sql = "select movie.*, screen.* from screen join movie on movie.movie_code = screen.scr_movie where scr_flag = 1 and scr_date > date_add(now(), interval -1 day) and scr_date = ? order by scr_time asc";
		List<ScheduleDto> results = jdbcTemplate.query(sql, new RowMapper<ScheduleDto>() {

			@Override
			public ScheduleDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScheduleDto schedule = new ScheduleDto();
				schedule.setSch_code(rs.getInt("movie_code"));
				schedule.setSch_title(rs.getString("movie_title"));
				schedule.setSch_screen(rs.getInt("scr_screen"));
				schedule.setSch_screencode(rs.getInt("scr_code"));
				schedule.setSch_screentime(rs.getString("scr_time").substring(0, 5));
				schedule.setSch_screendate(rs.getString("scr_date"));
				schedule.setSch_seat(rs.getString("scr_seat"));
				return schedule;
			}
			
		},date);
		return results;
	}
}
