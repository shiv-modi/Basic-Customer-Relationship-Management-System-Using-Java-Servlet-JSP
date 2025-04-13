<%@page import="com.crm.dao.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
   <%! 
   		
		DbCon conn = new DbCon();
		String u = conn.url;
		String user = conn.username;
		String pass = conn.password;
   
   %>
   
   
   <% 
	 	HttpSession session2 = request.getSession(false);
	 	if(session2!=null && session2.getAttribute("userId")!=null){
	 		session2.setAttribute("userId",session2.getAttribute("userId"));

	 %>
	 
	 <style>
	      .details-scroll {
            max-height: 100px;
            overflow-y: auto;
            white-space: nowrap;
            width: 200px;
            text-overflow: ellipsis;
        }
	 
	 </style>
	 
	  <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="<%=u%>" user="<%=user%>" password = "<%=pass%>"/>
      <sql:query var="rs" dataSource="${db}">SELECT * FROM interactions ORDER BY id DESC LIMIT 5;</sql:query>
	  <sql:query var="counts" dataSource="${db}">SELECT COUNT(id) AS total FROM interactions;</sql:query>
      <sql:query var="customerCounts" dataSource="${db}">SELECT COUNT(customer_id) AS customer_total FROM customers;</sql:query>
      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CRM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<%@include file = "sidebar.jsp" %>
    <div class="container">

        <div class="main-content">
            <header>
                <h1>Welcome Back,</h1>
            </header>
            <div class="content" style ="gap: 40px;">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-users" style="font-size: 50px; color: #0a3d62;"></i>
                    </div>
                    <div class="card-info">
                        <h3>Total Customers</h3>
                        <p><c:out value="${customerCounts.rows[0].customer_total}"></c:out></p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-comments" style="font-size: 50px; color: #0a3d62;"></i>
                    </div>
                    <div class="card-info">
                        <h3>Total Interactions</h3>
                        <p><c:out value="${counts.rows[0].total}"></c:out></p>
                    </div>
                </div>
                
				 <a href="reports.jsp"> 
				    <div class="card">
				        <div class="card-icon">
				            <i class="fas fa-file-alt" style="font-size: 50px; color: #0a3d62;"></i>
				        </div>
				
				        <div class="card-info">
				            <h3>Report</h3>
				        </div>
				    </div>
				</a>

            </div>
            
            <!-- Recent Activity Section -->
            <div class="recent-activity">
                <h2>Recent Activity</h2>
                
                <!-- Recent Interactions Table -->
                <div class="activity-card">
                    <h3>Recent Interactions</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Customer Name</th>
                                <th>Customer Email</th>
                                <th>Interaction Type</th>
                                <th>Details</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${rs.rows}" var="row">
                            
                            <tr>
                                <td><c:out value="${row.customer_name}"></c:out></td>
                                <td><c:out value="${row.customer_email}"></c:out></td>
                                <td><c:out value="${row.interaction_type}"></c:out></td>
                                <td ><div class="details-scroll">
									<c:out value="${row.details}"></c:out>
                                </div></td>
                                <td><c:out value="${row.interaction_date}"></c:out></td>
                                
                            </tr>
                            
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
 <script src="${pageContext.request.contextPath}/js/script.js"></script> 
</body>
</html>

	<%
		}else{
			response.sendRedirect("../index.jsp");

		}
	%>
