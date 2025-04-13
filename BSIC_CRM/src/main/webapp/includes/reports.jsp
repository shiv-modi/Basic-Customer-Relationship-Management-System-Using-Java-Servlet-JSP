<%@page import="com.crm.dao.DbCon"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession session2 = request.getSession(false);
    if(session2 != null && session2.getAttribute("userId") != null){
        session2.setAttribute("userId", session2.getAttribute("userId"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Reports</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">  <!-- Link to your existing CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Grid layout for the graphs */
        .graph-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* Two columns */
            gap: 30px; /* Space between the charts */
            margin-top: 40px;
        }

        .graph-container div {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .graph-container h3 {
            text-align: center;
        }

        canvas {
            width: 100% !important;
            height: 350px !important;
        }
    </style>
</head>
<body>

    <%@include file = "sidebar.jsp" %>

    <div class="container">
        <div class="main-content">
            <header>
                <h1>CRM Reports</h1>
            </header>

            <!-- Report Section with 3 Divisions for Graphs -->
            <div class="graph-container">
                <div>
                    <h3>Customer Growth Report</h3>
                    <canvas id="customerGrowthChart"></canvas>
                </div>

                <div>
                    <h3>Interaction Breakdown</h3>
                    <canvas id="interactionBreakdownChart"></canvas>
                </div>

                <div>
                    <h3>Top 5 Customers by Interactions</h3>
                    <canvas id="topCustomersChart"></canvas>
                </div>

                <div>
                    <h3>Number of Users</h3>
                    <canvas id="numberOfUsersChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Database Queries for Data -->
    <%
        DbCon conn = new DbCon();
        String u = conn.url;
        String user = conn.username;
        String pass = conn.password;
    %>

    <!-- Set the Data Source -->
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="<%= u %>" user="<%= user %>" password="<%= pass %>" />

    <!-- Customer Growth Data -->
    <sql:query var="customerGrowthData" dataSource="${db}">
        SELECT DATE_FORMAT(customer_join_date, '%Y-%m') AS month, COUNT(*) AS new_customers
        FROM customers
        GROUP BY month
        ORDER BY month;
    </sql:query>

    <!-- Interaction Breakdown Data -->
    <sql:query var="interactionData" dataSource="${db}">
        SELECT interaction_type, COUNT(*) AS interaction_count
        FROM interactions
        GROUP BY interaction_type;
    </sql:query>

    <!-- Top 5 Customers by Interactions -->
    <sql:query var="topCustomersData" dataSource="${db}">
        SELECT customer_name, COUNT(*) AS interaction_count
        FROM interactions
        GROUP BY customer_name
        ORDER BY interaction_count DESC
        LIMIT 5;
    </sql:query>

    <!-- Number of Users Data -->
    <sql:query var="numberOfUsersData" dataSource="${db}">
        SELECT COUNT(*) AS user_count
        FROM users;
    </sql:query>

    <!-- JavaScript for Charts -->
    <script>
        // Customer Growth Report (Bar Chart)
        const customerGrowthCtx = document.getElementById('customerGrowthChart').getContext('2d');
        const customerGrowthLabels = [];
        const customerGrowthData = [];
        
        <c:forEach var="row" items="${customerGrowthData.rows}">
            customerGrowthLabels.push('${row.month}');
            customerGrowthData.push(${row.new_customers});
        </c:forEach>

        const customerGrowthChart = new Chart(customerGrowthCtx, {
            type: 'bar',
            data: {
                labels: customerGrowthLabels,
                datasets: [{
                    label: 'New Customers',
                    data: customerGrowthData,
                    backgroundColor: 'rgba(0, 123, 255, 0.5)',
                    borderColor: 'rgba(0, 123, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: { beginAtZero: true },
                    y: { beginAtZero: true }
                }
            }
        });

        // Interaction Breakdown (Pie Chart)
        const interactionBreakdownCtx = document.getElementById('interactionBreakdownChart').getContext('2d');
        const interactionLabels = [];
        const interactionData = [];
        
        <c:forEach var="row" items="${interactionData.rows}">
            interactionLabels.push('${row.interaction_type}');
            interactionData.push(${row.interaction_count});
        </c:forEach>

        const interactionBreakdownChart = new Chart(interactionBreakdownCtx, {
            type: 'pie',
            data: {
                labels: interactionLabels,
                datasets: [{
                    data: interactionData,
                    backgroundColor: ['#007bff', '#28a745', '#ffc107'],
                    borderColor: '#fff',
                    borderWidth: 1
                }]
            },
            options: { responsive: true }
        });

        // Top 5 Customers by Interactions (Bar Chart)
        const topCustomersCtx = document.getElementById('topCustomersChart').getContext('2d');
        const topCustomersLabels = [];
        const topCustomersData = [];
        
        <c:forEach var="row" items="${topCustomersData.rows}">
            topCustomersLabels.push('${row.customer_name}');
            topCustomersData.push(${row.interaction_count});
        </c:forEach>

        const topCustomersChart = new Chart(topCustomersCtx, {
            type: 'bar',
            data: {
                labels: topCustomersLabels,
                datasets: [{
                    label: 'Interaction Count',
                    data: topCustomersData,
                    backgroundColor: 'rgba(255, 159, 64, 0.6)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: { beginAtZero: true },
                    y: { beginAtZero: true }
                }
            }
        });

        // Number of Users (Pie Chart or Bar Chart)
        const numberOfUsersCtx = document.getElementById('numberOfUsersChart').getContext('2d');
        const numberOfUsersData = [];
        
        <c:forEach var="row" items="${numberOfUsersData.rows}">
            numberOfUsersData.push(${row.user_count});
        </c:forEach>

        const numberOfUsersChart = new Chart(numberOfUsersCtx, {
            type: 'doughnut', // You can change to 'bar' or any other type
            data: {
                labels: ['Total Users'],
                datasets: [{
                    data: numberOfUsersData,
                    backgroundColor: ['#36A2EB'],
                    borderColor: '#fff',
                    borderWidth: 1
                }]
            },
            options: { responsive: true }
        });
    </script>

</body>
</html>

<%
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
