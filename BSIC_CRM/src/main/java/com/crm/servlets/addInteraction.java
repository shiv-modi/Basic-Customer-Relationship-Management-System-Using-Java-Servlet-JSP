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

@WebServlet("/addInteraction")
public class addInteraction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String interactionType = request.getParameter("interactionType");
		String details = request.getParameter("details");
		String dateTime = request.getParameter("dateTime");
		
		Users addInteract = new Users();
		addInteract.setUsername(customerName);
		addInteract.setEmail(customerEmail);
		addInteract.setInteractionType(interactionType);
		addInteract.setDetails(details);
		addInteract.setDateTime(dateTime);
		
		inter addInter = new Dba();
		
		if (addInter.interac(addInteract)) {
			response.sendRedirect("./includes/interaction.jsp?cName=" + customerName + "&email=" + customerEmail);
		}else {
			response.sendRedirect("./includes/interaction.jsp?cName=" + customerName + "&email=" + customerEmail);
		}
	}

}
