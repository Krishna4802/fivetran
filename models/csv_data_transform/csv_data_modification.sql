SELECT 
    account_id
FROM {{ source('csv_data_modification', 'CSV_DATA') }} 