# ScroogeDev

ScroogeDev is a local-first efficiency runtime for coding agents. It indexes a
repository and exposes bounded context, exact source ranges, search, local
decision support, output contracts, and token/cost accounting through a CLI
and a stdio MCP server.

This public repository is the **binary distribution surface** for ScroogeDev.
It contains release assets, installation/configuration instructions, licenses,
and third-party notices. The development repository is maintained separately.

## Supported binary platforms

Current public release targets:

| Platform | Asset | Intended use |
|---|---|---|
| macOS Apple Silicon (arm64) | `scroogedev-macos-arm64.tar.gz` | Apple-Silicon Macs |
| Linux x86_64 / amd64 | `scroogedev-linux-x86_64.tar.gz` | Linux workstations and Claude Code cloud Linux environments |

Windows, Intel macOS, and Linux arm64 are not release-qualified yet.

Each archive contains:

- `scroogedev` — the CLI
- `scroogedev-mcp` — the stdio MCP server
- `LICENSE`
- `NOTICE`
- `THIRD-PARTY.md`

Model weights are **not bundled**. Some local System-1 decision features need
separately downloaded, separately licensed model artifacts. Repository
indexing, context retrieval, search, exact ranges, MCP transport, and the
deterministic portions of the CLI do not require model weights.

## Install

### Latest release

For the safest flow, download and inspect the installer first:

```sh
curl -fsSLO https://raw.githubusercontent.com/codeshift-ai-solutions/scrooge-dev-pub/main/install.sh
less install.sh
sh install.sh
```

The default install prefix is `$HOME/.local/bin`. Make sure it is on `PATH`:

```sh
export PATH="$HOME/.local/bin:$PATH"
```

### Pin a version

```sh
sh install.sh --version v0.1.0
```

or choose another prefix:

```sh
sh install.sh --version v0.1.0 --prefix "$HOME/bin"
```

The installer downloads the matching GitHub Release asset and verifies it
against that release's `SHA256SUMS` before installing either executable.

You can also download the archive and `SHA256SUMS` directly from the
repository's Releases page and verify them yourself.

## Initialize a repository

From the project you want ScroogeDev to understand:

```sh
cd /path/to/project
scroogedev init
scroogedev index
scroogedev doctor
```

The repository-specific index/state lives under `.scroogedev/`. Do not point
one project's MCP server at another project's index.

After source changes, refresh the index:

```sh
scroogedev index
```

The MCP server also exposes an `index` tool, so an agent can refresh after it
edits the repository.

## Claude Code — local

This is the currently verified host integration.

From the target project:

```sh
scroogedev init
scroogedev index

claude mcp add --scope local scroogedev -- \
  "$HOME/.local/bin/scroogedev-mcp" \
  --repo "$PWD"

claude mcp list
```

Claude Code should report the `scroogedev` server as connected.

To remove the project-local registration:

```sh
claude mcp remove scroogedev --scope local
```

A project-scope registration can also be created with Claude Code, but avoid
checking in a machine-specific absolute binary path. A team/project config is
best once every environment installs `scroogedev-mcp` at the same command
name/location.

## Claude Code — cloud environments

Cloud VMs cannot use a ScroogeDev binary installed on your Mac. Install
ScroogeDev **inside the cloud environment**.

A setup step can use:

```sh
curl -fsSLO https://raw.githubusercontent.com/codeshift-ai-solutions/scrooge-dev-pub/main/install.sh
sh install.sh --prefix "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

cd "$CLAUDE_PROJECT_DIR"
scroogedev init
scroogedev index
```

Then configure Claude Code in that environment to run:

```text
scroogedev-mcp --repo <the cloud session's project checkout>
```

If the `claude` CLI is available during environment setup, the same
registration used locally can be applied to the cloud checkout:

```sh
claude mcp add --scope local scroogedev -- \
  "$HOME/.local/bin/scroogedev-mcp" \
  --repo "$CLAUDE_PROJECT_DIR"
```

**Cloud qualification is still preview-level:** the stdio server has been
verified with a real Claude Code client locally, but the release project's
Docker/cloud smoke gate has not yet been claimed complete. Keep an ordinary
Claude fallback available until your environment confirms `claude mcp list`
shows `scroogedev` connected.

No GitHub Actions are required for installation or publication. Public release
assets are hosted by GitHub Releases.

## Cursor

Cursor supports project-local stdio MCP configuration in `.cursor/mcp.json`.
For an installation under `~/.local/bin`:

```json
{
  "mcpServers": {
    "scroogedev": {
      "type": "stdio",
      "command": "${userHome}/.local/bin/scroogedev-mcp",
      "args": ["--repo", "${workspaceFolder}"]
    }
  }
}
```

Initialize/index the repository once before expecting context/range tools to
work:

```sh
scroogedev init
scroogedev index
```

Cursor Cloud Agents have separate dashboard/team MCP configuration; the stdio
command must exist inside the Cloud Agent environment.

## Codex CLI / IDE

Codex uses the same MCP configuration between its CLI and IDE extension.
Configure a stdio server in `~/.codex/config.toml` with the actual project
path:

```toml
[mcp_servers.scroogedev]
command = "/home/you/.local/bin/scroogedev-mcp"
args = ["--repo", "/absolute/path/to/project"]
cwd = "/absolute/path/to/project"
```

Then verify with:

```sh
codex mcp list
```

For hosted/cloud execution, the executable must be installed in that
execution environment and `cwd`/`--repo` must refer to that environment's
checkout, not your local machine.

## Windsurf and other MCP-compatible coding agents

ScroogeDev uses standard **stdio MCP**. In a host's custom MCP-server settings,
configure:

```text
command: scroogedev-mcp
args:    --repo /absolute/path/to/project
transport: stdio
```

Initialize/index the same project once with the CLI. If the host runs remotely,
install the Linux binary inside the remote environment and use the remote
checkout path.

## Optional: measure Claude Code token usage

ScroogeDev can ingest Claude Code's provider-reported OpenTelemetry usage.
Start the local receiver:

```sh
scroogedev audit receive --listen 127.0.0.1:4318
```

Then launch Claude Code with:

```sh
CLAUDE_CODE_ENABLE_TELEMETRY=1 \
OTEL_LOGS_EXPORTER=otlp \
OTEL_EXPORTER_OTLP_LOGS_PROTOCOL=http/json \
OTEL_EXPORTER_OTLP_LOGS_ENDPOINT=http://127.0.0.1:4318/v1/logs \
claude
```

ScroogeDev keeps token-count provenance and does not retain prompts,
completions, source code, or diffs in its token-audit records.

## Upgrade

Run the installer again:

```sh
sh install.sh
```

To stay reproducible, pin a version instead of following `latest`.

## License

ScroogeDev public distributions are licensed under the
[Apache License 2.0](LICENSE). Third-party components retain their own
licenses; see [THIRD-PARTY.md](THIRD-PARTY.md).

Model weights are fetched separately and are governed by their upstream
licenses.
