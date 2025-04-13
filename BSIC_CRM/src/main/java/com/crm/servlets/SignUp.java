package com.crm.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.crm.dao.Dba;
import com.crm.dao.Users;
import com.crm.interfaces.inter;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm-password");
		String role = request.getParameter("role");
		
		if (!password.equals(confirmPassword)) {
		    
		    request.setAttribute("k", "failed");
		    
		    RequestDispatcher requestDispatcher = request.getRequestDispatcher("./includes/signup.jsp");
		    requestDispatcher.forward(request, response);  
		    return;
		}

		Users user = new Users();
		user.setEmail(email);
		user.setUsername(username);
		user.setPassword(confirmPassword);
		user.setRole(role);
		
		ServletContext ctxContext = getServletContext();
		
		String url = ctxContext.getInitParameter("url");
		String usernam = ctxContext.getInitParameter("username");
		String passwor = ctxContext.getInitParameter("password");
		
		user.setDbUrl(url);
		user.setDbUsername(usernam);
		user.setDbPassword(passwor);
				
		inter dbAdd = new Dba();
		
		if(dbAdd.addUsers(user)) {
			response.sendRedirect("./includes/login.jsp?status=Success");
		}else {
			response.sendRedirect("./includes/signup.jsp?k=failed");
		}
	}
}
