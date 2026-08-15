# Change from 3.11-slim to 3.13-slim
FROM python:3.13-slim

WORKDIR /app

# Optimize layer caching for dependencies
COPY pyproject.toml README.md ./
COPY . .

# Install your local modified fork
RUN pip install --no-cache-dir .

# Default configuration settings
ENV FOURGET_URL=https://4get.ca

# Expose the network port FastMCP is listening on
EXPOSE 8000

# FIX: Invoke the module package directly from the python runtime path
ENTRYPOINT ["python", "-m", "mcp_4get"]
