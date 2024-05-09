FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl unzip &&
    curl https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip &&
    unzip terraform_1.8.2_linux_amd64.zip &&
    mv terraform /usr/bin &&
    rm -f terraform_1.8.2_linux_amd64.zip

# Set working directory
WORKDIR /app

# Copy terraform files
COPY . /app

# Initialize and validate Terraform (optional)
RUN terraform init && terraform validate
