# Data Loader Service – FastAPI + MySQL on OpenShift

This project implements a **FastAPI backend** that connects to a **MySQL database** deployed on OpenShift.  
The service exposes a `/data` GET endpoint that returns all records from the `data` table in JSON format.

## Features
- **MySQL Deployment** with Persistent Volume Claim (PVC) on OpenShift.
- **Secrets** for secure database credentials.
- **FastAPI** backend containerized via Docker.
- `/data` **GET API endpoint** to fetch all records from the database.
- Automatic **database initialization** from SQL scripts.