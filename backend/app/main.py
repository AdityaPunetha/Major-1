from fastapi import FastAPI
from app.routers import document

app = FastAPI()

app.include_router(document.router)


@app.get("/")
async def root():
    return {"message": "Hello World"}
