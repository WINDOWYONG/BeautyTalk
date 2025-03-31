package com.kh.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.post.model.service.PostService;
import com.kh.post.model.vo.Image2;
import com.kh.post.model.vo.Post;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class postUpdateController
 */
@WebServlet("/updatePost1.wr")
public class postUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postUpdateController() {
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
			
			String memNo = multiRequest.getParameter("MEM_NO");
			String postTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String imgNo = multiRequest.getParameter("originFileNo");
			
			Post po = new Post();
			po.setTitle(postTitle);
			po.setContent(content);
			po.setMemNo(Integer.parseInt(refBno));
			
			Image2 img = null; // 처음에는 null로 초기화

			if(multiRequest.getOriginalFileName("upfile") != null) {
				if(multiRequest.getParameter("originFileNo") != null) {
					// 기존의 첨부파일이 있었을 경우 => update attachment (기존의첨부파일번호 필요)
					img = new Image2();
					img.setOriginName(multiRequest.getOriginalFileName("upfile"));
					img.setChangeName(multiRequest.getFilesystemName("upfile"));
					img.setFilePath("resources/images/");
					img.setImgNo(Integer.parseInt(imgNo));

					int result = new PostService().updatePost(po, img);
			System.out.println("리뷰 이미지 업뎃 imgNo : " + Integer.parseInt(imgNo));	
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/post.list?");
					}
				}else {
					// 기존의 첨부파일이 없었을 경우 => insert attachment (해당, 현재게시글의 번호)
					img = new Image2();
					img.setRefBno(Integer.parseInt(memNo));
					img.setOriginName(multiRequest.getOriginalFileName("upfile"));
					img.setChangeName(multiRequest.getFilesystemName("upfile"));
					img.setFilePath("resources/images/");
					
					int result = new PostService().updatePost(po, img);
			
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
					}
				}

			}else {
				// 새로운 첨부파일 없음 => at 객체 null
				img = new Image2();
				img.setRefBno(Integer.parseInt(memNo));
				img.setOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setChangeName(multiRequest.getFilesystemName("upfile"));
				img.setFilePath("resources/images/");
				
				int result = new PostService().updatePost(po, img);

				if(result > 0) { // 성공
					response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
					
				}else { // 실패
					request.getSession().setAttribute("alertMsg", "오류 발생");
					response.sendRedirect(request.getContextPath() + "/post.list?");
				}
				
			}
			
			System.out.println("리뷰 업뎃 컨트롤러 bno : " + refBno);
			System.out.println("리뷰 이미지 뉴인풋 : " + memNo);
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
