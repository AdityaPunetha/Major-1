import os

from fastapi import APIRouter, UploadFile
from app.doc_loader import (
    add_to_vectorDB,
    get_documents_from_json,
    delete_from_vectorDB,
)

router = APIRouter(prefix="/document", tags=["Documents"])


@router.get("/")
async def get_documents():
    return get_documents_from_json()


@router.post("/")
async def create_document(files: list[UploadFile]):
    for file in files:
        with open(os.path.join("tmp", file.filename), "wb") as f:
            f.write(file.file.read())
    add_to_vectorDB(files)
    return {"message": "Document added"}


@router.delete("/{document_id}")
async def delete_document(document_id: str):
    delete_from_vectorDB(document_id)
    return {"message": "Document deleted"}
