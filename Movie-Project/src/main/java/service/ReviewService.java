package service;

import java.util.List;

import dto.Criteria;
import dto.ReviewDataDto;
import dto.ReviewDto;

public interface ReviewService {

	// 리뷰 등록
	public void setInsertReview(ReviewDto reviewDto);
	
	// 해당 영화 리뷰 가져오기
	public List<ReviewDto> getListByMovie(String movie_code);
	
	// 리뷰 삭제
	public void setDeleteReview(String review_code);
	
	//모든 리뷰 가져오기
	public List<ReviewDataDto> getAllList(String search_item, String text, Criteria cri);
	
	// 리뷰 개수 가져오기
	public Integer getAllCount(String search_item, String text);
}
