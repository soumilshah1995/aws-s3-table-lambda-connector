FROM public.ecr.aws/lambda/python:3.12.2024.07.10.11-arm64 AS build-stage

# Copy the requirements file
COPY requirements.txt /var/task/

# Install dependencies
RUN pip install --target /var/task -r requirements.txt

# Copy the application code
COPY . /var/task

# Set the working directory to /var/task
WORKDIR /var/task



# Set the command to run the lambda function
CMD ["handler.lambda_handler"]
