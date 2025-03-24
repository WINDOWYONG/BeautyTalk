package com.kh.people.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;
import com.kh.people.model.dao.PeopleDao;

public class PeopleService {
	
	public ArrayList<Member> selectPeopleList() {
		Connection conn = getConnection();
		ArrayList<Member> peopleList = new PeopleDao().selectPeopleList(conn);
		close(conn);
		return peopleList;
	}

}
