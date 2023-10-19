from fastapi import APIRouter
from pydantic import BaseModel
from langchain.vectorstores import FAISS
from app.doc_loader import embeddings


class IncomingMessage(BaseModel):
    selected_document: list
    message: str
    chat_history: list


router = APIRouter(prefix="/chat", tags=["Chat"])


@router.post("/")
async def send_message(message: IncomingMessage):
    db = FAISS.load_local("FAISS", embeddings=embeddings)
    chunks = db.similarity_search(
        message.message,
        filter={"doc_id": message.selected_document},
    )
