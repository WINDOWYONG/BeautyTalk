package com.kh.calendar.model.service;

import java.sql.Connection;

import com.kh.calendar.model.dao.CalendarDao;
import com.kh.calendar.model.vo.Calendar;
import static com.kh.common.JDBCTemplate.*;

public class CalendarService {
	
	public int insertSchedule(int userNo, Calendar c) {
		Connection conn = getConnection();
		int result = new CalendarDao().insertSchedule(conn, userNo, c);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		return result;
	}

}
