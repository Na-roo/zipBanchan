package com.itwill.board;

import java.util.Date;
import com.itwill.member.Member;
import com.itwill.product.Product;

public class Board {
	public int boardNo;
	public String title;
	public Date writeDate;
	public int evalPoint;
	public String content;
	public String memberId;
	public int productNo;
	
	public Board() { }

	public Board(String title, Date writeDate, int evalPoint, String content, String memberId, int productNo) {
		this.title = title;
		this.writeDate = writeDate;
		this.evalPoint = evalPoint;
		this.content = content;
		this.memberId = memberId;
		this.productNo = productNo;
	}

	public Board(int boardNo, String title, Date writeDate, int evalPoint, String content, String memberId, int productNo) {
		this.boardNo = boardNo;
		this.title = title;
		this.writeDate = writeDate;
		this.evalPoint = evalPoint;
		this.content = content;
		this.memberId = memberId;
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", writeDate=" + writeDate + ", evalPoint="
				+ evalPoint + ", content=" + content + ", memberId=" + memberId + ", productNo=" + productNo + "]";
	}
}
