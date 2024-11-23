# pylint: disable=W0707

import json
import os
import psycopg2

from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient
from azure.core.exceptions import HttpResponseError

from fastapi import FastAPI, HTTPException


app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}

def db_connect():
    conn = psycopg2.connect(
            host=get_environment_variable("DATABASE_HOST"),
            port=get_environment_variable("DATABASE_PORT", "5432"),
            database=get_environment_variable("DATABASE_NAME"),
            user=get_environment_variable("DATABASE_USER"),
            password=get_environment_variable("DATABASE_PASSWORD"),
            connect_timeout=10,
        )
    return conn

def create_table():
    try:
        conn = db_connect()
        cur = conn.cursor()

        query = """
        CREATE TABLE IF NOT EXISTS examples (
            id SERIAL PRIMARY KEY,
            description TEXT
        );
        """

        cur.execute(query)
        conn.commit()
        return (cur, conn)
    except psycopg2.Error as error:
        raise HTTPException(status_code=500, detail=f"Error while Creating Table: {str(error)}")

@app.get("/examples")
def read_examples():
    try:
        conn = db_connect()
        cur = conn.cursor()
        cur.execute("SELECT * FROM examples")
        examples = cur.fetchall()

        cur.close()
        conn.close()

        return {"examples": examples}
    
    except psycopg2.OperationalError as error:
        raise HTTPException(status_code=500, detail=str(error))
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Unexpected Error: {str(error)}")


def get_environment_variable(key, default=None):
    value = os.environ.get(key, default)
    if value is None:
        raise RuntimeError(f"{key} does not exist")
    return value

@app.post("/data")
def create_table():
    try:
        conn = db_connect()
        cur = conn.cursor()

        create_table_query = """
        CREATE TABLE IF NOT EXISTS examples (
            id SERIAL PRIMARY KEY,
            description TEXT
        );
        """

        cur.execute(create_table_query)
        
        insert_data_query = """
        INSERT INTO examples (description)
        SELECT 'Hello wooooorld!'
        WHERE NOT EXISTS (
            SELECT 1 FROM examples WHERE description = 'Hello world!'
        );
        """
        cur.execute(insert_data_query)
        
        conn.commit()
        cur.close()
        conn.close()

        return {"message": "Table 'examples' created successfully"}
    except psycopg2.Error as error:
        raise HTTPException(status_code=500, detail=f"Error creating table: {str(error)}")

@app.get("/quotes")
def read_quotes():
    try:
        account_url = get_environment_variable("STORAGE_ACCOUNT_URL")
        default_credential = DefaultAzureCredential(process_timeout=2)
        blob_service_client = BlobServiceClient(account_url, credential=default_credential)

        # Added storage container name as environment variables ro handle randomization of name
        container_name = get_environment_variable("STORAGE_CONTAINER_NAME")
        container_client = blob_service_client.get_container_client(container=container_name)
        quotes = json.loads(container_client.download_blob("quotes.json").readall())
    except HttpResponseError as error:
        raise HTTPException(status_code=500, detail=str(error))

    return {"quotes": quotes}
