package dto;

public class Criteria {

	private int page;
	private int perPageNum;
	private String search_item;
	private String text;

	// int page : 현재 페이지 번호
	// int perPageNum : 한 페이지당 보여줄 게시글의 갯수

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public String getSearch_item() {
		return search_item;
	}

	public void setSearch_item(String search_item) {
		this.search_item = search_item;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
