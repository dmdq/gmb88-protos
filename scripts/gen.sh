#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PROTO_DIR="$ROOT/api/proto"
export PATH="$(go env GOPATH)/bin:$PATH"
if ! command -v protoc-gen-go >/dev/null; then echo "need protoc-gen-go"; exit 1; fi
if ! command -v protoc-gen-go-grpc >/dev/null; then echo "need protoc-gen-go-grpc"; exit 1; fi
protoc -I "$PROTO_DIR" --go_out="$PROTO_DIR" --go_opt=paths=source_relative --go-grpc_out="$PROTO_DIR" --go-grpc_opt=paths=source_relative "$PROTO_DIR"/*.proto
