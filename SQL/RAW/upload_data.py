import snowflake.connector
import os

# --- 1. CONFIGURATION ---
USER = 'admin'
PASSWORD = 'z8Dg^idk}__"W82'  # <--- Paste your password here

# IMPORTANT: Your Account ID usually looks like 'xy12345.us-east-1'
# Check your URL: https://[ACCOUNT_ID].snowflakecomputing.com
ACCOUNT = 'ettwraf-ly11294'      

# List of your specific files
files_to_upload = [
    r"D:\uber end to end dataengineering project\dataset\jan\fhvhv_tripdata_2025-01.parquet",
    r"D:\uber end to end dataengineering project\dataset\feb\fhvhv_tripdata_2025-02.parquet",
    r"D:\uber end to end dataengineering project\dataset\march\fhvhv_tripdata_2025-03.parquet"
]

# --- 2. CONNECT TO SNOWFLAKE ---
print("Connecting to Snowflake...")
try:
    conn = snowflake.connector.connect(
        user=USER,
        password=PASSWORD,
        account=ACCOUNT,
        warehouse='UBER_WH',
        database='UBER_ANALYTICS',
        schema='RAW'
    )
    print("Connected successfully!")
except Exception as e:
    print(f"Connection failed: {e}")
    exit()

# --- 3. UPLOAD LOOP ---
cursor = conn.cursor()

for file_path in files_to_upload:
    
    # [FIX] Replace backslashes with forward slashes to avoid Unicode errors
    safe_path = file_path.replace('\\', '/')
    
    print(f"\nProcessing: {safe_path}")
    
    if not os.path.exists(file_path): # We still check the original path for Python
        print(f"❌ Error: File not found at {file_path}")
        continue

    # Use 'safe_path' in the SQL command
    sql_command = f"PUT 'file://{safe_path}' @HVFHV_STAGE AUTO_COMPRESS=FALSE PARALLEL=4"
    
    try:
        cursor.execute(sql_command)
        print(f"✅ Uploaded: {os.path.basename(file_path)}")
    except Exception as e:
        print(f"❌ Failed to upload {file_path}: {e}")