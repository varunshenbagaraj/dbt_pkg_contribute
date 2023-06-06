{%- macro ndc_to_hipaa(column_name) -%}

    {{ column_name }},

    -- length of ndc
    len({{ column_name }}) as length_ndc,                 
    
    -- no of hyphen if any
    array_size(split({{ column_name }}, '-'))-1 as no_of_hyphen,

    -- no of segments
    array_size(split({{ column_name }}, '-')) as no_of_segments,
    
    -- no of chars
    len({{ column_name }})-(array_size(split({{ column_name }}, '-'))-1) as no_of_chars,
    
    -- chars before 1st hyphen
    case when (array_size(split({{ column_name }}, '-'))=1) then 0 
        else substr({{ column_name }}, 1, position('-', {{ column_name }})-1) 
    end as chars_before_1st_hyphen,
    
    -- no of chars before 1st hyphen
    case 
        when (array_size(split({{ column_name }}, '-'))=1) then 0 else len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1)) end 
    as no_of_chars_before_1st_hyphen,
        
    -- chars between the 1st and 2nd hyphen
    case when (array_size(split({{ column_name }}, '-'))=1) then 0
        else substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1) 
    end as chars_btw_1st_2nd_hyphen,
    
    -- no of chars btw 1st and 2nd hyphen
    case 
        when (array_size(split({{ column_name }}, '-'))=1) then 0 else len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1)) end 
    as no_of_chars_btw_1st_2nd_hyphen,
    
    -- chars after 2nd hyphen
    case when array_size(split({{ column_name }}, '-'))=1 then 0 
        else substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1) 
    end as chars_aft_2nd_hyphen,
    
    -- no of chars after 2nd hyphen
    case 
        when (array_size(split({{ column_name }}, '-'))=1) then 0 else len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)) end 
    as no_of_chars_aft_2nd_hyphen,
    
    -- checking {{ column_name }} format        
    case
        when charindex('-', {{ column_name }} )=0 then len({{ column_name }})
            -- case when (len({{ column_name }}) = 11 or len({{ column_name }})=12) then len({{ column_name }}) else null end            
        when array_size(split({{ column_name }}, '-'))=3 
            then concat(len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1)), '-', 
                        len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1)), '-', 
                        len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))) else null end            
    as v_format,        
    case
        when ((array_size(split({{ column_name }}, '-'))-1)=0 and len({{ column_name }}) = 11) then {{ column_name }}
        when ((array_size(split({{ column_name }}, '-'))-1)=0 and len({{ column_name }}) = 12 and substr({{ column_name }}, 1, 1)=0) then substr({{ column_name }}, 2)
        when v_format == 'invalid' then 'invalid'                
        when array_size(split({{ column_name }}, '-'))=3 then
        case
        -- 6-4-2
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=6 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=4 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=2 and 
                {{ column_name }} not rlike '[a-zA-Z]') 
                then replace(concat(substr(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), 2), substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 6-4-1
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=6 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=4 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=1 and 
                {{ column_name }} not rlike '[a-zA-Z]')
                then replace(concat(substr(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), 2), substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), "0", substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 6-3-2
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=6 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=3 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=2 and 
                {{ column_name }} not rlike '[a-zA-Z]')
                then replace(concat(substr(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), 2), "0", substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 6-3-1
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=6 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=3 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=1 and 
                {{ column_name }} not rlike '[a-zA-Z]') 
                then replace(concat(substr(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), 2), "0", substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), "0", substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 5-4-2
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=5 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=4 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=2 and 
                {{ column_name }} not rlike '[a-zA-Z]') 
                then replace(concat(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 5-4-1 
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=5 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=4 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=1 and 
                {{ column_name }} not rlike '[a-zA-Z]')
                then replace(concat(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), "0", substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 5-3-2
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=5 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=3 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=2 and 
                {{ column_name }} not rlike '[a-zA-Z]')
                then replace(concat(substr({{ column_name }}, 1, position('-', {{ column_name }})-1), "0", substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)
        -- 4-4-2
            when (len(substr({{ column_name }}, 1, position('-', {{ column_name }})-1))=4 and 
                len(substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1))=4 and
                len(substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1))=2 and 
                {{ column_name }} not rlike '[a-zA-Z]')
                then replace(concat("0", substr({{ column_name }}, 1, position('-', {{ column_name }})-1), substr({{ column_name }}, position('-', {{ column_name }})+1, position('-' in substr({{ column_name }}, position('-', {{ column_name }})+1))-1), substr({{ column_name }}, position('-', {{ column_name }}, position('-', {{ column_name }})+1)+1)), '*', 0)

            else null
        end
    else null
    end as ret_ndc

{%- endmacro -%}