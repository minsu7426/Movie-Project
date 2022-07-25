package dto;

public class SalesMovieDto {

	private int sales_today; //금일 매출
	private int sales_yesday; //전일 매출
	private int sales_week; //주간 매출
	private int sales_month; //월간 매출
	private int sales_total; //전체 매출
	private float sales_viewing_today; //금일 관람율
	private float sales_viewing_total; //전체 관람율
	private float sales_man; //남성 비율
	private float sales_woman; //여성 비율
	private float sales_avg; //평균 연령
	
	public int getSales_today() {
		return sales_today;
	}
	public void setSales_today(int sales_today) {
		this.sales_today = sales_today;
	}
	public int getSales_yesday() {
		return sales_yesday;
	}
	public void setSales_yesday(int sales_yesday) {
		this.sales_yesday = sales_yesday;
	}
	public int getSales_week() {
		return sales_week;
	}
	public void setSales_week(int sales_week) {
		this.sales_week = sales_week;
	}
	public int getSales_month() {
		return sales_month;
	}
	public void setSales_month(int sales_month) {
		this.sales_month = sales_month;
	}
	public int getSales_total() {
		return sales_total;
	}
	public void setSales_total(int sales_total) {
		this.sales_total = sales_total;
	}
	public float getSales_viewing_today() {
		return sales_viewing_today;
	}
	public void setSales_viewing_today(float sales_viewing_today) {
		this.sales_viewing_today = sales_viewing_today;
	}
	public float getSales_viewing_total() {
		return sales_viewing_total;
	}
	public void setSales_viewing_total(float sales_viewing_total) {
		this.sales_viewing_total = sales_viewing_total;
	}
	public float getSales_man() {
		return sales_man;
	}
	public void setSales_man(float sales_man) {
		this.sales_man = sales_man;
	}
	public float getSales_woman() {
		return sales_woman;
	}
	public void setSales_woman(float sales_woman) {
		this.sales_woman = sales_woman;
	}
	public void setSales_woman(int sales_woman) {
		this.sales_woman = sales_woman;
	}
	public float getSales_avg() {
		return sales_avg;
	}
	public void setSales_avg(float sales_avg) {
		this.sales_avg = sales_avg;
	}
	
	
}
