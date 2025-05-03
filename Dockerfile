# Download alpine image
FROM alpine:3.21.3

# Download and install required 
RUN apk add --no-cache \
    build-base \ 
    python3 \
    py3-pip \
    ffmpeg
# Add here if needed more.
# build-base package can be reduced in the future.

# Copy the whole directory and move it to the container
COPY . /app
WORKDIR /app

# Create virtual env
RUN python3 -m venv venv

# Activate virtual environment and install dependencies
RUN source venv/bin/activate &&\
    pip install --upgrade pip &&\
    pip install -r requirements.txt