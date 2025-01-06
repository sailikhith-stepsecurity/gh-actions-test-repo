# Use the official Golang image as the base image
FROM golang:1.23-alpine@sha256:6c5c9590f169f77c8046e45c611d3b28fe477789acd8d3762d23d4744de69812

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the workspace
COPY go.mod go.sum ./

# Download all Go modules
RUN go mod download

# Copy the rest of the project files to the workspace
COPY . .

# Build the Go app
RUN go build -o main .

# Command to run the executable
CMD ["/app/main"]