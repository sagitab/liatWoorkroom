FROM python:3.12.8-slim
WORKDIR /usr/local/app

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy in the source code
COPY index.html ./index.html
RUN mkdir -p /static
COPY build/static/* ./static/
EXPOSE 80

# Setup an app user so the container doesn't run as the root user
RUN useradd app
USER app

CMD ["python", "-m", "http.server", "80"]

