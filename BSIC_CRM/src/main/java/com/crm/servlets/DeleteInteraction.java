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

@WebServlet("/DeleteInteraction")
public class DeleteInteraction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("cName");
		Users deleteInter = new Users();
		deleteInter.setId(id);
		inter deleteInteraction = new Dba();
		String email = deleteInteraction.DeleteInteraction(deleteInter);
		if (email!=null) {
			response.sendRedirect("./includes/interaction.jsp?cName=" + name + "&email=" + email);
		}else {
			System.out.println("error in code");
		};
			
	}
}
