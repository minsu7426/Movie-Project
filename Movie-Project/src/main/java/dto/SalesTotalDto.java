package dto;

public class SalesTotalDto {

	private int rank;
	private String sales_title;
	private int sales_today;
	private int sales_total;
	private int sales_viewCount;
	private float sales_man;
	private float sales_woman;
	private float sales_viewing;

	public float getSales_viewing() {
		return sales_viewing;
	}
	public void setSales_viewing(float sales_viewing) {
		this.sales_viewing = sales_viewing;
	}
	public String getSales_title() {
		return sales_title;
	}
	public void setSales_title(String sales_title) {
		this.sales_title = sales_title;
	}
	public int getSales_today() {
		return sales_today;
	}
	public void setSales_today(int sales_today) {
		this.sales_today = sales_today;
	}
	public int getSales_total() {
		return sales_total;
	}
	public void setSales_total(int sales_total) {
		this.sales_total = sales_total;
	}
	public int getSales_viewCount() {
		return sales_viewCount;
	}
	public void setSales_viewCount(int sales_viewCount) {
		this.sales_viewCount = sales_viewCount;
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
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
}
