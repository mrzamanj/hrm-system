# HRM System Setup Guide

This setup guide will walk you through the steps to get the HRM System running on your local machine or a server. The system is based on Docker, so it is easy to set up and run in isolated containers. Each microservice can be started independently, or you can use Docker Compose to start the entire system at once.

## Prerequisites

Before setting up the HRM system, make sure you have the following installed:

- **Docker** (version 20.10 or higher)
  - [Install Docker](https://docs.docker.com/get-docker/)
  
- **Docker Compose** (version 1.29 or higher)
  - [Install Docker Compose](https://docs.docker.com/compose/install/)

- **Git** (for cloning the repository)
  - [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/mrzamanj/hrm-system.git
cd hrm-system
```

## Configure Environment Variables

The system uses environment variables for configuration. You will need to set these in a `.env` file.

1. Copy the `.env.example` file to `.env`:

   ```bash
   cp .env.example .env
   ```

2. Open the `.env` file and configure the variables for your environment. Key variables include:

   - **Database URLs**: Connection details for PostgreSQL or any other database used.
   - **Kafka**: Kafka broker URL (default: `localhost:9092`).
   - **Redis**: Redis connection details (default: `localhost:6379`).
   - **JWT Secret**: Secret key for signing JSON Web Tokens.
   - **Service Ports**: Ports for each microservice (e.g., user service, payroll service, etc.).

   Make sure to update any default values with your environment-specific settings.

## Build and Run the System Using Docker Compose

With Docker Compose, you can bring up the entire system with one command. It will build all necessary images and start all services.

1. From the root of the project, run the following command:

   ```bash
   docker-compose up --build
   ```

   This command does the following:
   - **Builds the Docker images** for each service (if they haven't been built before).
   - **Starts the services** in the `docker-compose.yml` file.
   - **Runs the containers** for services like the user service, payroll service, leave service, notification service, Kafka, and Redis.

2. Wait for Docker Compose to complete the process. It may take a few minutes depending on your internet speed and machine performance.

## Accessing the Services

Once the system is up and running, you can access each of the services via the following URLs:

- **User Service**: [http://localhost:3000](http://localhost:3000)
- **Payroll Service**: [http://localhost:5000](http://localhost:5000)
- **Leave Service**: [http://localhost:5001](http://localhost:5001)
- **Notification Service**: [http://localhost:3001](http://localhost:3001)
- **Kafka Broker**: [localhost:9092](localhost:9092) (For event-driven communication between services)
- **Redis**: [localhost:6379](localhost:6379) (For caching and temporary data storage)

## Verifying the Setup

After starting the system, you can verify if everything is running correctly:

1. Check if the services are up and running:
   ```bash
   docker-compose ps
   ```

   This will show you the status of all containers in the system.

2. Check the logs for any errors or issues:
   ```bash
   docker-compose logs
   ```

   This will display the logs for all services. If there are any issues, the logs should provide details on what went wrong.

## Stopping the System

To stop all running services, simply run the following command:

```bash
docker-compose down
```

This will stop and remove all containers and networks created by Docker Compose.

## Optional: Run Services Individually

If you prefer, you can run the services individually using Docker. Each service has its own `Dockerfile` and can be built and run separately.

### Example: Running the User Service

1. Navigate to the `user-service` directory:

   ```bash
   cd user-service
   ```

2. Build the Docker image for the user service:

   ```bash
   docker build -t user-service .
   ```

3. Run the user service container:

   ```bash
   docker run -p 3000:3000 user-service
   ```

This approach can be used for other services as well.

## Troubleshooting

- **Service not starting**: Check the logs for any error messages. Make sure that all services are properly configured, especially the environment variables in the `.env` file.
- **Ports conflict**: If any ports are already in use on your system, change the port mappings in the `docker-compose.yml` or `.env` file.
- **Dependency errors**: If there are errors with service dependencies (e.g., missing libraries), ensure all dependencies are correctly installed by checking each service's `Dockerfile` and `package.json` (or `requirements.txt`).

## Conclusion

This guide covers the basic setup and running of the HRM system on your local machine or server. Once set up, you can interact with the system, develop new features, or test existing ones.

For more detailed API documentation, refer to the individual service documentation in the `docs/api-docs/` directory.

If you encounter any issues or need further assistance, feel free to raise an issue on the [GitHub repository](https://github.com/mrzamanj/hrm-system). 