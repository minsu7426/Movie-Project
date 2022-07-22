package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
import dto.ReviewDataDto;
import dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void setInsertReview(ReviewDto reviewDto) {
		String sql = "insert into review(review_id, review_movie, review_star, review_date, review_content) values (?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, 
				reviewDto.getReview_id(),
				reviewDto.getReview_movie(),
				reviewDto.getReview_star(),
				reviewDto.getReview_date(),
				reviewDto.getReview_content());
	}
	
	@Override
	public List<ReviewDto> getListByMovie(String movie_code) {
		String sql = "select * from review where review_movie = ? order by review_date desc";
		List<ReviewDto> results = jdbcTemplate.query(sql, new RowMapper<ReviewDto>() {

			@Override
			public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReviewDto reviewDto = new ReviewDto();
				reviewDto.setReview_code(rs.getInt("review_code"));
				reviewDto.setReview_content(rs.getString("review_content"));
				reviewDto.setReview_date(rs.getString("review_date").substring(0, 19));
				reviewDto.setReview_id(rs.getString("review_id"));
				reviewDto.setReview_movie(rs.getInt("review_movie"));
				reviewDto.setReview_star(rs.getFloat("review_star"));
				return reviewDto;
			}
			
		},movie_code);

		return results;
	}
	@Override
	public void setDeleteReview(String review_code) {
		String sql = "delete from review where review_code = ?";
		jdbcTemplate.update(sql, review_code);
	}
	
	@Override
	public List<ReviewDataDto> getAllList(String search_item, String text, Criteria cri) {
		String sql;
		if(search_item == null && text == null) {
			sql = "select review.*, movie.movie_title from review inner join movie on review.review_movie = movie.movie_code order by review.review_date desc limit ?, ?";
		} else if(search_item.equals("") && text.equals("")){
			sql = "select review.*, movie.movie_title from review inner join movie on review.review_movie = movie.movie_code order by review.review_date desc limit ?, ?";
		} else {
			sql = "select review.*, movie.movie_title from review inner join movie on review.review_movie = movie.movie_code where " + search_item + " like '%" + text + "%' order by review.review_date desc limit ?, ?";
		}
		
		List<ReviewDataDto> results = jdbcTemplate.query(sql, new RowMapper<ReviewDataDto>() {

			@Override
			public ReviewDataDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReviewDataDto reviewDataDto = new ReviewDataDto();
				reviewDataDto.setReview_code(rs.getInt("review_code"));
				reviewDataDto.setReview_content(rs.getString("review_content"));
				reviewDataDto.setReview_date(rs.getString("review_date").substring(0, 19));
				reviewDataDto.setReview_movie(rs.getInt("review_movie"));
				reviewDataDto.setReview_star(rs.getFloat("review_star"));
				reviewDataDto.setReview_id(rs.getString("review_id"));
				reviewDataDto.setMovie_title(rs.getString("movie_title"));
				return reviewDataDto;
			}
			
		}, cri.getPageStart(), cri.getPerPageNum());
		return results;
	}
	
	@Override
	public Integer getAllCount(String search_item, String text) {
		String sql = "select count(*) from review";
		if(search_item == null && text == null) {
			sql = "select count(*) from review";
		} else if(search_item.equals("") && text.equals("")) {
			sql = "select count(*) from review";
		} else {
			sql = "select count(*) from review where "+ search_item + " like '%" + text + "%'";
		}
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
}
