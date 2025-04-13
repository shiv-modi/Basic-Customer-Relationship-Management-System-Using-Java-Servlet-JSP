package com.crm.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.invoke.StringConcatFactory;

import com.crm.dao.Dba;
import com.crm.dao.Users;
import com.crm.interfaces.inter;

/**
 * Servlet implementation class editCustomers
 */
@WebServlet("/editCustomers")
public class editCustomers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
 		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerJoinDate = request.getParameter("customerJoinDate");
		
		Users customers = new Users();
		customers.setUsername(customerName);
		customers.setEmail(customerEmail);
		customers.setPhone(customerPhone);
		customers.setRole(customerJoinDate);
		
		inter editC = new Dba();
		if (editC.editCustomer(customers)) {
			response.sendRedirect("./includes/customer.jsp");
		}else {
			System.out.println("Error in code");
		}
		
	}

}
