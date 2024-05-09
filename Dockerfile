FROM alpine:latest

# Install dependencies
RUN apk add --no-cache ca-certificates curl unzip && \
    update-ca-certificates

RUN curl -O https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip && \
    unzip terraform_1.8.2_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm -f terraform_1.8.2_linux_amd64.zip \

# Set working directory
WORKDIR /app

# Copy terraform files
COPY . .

# Initialize and validate Terraform (optional)
RUN terraform init && terraform validate
