package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewUpdateController2
 */
@WebServlet("/updateReview2.up")
public class ReviewUpdateController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			// page, request, session, application
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String refBno = multiRequest.getParameter("bno"); // ReviewNo

			// String category = multiRequest.getParameter("SC_ID"); // pcode
			
			String reviewTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String pRating = multiRequest.getParameter("P_RATING"); 
			String rRating = multiRequest.getParameter("R_RATING");
			String prRating = multiRequest.getParameter("PR_RATING");
			String imgPath = multiRequest.getParameter("IMG_PATH");
			
			String imgNo = multiRequest.getParameter("originFileNo");
			
			Review rv = new Review();
			rv.setTitle(reviewTitle);
			rv.setContent(content);
			rv.setpRating(Integer.parseInt(pRating));
			rv.setrRating(Integer.parseInt(rRating));
			rv.setPrRating(Integer.parseInt(prRating));
			rv.setReviewNo(refBno);
			
			Image img = null; // 처음에는 null로 초기화
			img = new Image();
//			img.setRefBno(Integer.parseInt(refBno));
			img.setOriginName(multiRequest.getOriginalFileName("upfile"));
			img.setChangeName(multiRequest.getFilesystemName("upfile"));
			img.setFilePath("resources/images/");
			img.setImgNo(Integer.parseInt(imgNo));

			int result = new ReviewService().updateReview(rv, img);

			if(result > 0) { // 성공
				response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
				
			}else { // 실패
				request.getSession().setAttribute("alertMsg", "오류 발생");
				response.sendRedirect(request.getContextPath() + "/review.li?");
			}
			
			System.out.println("리뷰 업뎃 번호 : " + result);
			
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
