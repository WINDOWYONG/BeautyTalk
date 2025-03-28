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
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/updateReview.up")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
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
			
			String refBno = multiRequest.getParameter("bno"); // url용

			// String category = multiRequest.getParameter("SC_ID"); // pcode
			
			String memNo = multiRequest.getParameter("MEM_NO");
			String reviewTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String pRating = multiRequest.getParameter("P_RATING"); 
			String rRating = multiRequest.getParameter("R_RATING");
			String prRating = multiRequest.getParameter("PR_RATING");
			
			Review rv = new Review();
			rv.setTitle(reviewTitle);
			rv.setContent(content);
			rv.setpRating(Integer.parseInt(pRating));
			rv.setrRating(Integer.parseInt(rRating));
			rv.setPrRating(Integer.parseInt(prRating));
			rv.setReviewNo(refBno);
			
			Image img = null; // 처음에는 null로 초기화

			if(multiRequest.getOriginalFileName("upfile") != null) {
				img = new Image();
				img.setOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setChangeName(multiRequest.getFilesystemName("upfile"));
				img.setFilePath("resources/images/"); // /가 있어야 한다.

				// jsp에 번호가 없기 때문에 input type="hidden"으로 넣는다.
				if(multiRequest.getParameter("originFileNo") != null) {
					// 기존의 첨부파일이 있었을 경우 => update attachment (기존의첨부파일번호 필요)
					img.setImgNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));

					int result = new ReviewService().updateReview(rv, img);
					
					if(result > 0) {
						request.getSession().setAttribute("alertMsg", "수정하였습니다");
						response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
						
					}else {
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
					}
				}else {
					// 기존의 첨부파일이 없었을 경우 => insert attachment (해당, 현재게시글의 번호)
					img.setRefBno(rv.getMemNo());

					img.setReviewMem(Integer.parseInt(rv.getReviewNo()));
					
					int result = new ReviewService().updateReview(rv, img);

					if(result > 0) {
						request.getSession().setAttribute("alertMsg", "수정하였습니다");
						response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
						
					}else {
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
					}
				}

			}else {
				// 새로운 첨부파일 없음 => at 객체 null
				int result = new ReviewService().updateReview(rv, img);

				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "수정하였습니다");
					response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
					
				}else {
					request.getSession().setAttribute("alertMsg", "오류 발생");
					response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
				}
				
			}
		System.out.println("리뷰 업뎃 컨트롤러 refBno : " + refBno);
		System.out.println("리뷰 업뎃 컨트롤러 rv.getMemNo : " + memNo);
		System.out.println("리뷰 업뎃 오리지날 리뷰 넘버 : " + Integer.parseInt(multiRequest.getParameter("originFileNo")));
		System.out.println("리뷰 업뎃 뉴인풋 : " + memNo);
			
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
