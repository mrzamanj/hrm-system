# HRM System - Enterprise-grade Human Resource Management System

## Overview

This repository contains the source code for an **Enterprise-grade Human Resource Management (HRM) System** built using **Microservices Architecture**. It is designed to manage HR-related tasks such as **Authentication**, **User Roles**, **Payroll Management**, and **Leave Management** for businesses of all sizes.

The project demonstrates the application of modern technologies such as **Node.js**, **Go**, **Python**, **Kafka**, **Redis**, and **Docker** in a distributed environment, providing robust solutions for handling HR operations efficiently.




## Why I Built This HRM System

The idea behind building this HRM system was to create a **scalable, maintainable, and easy-to-use solution** for managing HR tasks in a growing organization. Traditional HR systems are often monolithic and hard to scale. By leveraging **Microservices Architecture**, I aimed to:

- Create **modular** services that can be scaled independently.
- Implement **modern development practices** like containerization, microservices, and event-driven architecture.
- Provide easy **integration** with other business applications.
- Build a system that is **highly customizable** for different organizational needs.

The goal is to provide a solid base for managing HR operations with the flexibility to evolve as business requirements change.




## Technology Stack

The following technologies are used in this project to provide a flexible, scalable, and efficient HRM solution:

### 1. **Node.js**
   - Used for building **RESTful APIs** and handling core business logic.
   - Great for asynchronous operations and handling a large number of requests.

### 2. **Go (Golang)**
   - Used for high-performance **microservices** that handle core tasks like **Payroll Management**.
   - Go is known for its speed and ability to handle concurrent requests efficiently.

### 3. **Python**
   - Python is used for some services where advanced logic or machine learning might be needed, for example, in **leave analytics** or other business insights.

### 4. **Kafka**
   - Used as the **message broker** to facilitate asynchronous communication between services.
   - It ensures **reliable message delivery** and **event-driven architecture**, enabling services to remain decoupled.

### 5. **Redis**
   - Used for **caching** and **session management** to improve the performance of the system and reduce the load on databases.
   - Ideal for storing frequently accessed data, like user sessions and active requests.

### 6. **Docker**
   - Used to containerize the entire system to ensure **consistency across environments** and simplify deployment.
   - **Docker Compose** is used for orchestrating services and running the system as a collection of microservices.

### 7. **JWT (JSON Web Tokens)**
   - Used for **authentication** and **authorization**, ensuring secure communication between clients and services.

### 8. **PostgreSQL/MySQL**
   - Relational databases are used for storing structured data such as employee details, payroll records, and leave history.




## How Microservices Work in This HRM System

The HRM system is built using a **Microservices Architecture**, where each service is responsible for a specific set of functionality. Each service is independent, scalable, and communicates with other services through **Kafka** for **asynchronous messaging**.

### Key Microservices:
1. **User Service (Node.js)**: Manages user authentication, registration, and role-based access control (RBAC).
2. **Payroll Service (Go)**: Handles employee payroll calculations, salary distribution, and bonuses.
3. **Leave Service (Python)**: Manages leave requests, approvals, and tracking.
4. **Notification Service (Node.js)**: Handles email or SMS notifications for leave approvals, payroll updates, etc.

### Communication Between Services:
- **Kafka** acts as the **message broker** that allows microservices to communicate with each other in an event-driven manner. For example, when a user applies for leave, a message is sent to the Kafka queue, and the Leave Service processes the request asynchronously.
  
### Database:
- Each service has its own **dedicated database** or data store, ensuring independence and scalability.
- For instance, the Payroll Service can use a separate database optimized for financial transactions, while the Leave Service might use a different database optimized for time-off data.

### Benefits of Microservices:
- **Scalability**: Each service can be scaled independently depending on demand (e.g., scale the payroll service during salary payouts).
- **Resilience**: If one service fails, others continue to function.
- **Flexibility**: New features can be added as new services without disrupting the entire system.
  



## What I Learned From Building This HRM System

- **Microservices Benefits**: I have learned that microservices allow for better separation of concerns, scalability, and flexibility in managing complex systems.
- **Event-Driven Architecture**: Using Kafka for asynchronous communication between microservices was challenging but rewarding. It allowed for better decoupling between services and increased overall system performance.
- **Containerization**: Docker provided a simple and consistent way to deploy and manage services. I learned how to use Docker Compose for orchestrating multiple services and databases.
- **Performance Optimization**: Caching with Redis has significantly reduced the load on databases and improved the overall performance of the system.
  



## Scope of the HRM System

Currently, the HRM system includes:
- **Authentication & User Roles**: Secure login, registration, and RBAC.
- **Payroll Management**: Calculation, management, and tracking of employee payroll.
- **Leave Management**: Request, approval, and leave history tracking.

### Future Features (Coming Soon):
- **Performance Reviews**: Implement a performance review system for employees.
- **Time Tracking**: Track working hours, overtime, and generate reports.
- **Employee Benefits Management**: Manage employee benefits like health insurance, retirement plans, etc.
- **Advanced Analytics**: Integrate machine learning models for predictive analytics in HR, like leave prediction, performance forecasting, etc.
- **Mobile App Integration**: Develop a mobile app for employees to request leave, check payroll, and get notifications.
- **Advanced Reporting**: Generate detailed reports on employee performance, payroll, leave usage, etc.




## Getting Started

To get started with the HRM system, follow these steps:

### Prerequisites:
- Docker
- Node.js
- Go
- Kafka
- Redis
- PostgreSQL/MySQL

### Setup Instructions:

1. Clone the repository:
   ```bash
   git clone https://github.com/mrzamanj/hrm-system.git
   cd hrm-system
   ```

2. Install dependencies:
   - For Node.js services:
     ```bash
     cd user-service && npm install
     ```
   - For Go services:
     ```bash
     cd payroll-service && go mod tidy
     ```

3. Build and start services using Docker Compose:
   ```bash
   docker-compose up --build
   ```

4. Run migrations (if required):
   ```bash
   npm run migrate
   ```

5. Access the system on `http://localhost:3000` (or the appropriate port configured).




## Conclusion

This HRM system is an evolving project with the goal of providing an enterprise-grade solution for managing human resources. The use of **microservices**, **containerization**, and **event-driven architecture** ensures that the system is **scalable**, **resilient**, and **high-performing**. As new features are added, the system will continue to evolve to meet the needs of modern organizations.

Feel free to explore, fork, and contribute to the project!




## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 
