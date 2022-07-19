package dto;

public class PageDto {

	private int totalCount;
	private int startPage;
	private int endPage;
	private Criteria cri;
	private int displayPageNum = 5;
	private boolean prev;
	private boolean next;
	
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void calcData() {
		// 끝 페이지번호 = Math.ceil(현재페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		// 시작 페이지 번호 = (끝 페이지 번호 - 페이지 번호의 갯수) + 1
		startPage = (endPage - displayPageNum) + 1;
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		
	}
	
	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public Criteria getCri() {
		return cri;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	
	
	
	
////	private Criteria cri;
//	// 전체 글의 수
//	private int total;
//	// 시작 페이지 번호
//	private int startPage;
//	// 종료 페이지 번호
//	private int endPage;
//	private int displayPageNum = 5;
//	
//	// 현재 페이지 번호
//	private int currentPage;
//	// 전체 페이지 개수
//	private int totalPages;
//	// 페이징의 개수
//	private int pagingCount;
//	
//	
//	public PageDto(int total, int currentPage, int pagingCount) {
//		this.total = total;
//		this.currentPage = currentPage;
//		this.pagingCount = pagingCount;
//		
//		if(total == 0) {
//			totalPages = 0;
//			startPage = 0;
//			endPage = 0;
//		} else {
//			totalPages = total / 10;
//			if(totalPages % 10 == 0) {
//				totalPages++;
//			}
//			//[1] [2] [3] [4] [5]에서 3일때, 
//			startPage = currentPage-1;
//			endPage = totalPages;
//		}
//	}
	
	
}
