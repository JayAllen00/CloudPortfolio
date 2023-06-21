#import Modules
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from uuid import UUID

app = FastAPI()

#Fields
class Movies(BaseModel):
    id: UUID
    title: str = Field(min_length=1)
    director: str = Field(min_length=1, max_length=100)
    description: str = Field(min_length=1, max_length=100)
    rating: int = Field(gt=-1, lt=101)


MOVIES = []

#Functions
@app.get("/")
def view_api():
    return MOVIES


@app.post("/")
def create_movies(movies: Movies):
    MOVIES.append(movies)
    return movies


@app.put("/{movies_id}")
def update_movies(movies_id: UUID, movies: Movies):
    counter = 0

    for x in MOVIES:
        counter += 1
        if x.id == movies_id:
            MOVIES[counter - 1] = movies
            return MOVIES[counter - 1]
    raise HTTPException(
        status_code=404,
        detail=f"ID {movies_id} : Does not exist"
    )


@app.delete("/{movies_id}")
def delete_movies(movies_id: UUID):
    counter = 0

    for x in MOVIES:
        counter += 1
        if x.id == movies_id:
            del MOVIES[counter - 1]
            return f"ID: {movies_id} deleted"
    raise HTTPException(
        status_code=404,
        detail=f"ID {movies_id} : Does not exist"
    )








