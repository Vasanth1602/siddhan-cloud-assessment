# ---- Build Stage ----
FROM python:3.9-slim AS builder

WORKDIR /app

# Install dependencies in isolation
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# ---- Production Stage ----
FROM python:3.9-slim

WORKDIR /app

# Copy installed packages from builder
COPY --from=builder /install /usr/local

# Copy application source
COPY app.py .

# Non-root user for security
RUN useradd --create-home appuser
USER appuser

# Expose Flask port
EXPOSE 5000

# Use Gunicorn as production WSGI server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--timeout", "60", "app:app"]
