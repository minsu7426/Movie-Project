package dto;

public class PageDto {

	private int totalCount; // 전체 게시글수
	private int startPage; // 시작 페이지
	private int endPage; // 마지막 페이지
	private Criteria cri; // 첫
	private int displayPageNum = 5; // 보여지는 페이수
	private boolean prev; // 앞 버튼
	private boolean next; // 뒷 버튼
	private int displayCount; // 한 페이지에 보여지는 게시물수
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public int getDisplayCount() {
		return displayCount;
	}
	
	
	public void calcData() {
		// 끝 페이지번호 = Math.ceil(현재페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		// 시작 페이지 번호 = (끝 페이지 번호 - 페이지 번호의 갯수) + 1
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		
		displayCount = totalCount - (cri.getPage() * 10 - 10);
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

}
