 
# Use an official Golang image as the base image
FROM golang:1.18-alpine as builder

# Set the current working directory inside the container
WORKDIR /app

# Copy the go mod and sum files for dependency management
COPY go.mod go.sum ./

# Download the Go dependencies
RUN go mod tidy

# Copy the rest of the application code into the container
COPY . .

# Build the Go binary
RUN go build -o payroll-service ./cmd/payroll-service

# Create a smaller image for running the service
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Copy the compiled binary from the builder stage
COPY --from=builder /app/payroll-service .

# Expose the port the app will run on (5000 for this example)
EXPOSE 5000

# Start the Go application
CMD ["./payroll-service"]
