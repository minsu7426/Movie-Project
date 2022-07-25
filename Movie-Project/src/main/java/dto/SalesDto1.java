package dto;

public class SalesDto1 {
	
	private String sales_movie; //영화 이름 movie.movie_title
	private long sales_payment; //금액 ticket.tic_payment
	private String sales_date; //영화 상영 날짜 screen.scr_date
	private String sales_paytime; //결제 시간 ticket.tic_paytime
	private String sales_jumin; //관람객 주민번호 user.user_jumin
	private String sales_seat; //상영관 좌석
	
	public String getSales_seat() {
		return sales_seat;
	}
	public void setSales_seat(String sales_seat) {
		this.sales_seat = sales_seat;
	}
	public String getSales_paytime() {
		return sales_paytime;
	}
	public void setSales_paytime(String sales_paytime) {
		this.sales_paytime = sales_paytime;
	}
	public long getSales_payment() {
		return sales_payment;
	}
	public void setSales_payment(long sales_payment) {
		this.sales_payment = sales_payment;
	}
	public String getSales_movie() {
		return sales_movie;
	}
	public void setSales_movie(String sales_movie) {
		this.sales_movie = sales_movie;
	}
	public String getSales_date() {
		return sales_date;
	}
	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}
	public String getSales_jumin() {
		return sales_jumin;
	}
	public void setSales_jumin(String sales_jumin) {
		this.sales_jumin = sales_jumin;
	}
	
	
}
