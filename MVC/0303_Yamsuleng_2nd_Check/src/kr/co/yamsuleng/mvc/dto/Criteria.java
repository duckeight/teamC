package kr.co.yamsuleng.mvc.dto;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	//페이징 버튼의 총 개수
	private static final float BTN_AMOUNT = 5.0f;
	private int pageNo;
	private int amount;
	
	private String searchType;
	private String searchKeyWord;

	
	//쪽 이동을 위한 추가 정보
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;


	private int totalDataCount;		//전체 데이타 건수

	public Criteria() {
		this(1, 3);
	}

	public Criteria(int pageNo, int amount) {
		this.pageNo = pageNo;
		this.amount = amount;
	}

	
	public void setTotalCount(int totalCount) {
		this.totalDataCount = totalCount;
		
		calcPagination();
	}
	
	public String getSearchType() {
		return searchType;
	}

	public String[] getSearchTypes() {
		//정보가 없으면? 빈 배열로... 있다면 모든 각 단어를 배열 요소로
		return searchType == null ? new String[] {} : searchType.split("");
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyWord() {
		return searchKeyWord;
	}

	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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


	private void calcPagination() {

//		endPage = (int) (Math.ceil(pageNo / BTN_AMOUNT) * BTN_AMOUNT);
//		startPage =  endPage - (int)(BTN_AMOUNT-1);
//		int realEnd = (int) (Math.ceil((totalDataCount * 1.0) / pageNo));
//		if (realEnd  <   endPage)  {
//			endPage  =   realEnd; }
//			prev = startPage > 1; 
//			next =  endPage  <   realEnd;
//		}

		//구글 스타일 : 중앙이 선택된 쪽이야   3
		startPage = pageNo - (int) Math.floor(BTN_AMOUNT / 2);
		if (startPage < 1)
			startPage = 1;
		endPage = startPage + (int) (BTN_AMOUNT - 1);
		
		//구글 스타일의 실질 마지막 쪽 번호
		int realEnd = (int) Math.ceil((float) totalDataCount / amount);
		if (realEnd < endPage) {
			endPage = realEnd; 
			startPage = endPage - (int) BTN_AMOUNT + 1;
			if (startPage < 1)
				startPage = 1;
		}
		//앞은 있니?
		prev = startPage > 1;
		//뒤로는 있니?
		next = endPage < realEnd;
	}

	public String getQueryParams() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNo", pageNo)
				.queryParam("amount", amount);
		if (searchType != null && !searchType.isEmpty())
			builder.queryParam("searchType", searchType);
		if (searchKeyWord != null && !searchKeyWord.isEmpty())
			builder.queryParam("searchKeyWord", searchKeyWord);
		return builder.toUriString();
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNo=" + pageNo + ", searchType=" + searchType + ", searchKeyWord=" + searchKeyWord
				+ ", startPage=" + startPage + ", totalDataCount=" + totalDataCount + "]";
	}


}
