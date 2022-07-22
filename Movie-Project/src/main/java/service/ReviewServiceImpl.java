package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewDao;
import dto.Criteria;
import dto.ReviewDataDto;
import dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void setInsertReview(ReviewDto reviewDto) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String review_date = formatter.format(new Date());
		reviewDto.setReview_date(review_date);
		reviewDao.setInsertReview(reviewDto);
	}
	
	@Override
	public List<ReviewDto> getListByMovie(String movie_code) {
		return reviewDao.getListByMovie(movie_code);
	}
	
	@Override
	public void setDeleteReview(String review_code) {
		reviewDao.setDeleteReview(review_code);
	}
	
	@Override
	public List<ReviewDataDto> getAllList(String search_item, String txt, Criteria cri) {
		return reviewDao.getAllList(search_item, txt, cri);
	}
	
	@Override
	public Integer getAllCount(String search_item, String txt) {
		return reviewDao.getAllCount(search_item, txt);
	}
}
