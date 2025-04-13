package com.crm.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.lang.invoke.StringConcatFactory;
import java.util.Iterator;
import java.util.List;

import com.crm.dao.Dba;
import com.crm.dao.Users;
import com.crm.interfaces.inter;


@WebServlet("/Customer")
public class Customer extends HttpServlet {
	
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
		
		inter addc = new Dba();
		
		if (addc.addCustomer(customers) ) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("./includes/customer.jsp");
			requestDispatcher.forward(request, response);
		}else {
			System.out.println("there is an error");
		}
					
	}

}
