FROM python:3.11-slim

# Install system utilities often needed by operators
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Pre-install common custom operator dependencies to avoid dynamic installation startup delays
RUN pip install --no-cache-dir \
    kubernetes \
    requests \
    pyyaml \
    oci

WORKDIR /app

ENV PYTHONUNBUFFERED=1

# By default, look for /app/main.py, but can be overridden by deployment commands
CMD ["python", "/app/main.py"]
