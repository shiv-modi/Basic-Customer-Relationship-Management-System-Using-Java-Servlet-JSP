package com.crm.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.crm.dao.Dba;
import com.crm.dao.Users;
import com.crm.interfaces.inter;

@WebServlet("/DeleteCustomers")
public class DeleteCustomers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		Users deleteCus = new Users();
		deleteCus.setEmail(email);
		inter deleteCustomer = new Dba();
		if (deleteCustomer.delCust(deleteCus)) {
			response.sendRedirect("./includes/customer.jsp");
		}else {
			System.out.println("error");
			response.sendRedirect("./includes/customer.jsp");
		}
	}
}
