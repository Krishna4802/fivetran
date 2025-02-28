select 
    UPPER(COMPANY_NAME)
FROM {{ source('test_csv_loading1', 'LP_DATA_PIPE') }} 