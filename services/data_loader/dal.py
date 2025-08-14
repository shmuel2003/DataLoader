import mysql.connector
from typing import List, Dict
import os


class DataLoader:
    def __init__(self):
        self.conn = mysql.connector.connect(
            host=os.getenv("MYSQL_HOST", "localhost"),
            user=os.getenv("MYSQL_USER", "root"),
            password=os.getenv("MYSQL_PASSWORD", ""),
            database=os.getenv("MYSQL_DATABASE", "test_db")
        )

    def get_all_data(self) -> List[Dict]:
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM data")
        result = cursor.fetchall()
        cursor.close()
        return result