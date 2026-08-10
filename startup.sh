#!/bin/sh
set -eu

# Create writable application paths when the container starts with empty mounts.
mkdir -p "${LOG_DIR:-/app/logging}"
mkdir -p /app/stores/audio
mkdir -p /app/stores/sqlite
mkdir -p "${HF_HOME:-/app-data/huggingface}"

exec python -m streamlit run /app/app.py \
    --server.address="${STREAMLIT_SERVER_ADDRESS:-0.0.0.0}" \
    --server.port="${STREAMLIT_SERVER_PORT:-8501}" \
    --server.headless="${STREAMLIT_SERVER_HEADLESS:-true}" \
    --browser.gatherUsageStats="${STREAMLIT_BROWSER_GATHER_USAGE_STATS:-false}"
