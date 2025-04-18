package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.profile.controller.model.service.ProfileService;
import com.kh.profile.controller.model.vo.Profile;
import com.kh.profile.controller.model.vo.UserProfileImage;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			
			Member loginUser = new MemberService().loginMember(userId, userPwd);
			

			if(loginUser == null) {
				request.getSession().setAttribute("alertMsg", "로그인에 실패하였습니다.");
				response.sendRedirect(request.getContextPath() + "/loginForm.me");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				response.sendRedirect(request.getContextPath());
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
