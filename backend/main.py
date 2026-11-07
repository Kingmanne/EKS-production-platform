import os
import socket

from fastapi import FastAPI

app = FastAPI(title="eks-platform-backend")


@app.get("/health")
def health():
    # Used by Kubernetes readiness/liveness probes later
    return {"status": "ok"}


@app.get("/api/message")
def message():
    return {
        "message": os.getenv("APP_MESSAGE", "Hello from the EKS platform backend"),
        "version": os.getenv("APP_VERSION", "dev"),
        "hostname": socket.gethostname(),
    }
