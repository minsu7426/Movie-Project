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

	@Override
	public List<MovieDto> getTotal_Screen() {
		String sql = "select * from movie";
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
	public MovieDto getMovie_Detail(String movie_code) {
		String sql = "select * from movie where movie_code = ?";
		List<MovieDto> dto = jdbcTemplate.query(sql, new RowMapper<MovieDto>() {
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
		}, movie_code);
		return dto.get(0);
	}

	@Override
	public void setAdd(MovieDto movieDto) {
		String sql = "insert into movie(movie_title, movie_date, movie_genre, "
				+ "movie_grade, movie_director, movie_actor, movie_time, movie_board, movie_img)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, movieDto.getMovie_title(), movieDto.getMovie_date(),
				movieDto.getMovie_genre(), movieDto.getMovie_grade(), movieDto.getMovie_director(),
				movieDto.getMovie_actor(), movieDto.getMovie_time(), movieDto.getMovie_board(),
				movieDto.getMovie_img());
	}
}
