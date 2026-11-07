# ---- Stage 1: install dependencies ----
FROM python:3.13-slim AS builder
WORKDIR /build
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---- Stage 2: minimal runtime image ----
FROM python:3.13-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
# pip is only needed to install packages (done in stage 1). Removing it from the
# runtime image removes its vendored libraries (msgpack, urllib3) and their CVEs.
RUN python -m pip uninstall -y pip \
 && rm -rf /usr/local/lib/python3.13/ensurepip \
 && useradd --uid 10001 --no-create-home --shell /usr/sbin/nologin appuser
WORKDIR /app
COPY --from=builder /install /usr/local
COPY main.py .
USER 10001
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
