# HRM System Documentation

Welcome to the HRM System documentation! This repository contains a microservices-based Human Resource Management (HRM) system built using a variety of technologies, including Node.js, Go, Python, Kafka, Redis, and Docker. The system offers services for user management, payroll, leave management, and notifications, all designed to be scalable and modular using microservices architecture.

## Table of Contents

- [Introduction](#introduction)
- [System Architecture](#system-architecture)
- [Technologies Used](#technologies-used)
- [Services](#services)
  - [User Service](#user-service)
  - [Payroll Service](#payroll-service)
  - [Leave Service](#leave-service)
  - [Notification Service](#notification-service)
- [Setup and Installation](#setup-and-installation)
- [Running the System](#running-the-system)
- [API Documentation](#api-documentation)
- [Features and Roadmap](#features-and-roadmap)
- [License](#license)

## Introduction

The HRM System is designed to automate and streamline human resource processes for organizations. The system is built using microservices to provide scalability and flexibility in handling various HR functions. Each service is built using a different technology stack, allowing teams to choose the most suitable technology for each aspect of the system.

## System Architecture

The system follows a microservices architecture, where each service is independent, communicating via HTTP/REST APIs and message queues (Kafka). Each service runs in its own container and interacts with others through defined APIs or Kafka topics.

### Core Components:
- **User Service**: Manages authentication, user roles, and user information.
- **Payroll Service**: Handles payroll calculations and processes.
- **Leave Service**: Manages employee leave requests and tracking.
- **Notification Service**: Sends notifications (e.g., emails, SMS) for various events in the HR system.
- **Kafka**: Manages event-driven communication between services.
- **Redis**: Used for caching and temporary data storage.

## Technologies Used

- **Node.js**: Used for the User and Notification services. It is fast, scalable, and supports a rich ecosystem of packages.
- **Go**: Used for the Payroll service, providing high performance and concurrency.
- **Python (Flask)**: Used for the Leave service, providing a lightweight and easy-to-develop framework for building REST APIs.
- **Kafka**: A distributed event streaming platform for communication between services in a decoupled manner.
- **Redis**: An in-memory data store used for caching and temporary session storage.
- **Docker**: Containerizes each service, ensuring that the system is portable and easy to deploy across various environments.
- **Docker Compose**: Orchestrates the multi-container Docker setup, making it easy to spin up the entire system.

## Services

### User Service
The **User Service** is responsible for managing users, including authentication (via JWT tokens), user roles, and access control. It provides endpoints for creating users, assigning roles, and authenticating users.

### Payroll Service
The **Payroll Service** calculates payroll based on employee data, pay schedules, and other HR factors. It interacts with a database for employee data and stores payroll information. This service is written in Go for performance and concurrency.

### Leave Service
The **Leave Service** handles employee leave requests, tracking leave balances, and leave approvals. It uses Flask to build REST APIs to manage leave requests and integrate with other services.

### Notification Service
The **Notification Service** sends notifications (e.g., email, SMS) to users for various HR events, such as payroll processing, leave approvals, and other updates. It is written in Node.js.

## Setup and Installation

To set up the HRM system on your local machine, follow these steps:

### Prerequisites
- Docker
- Docker Compose
- Git

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mrzamanj/hrm-system.git
   cd hrm-system
   ```

2. **Configure environment variables**:
   Copy the `.env.example` file to `.env` and modify the necessary configurations (e.g., database URLs, Kafka configurations).

3. **Build and start services using Docker Compose**:
   ```bash
   docker-compose up --build
   ```

   This command will build and start all services defined in the `docker-compose.yml` file. You can access the services at their respective ports.

4. **Verify services**:
   Ensure that all services are running by checking their logs or accessing the respective URLs.

## Running the System

Once the system is set up using Docker Compose, the following services will be accessible:

- **User Service**: `http://localhost:3000`
- **Payroll Service**: `http://localhost:5000`
- **Leave Service**: `http://localhost:5001`
- **Notification Service**: `http://localhost:3001`
- **Kafka Broker**: `localhost:9092`
- **Redis**: `localhost:6379`

## API Documentation

API documentation for each service can be found in the respective service's `README.md` file. The APIs are designed to be RESTful, and Swagger or Postman collections can be used for testing.

- **User Service API**: [user-service/README.md](../user-service/README.md)
- **Payroll Service API**: [payroll-service/README.md](../payroll-service/README.md)
- **Leave Service API**: [leave-service/README.md](../leave-service/README.md)
- **Notification Service API**: [notification-service/README.md](../notification-service/README.md)

## Features and Roadmap

### Current Features:
- **User Management**: User registration, authentication, and role-based access control.
- **Payroll Management**: Payroll processing, calculation, and history tracking.
- **Leave Management**: Leave requests, approvals, and tracking.
- **Notifications**: Email/SMS notifications for various HR events.

### Upcoming Features:
- **Performance Analytics**: Reports and dashboards for HR and payroll analytics.
- **Employee Benefits Management**: Integration of employee benefits such as health insurance, bonuses, etc.
- **Mobile App Integration**: Integration with mobile platforms for ease of use.
- **More Integrations**: Integration with third-party services like HRIS, attendance management, etc.

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE) file for details.
 