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
2. Import the `crm.sql` into the database

---

## ⚙️ Configure Database in `/BSIC_CRM/src/main/java/com/crm/dao/DbCon.java`

```xml
	public final String url = "jdbc:mysql://localhost:3306/YOUR_DATABASE_NAME";
	public final String username = "YOUR_USERNAME";
	public final String password = "YOUR_PASSWORD";
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

   ![Login Page](https://github.com/user-attachments/assets/e3706a67-47f6-4dd1-ba11-37f586966b2d)

2. **SignUp Page**

   ![SignUp Page](https://github.com/user-attachments/assets/47b9860d-39bb-4f16-8531-8a8e8ff9b747)

3. **Dashboard**
   
   ![Dashboard](https://github.com/user-attachments/assets/df145ba5-6918-4298-96e5-ac95c2ea1641)

4. **Customer Management**
   
   ![Customer Management](https://github.com/user-attachments/assets/20bce4ab-ef1b-4f1d-b701-c6ad9aadf5af)

5. **Add Customer**
   
   ![Add Customer](https://github.com/user-attachments/assets/e00d36b7-3f0e-4a44-89eb-47e232ecfce9)

6. **Interaction Management**
   
   ![Interaction Management](https://github.com/user-attachments/assets/4d7e1a61-2c0e-4fad-81e1-b288bd7afdc5)

7. **Reports** 

   ![Reports](https://github.com/user-attachments/assets/9f23222a-058e-4cc9-9492-82210e845d19)

## License

This project is licensed under the Apache License 2.0. See the LICENSE file for details.

## Contact

For any questions or feedback, feel free to reach out:

- LinkedIn: [linkedin.com/shivmodi](https://linkedin.com/shivmodi)
- GitHub: [shiv-modi](https://github.com/shiv-modi)

# Thank you for checking out BASIC_CRM! 😊 
# If you like this project, give it a 🌟
