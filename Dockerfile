FROM python:3.11-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    STREAMLIT_SERVER_ADDRESS=0.0.0.0 \
    STREAMLIT_SERVER_PORT=8501 \
    STREAMLIT_SERVER_HEADLESS=true \
    STREAMLIT_BROWSER_GATHER_USAGE_STATS=false \
    HF_HOME=/app-data/huggingface

WORKDIR /app

# libgomp1 is required by the compiled numerical libraries used by scikit-learn.
# curl supports the container health check.
RUN apt-get update \
    && apt-get install --yes --no-install-recommends curl libgomp1 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt

# Install the CPU-only PyTorch wheel first so the image cannot pull CUDA wheels.
RUN python -m pip install --upgrade pip \
    && python -m pip install \
        --index-url https://download.pytorch.org/whl/cpu \
        torch==2.4.1 \
    && python -m pip install --requirement /app/requirements.txt

COPY . /app

RUN chmod 0755 /app/startup.sh \
    && mkdir -p /app/logging /app/stores/audio /app/stores/sqlite /app-data/huggingface

EXPOSE 8501

HEALTHCHECK --interval=30s --timeout=5s --start-period=120s --retries=3 \
    CMD curl --fail http://127.0.0.1:8501/_stcore/health || exit 1

ENTRYPOINT [ "/app/startup.sh" ]
