package com.crm.servlets;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.crm.dao.Dba;
import com.crm.dao.Users;
import com.crm.interfaces.inter;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Users user = new Users();
		
		user.setEmail(email);
		user.setPassword(password);
		
		inter logUser = new Dba();
		
		if (logUser.userExist(user)) {
			HttpSession session = request.getSession();
			String sessionId = session.getId();
			session.setAttribute("userId",sessionId);
			System.out.println(sessionId);
			response.sendRedirect("./includes/home.jsp");
		}else {
			request.setAttribute("k","failed");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("./includes/login.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
