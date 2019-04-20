package com.ars.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ars.bo.LoginBO;
import com.ars.model.User;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userid");
		String password=request.getParameter("password");
		
		LoginBO loginbo=new LoginBO();
		User user=loginbo.validateUser(userId, password);
		
		if(user!=null)
		{
			request.removeAttribute("invaliduser");
			HttpSession session=request.getSession();
			session.setAttribute("userloggedin", user);
			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("invaliduser","Invalid Credentials");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}

}
