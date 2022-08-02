package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
import dto.MovieDto;
import dto.SlideDto;

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
	public List<MovieDto> getTotal_Screen(Criteria cri) {
		String sql;
		if(cri.getSearch_item() == null && cri.getText() == null) {
			sql = "select * from movie order by movie_date desc limit ?, ?";
		} else if(cri.getSearch_item().equals("") && cri.getText().equals("")) {
			sql = "select * from movie order by movie_date desc limit ?, ?";
		} else {
			sql = "select * from movie where "+ cri.getSearch_item() + " like '%" + cri.getText() + "%' order by movie_date desc limit ?, ?";
		}
		
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
		},cri.getPageStart(), cri.getPerPageNum());
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
	
	@Override
	public void setUpdate(MovieDto moviedto) {
		String sql = "update movie set movie_date = ?, movie_genre = ?, movie_grade = ?, movie_director = ?, movie_actor = ?, movie_time = ?, movie_board = ?, movie_flag = ? where movie_code = ?";
		jdbcTemplate.update(sql, moviedto.getMovie_date(),
				moviedto.getMovie_genre(),
				moviedto.getMovie_grade(),
				moviedto.getMovie_director(),
				moviedto.getMovie_actor(),
				moviedto.getMovie_time(),
				moviedto.getMovie_board(),
				moviedto.isMovie_flag(),
				moviedto.getMovie_code()
				);
	}
	
	@Override
	public Integer getAllCount(String search_item, String text) {
		String sql;
		if(search_item == null && text == null) {
			sql = "select count(*) from movie";
		} else if(search_item.equals("") && text.equals("")) {
			sql = "select count(*) from movie";
		} else {
			sql = "select count(*) from movie where "+ search_item + " like '%" + text + "%'";
		}
		
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	@Override
	public List<MovieDto> getShowedMovie(String id) {
		String sql = "select movie.movie_code, movie.movie_grade, ticket.tic_num, movie.movie_title, movie.movie_date, movie.movie_genre, movie.movie_director, movie.movie_actor, movie.movie_time, movie.movie_img from ticket join screen on ticket.tic_code = screen.scr_code join movie on movie.movie_code = screen.scr_movie where tic_id = ? group by movie.movie_title";
		List<MovieDto> results = jdbcTemplate.query(sql, new RowMapper<MovieDto>() {

			@Override
			public MovieDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDto movie = new MovieDto();
				movie.setMovie_code(rs.getInt("movie_code"));
				movie.setMovie_grade(rs.getInt("movie_grade"));
				movie.setMovie_title(rs.getString("movie_title"));
				movie.setMovie_date(rs.getString("movie_date"));
				movie.setMovie_genre(rs.getString("movie_genre"));
				movie.setMovie_director(rs.getString("movie_director"));
				movie.setMovie_actor(rs.getString("movie_actor"));
				movie.setMovie_time(rs.getInt("movie_time"));
				movie.setMovie_img(rs.getString("movie_img"));
				return movie;
			}
			
		}, id);
		return results;
	}
	
	@Override
	public List<SlideDto> getSlideMovie() {
		String sql = "select movie_title, movie_code, movie_img, sum(30 - (length(scr_seat) - length(replace(scr_seat, ',', '')) + 1)) as count from screen join movie on movie.movie_code = screen.scr_movie group by movie_code order by count desc";
		List<SlideDto> results = jdbcTemplate.query(sql, new RowMapper<SlideDto>() {

			@Override
			public SlideDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				SlideDto slide = new SlideDto();
				slide.setSlide_code(rs.getInt("movie_code"));
				slide.setSlide_count(rs.getInt("count"));
				slide.setSlide_img(rs.getString("movie_img"));
				slide.setSlide_title(rs.getString("movie_title"));
				return slide;
			}
			
		});
		return results;
	}
	
	@Override
	public void setDelete(String code) {
		String sql = "delete from movie where movie_code = "+code;
		jdbcTemplate.update(sql);
	}
}
