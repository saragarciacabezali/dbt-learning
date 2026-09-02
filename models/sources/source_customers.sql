WITH final AS (

    SELECT
        CAST(customer_id AS STRING) AS customer_id,
        CAST(TRIM(SPLIT(name, " ") [OFFSET(0)]) AS STRING) AS name,
        CAST(TRIM(SPLIT(name, " ") [OFFSET(1)]) AS STRING) AS last_name,
        {# signup_date, #}
        {# country,x #}
        {# segment #}
    FROM {{ ref("customers") }}

)

SELECT *
FROM final
