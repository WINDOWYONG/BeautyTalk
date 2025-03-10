package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		return result;
	}
	
<<<<<<< HEAD
	public int deleteMember(String userPwd, String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userPwd, userId);
		
		Member deleteMem = null;
		if(result > 0) { //실패
			commit(conn);
		} else { //성공
			rollback(conn);
		}
=======
	public int kakaoCheckUser(String kakaoEmail) {
		Connection conn = getConnection();
		int result = new MemberDao().kakaoCheckUser(conn, kakaoEmail);
>>>>>>> 55075f95964fa8d9c1cff08fae19f789bc30628f
		close(conn);
		return result;
	}
	
<<<<<<< HEAD
	
=======
	public Member kakaoLoginMember(String kakaoEmail) {
		Connection conn = getConnection();
		Member m = new MemberDao().kakaoLoginMember(conn, kakaoEmail);
		close(conn);
		return m;
	}
>>>>>>> 55075f95964fa8d9c1cff08fae19f789bc30628f

}
