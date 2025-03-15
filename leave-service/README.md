# Leave Service

The **Leave Service** is a part of the **HRM System** that handles leave management for employees. It is built using **Flask** (Python) and integrates with other services like User Service and Payroll Service in a **Microservices Architecture**.

This service allows employees to request, approve, and manage leaves, ensuring smooth workflows in organizations.


## Features

- **Leave Request**: Employees can request leaves, which are then processed and approved by their managers.
- **Leave Approval**: Managers can review and approve or reject leave requests.
- **Leave Types**: Supports different types of leave, such as sick leave, annual leave, etc.
- **Leave Balances**: Employees can view their available leave balances.

## Architecture

This service is built using **Flask** for the backend API and **SQLAlchemy** for ORM. It uses **PostgreSQL** as the database for persisting leave data and integrates with other microservices via APIs.

The main components of the service include:
- **API Endpoints**: Exposes RESTful APIs for interacting with the service.
- **Database Models**: Defines leave request and leave balance models.
- **Migrations**: Utilizes **Flask-Migrate** for managing database migrations.
- **Authentication**: Integrates with the User Service to authenticate and authorize users.

## Getting Started

### Prerequisites

To run the **Leave Service**, you need to have the following installed:
- **Python 3.8+**
- **PostgreSQL**
- **pip** (Python package manager)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/mrzamanj/hrm-system.git
    cd hrm-system/leave-service
    ```

2. Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

3. Set up environment variables by creating a `.env` file:

    Example `.env` file:

    ```env
    FLASK_APP=app.py
    FLASK_ENV=development
    DATABASE_URL=postgresql://user:password@localhost:5432/hrm_db
    SECRET_KEY=your_secret_key
    ```

    Replace `your_secret_key` with a random string.

4. Run database migrations:

    ```bash
    flask db upgrade
    ```

5. Start the service:

    ```bash
    flask run
    ```

    The service should now be running at `http://127.0.0.1:5000`.

## API Endpoints

### Create Leave Request

- **Endpoint**: `POST /api/leaves`
- **Description**: Create a new leave request.
- **Request Body**:

    ```json
    {
      "employee_id": 1,
      "leave_type": "Annual Leave",
      "start_date": "2025-03-20",
      "end_date": "2025-03-25",
      "reason": "Vacation"
    }
    ```

### Get Leave Requests

- **Endpoint**: `GET /api/leaves`
- **Description**: Get all leave requests for the authenticated employee.

### Approve Leave Request

- **Endpoint**: `PATCH /api/leaves/{id}/approve`
- **Description**: Approve a leave request.
- **Request Parameters**: `id` (Leave request ID)

### Reject Leave Request

- **Endpoint**: `PATCH /api/leaves/{id}/reject`
- **Description**: Reject a leave request.
- **Request Parameters**: `id` (Leave request ID)

## Docker

To run the service in a Docker container:

1. Build the Docker image:

    ```bash
    docker build -t leave-service .
    ```

2. Run the Docker container:

    ```bash
    docker run -d -p 5000:5000 leave-service
    ```

The service should now be available at `http://127.0.0.1:5000`.

## Contributing

We welcome contributions to improve the Leave Service. If you'd like to contribute, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE) file for details.
