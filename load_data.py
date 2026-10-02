import os
import pandas as pd
from sqlalchemy import create_engine

 # 1. Database Connection String
# Format: mysql+mysqlconnector://<username>:<password>@localhost:3306/<database_name>

DB_USER = "username"
DB_PASSWORD = "your password"
DB_HOST = "localhost:3306"
DB_NAME = "olist_ecommerce"

engine = create_engine(f"mysql+mysqlconnector://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}")

# 2. Folder containing your unzipped CSVs
data_dir = r"path to your unzipped csvs"

# 3. Tables to load
files = {
    "olist_orders": "olist_orders_dataset.csv",
    "olist_order_items": "olist_order_items_dataset.csv",
    "olist_order_payments": "olist_order_payments_dataset.csv",
    "olist_customers": "olist_customers_dataset.csv",
    "olist_products": "olist_products_dataset.csv"
}

# 4. Bulk upload each table
for table_name, file_name in files.items():
    file_path = os.path.join(data_dir, file_name)
    print(f"Loading {table_name} into MySQL...")
    
    df = pd.read_csv(file_path)
    df.to_sql(table_name, con=engine, if_exists="replace", index=False, chunksize=10000)
    
    print(f"Successfully loaded {table_name} ({len(df):,} rows)")

print("\n All 5 tables are fully imported into MySQL Workbench!")