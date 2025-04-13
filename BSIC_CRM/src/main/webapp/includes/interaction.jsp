<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="com.crm.dao.Dba"%>
<%@page import="com.crm.interfaces.inter"%>
<%@page import="com.crm.dao.Users"%>
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
    <title>Interaction - CRM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
        .details-scroll {
            max-height: 100px;
            overflow-y: auto;
            white-space: nowrap;
            width: 200px;
            text-overflow: ellipsis;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            resize: vertical;
        }

        /* View Interaction Modal Styling */
        .view-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .view-modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 30px;
            border-radius: 8px;
            width: 80%;
            max-width: 800px;
            height: 80%;
            overflow-y: auto;
        }

        .close-btn {
            font-size: 30px;
            font-weight: bold;
            color: #aaa;
            float: right;
            cursor: pointer;
        }

        .close-btn:hover,
        .close-btn:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .view-modal-body {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-group span {
            font-size: 14px;
            color: #555;
        }

        .form-group textarea {
            width: 100%;
            height: 200px;  /* Fixed height for consistency */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            resize: vertical;
            color: #333;
            background-color: #f9f9f9;
            margin-top: 5px;
            overflow-y: auto;  /* Enable scrolling within textarea */
            box-sizing: border-box; /* Ensures padding is included in width/height calculation */
        }

        /* Responsive Design for View Modal */
        @media screen and (max-width: 768px) {
            .view-modal-content {
                width: 90%;
            }

            .view-modal-body {
                margin-top: 10px;
            }

            .form-group {
                margin-bottom: 10px;
            }

            .form-group textarea {
                height: 150px;  /* Reduced height for smaller screens */
            }
        }
    </style>
</head>

<%!
    int idx = 0;
    String cName;
    String email;
    String details;
%>

<%
    cName = request.getParameter("cName");
    email = request.getParameter("email");
%>

<body>
    <%@include file = "sidebar.jsp" %>

    <div class="container">
        <div class="main-content">
            <header>
                <h1>Interaction List</h1>
                <button class="btn add-customer-btn" id="addInteractionBtn">Add Interaction</button>
            </header>

            <div class="search-bar">
                <form action="#" method="get">
                    <input type="text" placeholder="Search Interactions..." id="searchInput" name="searchQuery">
                    <button type="submit"><i class="fas fa-search"></i> Search</button>
                </form>
            </div>

            <div class="customer-table">
                <table>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Customer Name</th>
                            <th>Interaction Type</th>
                            <th>Details</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            inter interaction = new Dba();
                            List<Users> showInteration = interaction.getInteractions(email);
                            
                            if(showInteration != null && !showInteration.isEmpty()){
                                idx = 1;

                                for(Users c : showInteration){
                                    details = c.getDetails().replace("'", "\\'").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
                        %>
                        <tr>
                            <td><%=idx++%></td>
                            <td><%=cName %></td>
                            <td><%=c.getInteractionType() %></td>
                            <td>
                                <div class="details-scroll">
                                    <%=c.getDetails() %>
                                </div>
                            </td>
                            <td><%=c.getDateTime() %></td>
                            <td>
                                <!-- Open the View Interaction Modal with dynamic values -->
                                <button onclick="openViewModal('<%= c.getEmail() %>', '<%= cName %>', '<%= c.getDateTime() %>', '<%= c.getInteractionType() %>', '<%= details %>')">View</button>
                                <button onclick="window.location.href='${pageContext.request.contextPath}/DeleteInteraction?cName=<%=cName%>&id=<%= c.getId() %>';">Delete</button>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                            <h5>No Interaction Found</h5>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <button id="prevBtn">Previous</button>
                <span id="pageNumbers">1</span>
                <button id="nextBtn">Next</button>
            </div>
        </div>
    </div>

    <!-- Add Interaction Modal -->
    <div class="modal" id="addInteractionModal">
        <div class="modal-content">
            <span class="close-btn" id="closeAddInteractionModalBtn">&times;</span>
            <h2>Add New Interaction</h2>
            <form id="addInteractionForm" action="${pageContext.request.contextPath}/addInteraction" method="POST">
                <div class="form-group">
                    <label for="addInteractionCustomer">Customer Name</label>
                    <input type="text" id="addInteractionCustomer" name="customerName" value="<%=cName%>" readonly>
                </div>
                <div class="form-group">
                    <label for="addInteractionEmail">Email (Unique)</label>
                    <input type="email" id="addInteractionEmail" name="customerEmail" value =<%=email%> readonly>
                </div>
                <div class="form-group">
                    <label for="addInteractionType">Interaction Type</label>
                    <input type="text" id="addInteractionType" name="interactionType" required>
                </div>
                <div class="form-group">
                    <label for="addInteractionDetails">Details</label>
                    <textarea id="addInteractionDetails" name="details" required></textarea>
                </div>
                <div class="form-group">
                    <label for="addInteractionDateTime">Date</label>
                    <%
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                        String currentDateTime = sdf.format(new java.util.Date());
                    %>
                    <input type="datetime-local" id="addInteractionDateTime" name="dateTime" value="<%=currentDateTime %>" readonly>               
                </div>
                <button type="submit" class="btn">Add Interaction</button>
            </form>
        </div>
    </div>

    <!-- View Interaction Modal -->
    <div class="view-modal" id="viewInteractionModal">
        <div class="view-modal-content">
            <span class="close-btn" id="closeViewInteractionModalBtn">&times;</span>
            <h2>Interaction Details</h2>
            <div class="view-modal-body">
                <div class="form-group">
                    <label for="viewInteractionEmail"><strong>Email:</strong></label>
                    <span id="viewInteractionEmail">N/A</span>
                </div>
                <div class="form-group">
                    <label for="viewInteractionName"><strong>Name:</strong></label>
                    <span id="viewInteractionName">N/A</span>
                </div>
                <div class="form-group">
                    <label for="viewInteractionJoinDate"><strong>Join Date:</strong></label>
                    <span id="viewInteractionJoinDate">N/A</span>
                </div>
                <div class="form-group">
                    <label for="viewInteractionType"><strong>Interaction Type:</strong></label>
                    <span id="viewInteractionType">N/A</span>
                </div>
                <div class="form-group">
                    <label for="viewInteractionDetails"><strong>Details:</strong></label>
                    <textarea id="viewInteractionDetails" readonly></textarea>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Open modal for Add Interaction
        document.getElementById('addInteractionBtn').onclick = function() {
            openModal('addInteractionModal');
        };

        document.getElementById('closeAddInteractionModalBtn').onclick = function() {
            closeModal('addInteractionModal');
        };

        function openViewModal(email, name, joinDate, interactionType, details) {
            console.log("Email:", email);
            console.log("Name:", name);
            console.log("Join Date:", joinDate);
            console.log("Interaction Type:", interactionType);
            console.log("Details:", details);
            
            // Populate View Interaction modal
            document.getElementById('viewInteractionEmail').textContent = email || "N/A";
            document.getElementById('viewInteractionName').textContent = name || "N/A";
            document.getElementById('viewInteractionJoinDate').textContent = joinDate || "N/A";
            document.getElementById('viewInteractionType').textContent = interactionType || "N/A";
            
            // Populate the textarea for details
            document.getElementById('viewInteractionDetails').textContent = details || "N/A";

            // Open the View Interaction modal
            openModal('viewInteractionModal');
        }

        // Generic function to open modals
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        // Generic function to close modals
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        document.getElementById('closeViewInteractionModalBtn').onclick = function() {
            closeModal('viewInteractionModal');
        };

        // Close modal when clicking outside of it
        window.addEventListener('click', function(event) {
            if (event.target.classList.contains('view-modal')) {
                closeModal(event.target.id);
            }
        });
    </script>

</body>
</html>
<%
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
