FROM alpine:latest

# Install Terraform
RUN apk add --no-cache wget unzip
RUN wget https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip
RUN unzip terraform_1.8.2_linux_amd64.zip
RUN mv terraform /usr/local/bin

# Set working directory
WORKDIR /app

# Copy terraform files
COPY . /app

# Initialize and validate Terraform (optional)
RUN terraform init && terraform validate
