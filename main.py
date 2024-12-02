from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello, from FastAPI application approve 2 push protected!"}


@app.get("/health")
async def health():
    return {"status": "Saab changa si!!!"}
