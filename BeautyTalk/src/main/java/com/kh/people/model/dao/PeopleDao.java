package com.kh.people.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class PeopleDao {
	
	private Properties prop = new Properties();
	
	public PeopleDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/people-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Member> selectPeopleList(Connection conn) {
		ArrayList<Member> peopleList = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPeopleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				peopleList.add(new Member(rset.getInt("MEM_NO"),
										  rset.getString("MEM_NAME"), 
										  rset.getInt("FOLLOWER_CNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return peopleList;
	}

}
