<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CRM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Login to Your Account</h2>
            <form action="${pageContext.request.contextPath}/Login" method="POST">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id=email name="email" required placeholder="Enter your email">
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>
                
                <%
                	String status = (String) request.getAttribute("k");
                    	
                    		if(status!=null && status.equals("failed")){
                 %>
                 			
           		<h5 class ="error-message">Passwords or Email is incorrect. Please try again</h5>
					<br>
                 
 				<% 	
                    		}
                
                %>
                
                <button type="submit" class="btn">Login</button>
                <p>Don't have an account? <a href="${pageContext.request.contextPath}/includes/signup.jsp">Sign up</a></p>
            </form>
        </div>
    </div>
</body>
</html>
