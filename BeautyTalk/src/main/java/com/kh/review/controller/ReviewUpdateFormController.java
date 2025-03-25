package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.SubCategory;
import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.service.*;

/**
 * Servlet implementation class ReviewUpdateForm
 */
@WebServlet("/updateReview.wr")
public class ReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String refBno = request.getParameter("bno");
		
		ReviewService rService = new ReviewService();
		rService.selectMemNo(refBno);
		
		System.out.println("bno parameter: " + request.getParameter("bno"));
		
		Review rv = rService.selectMemNo(refBno);
		
		int listCount;		// 현재 총 게시글 개수
		
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 최대 개수(몇개 단위씩 보여질건지)
		int reviewLimit;	// 한 페이지 내에 보여질 게시글 최대 개수(몇개 단위씩)

		int startPage;		// 페이징바의 시작수
		int endPage;		// 페이징바의 끝수
		
		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		
		listCount = new ReviewService().selectReviewList();
		
		int cpage = 1;
		if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		}else {
			currentPage = 1;
		}
		
		pageLimit = 5;
		
		reviewLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / reviewLimit);
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// com.kh.common.model.vo.PageInfo - jsp 가져가야해서 가방에 담아야함
		// * jsp에서 페이징바를 만드려면 7개의 값이 필요한데
		// 그걸 담기 위한 가방, 그릇! (vo)
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, reviewLimit, maxPage, startPage, endPage);
		
		
		// * 현재 요청한 페이지(c)에 보여질 게시글 리스트 boardLimit 수만큼 조회
		ArrayList<Review> list = new ReviewService().selectReviewArrayList(pi);
		
		ArrayList<SubCategory> list1 = new ReviewService().selectSubCategoryList();
		request.setAttribute("list", list);
		
		if(rv != null) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Review rv1 = rService.selectReview(refBno);
			Image img = rService.selectImage(refBno);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("list1", list1);
			request.setAttribute("rv1", rv1);
			request.setAttribute("img", img);
		
			request.getRequestDispatcher("views/review/reviewUpdateForm.jsp").forward(request, response);
			
		}else {
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
