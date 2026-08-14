"""Entry point for running the 4get MCP server."""

from __future__ import annotations

from src.server import create_server


def main() -> None:
    server = create_server()
    
    # Configure FastMCP to boot as an HTTP web application
    server.run(
        transport="sse",
        host="0.0.0.0",  # Binds to all network interfaces inside the Docker container
        port=8000        # The network port your remote machine will listen on
    )


if __name__ == '__main__':
    main()
