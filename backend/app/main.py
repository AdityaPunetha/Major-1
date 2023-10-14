import os
import shutil
from contextlib import asynccontextmanager

from fastapi import FastAPI
from dotenv import load_dotenv
from app.routers import chat, document


load_dotenv()


@asynccontextmanager
async def lifespan(app: FastAPI):
    # TODO add documents.json creation
    if not os.path.exists("tmp"):
        os.mkdir("tmp")
    yield
    if os.path.exists("tmp"):
        shutil.rmtree("tmp")


app = FastAPI(lifespan=lifespan)

app.include_router(document.router)
app.include_router(chat.router)


@app.get("/")
async def root():
    return {"message": "Hello World"}
