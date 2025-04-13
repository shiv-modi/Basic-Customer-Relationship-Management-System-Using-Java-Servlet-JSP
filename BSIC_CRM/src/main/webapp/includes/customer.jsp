<%@page import="com.crm.dao.Dba"%>
<%@page import="com.crm.interfaces.inter"%>
<%@page import="com.crm.dao.Users"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Customers - CRM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

      
<%@include file = "sidebar.jsp" %>
    <div class="container">
        <div class="main-content">
            <header>
                <h1>Customer List</h1>
                <button class="btn add-customer-btn" id="addCustomerBtn">Add Customer</button>
            </header>

		<div class="search-bar">
		    <form action="yourSearchEndpoint" method="get">
		        <input type="text" placeholder="Search Customers..." id="searchInput" name="searchQuery">
		        <button type="submit"><i class="fas fa-search"></i> Search</button>
		    </form>
		</div>


            <div class="customer-table">
                <table>
                    <thead>
                        <tr>
                        	<th>No.</th>
                            <th>Customer Name</th>
                            <th>Email (Unique)</th>
                            <th>Phone</th>
                            <th>Join Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%!
                    	int idx = 0;
                    	int cid;
                        String name;
                        String email;
                        String phone;
                        String date;
                    %>
                    <% 
                        inter customer = new Dba();
                        List<Users> customers = customer.viewCustomers();
                        if(customers != null && !customers.isEmpty()){
                        	idx = 0;
                            for (Users data : customers) {
                            	idx++;
                            	cid = data.getId();
                                name = data.getUsername();
                                email = data.getEmail();
                                phone = data.getPhone();
                                date = data.getRole();
                                
                    %>
                        <tr>
                        	<td><%=idx %>.</td>
                            <td><%= name %></td>
                            <td><%= email %></td>
                            <td><%= phone %></td>
                            <td><%= date %></td>
                            <td>
                                <!-- Open the Edit Modal with dynamic values -->
                                <button onclick="window.location.href='${pageContext.request.contextPath}/Interaction?email=<%=email%>';">Interaction</button>
                                <button onclick="openEditModal('<%= name %>', '<%= email %>', '<%= phone %>', '<%= date %>')">Edit</button>
								<button onclick="window.location.href='${pageContext.request.contextPath}/DeleteCustomers?email=<%=email%>';">Delete</button>
                            </td>
                        </tr>
                    <%      }
                        } else {
                    %>
                      <tr>Customers not Found</tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <button id="prevBtn">Previous</button>
                <span id="pageNumbers"></span>
                <button id="nextBtn">Next</button>
            </div>
        </div>
    </div>

    <div class="modal" id="addCustomerModal">
        <div class="modal-content">
            <span class="close-btn" id="closeAddModalBtn">&times;</span>
            <h2>Add New Customer</h2>
            <form id="addCustomerForm" action="${pageContext.request.contextPath}/Customer" method="POST">
                <div class="form-group">
                    <label for="customerName">Customer Name</label>
                    <input type="text" id="customerName" name="customerName" required>
                </div>
                <div class="form-group">
                    <label for="customerEmail">Email (Unique)</label>
                    <input type="email" id="customerEmail" name="customerEmail" required>
                </div>
                <div class="form-group">
                    <label for="customerPhone">Phone</label>
                    <input type="text" id="customerPhone" name="customerPhone" required>
                </div>
                <div class="form-group">
                    <label for="customerJoinDate">Join Date</label>
                    <input type="date" id="customerJoinDate" name="customerJoinDate" required>
                </div>
                <button type="submit" class="btn">Add Customer</button>
            </form>
        </div>
    </div>

    <div class="modal" id="editCustomerModal">
        <div class="modal-content">
            <span class="close-btn" id="closeEditModalBtn">&times;</span>
            <h2>Edit Customer</h2>
            <form id="editCustomerForm" action = "${pageContext.request.contextPath}/editCustomers" method = "POST">
                <div class="form-group"> 
                    <label for="editCustomerName">Customer Name</label>
                    <input type="text" id="editCustomerName" name="customerName" required>
                </div>
                <div class="form-group">
                    <label for="editCustomerEmail">Email (Unique)</label>
                    <input type="email" id="editCustomerEmail" name="customerEmail" required>
                </div>
                <div class="form-group">
                    <label for="editCustomerPhone">Phone</label>
                    <input type="text" id="editCustomerPhone" name="customerPhone" required>
                </div>
                <div class="form-group">
                    <label for="editCustomerJoinDate">Join Date</label>
                    <input type="date" id="editCustomerJoinDate" name="customerJoinDate" required>
                </div>
                <button type="submit" class="btn">Save Changes</button>
            </form>
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        document.getElementById('addCustomerBtn').onclick = function() {
            openModal('addCustomerModal');
        };

        document.getElementById('closeAddModalBtn').onclick = function() {
            closeModal('addCustomerModal');
        };

        window.onclick = function(event) {
            if (event.target === document.getElementById('addCustomerModal')) {
                closeModal('addCustomerModal');
            }
        };

        // Open the Edit Modal with customer data
        function openEditModal(name, email, phone, joinDate) {
            document.getElementById('editCustomerName').value = name;
            document.getElementById('editCustomerEmail').value = email;
            document.getElementById('editCustomerPhone').value = phone;
            document.getElementById('editCustomerJoinDate').value = joinDate;
            openModal('editCustomerModal');
        }

        document.getElementById('closeEditModalBtn').onclick = function() {
            closeModal('editCustomerModal');
        };

        window.onclick = function(event) {
            if (event.target === document.getElementById('editCustomerModal')) {
                closeModal('editCustomerModal');
            }
        };
        
        // Pagination functionality
	    const rowsPerPage = 5; // Number of rows per page
	    let currentPage = 1;
	    const table = document.querySelector('.customer-table table tbody');
	    const prevBtn = document.getElementById('prevBtn');
	    const nextBtn = document.getElementById('nextBtn');
	    const pageNumbers = document.getElementById('pageNumbers');
	
	    function paginateTable() {
	        const rows = Array.from(table.rows);
	        const totalPages = Math.ceil(rows.length / rowsPerPage);
	        
	        // Show only the rows for the current page
	        rows.forEach((row, index) => {
	            row.style.display = (index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage) ? '' : 'none';
	        });
	
	        // Disable/Enable buttons based on page number
	        prevBtn.disabled = currentPage === 1;
	        nextBtn.disabled = currentPage === totalPages;
	
	        // Update page number navigation
	        updatePageNumbers(totalPages);
	    }
	
	    // Function to update page numbers
	    function updatePageNumbers(totalPages) {
	        pageNumbers.innerHTML = ''; // Clear existing page numbers
	
	        for (let i = 1; i <= totalPages; i++) {
	            const pageBtn = document.createElement('button');
	            pageBtn.textContent = i;
	            pageBtn.classList.add('page-btn');
	            if (i === currentPage) {
	                pageBtn.classList.add('active'); // Add active class to the current page
	            }
	            pageBtn.addEventListener('click', () => {
	                currentPage = i;
	                paginateTable();
	            });
	            pageNumbers.appendChild(pageBtn);
	        }
	    }
	
	    // Event listeners for previous and next buttons
	    prevBtn.addEventListener('click', () => {
	        if (currentPage > 1) {
	            currentPage--;
	            paginateTable();
	        }
	    });
	
	    nextBtn.addEventListener('click', () => {
	        const totalRows = table.rows.length;
	        const totalPages = Math.ceil(totalRows / rowsPerPage);
	        if (currentPage < totalPages) {
	            currentPage++;
	            paginateTable();
	        }
	    });
	
	    paginateTable();
    </script>

    <script src="${pageContext.request.contextPath}/js/script.js"></script> 
</body>
</html>
<%
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
