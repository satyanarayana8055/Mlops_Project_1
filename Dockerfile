FROM python:slim

# Correct ENV syntax
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install project dependencies
RUN pip install --no-cache-dir -e .

# DO NOT train inside docker build (commented)
# RUN python pipeline/training_pipeline.py

EXPOSE 8080

CMD ["python", "app.py"]
