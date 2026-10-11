#!/bin/sh
set -eu

REPO="codeshift-ai-solutions/scrooge-dev-pub"
VERSION="latest"
PREFIX="${HOME}/.local/bin"

usage() {
  cat <<'EOF'
Usage: sh install.sh [--version TAG] [--prefix DIR]

Installs scroogedev and scroogedev-mcp from the public GitHub Releases.
Supported platforms:
  macOS arm64
  Linux x86_64/amd64

Defaults:
  --version latest
  --prefix  $HOME/.local/bin
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --version)
      [ "$#" -ge 2 ] || { usage >&2; exit 2; }
      VERSION="$2"; shift 2 ;;
    --prefix)
      [ "$#" -ge 2 ] || { usage >&2; exit 2; }
      PREFIX="$2"; shift 2 ;;
    -h|--help)
      usage; exit 0 ;;
    *)
      echo "install.sh: unknown argument: $1" >&2
      usage >&2
      exit 2 ;;
  esac
done

command -v curl >/dev/null 2>&1 || { echo "install.sh: curl is required" >&2; exit 2; }

os=$(uname -s)
arch=$(uname -m)
case "$os:$arch" in
  Darwin:arm64|Darwin:aarch64)
    asset="scroogedev-macos-arm64.tar.gz" ;;
  Linux:x86_64|Linux:amd64)
    asset="scroogedev-linux-x86_64.tar.gz" ;;
  *)
    echo "install.sh: unsupported platform $os/$arch" >&2
    exit 2 ;;
esac

if [ "$VERSION" = "latest" ]; then
  base="https://github.com/$REPO/releases/latest/download"
else
  case "$VERSION" in
    v[0-9]*.[0-9]*.[0-9]*) ;;
    *)
      echo "install.sh: --version must look like v0.1.0" >&2
      exit 2 ;;
  esac
  base="https://github.com/$REPO/releases/download/$VERSION"
fi

tmp=$(mktemp -d 2>/dev/null || mktemp -d -t scroogedev)
trap 'rm -rf "$tmp"' EXIT INT TERM HUP

echo "Downloading $asset..." >&2
curl -fL --retry 3 --retry-delay 1 "$base/$asset" -o "$tmp/$asset"
curl -fL --retry 3 --retry-delay 1 "$base/SHA256SUMS" -o "$tmp/SHA256SUMS"

expected=$(awk -v name="$asset" '$2 == name { print $1 }' "$tmp/SHA256SUMS")
[ -n "$expected" ] || { echo "install.sh: $asset is not in SHA256SUMS" >&2; exit 1; }

if command -v sha256sum >/dev/null 2>&1; then
  actual=$(sha256sum "$tmp/$asset" | awk '{print $1}')
elif command -v shasum >/dev/null 2>&1; then
  actual=$(shasum -a 256 "$tmp/$asset" | awk '{print $1}')
elif command -v openssl >/dev/null 2>&1; then
  actual=$(openssl dgst -sha256 "$tmp/$asset" | sed 's/^.*= //')
else
  echo "install.sh: sha256sum, shasum, or openssl is required for verification" >&2
  exit 2
fi

[ "$actual" = "$expected" ] || {
  echo "install.sh: SHA-256 verification failed for $asset" >&2
  exit 1
}

mkdir -p "$tmp/unpack"
tar -xzf "$tmp/$asset" -C "$tmp/unpack"
[ -f "$tmp/unpack/scroogedev" ] && [ -f "$tmp/unpack/scroogedev-mcp" ] || {
  echo "install.sh: release archive does not contain both executables" >&2
  exit 1
}

mkdir -p "$PREFIX"
install -m 0755 "$tmp/unpack/scroogedev" "$PREFIX/scroogedev"
install -m 0755 "$tmp/unpack/scroogedev-mcp" "$PREFIX/scroogedev-mcp"

echo "Installed:" >&2
echo "  $PREFIX/scroogedev" >&2
echo "  $PREFIX/scroogedev-mcp" >&2
case ":$PATH:" in
  *":$PREFIX:"*) ;;
  *) echo "Add $PREFIX to PATH before using ScroogeDev." >&2 ;;
esac
