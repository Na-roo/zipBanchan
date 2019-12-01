package com.itwill.member;

import java.util.ArrayList;

import com.itwill.exception.ExistedUserException;
import com.itwill.exception.PasswordMismatchException;
import com.itwill.exception.UserNotFoundException;

public class MemberService {
	
	private MemberDAO memberDAO;
	
	public MemberService() throws Exception {
		memberDAO = new MemberDAO();
	}
	
	/*
	 * 회원가입
	 */
	public boolean create(Member member) throws ExistedUserException, Exception {
		// 1. 아이디 중복 검사
		if(memberDAO.existedMember(member.getMemberId())) {
			throw new ExistedUserException(member.getMemberId() + "는 이미 존재하는 아이디입니다.");
		}
		//2. 아이디 영문으로 대소문자, 숫자만 입력가능하고 자릿수는 4~16자로 제한
		for (int i = 0; i < member.getMemberId().length(); i++) {
			char c = member.getMemberId().charAt(i);
			if(!(c >= 'a' && 'z' >= c || 
				 c >= 'A' && 'Z' >= c || 
				 c >= '0' && '9' >= c || 
				 4 <= member.getMemberId().length() && 
				 	  member.getMemberId().length() <= 16)) {
				return false;
			}
		}
		//3. 비밀번호 영문으로 대소문자, 숫자만 입력가능하고 자릿수는 10~16자로 제한
		for (int i = 0; i < member.getMemberPassword().length(); i++) {
			char c = member.getMemberPassword().charAt(i);
			if(!(c >= 'a' && 'z' >= c || 
				 c >= 'A' && 'Z' >= c || 
				 c >= '0' && '9' >= c || 
				 10 <= member.getMemberPassword().length() && 
				 	   member.getMemberPassword().length() <= 16)) {
				return false;
			}
		}
		
		return memberDAO.create(member);
	}
	/*
	 * 아이디중복체크
	 * 
	 */
	public boolean isDuplcateMemberId(String memberId) throws Exception{
		boolean isExist = memberDAO.existedMember(memberId);
		if(isExist) {
			return true;
		}else {
			return false;
		}
	}
	/*
	 * 회원 로그인
	 */
	public Member login(String memberId, String memberPassword) throws UserNotFoundException, PasswordMismatchException, Exception {
		//1.아이디 존재여부
		Member findMember = memberDAO.readOne(memberId);
		if(findMember == null) {
			throw new UserNotFoundException("존재하지 않는 아이디입니다.");
		}
		//2. 패스워드 일치여부
		if(!(findMember.isMatchPassword(memberPassword))) {
			throw new PasswordMismatchException( "비밀번호가 틀립니다.");
		}
		return findMember;
	}
	
	/*
	 * 회원리스트
	 */
	public ArrayList<Member> readAllService() throws Exception {
		return memberDAO.readAll();
	}
	/*
	 * 회원 한명
	 */
	public Member readOne(String memberId) throws Exception {
		return memberDAO.readOne(memberId);
	}
	/*
	 * 회원 아이디 찾기
	 */
	public String readOneId(String memberName, String memberPhone) throws Exception {
		return memberDAO.findMemberId(memberName, memberPhone);
	}
	/*
	 * 회원 이름 찾기
	 */
	public String readOneName(String memberId) throws Exception {
		return memberDAO.readOne(memberId).getMemberName();
	}
	/*
	 * 회원 비밀번호 찾기
	 */
	public String readOnePassword(String memberId, String memberPhone) throws Exception {
		return memberDAO.findMemberPassword(memberId, memberPhone);
	}
	
	/*
	 * 회원수정
	 */
	public boolean update(Member member) throws Exception {
		return memberDAO.update(member);
	}
	
	/*
	 * 회원탈퇴
	 */
	public boolean delete(String memberId) throws Exception {
		return memberDAO.delete(memberId);
	}
	
}
