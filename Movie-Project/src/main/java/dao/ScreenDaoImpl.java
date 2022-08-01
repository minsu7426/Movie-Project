package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
import dto.MovieDto;
import dto.ScreenDto;

@Repository
public class ScreenDaoImpl implements ScreenDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public void setFlag() {
		String sql = "update screen set scr_flag = false where date_format(concat(scr_date,' ', scr_time),'%Y-%m-%d %H:%i:%S') < now()";
		jdbcTemplate.update(sql);
	}
	
	@Override
	public List<ScreenDto> getScreenList(Criteria cri) {
		String title = cri.getSearch_item();
		String text = "'%" + cri.getText() +"%'";
		String sql;
		
		if(cri.getSearch_item() == null || cri.getSearch_item().equals("")) {
			sql = "select movie.movie_title, screen.scr_code, screen.scr_movie, screen.scr_seat, screen.scr_screen, screen.scr_time, screen.scr_date, screen.scr_flag from screen join movie on movie.movie_code = screen.scr_movie order by scr_flag = true desc, scr_date desc limit ?, ?";
		} else {
			sql = "select movie.movie_title, screen.scr_code, screen.scr_movie, screen.scr_seat, screen.scr_screen, screen.scr_time, screen.scr_date, screen.scr_flag from screen join movie on movie.movie_code = screen.scr_movie where "+ title +" like "+ text +" order by scr_flag = true desc, scr_date desc limit ?, ?";
		}
		List<ScreenDto> list = jdbcTemplate.query(sql, new RowMapper<ScreenDto>() {
			@Override
			public ScreenDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScreenDto dto = new ScreenDto();
				dto.setScr_code(rs.getInt("scr_code"));
				dto.setScr_movie(rs.getInt("scr_movie"));
				dto.setScr_seat(rs.getString("scr_seat"));
				dto.setScr_screen(rs.getString("scr_screen"));
				dto.setScr_time(rs.getString("scr_time").substring(0, 5));
				dto.setScr_date(rs.getString("scr_date"));
				dto.setScr_flag(rs.getBoolean("scr_flag"));
				return dto;
			}
		}, cri.getPageStart(), cri.getPerPageNum());

		return list;
	}

	@Override
	public int getScreenCount(Criteria cri) {
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
		String seat = "A1,A2,A3,A4,A5,A6,B1,B2,B3,B4,B5,B6,C1,C2,C3,C4,C5,C6,D1,D2,D3,D4,D5,D6,E1,E2,E3,E4,E5,E6";
		String sql = "insert into screen(scr_movie, scr_screen, scr_date, scr_time, SCR_SEAT) values (?, ?, ?, ?, '"+seat+"')";
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
				dto.setScr_flag(rs.getBoolean("scr_flag"));
				return dto;
			}
		}, scr_code);
		return dto.get(0);
	}

	@Override
	public String getMovieTitle(String scr_code) {
		String sql = "select movie.movie_title from screen inner join movie on screen.scr_movie = movie.movie_code  where scr_code = "
				+ scr_code;
		String title = jdbcTemplate.queryForObject(sql, String.class);
		return title;
	}

	@Override
	public void setDelete(String scr_code) {
		String sql = "delete from screen where scr_code =" + scr_code;
		jdbcTemplate.update(sql);
	}

	@Override
	public void setUpdate(ScreenDto dto) {
		String sql = "update screen set scr_date = ?, scr_screen= ?, scr_time = ?, scr_flag = ? where scr_code = ?";
		jdbcTemplate.update(sql, dto.getScr_date(), dto.getScr_screen(), dto.getScr_time(), dto.isScr_flag(), dto.getScr_code());
	}

	@Override
	public int getListCount(Criteria cri) {
		String title = cri.getSearch_item();
		String text = "'%" + cri.getText() + "%'";
		String sql;
		if (cri.getSearch_item() == null || cri.getSearch_item().equals("")) {
			sql = "select count(*) from screen";
		} else {
			sql = "select count(*) from screen join movie on movie.movie_code = screen.scr_movie where " + title + " like " + text;
		}
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
}
