# Hospital Management System

## 📌 Description
The **Hospital Management System** is a **web-based Java application** designed to streamline hospital operations.  
It provides **patients** with the ability to book appointments and receive **BMI-based health tips**, while **doctors** can manage appointments, and **admins** can oversee hospital records efficiently.

## 🛠 Technologies Used
- **Languages:** Java, JSP, HTML, CSS, JavaScript  
- **Database:** MySQL  
- **Frameworks:** Bootstrap  
- **Libraries:** jQuery, MySQL Connector/J  
- **External JARs:** mysql-connector-java-8.0.11  
- **Server:** Apache Tomcat 10.1.33  
- **IDE:** Eclipse IDE  

## 🚀 Features
### 👨‍⚕️ Patient Role
- Register, login, and logout  
- Book and view appointments  
- Receive **personalized health tips** based on **BMI** (suggestions on drinks, walking, and exercises)  

### 🏥 Doctor Role
- Register, login, and logout  
- View assigned patient appointments  

### 🔧 Admin Role
- Login and logout  
- View and manage **doctor details** and **patient records**  

## 📥 Installation Instructions

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/pruthvi-m-y/hospital-management-system.git
```

### 2️⃣ Open the Project in Eclipse
- Launch **Eclipse IDE**  
- Import the project  

### 3️⃣ Set Up Apache Tomcat
- Install and configure **Apache Tomcat 10.1.33** as the server  

### 4️⃣ Configure MySQL Connector/J
- **Download** `mysql-connector-java-8.0.11.jar` if not already included  
- **Place the JAR file** in the `WEB-INF/lib` folder of the project  
- Alternatively, add it manually:  
  ```
  Right-click on the project → Build Path → Add External JARs → Select mysql-connector-java-8.0.11.jar
  ```

### 5️⃣ Import the Database
- Open **MySQL**  
- Import the provided **SQL file** to create the necessary tables  

### 6️⃣ Run the Project
- Start **Apache Tomcat**  
- Open your browser and navigate to:
  ```
  http://localhost:8080/HospitalManagementSystem/index.jsp
  ```
  (**`index.jsp`** is the **main entry point** to run the project)

## 🔔 Notes
- **MySQL Connector JAR** is **required** for database connectivity and should be placed inside `WEB-INF/lib`  
- Ensure **MySQL service is running** before launching the application  
- The project follows **MVC architecture** for better maintainability  

## 👥 Contributors
- **Pruthvi M Y**
