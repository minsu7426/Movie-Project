package dto;

public class ScreenDto {

	private int scr_code;
	private int scr_movie;
	private String scr_seat;
	private String scr_screen;
	private String scr_date;
	private String date_start;
	private String date_end;
	private String scr_time;
	private String movie_title;
	private boolean scr_flag;
	
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public int getScr_code() {
		return scr_code;
	}
	public void setScr_code(int scr_code) {
		this.scr_code = scr_code;
	}
	public int getScr_movie() {
		return scr_movie;
	}
	public void setScr_movie(int scr_movie) {
		this.scr_movie = scr_movie;
	}
	public String getScr_seat() {
		return scr_seat;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	public void setScr_seat(String scr_seat) {
		this.scr_seat = scr_seat;
	}
	public String getScr_screen() {
		return scr_screen;
	}
	public void setScr_screen(String scr_screen) {
		this.scr_screen = scr_screen;
	}
	public String getScr_date() {
		return scr_date;
	}
	public void setScr_date(String scr_date) {
		this.scr_date = scr_date;
	}
	public String getScr_time() {
		return scr_time;
	}
	public void setScr_time(String scr_time) {
		this.scr_time = scr_time;
	}
	public boolean isScr_flag() {
		return scr_flag;
	}
	public void setScr_flag(boolean scr_flag) {
		this.scr_flag = scr_flag;
	}
	
	
}
