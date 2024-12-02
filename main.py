from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {
        "message": "Hello, from FastAPI application deployment version 2 successful !"
    }


@app.get("/health")
async def health():
    return {"status": "Saab changa si!!!"}
