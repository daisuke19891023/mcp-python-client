#!/bin/bash
# postCreateCommand.sh - DevContainer環境専用

set -e

echo "START DevContainer Setup"

# Install uv manually as the feature can fail on auth issues
if ! command -v uv >/dev/null 2>&1; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    # Add uv to PATH for the rest of this script's execution
    if [ -d "$HOME/.local/bin" ]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi
    if [ -f "$HOME/.cargo/env" ]; then
        source "$HOME/.cargo/env"
    fi
fi

# 権限設定
sudo chown -R vscode:vscode .

# 作業ディレクトリを設定
cd "${containerWorkspaceFolder}"

# 仮想環境を作成（初回のみ）
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    uv venv --python 3.12
fi

# 仮想環境の権限を設定
sudo chown -R vscode:vscode .venv

# 仮想環境を有効化
source .venv/bin/activate

# 依存関係をインストール
echo "Installing dependencies..."
uv sync

# pre-commit設定
if uv pip list | grep -q pre-commit; then
    echo "Setting up pre-commit..."
    uv run -- pre-commit install
fi

# Git設定
echo "Setting up Git configuration..."
git config --global user.name "DevContainer User"
git config --global user.email "devcontainer@example.com"

echo "FINISH DevContainer Setup"