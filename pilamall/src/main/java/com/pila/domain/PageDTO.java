package com.pila.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage; //시작페이지
	private int endPage; //마지막페이지
	private boolean prev; //이전버튼
	private boolean next; //다음버튼
	private int total; //총게시물 수
	private Criteria cri; //pageNum,amount
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		//현재페이지에서 10.0으로 나누고 올림처리(ceil)를 하고 10을 곱한다.
		//4페이지라고 가정하면 0.4 -> 1 -> 10 임으로 endPage는 10
		
		this.startPage = this.endPage - 9;
		//엔드페이지의 -9를 한다.
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		//총 게시물이 21개라고 가정을 한다면 realEnd = 3;
		//21개라고 가정을 하면 21.0 -> 2.1 -> 3
		
		//총게시물이 64개여서 realEnd가 7인데
		//endPage는 endPage가 10으로 나와서 8,9,10페이지는 표시하면 안되기 때문에
		//endPage가 realEnd보다 크다면 endPage를 realEnd에 맞춤
		//10페이지가 7페이지로 됨
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1; //11페이지 이상부터 생성 prev버튼을 생성
		this.next = this.endPage < realEnd; //마지막 페이징부분에서는 next버튼이 없음
	}
}
