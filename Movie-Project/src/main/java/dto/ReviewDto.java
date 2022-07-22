package dto;

public class ReviewDto {
	
	private int review_code;
	private String review_id;
	private int review_movie;
	private float review_star;
	private String review_date;
	private String review_content;
	
	public int getReview_code() {
		return review_code;
	}
	
	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}
	
	public String getReview_id() {
		return review_id;
	}
	
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	
	public int getReview_movie() {
		return review_movie;
	}
	
	public void setReview_movie(int review_movie) {
		this.review_movie = review_movie;
	}
	
	public float getReview_star() {
		return review_star;
	}
	
	public void setReview_star(float review_star) {
		this.review_star = review_star;
	}
	
	public String getReview_date() {
		return review_date;
	}
	
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	public String getReview_content() {
		return review_content;
	}
	
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	
}
