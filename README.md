# mcp-pyhon-client

MCP Python Client

## Features

-   Modern Python project structure with uv and nox
-   Comprehensive code quality tools (Ruff, Black, isort, Pyright)
-   Security scanning (Bandit, pip-audit, Safety)
-   Automated testing with pytest and coverage
-   Documentation with MkDocs Material
-   Pre-commit hooks for code quality
-   Conventional commits with Commitizen
-   GitHub Actions CI/CD pipeline
-   Docker support

## Quick Start

### Prerequisites

-   Python 3.12+
-   uv (Python package manager)
-   Node.js 18+ (npm または yarn)

### Installation

```bash
# Clone the repository
git clone <your-repo-url>
cd mcp-pyhon-client

# Install Python dependencies
uv pip install -e ".[dev]"

# Install Node.js dependencies (if any)
npm install
# or
yarn install

# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Install pre-commit hooks
pre-commit install
```

### Development Commands

| Command              | Description                    |
| -------------------- | ------------------------------ |
| `nox -s lint`        | Run linting with Ruff          |
| `nox -s format_code` | Format code with Ruff          |
| `nox -s typing`      | Run type checking with Pyright |
| `nox -s test`        | Run tests with coverage        |
| `nox -s security`    | Run security checks            |
| `nox -s docs`        | Build documentation            |
| `nox -s ci`          | Run all CI checks              |
| `nox -s all_checks`  | Run all quality checks         |

### Testing

```bash
# Run tests with coverage
nox -s test

# Run tests in parallel
pytest -n auto

# Run specific test markers
pytest -m "not slow"
```

### Documentation

```bash
# Build documentation
nox -s docs

# Serve documentation locally
mkdocs serve
```

### Docker

```bash
# Build Docker image
docker build -t mcp-pyhon-client .

# Run Docker container
docker run mcp-pyhon-client
```

## Project Structure

```
mcp-pyhon-client/
├── src/                    # Source code
├── tests/                  # Test files
├── docs/                   # Documentation
├── .github/                # GitHub configuration
├── .vscode/                # VS Code settings
├── .cursor/                # Cursor IDE configuration
│   └── rules               # Cursor IDE rules
├── constraints/            # Dependency constraints
├── pyproject.toml          # Project configuration
├── noxfile.py              # Nox tasks
├── mkdocs.yml              # Documentation configuration
├── Dockerfile              # Docker configuration
└── README.md               # This file
```

### Cursor IDE サポート

このプロジェクトには`.cursor/rules`ファイルが含まれており、Cursor IDE でプロジェクト固有のルールを設定しています。これにより、AI アシスタントがプロジェクトの規約に従ったコードを生成するようになります。

主な設定内容：

-   コーディング規約（Python、ファイル命名、テスト等）
-   開発ツールの使用方法
-   セキュリティガイドライン
-   コミット規約
-   アーキテクチャ指針

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run quality checks: `nox -s all_checks`
5. Commit using conventional commits: `cz commit`
6. Create a pull request

## Development Workflow

### Code Quality

The project uses several tools to maintain code quality:

-   **Ruff**: Fast Python linter and formatter
-   **Black**: Uncompromising code formatter
-   **isort**: Import sorting
-   **Pyright**: Type checking
-   **Bandit**: Security linting
-   **pip-audit**: Dependency vulnerability scanning
-   **Safety**: Commercial-grade security scanning

### Pre-commit Hooks

Pre-commit hooks automatically run quality checks before each commit:

```bash
# Install pre-commit hooks
pre-commit install

# Run all hooks manually
pre-commit run --all-files
```

### Conventional Commits

The project uses conventional commits for versioning:

```bash
# Use Commitizen for commits
cz commit

# Bump version
cz bump
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# 開発環境セットアップ手順

## 手動セットアップ

### pipx のインストール（入っていない場合）

```bash
sudo apt update
sudo apt install pipx
pipx ensurepath
```

詳細は[pipx の公式ドキュメント](https://pipx.pypa.io/stable/installation/)を参照してください。

### uv のインストール

```bash
pipx install uv
```

詳細は[uv の公式ドキュメント](https://docs.astral.sh/uv/getting-started/installation/#configuring-installation)を参照してください。

### 対象の Python バージョンのインストール

```bash
uv python install [TARGET_PYTHON_VERSION]
```

### 仮想環境の作成

```bash
uv venv
```

### ライブラリのインストール

```bash
uv sync
```

### pre-commit の設定

```bash
uv run pre-commit install
```

ここまでは`setup.sh`で実行できます

### nox の実行

```bash
uv run nox
```

### 仮想環境の有効化

```bash
source .venv/bin/activate
```

### 仮想環境の終了

```bash
deactivate
```

## 自動セットアップスクリプト

環境のセットアップを自動化するために、`setup.sh`スクリプトを用意しています。

### setup.sh の使用方法

このスクリプトを使用することで、開発環境のセットアップを簡単に行うことができます。

1. `setup.sh`ファイルをプロジェクトのルートディレクトリに配置します。

2. スクリプトに実行権限を付与します：

    ```bash
    chmod +x setup.sh
    ```

3. スクリプトを実行します：

    ```bash
    ./setup.sh
    ```

注意事項：

-   スクリプトは sudo コマンドを使用するため、実行時にパスワードの入力を求められる場合があります。
-   Python のバージョンインストール行はデフォルトでコメントアウトされています。使用する場合は、スクリプトを編集し、適切なバージョン番号を指定してください。
-   仮想環境の有効化と終了は、スクリプト実行後に手動で行う必要があります。
