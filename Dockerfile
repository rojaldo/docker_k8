FROM --platform=x86_64 ubuntu:25.04
LABEL maintainer="My Name"
LABEL description="Sample Dockerfile for a simple Python container"
EXPOSE 8000
# Install necessary packages to run Python and git
RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    rm -rf /var/lib/apt/lists/*

# clone the repository
RUN git clone https://github.com/macagua/example.fastapi.helloworld.git app
# Set the working directory
WORKDIR /app
RUN pip3 install --break-system-packages --no-cache-dir -r requirements.txt
CMD fastapi run main.py