package com.crm.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.invoke.StringConcatFactory;
import java.util.Iterator;

import com.crm.dao.Dba;
import com.crm.dao.Users;
import com.crm.interfaces.inter;

@WebServlet("/Interaction")
public class Interaction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		Users cutsname = new Users();
		cutsname.setEmail(email);
		inter cust = new Dba();
		String cName = cust.getCustomerName(cutsname);
		String cuName = cName.split(" ")[0];
		if (cName!=null) {
			response.sendRedirect("./includes/interaction.jsp?cName=" + cuName + "&email=" + email);
		}
		
	}
}
