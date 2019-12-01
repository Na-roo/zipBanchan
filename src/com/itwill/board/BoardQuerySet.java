package com.itwill.board;

public class BoardQuerySet {
	
	public static String BOARD_ALL_SELECT = "SELECT * FROM board";
	
	// BOARD_SELECT_AS_BOARD_NO 구문의 ? 순서에 대한 설명
	// 게시판에 입력된 번호(b_no)
	public static String BOARD_SELECT_AS_BOARD_NO = "SELECT * FROM board WHERE b_no = ?";
	
	// 사용자 아이디로 게시물 찾기
	public static String BOARD_SELECT_AS_MEMBER_ID = "SELECT * FROM board WHERE m_id = ?";
	
	// 게시판 제목으로 게시물 찾기
	public static String BOARD_SELECT_AS_BOARD_TITLE = "SELECT * FROM board WHERE title LIKE ?";
	
	// 게시물 페이징 하기
	public static String BOARD_SELECT_AS_PAGING = "SELECT B.b_no, B.title, B.writeDate, B.evalPoint, B.b_content, B.m_id, B.p_no " +
												  "FROM" + 
												  "(" +
												        "SELECT ROWNUM as NUM, b_no, title, writeDate, evalPoint, b_content, m_id, p_no " +
												        "FROM board " + 
												        "ORDER BY b_no DESC" +
												   ") B " +
													"WHERE B.NUM >= ? AND B.NUM <= ? " +
													"ORDER BY b_no DESC, writeDate DESC";
												
	
	// BOARD_INSERT 구문의 ? 순서에 대한 설명
	// 제목(title), 평점(evalPoint), 내용(b_content), 사용자 아이디(m_id), 상품 번호(p_no) 
	public static String BOARD_INSERT = "INSERT INTO board VALUES (BOARD_SEQ.nextval, ?, sysdate, ?, ?, ? ,?)";
	
	// BOARD_UPDATE 구문의 ? 순서에 대한 설명
	// 게시판 제목(title), 평점(evalPoint), 내용(b_content), 게시판 번호(b_no)
	public static String BOARD_UPDATE = "UPDATE board SET title = ?, writeDate = sysdate, evalPoint = ?, b_content = ? WHERE b_no = ?";
	
	// BOARD_DELETE 구문의 ? 순서에 대한 설명
	// 게시판 번호(b_no)
	public static String BOARD_DELETE = "DELETE FROM board WHERE b_no = ?";
	
	public static String BOARD_COUNT = "SELECT count(*) FROM board";
}