{{ config(materialized = "view") }}

select
    {{ ndc_to_hipaa('ndc') }}
from
    {{ ref('ndc_to_hipaa_public') }};