package com.kh.calendar.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.calendar.model.vo.Calendar;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;

public class CalendarDao {
	
private Properties prop = new Properties();
	
	public CalendarDao() {
		String filePath = MemberDao.class.getResource("/db/sql/calendar-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertSchedule(Connection conn, int userNo, Calendar c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(userNo);
			System.out.println(c.getTitle());
			System.out.println(c.getStartDay());
			System.out.println(c.getEndDay());
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, c.getTitle());
			pstmt.setDate(3, Date.valueOf(c.getStartDay()));
			pstmt.setDate(4, Date.valueOf(c.getEndDay()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

}
