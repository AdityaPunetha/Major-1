from fastapi import APIRouter
from pydantic import BaseModel
from langchain.vectorstores import FAISS
from app.doc_loader import embeddings
from app.llm import response


class IncomingMessage(BaseModel):
    selected_document: list
    message: str
    chat_history: list


router = APIRouter(prefix="/chat", tags=["Chat"])


@router.post("/")
async def send_message(message: IncomingMessage):
    db = FAISS.load_local("FAISS", embeddings=embeddings)
    chunks = db.similarity_search(
        message.message, filter={"doc_id": message.selected_document}, k=2
    )
    refs = [chunk.page_content for chunk in chunks]
    reply = response(message.message, "\n".join(refs), message.chat_history)

    return {"references": "\n".join(refs), "reply": reply}
    return {"references": "\n".join(refs), "reply": "Generated LLM response here"}
