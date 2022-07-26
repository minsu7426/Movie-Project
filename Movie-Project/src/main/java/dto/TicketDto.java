package dto;

public class TicketDto {

	private int tic_num;
	private int tic_code;
	private String tic_id;
	private String tic_seat;
	private int tic_payment;
	private String tic_paytime;
	private String movie_title;
	
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public int getTic_num() {
		return tic_num;
	}
	public void setTic_num(int tic_num) {
		this.tic_num = tic_num;
	}
	public int getTic_code() {
		return tic_code;
	}
	public void setTic_code(int tic_code) {
		this.tic_code = tic_code;
	}
	public String getTic_id() {
		return tic_id;
	}
	public void setTic_id(String tic_id) {
		this.tic_id = tic_id;
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
	public String getTic_paytime() {
		return tic_paytime;
	}
	public void setTic_paytime(String tic_paytime) {
		this.tic_paytime = tic_paytime;
	}
	
	
}
