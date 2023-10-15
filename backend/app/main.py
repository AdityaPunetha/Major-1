import os
import shutil
from contextlib import asynccontextmanager

from fastapi import FastAPI

from app.routers import chat, document


@asynccontextmanager
async def lifespan(app: FastAPI):
    # TODO add documents.json creation
    if not os.path.exists("tmp"):
        os.mkdir("tmp")
    doc_json_path = os.path.join("app", "documents.json")
    if not os.path.exists(doc_json_path):
        with open(doc_json_path, "w") as f:
            f.write("{}")
    yield
    if os.path.exists("tmp"):
        shutil.rmtree("tmp")


app = FastAPI(lifespan=lifespan)

app.include_router(document.router)
app.include_router(chat.router)


@app.get("/")
async def root():
    return {"message": "Hello World"}
