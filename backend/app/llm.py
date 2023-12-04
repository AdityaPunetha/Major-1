import os
from langchain.chat_models import ChatOpenAI
from langchain.schema.messages import HumanMessage, SystemMessage, AIMessage

chat = ChatOpenAI(openai_api_key=os.environ["OPENAI_API_KEY"])

PROMPT = SystemMessage(
    content="""The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly. Answer from the given context."""
)

TEMPLATE = """Context: {context}
User: {user_message}
"""


def response(message, selected_document, chat_history):
    messages = [PROMPT]
    if chat_history:
        history = [
            HumanMessage(content=msg)
            if sender == "UserMessage"
            else AIMessage(content=msg)
            for msg, sender in chat_history
        ]
        messages.extend(history)
    messages.append(
        HumanMessage(
            content=TEMPLATE.format(context=selected_document, user_message=message)
        )
    )
    response = chat.invoke(messages)
    return response.content
