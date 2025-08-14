from fastapi import FastAPI
from .dal import DataLoader

app = FastAPI()
data_loader = DataLoader()

@app.get("/data")
def read_data():
    return data_loader.get_all_data()