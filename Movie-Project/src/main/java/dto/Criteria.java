package dto;

public class Criteria {

	private int page;
	private int perPageNum;

	//int page : 현재 페이지 번호
	//int perPageNum : 한 페이지당 보여줄 게시글의 갯수
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	// 뭔지 모르겠음?
//	public void setPerPageNum(int pageCount) {
//		int cnt = this.perPageNum;
//		if(pageCount != cnt) {
//			this.perPageNum = cnt;
//		}
//		this.perPageNum = pageCount;
//	}

	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	
}