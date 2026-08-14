FROM python:3.11-slim

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

# Execute the script normally
ENTRYPOINT ["python", "-m", "mcp_4get"] 
# (Adjust "mcp_4get" to the actual package run module defined in your pyproject.toml)
