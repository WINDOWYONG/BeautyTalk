package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

import static com.kh.common.JDBCTemplate.*;


public class ReviewService {
	
	public int selectReviewList() {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewList(conn);
		close(conn);
		return listCount;

	}
	
	public void selectReviewArrayList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewArrayList(conn, pi);
		
		
	}

}
