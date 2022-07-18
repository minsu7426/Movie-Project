package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<MovieDto> getCurrentList() {
		String sql = "select * from movie where (movie_date < now()) and movie_flag = true";
		List<MovieDto> list = jdbcTemplate.query(sql, new RowMapper<MovieDto>() {

			@Override
			public MovieDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDto dto = new MovieDto();
				dto.setMovie_code(rs.getInt("movie_code"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setMovie_date(rs.getString("movie_date"));
				dto.setMovie_genre(rs.getString("movie_genre"));
				dto.setMovie_grade(rs.getInt("movie_grade"));
				dto.setMovie_director(rs.getString("movie_director"));
				dto.setMovie_actor(rs.getString("movie_actor"));
				dto.setMovie_time(rs.getInt("movie_time"));
				dto.setMovie_board(rs.getString("movie_board"));
				dto.setMovie_img(rs.getString("movie_img"));
				dto.setMovie_like(rs.getInt("movie_like"));
				dto.setMovie_flag(rs.getBoolean("movie_flag"));
				return dto;
			}
		});
		return list;
	}

	@Override
	public List<MovieDto> getShown_screenList() {
		String sql = "select * from movie where (movie_date > now())";
		List<MovieDto> list = jdbcTemplate.query(sql, new RowMapper<MovieDto>() {

			@Override
			public MovieDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDto dto = new MovieDto();
				dto.setMovie_code(rs.getInt("movie_code"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setMovie_date(rs.getString("movie_date"));
				dto.setMovie_genre(rs.getString("movie_genre"));
				dto.setMovie_grade(rs.getInt("movie_grade"));
				dto.setMovie_director(rs.getString("movie_director"));
				dto.setMovie_actor(rs.getString("movie_actor"));
				dto.setMovie_time(rs.getInt("movie_time"));
				dto.setMovie_board(rs.getString("movie_board"));
				dto.setMovie_img(rs.getString("movie_img"));
				dto.setMovie_like(rs.getInt("movie_like"));
				dto.setMovie_flag(rs.getBoolean("movie_flag"));
				return dto;
			}
		});
		return list;
	}
	

}
