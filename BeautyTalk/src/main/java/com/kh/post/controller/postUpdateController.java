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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PostUpdateController
 */
@WebServlet("/updatePost1.wr")
public class PostUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostUpdateController() {
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
			
			String refBno = multiRequest.getParameter("bno"); // POST_NO
			String postTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			
			String imgNo = multiRequest.getParameter("originFileNo");
	System.out.println("포스트 업뎃 이미지넘버 : " + imgNo);		
			Post po = new Post();
			po.setTitle(postTitle);
			po.setContent(content);
			po.setPostNo(Integer.parseInt(refBno));
			
			Image2 img = null; // 처음에는 null로 초기화
			img = new Image2();
			img.setOriginName(multiRequest.getOriginalFileName("upfile"));
			img.setChangeName(multiRequest.getFilesystemName("upfile"));
			img.setFilePath("resources/images/");
	System.out.println("포스트 업뎃 이미지이름 : " + multiRequest.getOriginalFileName("upfile"));
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				if(imgNo != null) {
					// 첨부파일 있음 => update (기존의첨부파일번호 필요)
					img.setImgNo(Integer.parseInt(imgNo));

					int result = new PostService().updatePost(po, img);
					
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.po?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/post.list?");
					}
				}else {
					// 첨부파일 없음
					img.setRefBno(Integer.parseInt(refBno));
					
					int result = new PostService().updatePost(po, img);
			
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.po?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/post.list?");
					}
				}

			}else {
				// 새로운 첨부파일 없음
				img.setRefBno(0);


				int result = new PostService().updatePost(po, img);

				if(result > 0) { // 성공
					response.sendRedirect(request.getContextPath() + "/detail.po?bno=" + refBno);
					
				}else { // 실패
					request.getSession().setAttribute("alertMsg", "오류 발생");
					response.sendRedirect(request.getContextPath() + "/post.list?");
				}
				
			}
			
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
