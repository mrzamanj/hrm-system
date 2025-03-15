# HRM System Architecture

This document provides an overview of the architecture of the HRM System. The system is designed using a **microservices architecture**, where each functionality (user management, payroll, leave management, etc.) is implemented as an independent service. The system is scalable, resilient, and maintainable by following best practices for distributed systems.

## Table of Contents

- [Microservices Overview](#microservices-overview)
- [Architecture Diagram](#architecture-diagram)
- [Service Communication](#service-communication)
- [Event-Driven Architecture](#event-driven-architecture)
- [Technology Stack](#technology-stack)
- [Security](#security)
- [Scalability and Fault Tolerance](#scalability-and-fault-tolerance)

## Microservices Overview

The HRM system is composed of several independent services, each responsible for a specific domain of the application. These services are designed to be loosely coupled, allowing them to scale independently and communicate via defined APIs or message queues.

### Core Services

1. **User Service**: Handles user authentication, user roles, and account management.
   - Built with **Node.js**.
   - Exposes RESTful APIs for managing users and authentication.
   - Uses **JWT** for secure authentication and authorization.

2. **Payroll Service**: Responsible for calculating and managing employee payroll.
   - Built with **Go** for high performance and concurrency.
   - Interacts with a payroll database and handles payroll calculations.

3. **Leave Service**: Manages employee leave requests, balances, and approvals.
   - Built with **Python (Flask)**.
   - Provides RESTful APIs for leave management.

4. **Notification Service**: Sends notifications (emails/SMS) based on events in the system (e.g., payroll processed, leave request approved).
   - Built with **Node.js**.
   - Provides an API for sending notifications to employees.

5. **Kafka**: Acts as the message broker for communication between services.
   - Ensures loose coupling by sending and receiving messages between services asynchronously.

6. **Redis**: Used for caching and session management.
   - Helps in reducing database load and improving response times.

## Architecture Diagram

Below is a high-level overview of the architecture of the HRM system:

```plaintext
+------------------+       +-------------------+      +------------------+
|  User Service    | <---> |      Kafka        | <---> |  Payroll Service |
|  (Node.js)       |       |  (Event-Driven)   |      |  (Go)            |
+------------------+       +-------------------+      +------------------+
      |                           |                          |
      |                           |                          |
+------------------+       +-------------------+      +------------------+
|  Leave Service   | <---> |     Redis         |      | Notification     |
|  (Python)        |       |  (Caching)        |      | Service          |
+------------------+       +-------------------+      |  (Node.js)       |
                        |                          +------------------+
                    +-------------------+
                    |  External Systems |
                    +-------------------+
```

In this architecture:
- **Microservices** communicate with each other through synchronous HTTP APIs or asynchronous event-driven messages via **Kafka**.
- **Kafka** ensures reliable communication between services by decoupling the services, enabling them to be scaled independently.
- **Redis** helps in caching and session management, ensuring high availability and performance.

## Service Communication

### RESTful API
Each microservice exposes a RESTful API for handling incoming requests. Services such as **User Service**, **Payroll Service**, and **Leave Service** communicate with each other via REST APIs. This synchronous communication is essential for retrieving real-time data from each service.

- **User Service** API: Handles user-related actions such as login, registration, and profile management.
- **Payroll Service** API: Handles payroll calculation and provides endpoints for viewing payroll details.
- **Leave Service** API: Manages leave requests and approvals.

### Asynchronous Communication (Event-Driven)
To facilitate loose coupling, the services communicate asynchronously through **Kafka**. This allows services to publish and consume events, which is especially useful for handling actions that do not require immediate response.

For example:
- When a **payroll is processed**, the **Payroll Service** publishes an event to Kafka, and the **Notification Service** listens for the event to send a payroll notification to the employee.
- When a **leave request** is approved or rejected, the **Leave Service** can send an event, and other services (e.g., User Service) can act on this event.

### Kafka Topics
Each event that needs to be communicated between services is sent to specific Kafka topics. For instance:
- `payroll_processed`: Event generated by the Payroll Service when payroll processing is complete.
- `leave_approved`: Event generated by the Leave Service when an employee's leave request is approved.

## Event-Driven Architecture

An event-driven approach enables better decoupling between services, ensuring that each service does not need to directly communicate with other services unless necessary. Kafka provides a reliable messaging system for services to listen for and process events asynchronously.

### Event Flow Example:
1. **User Service** processes a user login.
2. The **User Service** sends an event to Kafka, notifying other services about the authentication success.
3. **Leave Service** listens to the Kafka event and checks whether the user has any leave remaining.
4. If applicable, **Leave Service** processes a leave request and sends another event (`leave_request_processed`) back to Kafka.
5. **Notification Service** listens to the event and sends a confirmation email to the employee.

This decoupled architecture enables better scalability, fault tolerance, and flexibility.

## Technology Stack

- **Node.js**: For building scalable RESTful APIs (User and Notification Services).
- **Go**: For building high-performance services (Payroll Service).
- **Python (Flask)**: For building the Leave Management Service.
- **Kafka**: For asynchronous messaging and event-driven communication.
- **Redis**: For caching and session management.
- **Docker**: For containerization of all services.
- **Docker Compose**: For orchestration of multi-container services.

## Security

Security is a key consideration in the HRM system. The following measures are implemented:

- **JWT Authentication**: The User Service implements JWT-based authentication for securing access to APIs.
- **Role-Based Access Control (RBAC)**: Users are assigned roles (e.g., admin, employee) to restrict access to certain functionality.
- **TLS/SSL**: Services can be secured with HTTPS using SSL/TLS encryption to ensure secure communication over the network.
- **Environment Variables**: Sensitive data, such as JWT secrets and database credentials, are stored in environment variables and are not hardcoded into the codebase.

## Scalability and Fault Tolerance

The HRM system is designed to be highly scalable and resilient.

- **Microservices**: Each service can be independently scaled based on load.
- **Kafka**: Ensures fault tolerance by allowing event retry mechanisms and message persistence.
- **Redis**: Provides high availability through Redis clustering, ensuring that cached data remains available even during failures.
- **Docker**: Services are containerized, making it easy to scale the system horizontally.

In case of failure in one service, other services can continue operating normally, and Kafka ensures the message delivery even if the consumer service is temporarily down.

## Conclusion

The HRM system leverages a microservices architecture to provide modularity, scalability, and flexibility. Each service is independently deployable and can scale based on demand. The system uses event-driven communication via Kafka to maintain loose coupling and ensure reliability.

By leveraging technologies like **Node.js**, **Go**, **Python**, **Kafka**, and **Redis**, the HRM system provides a high-performance, fault-tolerant solution that can grow and adapt to future requirements. 