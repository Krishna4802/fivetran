SELECT 
    account_id,
    UPPER(brand) AS upper_brand, 
    TO_CHAR(parent_case_open_date, 'YYYY-MM-DD') AS formatted_open_date, 
    INITCAP(standardized_primary_payer_name) AS capitalized_payer_name, 
    REPLACE(payment_type, ' ', '_') AS payment_type_snake_case,
    CASE 
        WHEN current_stage_status = 'Cancelled' THEN 'Inactive'
        WHEN current_stage_status = 'Closed' THEN 'Completed'
        ELSE current_stage_status
    END AS transformed_stage_status
FROM {{ source('csv_data_modification', 'CSV_DATA') }} 