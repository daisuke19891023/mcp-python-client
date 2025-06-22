FROM python:3.12-slim

# Install Node.js and npm
RUN apt-get update && apt-get install -y \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code

# install uv
RUN curl -Ls https://astral.sh/uv/install.sh | sh

WORKDIR /app
COPY pyproject.toml /app/
RUN uv pip install ".[dev]"  # small; uses uv cache layer

COPY . /app
CMD ["python", "-m", "myproject.main"]
