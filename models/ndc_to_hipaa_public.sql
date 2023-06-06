{{ config(materialized = "view") }}


-- 442
select '7594-3226-54' as ndc 
union all select '4907-9700-57' as ndc 
union all select '7585-9504-47' as ndc 
union all select '6969-1309-33' as ndc 
union all select '8840-2109-82' as ndc 

-- 442_1
union all select 'e292-4930-31' as ndc
union all select 'v169-6474-93' as ndc
union all select 'w818-8560-58' as ndc
union all select 'u286-3719-42' as ndc
union all select 'r336-4177-30' as ndc

-- 442_2
union all select '2187-R661-67' as ndc
union all select '3511-U691-34' as ndc
union all select '4154-L258-22' as ndc
union all select '1247-H819-51' as ndc
union all select '1491-O768-73' as ndc

-- 442_3
union all select '7446-2461-N2' as ndc
union all select '3340-3985-C2' as ndc
union all select '2961-8517-I7' as ndc
union all select '9496-5340-W7' as ndc
union all select '6428-2601-L7' as ndc

-- 531
union all select '62425-345-6' as ndc
union all select '26059-393-2' as ndc
union all select '58642-393-8' as ndc
union all select '95262-922-7' as ndc
union all select '32736-256-7' as ndc

-- 531_1
union all select 'O2425-345-6' as ndc
union all select 'Q2059-393-2' as ndc
union all select 'G5842-393-8' as ndc
union all select 'S9522-922-7' as ndc
union all select 'F3273-256-7' as ndc

-- 531_2
union all select '22260-O33-3' as ndc
union all select '45808-B40-3' as ndc
union all select '76237-E97-1' as ndc
union all select '24903-F31-3' as ndc
union all select '65417-L53-3' as ndc

-- 531_3
union all select '22260-O33-w' as ndc
union all select '45808-B40-w' as ndc
union all select '76237-E97-w' as ndc
union all select '24903-F31-w' as ndc
union all select '65417-L53-w' as ndc

-- 532
union all select '94247-491-98' as ndc
union all select '60833-555-23' as ndc
union all select '89232-276-98' as ndc
union all select '40893-514-14' as ndc
union all select '34679-757-17' as ndc

-- 532_1
union all select 'B4737-733-63' as ndc
union all select 'S6148-411-96' as ndc
union all select 'N2018-908-35' as ndc
union all select 'J5807-820-81' as ndc
union all select 'M6500-126-72' as ndc

-- 532_2
union all select '69294-Q51-97' as ndc
union all select '18922-U52-17' as ndc
union all select '12517-K44-67' as ndc
union all select '48051-P77-72' as ndc
union all select '65730-D42-86' as ndc

-- 532_3
union all select '87543-983-R1' as ndc
union all select '84851-165-U1' as ndc
union all select '44582-148-T4' as ndc
union all select '56962-597-Z6' as ndc
union all select '16923-149-M1' as ndc

-- 541
union all select '14852-8229-8' as ndc
union all select '14971-4243-7' as ndc
union all select '17966-3880-3' as ndc
union all select '15651-5957-1' as ndc
union all select '19657-5706-3' as ndc

-- 541_1
union all select 'K4852-8229-8' as ndc
union all select 'W4971-4243-7' as ndc
union all select 'G7966-3880-3' as ndc
union all select 'F5651-5957-1' as ndc
union all select 'M9657-5706-3' as ndc

-- 541_2
union all select '82892-D264-1' as ndc
union all select '98409-R795-6' as ndc
union all select '32073-D348-4' as ndc
union all select '87299-R409-2' as ndc
union all select '64143-M270-5' as ndc

-- 541_3
union all select '82892-D264-a' as ndc
union all select '98409-R795-a' as ndc
union all select '32073-D348-a' as ndc
union all select '87299-R409-a' as ndc
union all select '64143-M270-a' as ndc

-- 542
union all select '82892-2264-11' as ndc
union all select '98409-7295-10' as ndc
union all select '32073-3428-22' as ndc
union all select '87299-4092-23' as ndc
union all select '64143-3270-24' as ndc

