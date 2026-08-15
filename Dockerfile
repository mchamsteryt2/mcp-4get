# Change from 3.11-slim to 3.13-slim
FROM python:3.13-slim

WORKDIR /app

COPY pyproject.toml README.md ./
COPY . .

# FIX: Inject the missing local user binary path into the system PATH
ENV PATH="/root/.local/bin:$PATH"
ENV FOURGET_URL=https://4get.ca

# Force an explicit global installation layout
RUN pip install --no-cache-dir .

EXPOSE 8000

ENTRYPOINT ["mcp-4get"]
