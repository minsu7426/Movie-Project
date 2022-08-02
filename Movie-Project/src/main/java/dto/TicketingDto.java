package dto;

public class TicketingDto {

	private String tic_paytime; //예매일자
	private String tic_num; //예매번호 pk
	private String movie_title; //영화 제목
	private String scr_datetime; //상영시간과 일자
	private int scr_screen; //상영관
	private String tic_seat; //좌석 번호
	private int tic_payment; //결제 금액
	
	public String getTic_paytime() {
		return tic_paytime;
	}
	public void setTic_paytime(String tic_paytime) {
		this.tic_paytime = tic_paytime;
	}
	public String getTic_num() {
		return tic_num;
	}
	public void setTic_num(String tic_num) {
		this.tic_num = tic_num;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getScr_datetime() {
		return scr_datetime;
	}
	public void setScr_datetime(String scr_datetime) {
		this.scr_datetime = scr_datetime;
	}
	public int getScr_screen() {
		return scr_screen;
	}
	public void setScr_screen(int scr_screen) {
		this.scr_screen = scr_screen;
	}
	public String getTic_seat() {
		return tic_seat;
	}
	public void setTic_seat(String tic_seat) {
		this.tic_seat = tic_seat;
	}
	public int getTic_payment() {
		return tic_payment;
	}
	public void setTic_payment(int tic_payment) {
		this.tic_payment = tic_payment;
	}

	
}