-- 631
union all select '480711-376-2' as ndc
union all select '251950-612-5' as ndc
union all select '472870-765-7' as ndc
union all select '666415-267-1' as ndc
union all select '609195-381-1' as ndc

-- 631_1
union all select 'U53257-431-2' as ndc
union all select 'Y19504-112-2' as ndc
union all select 'F30860-368-4' as ndc
union all select 'N62922-322-8' as ndc
union all select 'U49083-397-8' as ndc

-- 631_2
union all select '434749-P97-7' as ndc
union all select '365693-W91-4' as ndc
union all select '642890-S10-2' as ndc
union all select '105645-K48-3' as ndc
union all select '932116-M28-5' as ndc

-- 631_3
union all select '122524-955-a' as ndc
union all select '613677-283-b' as ndc
union all select '251440-733-c' as ndc
union all select '351153-177-D' as ndc
union all select '980316-743-E' as ndc

-- 632_1
union all select 'B61881-251-59' as ndc
union all select 'V74072-621-36' as ndc
union all select 'G78020-409-18' as ndc
union all select 'O89700-785-68' as ndc
union all select 'M64532-149-49' as ndc

-- 632_2
union all select '708861-Y78-11' as ndc
union all select '235436-E23-66' as ndc
union all select '397186-G67-27' as ndc
union all select '397888-H10-92' as ndc
union all select '743851-S87-78' as ndc

-- 632_3
union all select '223598-842-U5' as ndc
union all select '831249-100-Q6' as ndc
union all select '935184-596-D8' as ndc
union all select '591859-814-P7' as ndc
union all select '503244-290-C6' as ndc

-- 641
union all select '514071-4371-1' as ndc
union all select '567726-1341-1' as ndc
union all select '880663-7682-3' as ndc
union all select '866454-8369-4' as ndc
union all select '357420-3012-3' as ndc

-- 641_1
union all select 'R37379-4516-2' as ndc
union all select 'W19521-9117-5' as ndc
union all select 'A96642-1345-1' as ndc
union all select 'A21006-8767-4' as ndc
union all select 'H70597-6240-8' as ndc

-- 641_2
union all select '972524-T955-5' as ndc
union all select '836677-A283-8' as ndc
union all select '652540-Y733-2' as ndc
union all select '733513-D177-8' as ndc
union all select '529803-A743-2' as ndc

-- 641_3
union all select '972524-T955-a' as ndc
union all select '836677-A283-b' as ndc
union all select '652540-Y733-c' as ndc
union all select '733513-D177-D' as ndc
union all select '529803-A743-E' as ndc

-- 642
union all select '900412-6290-55' as ndc
union all select '690199-6496-85' as ndc
union all select '509024-1174-75' as ndc
union all select '803905-5232-55' as ndc
union all select '193990-1340-15' as ndc

-- 642_1
union all select 'Z20693-3925-90' as ndc
union all select 'C76565-2871-63' as ndc
union all select 'W49637-4090-65' as ndc
union all select 'X11257-5768-13' as ndc
union all select 'G93526-6285-58' as ndc

-- 642_2
union all select '764326-J188-89' as ndc
union all select '865467-F556-54' as ndc
union all select '345046-V187-29' as ndc
union all select '234013-U634-95' as ndc
union all select '875346-X460-62' as ndc

-- 642_3
union all select '704120-6290-N5' as ndc
union all select '361993-6496-L8' as ndc
union all select '150243-1174-Z7' as ndc
union all select '980355-5232-I5' as ndc
union all select '719396-1340-B1' as ndc

-- 11 digits without hyphen
union all select '99989796959' as ndc

-- 12 digits without hyphen starting with zero
union all select '099989796959' as ndc

union all select 'mepivicaine10' as ndc
union all select 'atorvastation5mg' as ndc
union all select 'aspirin3mg' as ndc
union all select 'remdezvir' as ndc
union all select 'covishield13' as ndc
union all select 'covaxin' as ndc
union all select '5555@-4444-22' as ndc