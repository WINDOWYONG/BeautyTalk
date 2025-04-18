package com.kh.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePoliy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.profile.controller.model.service.ProfileService;
import com.kh.profile.controller.model.vo.UserProfileImage;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class profileImage
 */
@WebServlet("/insert.img")
public class profileImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileImage() {
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
			
			String savepath = request.getSession().getServletContext().getRealPath("/resources/userImage/");
			
			MultipartRequest multRequest = new MultipartRequest(request, savepath, maxSize, "UTF-8", new MyFileRenamePoliy());
			
			int userNo = Integer.parseInt(multRequest.getParameter("userNo"));
			
			UserProfileImage up = null;
			
			if(multRequest.getOriginalFileName("upfile") != null) {
				up = new UserProfileImage();
				up.setOriginName(multRequest.getOriginalFileName("upfile"));
				up.setChangename(multRequest.getFilesystemName("upfile"));
				up.setFilepath("resources/userImage/");
			}
			
			int result = new ProfileService().insertUserImage(up, userNo);
			Member updateMem = new MemberService().selectMember(userNo);

			HttpSession session = request.getSession();
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "프로필 이미지 등록 성공");
				Member loginUser = (Member) session.getAttribute("loginUser");
				if (loginUser != null) { 
				    // 기존 객체에서 filePath만 변경
				    loginUser.setFilePath(updateMem.getFilePath());

				    // 변경된 객체를 다시 세션에 저장
				    session.setAttribute("loginUser", loginUser);
				}
				
//				session.setAttribute("loginUser", updateMem);
				
				response.sendRedirect(request.getContextPath() + "/myPage.me?userNo=" + userNo);
			} else {
				request.setAttribute("alertMsg", "프로필 이미지 등록 실패!");
				request.getRequestDispatcher(request.getContextPath() + "/mypage.jsp");
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
