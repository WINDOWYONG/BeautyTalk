package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;


/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detail.re")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String refBno = request.getParameter("bno");
		
		ReviewService rService = new ReviewService();
		
		Review rv = rService.selectReviewTest(refBno);
		
		if(rv != null) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Review rv1 = rService.selectReview(refBno);
			Image img = rService.selectImage(refBno);
			System.out.println(refBno);	
			request.setAttribute("rv1", rv1); // review에 대한 정보
			request.setAttribute("img", img); // image에 대한 정보
			
			request.getRequestDispatcher("views/review/reviewDetail.jsp").forward(request, response);
			
		}else { // 에러 => db로부터 조회x
			response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
			request.getSession().setAttribute("alertMsg", "게시글 조회 오류");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
