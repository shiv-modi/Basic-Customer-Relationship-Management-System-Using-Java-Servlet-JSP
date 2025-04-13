<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- signup.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - CRM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> 
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Create Account</h2>
            <form action="../SignUp" method="POST">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required placeholder="Enter your username">
                </div>

                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email">
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>

                <div class="input-group">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" id="confirm-password" name="confirm-password" required placeholder="Confirm your password">
                </div>

                <div class="input-group">
                    <label for="role">Role</label>
                    <select id="role" name="role" required>
                        <option value="admin">Admin</option>
                        <option value="user">Employee</option>
                    </select>
                </div>

                <!-- Display error message if passwords don't match -->
                <%
                    String k = (String) request.getAttribute("k");
                    if ("failed".equals(k)) {
                %>
                    <h5 class ="error-message">Passwords do not match. Please try again.</h5>
                    <br>
                    
                <%
                    }
                %>
                <button type="submit" class="btn">Sign Up</button>
                <p>Already have an account? <a href="${pageContext.request.contextPath}/includes/login.jsp">Login</a></p>
            </form>
        </div>
    </div>
</body>
</html>
