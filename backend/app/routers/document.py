from fastapi import APIRouter

router = APIRouter(prefix="/document", tags=["Documents"])


@router.get("/")
async def get_documents():
    pass


@router.post("/")
async def create_document():
    pass
