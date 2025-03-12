package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Set;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.vo.Review;

import static com.kh.common.JDBCTemplate.*;


public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {

			e.printStackTrace();
		}
		
	}
	
	public int selectReviewList(Connection conn) {
		// 갯수로 처리하는 거니까 int 인줄 알았는데, 조회라서 ResultSet이래
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectReviewList");
	
		try {
			pstmt = conn.prepareStatement(sql); // 완성형
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Review> selectReviewArrayList(Connection conn, PageInfo pi){
		// select 조회해야 하니까 ResultSet, 다행렬 조회
		ArrayList<Review> list = new ArrayList<Review>(); // 초기화
		
		PreparedStatement pstmt = null; // 초기화
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewArrayList"); 
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			/*
			 * currentPage : 1 => 시작값(RNUM) : 1 | 끝값(RNUM) : 4
			 * currentPage : 2 => 시작값 : 5 | 끝값 : 9
			 * currentPage : 3 => 시작값 : 10 | 끝값 : 15
			 * 
			 * 시작값 : (current - 1) * reviewLimit + 1
			 * 끝값 : 시작값 + reviewLimit - 1
			 */
			
			int startReview = (pi.getCurrentPage() - 1 ) * (pi.getreviewLimit() + 1);
			int endReview = startReview + pi.getreviewLimit() - 1;
			
			pstmt.setInt(1, startReview);
			pstmt.setInt(2, endReview);
			
			rset = pstmt.executeQuery();
			
			Review rv = new Review();
			
			while(rset.next()) {
				rv = new Review();
				rv.setReviewNo(rset.getInt("reviewNo"));
				rv.setCreateDate(rset.getDate("createDate"));
				rv.setTitle(rset.getString("title"));
				rv.setContent(rset.getString("content"));
				rv.setPrRating(rset.getInt("prRating"));
				rv.setpRating(rset.getInt("pRating"));
				rv.setrRating(rset.getInt("rRating"));
				rv.setLikeReview(rset.getInt("likeReview"));
				
				list.add(rv);

			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}
	
	

}
