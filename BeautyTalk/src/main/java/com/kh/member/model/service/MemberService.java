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
	

	public int deleteMember(String userPwd, String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userPwd, userId);
		
		Member deleteMem = null;
		if(result > 0) { //실패
			commit(conn);
		} else { //성공
			rollback(conn);
		}
		return result;
	}

	
	public int kakaoCheckUser(String accessToken) {
		Connection conn = getConnection();
		int result = new MemberDao().kakaoCheckUser(conn, accessToken);
		close(conn);
		return result;
	}
	




	public Member kakaoLoginMember(String kakaoEmail) {
		Connection conn = getConnection();
		Member m = new MemberDao().kakaoLoginMember(conn, kakaoEmail);
		close(conn);
		return m;
	}


}
