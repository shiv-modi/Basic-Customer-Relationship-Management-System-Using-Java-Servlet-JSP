# BASIC_CRM - Basic Customer Relationship Management System

Welcome to **BSIC_CRM**, a simple yet functional Customer Relationship Management (CRM) system built using Java, JSP, Servlets, and MySQL. This project is designed to help manage customers, log interactions, and generate insightful reports to support business growth.

---

## 🚀 Features

### 🔐 User Authentication
- Login and Signup functionality
- Role-based access (Admin and Employee)

### 👥 Customer Management
- Add, edit, delete, and view customer details
- Search customers by keyword

### 💬 Interaction Management
- Add, view, and delete customer interactions
- Modal pop-up to view interaction details

### 📊 Dashboard
- Overview of total customers and interactions
- Recent activity section for quick business insight

### 📈 Reports
- Customer growth report
- Interaction breakdown by type
- Top 5 customers by interaction volume
- Total number of users

### 📱 Responsive Design
- User-friendly and responsive interface using CSS

### 📄 Pagination
- Implemented for customer and interaction tables for improved usability

---

## 🧰 Tech Stack

| Layer       | Technology                     |
|-------------|--------------------------------|
| Backend     | Java, JSP, Servlets            |
| Frontend    | HTML, CSS, JavaScript          |
| Database    | MySQL                          |
| Server      | Apache Tomcat 10.1             |
| Libraries   | JSTL, Chart.js                 |

---

## ⚙️ Installation and Setup

### ✅ Prerequisites
- Java Development Kit (JDK) 21+
- Apache Tomcat 10.1+
- MySQL
- Eclipse IDE (or any IDE with support for Java web projects)

### 📥 Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/BSIC_CRM.git
   cd BSIC_CRM

## 🚀 Import the Project

1. Open **Eclipse IDE**
2. Go to: `File > Import > Existing Maven Projects`
3. Select the project directory and click **Finish**

---

## 🛠️ Set Up the Database

1. Create a **MySQL** database named `CRM`
2. Import the provided SQL schema/data into the database

---

## ⚙️ Configure Database in `web.xml`

```xml
<context-param>
  <param-name>url</param-name>
  <param-value>jdbc:mysql://localhost:3306/CRM</param-value>
</context-param>
<context-param>
  <param-name>username</param-name>
  <param-value>root</param-value>
</context-param>
<context-param>
  <param-name>password</param-name>
  <param-value>your_password</param-value>
</context-param>
```
## 📦 Add Dependencies

Include the following JARs in your classpath:

- `jstl-1.2.jar`  
- `jsp-api-2.1.jar`  
- Other required dependencies as needed

---

## ▶️ Run the Project

1. Deploy the project to an **Apache Tomcat** server.
2. Open your browser and visit:  
   [http://localhost:8080/BSIC_CRM](http://localhost:8080/BSIC_CRM)
   
## Project Structure
```xml
BSIC_CRM/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com.crm/
│   │   │       ├── dao/          # Database connection and data access logic
│   │   │       ├── interfaces/   # Interface for database operations
│   │   │       └── servlets/     # Servlets for handling requests
│   │   ├── webapp/
│   │       ├── css/              # Stylesheets
│   │       ├── js/               # JavaScript files
│   │       ├── includes/         # JSP files for different pages
│   │       └── WEB-INF/          # Configuration files (web.xml)
├── .classpath
├── .project
├── .gitignore
└── README.md
```
## Screenshots

1. **Login Page**  
   ![Login Page](https://via.placeholder.com/800x400?text=Login+Page)

2. **Dashboard**  
   ![Dashboard](https://via.placeholder.com/800x400?text=Dashboard)

3. **Customer Management**  
   ![Customer Management](https://via.placeholder.com/800x400?text=Customer+Management)

4. **Interaction Management**  
   ![Interaction Management](https://via.placeholder.com/800x400?text=Interaction+Management)

5. **Reports**  
   ![Reports](https://via.placeholder.com/800x400?text=Reports)
