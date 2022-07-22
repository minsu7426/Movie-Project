package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.MovieDto;
import dto.ScreenDto;

@Repository
public class ScreenDaoImpl implements ScreenDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<ScreenDto> getScreenList() {
		String sql = "select * from screen where scr_flag = true order by scr_date asc";
		List<ScreenDto> list = jdbcTemplate.query(sql, new RowMapper<ScreenDto>() {
			@Override
			public ScreenDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScreenDto dto = new ScreenDto();
				dto.setScr_code(rs.getInt("scr_code"));
				dto.setScr_movie(rs.getInt("scr_movie"));
				dto.setScr_seat(rs.getString("scr_seat"));
				dto.setScr_screen(rs.getString("scr_screen"));
				dto.setScr_time(rs.getString("scr_time").substring(0,5));
				dto.setScr_date(rs.getString("scr_date"));
				return dto;
			}
		});
		
		return list;
	}

	@Override
	public int getScreenCount() {
		return 0;
	}
	
	@Override
	public List<MovieDto> getMovieList() {
		String sql = "select movie_code, movie_title from movie";
		List<MovieDto> list = jdbcTemplate.query(sql, new RowMapper<MovieDto>() {
			@Override
			public MovieDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDto dto = new MovieDto();
				dto.setMovie_code(rs.getInt("movie_code"));
				dto.setMovie_title(rs.getString("movie_title"));
				return dto;
			}
		});
		
		return list;
	}

	@Override
	public void setScreenAdd(ScreenDto dto, List<String> timeChecked, List<LocalDate> date) {
		String sql = "insert into screen(scr_movie, scr_screen, scr_date, scr_time) values (?, ?, ?, ?)";
		for (int i = 0; i < timeChecked.size(); i++) {
			for (int j = 0; j < date.size(); j++) {
				jdbcTemplate.update(sql, dto.getScr_movie(), dto.getScr_screen(), date.get(j), timeChecked.get(i));
			}
		}
	}
	
	@Override
	public ScreenDto getUpdate(String scr_code) {
		String sql = "select * from screen where scr_code = ?";
		List<ScreenDto> dto = jdbcTemplate.query(sql, new RowMapper<ScreenDto>() {
			@Override
			public ScreenDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScreenDto dto = new ScreenDto();
				dto.setScr_code(rs.getInt("scr_code"));
				dto.setScr_movie(rs.getInt("scr_movie"));
				dto.setScr_seat(rs.getString("scr_seat"));
				dto.setScr_screen(rs.getString("scr_screen"));
				dto.setScr_time(rs.getString("scr_time"));
				dto.setScr_date(rs.getString("scr_date"));
				return dto;
			}
		},scr_code);
		return dto.get(0);
	}
	
	@Override
	public String getMovieTitle(String scr_code) {
		String sql = "select movie.movie_title from screen inner join movie on screen.scr_movie = movie.movie_code  where scr_code = " + scr_code;
		String title = jdbcTemplate.queryForObject(sql, String.class);
		return title;
	}
	
	@Override
	public void setDelete(String scr_code) {
		String sql = "delete from screen where scr_code ="+scr_code;
		jdbcTemplate.update(sql);
	}
	
	@Override
	public void setUpdate(ScreenDto dto) {
		String sql = "update screen set scr_date = ?, scr_screen= ?, scr_time = ? where scr_code = ?";
		jdbcTemplate.update(sql, dto.getScr_date(), dto.getScr_screen(), dto.getScr_time(), dto.getScr_code());
	}
}
