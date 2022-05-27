CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_PriceHistoricalMonthly
AS
SELECT a.Date,
a.sku_product_code as SKU_Code,
a.price as Price_Historical,
CASE
  WHEN sku.sub_market_code in (SELECT distinct(sub_market_code) FROM STAGING.load_sims_product_PriceSegment ) THEN
(SELECT price_segm_name FROM STAGING.load_sims_product_PriceSegment  s WHERE  (a.price / sku.cgrt_pack) >= (s.price_from /20) AND (a.price / sku.cgrt_pack) < (s.price_to /20) AND s.sub_market_code = sku.sub_market_code)
END AS Price_Segment_Historical
FROM
--SELECT para agrupar los precios por mes habiendo filtrado el precio que tenia al inicio del mes (e.rn=1)
(SELECT
       CAST(
         DATEADD(month, DATEDIFF(month, '1900-01-01'::date, e.time_date),'1900-01-01'::date)  AS Date) as DATE,
e.sku_product_code,
e.price
FROM (SELECT c.time_date,
p.sku_product_code,
p.price,
ROW_NUMBER ()
OVER (
PARTITION BY c.time_date, p.sku_product_code, p.price
ORDER BY c.time_date ASC) /*** MSC-WARNING - MSCEWI1046 - 'Row_number' FUNCTION MAPPED TO 'ROW_NUMBER', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS rn
FROM STAGING.load_sims_core_Calendar  c
inner join STAGING.load_sims_product_PriceHistorical  p on c.time_date between p.date_from and p.date_to
) e
WHERE e.rn = 1 AND e.time_date <= CURRENT_TIMESTAMP() :: TIMESTAMP GROUP BY DATEADD(month, DATEDIFF(month, '1900-01-01'::date, e.time_date) , '1900-01-01'::date) , e.sku_product_code, e.price) a
left outer join STAGING.load_sims_product_ProductSKU  sku on a.sku_product_code = sku.sku_product_code;


CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_ROFO
AS
SELECT s.SKU_product_code,
s.sales_date, CASE submarket.sub_market_code
--HEETS (Viene en TH)
WHEN 'HNB' THEN s.sales_qty /1000
ELSE s.sales_qty
END AS Sales_Qty,
s.version as Version, CASE submarket.sub_market_code
--Conventional (Viene en Mio Cigs)
WHEN 'TOT' THEN s.sales_qty *1000000
--HEETS (Viene en TH)
WHEN 'HNB' THEN s.sales_qty *1000
--Cigarillos
WHEN 'TOC' THEN s.sales_qty
--CIGARS
WHEN 'CIG' THEN s.sales_qty
--MYO (Viene en GR)
WHEN 'MYO'  THEN s.sales_qty / submarket.cigs_equiv
--MYV (Viene en GR)
WHEN 'MYV'  THEN s.sales_qty / submarket.cigs_equiv
--RYO (Viene en GR)
WHEN 'RYO'  THEN s.sales_qty / submarket.cigs_equiv
--Pipe 
WHEN 'TOP'  THEN s.sales_qty / submarket.cigs_equiv
--Chewing 
WHEN 'CHE'   THEN s.sales_qty / submarket.cigs_equiv
--Snuff 
WHEN 'SUN'   THEN s.sales_qty / submarket.cigs_equiv
--P1
WHEN 'RP1'    THEN s.sales_qty
--P2
WHEN 'RP2'    THEN 0
--P3
WHEN 'RP3'    THEN 0
--P4
WHEN 'RP4'    THEN s.sales_qty
--NA
WHEN 'NA'     THEN s.sales_qty
END AS Cigs_Eqv, CASE submarket.sub_market_code
--Conventional (Viene en Mio Cigs)
WHEN 'TOT' THEN null
--HEETS (Viene en TH)
WHEN 'HNB' THEN null
--Cigarillos
WHEN 'TOC' THEN null
--CIGARS
WHEN 'CIG' THEN null
--MYO (Viene en GR)
WHEN 'MYO'  THEN s.sales_qty
--MYV (Viene en GR)
WHEN 'MYV'  THEN s.sales_qty
--RYO (Viene en GR)
WHEN 'RYO'  THEN s.sales_qty
--Pipe 
WHEN 'TOP'  THEN s.sales_qty
--Chewing 
WHEN 'CHE'   THEN s.sales_qty
--Snuff 
WHEN 'SUN'   THEN s.sales_qty
--P1
WHEN 'RP1'    THEN null
--P2
WHEN 'RP2'    THEN null
--P3
WHEN 'RP3'    THEN null
--P4
WHEN 'RP4'    THEN null
--NA
WHEN 'NA'     THEN null
END AS Gr_RF, CASE submarket.sub_market_code
--Conventional (Viene en Mio Cigs)
WHEN 'TOT' THEN null
--HEETS (Viene en TH)
WHEN 'HNB' THEN null
--Cigarillos
WHEN 'TOC' THEN null
--CIGARS
WHEN 'CIG' THEN null
--MYO (Viene en GR)
WHEN 'MYO'  THEN null
--MYV (Viene en GR)
WHEN 'MYV'  THEN null
--RYO (Viene en GR)
WHEN 'RYO'  THEN null
--Pipe 
WHEN 'TOP'  THEN null
--Chewing 
WHEN 'CHE'   THEN null
--Snuff 
WHEN 'SUN'   THEN null
--P1
WHEN 'RP1'    THEN s.sales_qty
--P2
WHEN 'RP2'    THEN s.sales_qty
--P3
WHEN 'RP3'    THEN s.sales_qty
--P4
WHEN 'RP4'    THEN s.sales_qty
--NA
WHEN 'NA'     THEN null
END AS Packs_RF

FROM STAGING.load_sims_core_ROFO  s
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on s.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code;

-- ** MSC-WARNING - MSCEWI1040 - THE STATEMENT IS NOT SUPPORTED IN SNOWFLAKE **
----WHERE s.[version] = 'ROFO 01'









CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SO_STOCK_OUT
AS
SELECT fecha as Fecha
,
mercado as Mercado_Logista
,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista"
,
familia as "Código_Familia_Logista"
,
descripcion_familia as Familia_Logista
,
total_OOS as Total_OOS
FROM STAGING.load_sims_load_CSV_SO_STOCK_OUT ;









CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SO_TICK_ANY
AS
SELECT fecha as Fecha
,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista"
,
total_tickets as Total_Tickets
,
total_importe as Total_Importe
,
total_articulos as Total_Articulos
FROM STAGING.load_sims_load_CSV_SO_TICK_ANY ;










CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SO_TICK_ALL
AS
SELECT fecha as Fecha
,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista"
,
total_tickets as Total_Tickets
,
total_tickets_tabaco as Total_Tickets_Tabaco
,
total_importe as Total_Importe
,
total_articulos as Total_Articulos
FROM STAGING.load_sims_load_CSV_SO_TICK_ALL ;










CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SO_TICK_SKU
AS
SELECT fecha as Fecha
,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista"
,
familia as "Código_Familia_Logista"
,
descripcion_familia as Familia_Logista
,
total_tickets as Total_Tickets
,
total_importe as Total_Importe
,
total_articulos as Total_Articulos
,
total_articulos_sku as Total_Articulos_SKU
FROM STAGING.load_sims_load_CSV_SO_TICK_SKU ;

-- ** MSC-WARNING - MSCEWI1040 - THE STATEMENT IS NOT SUPPORTED IN SNOWFLAKE **
-- --WHERE fecha >= '2020-07-01'









CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SO_WSALES
AS
SELECT fecha as Fecha,
mercado as Mercado_Logista,
segmento as Segmento,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista",
familia as "Código_Familia_Logista",
descripcion_familia as Familia_Logista, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN s.Volumen_LLOCIGKGUN
--HEETS
WHEN 'HNB' THEN (s.Volumen_LLOCIGKGUN *1000) / sku.cigs_equiv
--Cigarillos
WHEN 'TOC' THEN s.Volumen_LLOCIGKGUN
--CIGARS
WHEN 'CIG' THEN s.Volumen_LLOCIGKGUN
--MYO
WHEN 'MYO'  THEN (s.Volumen_LLOCIGKGUN *1000) / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN (s.Volumen_LLOCIGKGUN *1000) / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN (s.Volumen_LLOCIGKGUN *1000) / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN (s.Volumen_LLOCIGKGUN *1000) / submarket.cigs_equiv
ELSE s.Volumen_LLOCIGKGUN
END AS Cigs_Eqv, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN null
--HEETS
WHEN 'HNB' THEN s.Volumen_LLOCIGKGUN
--Cigarillos
WHEN 'TOC' THEN null
--CIGARS
WHEN 'CIG' THEN null
--MYO
WHEN 'MYO'  THEN s.Volumen_LLOCIGKGUN
--MYV
WHEN 'MYV'  THEN s.Volumen_LLOCIGKGUN
--RYO
WHEN 'RYO'  THEN s.Volumen_LLOCIGKGUN
--Pipe
WHEN 'TOP'  THEN s.Volumen_LLOCIGKGUN
ELSE s.Volumen_LLOCIGKGUN
END AS Kg,
Volumen_Mercado_LLOCIGKGUN as Volumen_Segmento,
Volumen_Segmento_LLOCIGKGUN as Volumen_Subsegmento
FROM STAGING.load_sims_load_CSV_SO_WSALES_TAB  s
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.familia
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code

--where fecha > '2020-07-01'

UNION ALL

SELECT fecha as Fecha,
mercado as Mercado_Logista,
segmento as Segmento,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista",
familia as "Código_Familia_Logista",
descripcion_familia as Familia_Logista,
Volumen_LLOCIGKGUN AS Cigs_Eqv, null AS Kg,
Volumen_Mercado_LLOCIGKGUN as Volumen_Segmento,
Volumen_Segmento_LLOCIGKGUN as Volumen_Subsegmento
FROM STAGING.load_sims_load_CSV_SO_WSALES_ELE ;


-- ** MSC-WARNING - MSCEWI1040 - THE STATEMENT IS NOT SUPPORTED IN SNOWFLAKE **
----where fecha > '2020-07-01'










CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SO_WSALES_SEG
AS
SELECT fecha as Fecha
,
mercado as Mercado_Logista
,
segmento as Segmento
,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista"
,
MAX(Volumen_Mercado_LLOCIGKGUN) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as Volumen_Segmento
,
MAX(Volumen_Segmento_LLOCIGKGUN) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as Volumen_Subsegmento
FROM STAGING.load_sims_load_CSV_SO_WSALES_TAB  GROUP BY fecha, mercado, segmento, codigo_SAP_cliente_antiguo

--where fecha > '2019-07-01'

UNION ALL

SELECT fecha as Fecha
,
mercado as Mercado_Logista
,
segmento as Segmento
,
codigo_SAP_cliente_antiguo as "Código_de_Expendeduria_Logista"
,
MAX(Volumen_Mercado_LLOCIGKGUN) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as Volumen_Segmento
,
MAX(Volumen_Segmento_LLOCIGKGUN) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as Volumen_Subsegmento
FROM STAGING.load_sims_load_CSV_SO_WSALES_ELE  GROUP BY fecha, mercado, segmento, codigo_SAP_cliente_antiguo;


-- ** MSC-WARNING - MSCEWI1040 - THE STATEMENT IS NOT SUPPORTED IN SNOWFLAKE **
----where fecha > '2019-07-01'






CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCounty
AS
SELECT s.logista_product_code as Logista_Code,
sku.SKU_product_code as SKU_Code,
s.county_code as County_Code,
s.sales_date Sales_Date, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN NVL(s.sales_gr / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYO
WHEN 'MYO' THEN NVL(s.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYV
WHEN 'MYV' THEN NVL(s.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--RYO
WHEN 'RYO' THEN NVL(s.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
ELSE s.sales_qty
END AS Sales_Qty, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN s.sales_gr
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO'  THEN s.sales_gr
--MYV
WHEN 'MYV'  THEN s.sales_gr
--RYO
WHEN 'RYO'  THEN s.sales_gr
--Pipe
WHEN 'TOP'  THEN s.sales_gr
--Chewing
WHEN 'CHE'   THEN s.sales_gr
--Snuff
WHEN 'SUN'   THEN s.sales_gr
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0
--NA
WHEN 'NA' THEN 0
END AS Sales_Gr, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN s.sales_gr
--HEETS
WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN s.sales_gr
--CIGARS
WHEN 'CIG' THEN s.sales_gr
--MYO
WHEN 'MYO'  THEN CASE WHEN YEAR(s.sales_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ <= 2008 THEN s.sales_gr / 0.75 ELSE s.sales_gr / submarket.cigs_equiv END
--MYV
WHEN 'MYV'  THEN CASE WHEN YEAR(s.sales_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ <= 2008 THEN s.sales_gr / 0.75 ELSE s.sales_gr / submarket.cigs_equiv END
--RYO
WHEN 'RYO'  THEN CASE WHEN YEAR(s.sales_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ <= 2008 THEN s.sales_gr / 0.75 ELSE s.sales_gr / submarket.cigs_equiv END
--Pipe
WHEN 'TOP'  THEN s.sales_gr / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN s.sales_gr / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN s.sales_gr / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.sales_qty * sku.cgrt_pack
--NA
WHEN 'NA' THEN s.sales_qty
END AS Cigs_Eqv,  CASE submarket.sub_market_code
--Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack
WHEN 'TOT' THEN s.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYO
WHEN 'MYO'  THEN s.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYV
WHEN 'MYV'  THEN s.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--RYO
WHEN 'RYO'  THEN s.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--Resto
ELSE
s.sales_qty * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
END AS Revenue,
submarket.sub_market_code as Sub_Market

FROM INTEGRATION.sims_sales_SalesDayCounty s
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
--ProductFA para los packs
left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code

WHERE fa.FA_code is null OR fa.FA_code not LIKE 'PACK%'
--WHERE s.sales_date >= '2021-11-01' and fa.FA_code is null OR fa.FA_code not LIKE 'PACK%' and s.sales_date >= '2021-11-01'

UNION ALL

SELECT k.logista_product_code as Logista_Code,
sku.SKU_product_code as SKU_Code,
s.county_code as County_Code,
s.sales_date Sales_Date, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN NVL(s.sales_gr / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
--HEETS
WHEN 'HNB' THEN s.sales_qty * k.equivalence /10
--MYO
WHEN 'MYO' THEN NVL(s.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
--MYV
WHEN 'MYV' THEN NVL(s.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
--RYO
WHEN 'RYO' THEN NVL(s.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
ELSE s.sales_qty * k.equivalence
END AS Sales_Qty, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN s.sales_gr * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO'  THEN s.sales_gr * k.equivalence
--MYV
WHEN 'MYV'  THEN s.sales_gr * k.equivalence
--RYO
WHEN 'RYO'  THEN s.sales_gr * k.equivalence
--Pipe
WHEN 'TOP'  THEN s.sales_gr * k.equivalence
--Chewing
WHEN 'CHE'   THEN s.sales_gr * k.equivalence
--Snuff
WHEN 'SUN'   THEN s.sales_gr * k.equivalence
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0
--NA
WHEN 'NA' THEN 0
END AS Sales_Gr, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN s.sales_gr * k.equivalence
--HEETS
WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN s.sales_gr * k.equivalence
--CIGARS
WHEN 'CIG' THEN s.sales_gr * k.equivalence
--MYO
WHEN 'MYO'  THEN CASE WHEN YEAR(s.sales_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ <= 2008 THEN s.sales_gr * k.equivalence / 0.75 ELSE s.sales_gr * k.equivalence / submarket.cigs_equiv END
--MYV
WHEN 'MYV'  THEN CASE WHEN YEAR(s.sales_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ <= 2008 THEN s.sales_gr * k.equivalence / 0.75 ELSE s.sales_gr * k.equivalence / submarket.cigs_equiv END
--RYO
WHEN 'RYO'  THEN CASE WHEN YEAR(s.sales_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ <= 2008 THEN s.sales_gr * k.equivalence / 0.75 ELSE s.sales_gr * k.equivalence / submarket.cigs_equiv END
--Pipe
WHEN 'TOP'  THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.sales_qty * sku.cgrt_pack * k.equivalence
--NA
WHEN 'NA' THEN s.sales_qty * k.equivalence
END AS Cigs_Eqv,  CASE submarket.sub_market_code
--Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack
WHEN 'TOT' THEN s.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--HNB
WHEN 'HNB' THEN s.sales_qty * (k.equivalence /10) * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYO
WHEN 'MYO'  THEN s.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYV
WHEN 'MYV'  THEN s.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--RYO
WHEN 'RYO'  THEN s.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--Resto
ELSE
s.sales_qty * k.equivalence * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
END AS Revenue,
submarket.sub_market_code as Sub_Market

FROM INTEGRATION.sims_sales_SalesDayCounty s
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductFA para los packs
left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code
--ProductPacks
left join STAGING.load_sims_product_ProductPacks  k on logista.logista_product_code = k.logista_product_code_pack
 --LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista2 on logista2.logista_product_code = k.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista2.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code


WHERE fa.FA_code LIKE 'PACK%' ;









CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyDataset
AS

--Filtramos Online en Dataset desde ago-18 para optimizar, el historico se mostrara solo en la vista 'User'
SELECT
* FROM DATA_PRODUCT.v_sims_SalesDayCounty
WHERE YEAR(Sales_Date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >= (YEAR(CURRENT_TIMESTAMP() :: TIMESTAMP) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ -2);










CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyComis
AS
SELECT s.comis_brand as Brand_Comisionado,
s.logista_product_code as Logista_Code,
sku.SKU_product_code as SKU_Code,
s.county_code as County_Code,
s.sales_date Sales_Date, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN NVL((s.sales_qty *20)/ NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, s.sales_qty *20) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--HNB
WHEN 'HNB' THEN (s.sales_qty * 1000)/ sku.gram_ml_per_pack
--Cigarillos (de puros viene en unidades no sabemos los packs)
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN NVL((s.sales_qty * 1000)/ NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/,0) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYV
WHEN 'MYV' THEN NVL((s.sales_qty * 1000)/ NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/,0) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--RYO
WHEN 'RYO' THEN NVL((s.sales_qty * 1000)/ NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/,0) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--Pipe
WHEN 'TOP'  THEN 0
ELSE s.sales_qty
END AS Sales_Qty, CASE submarket.sub_market_code
--MYO (se multiplica el qty porque en la tabla de comis solo informamos el qty)
WHEN 'MYO'  THEN (s.sales_qty * 1000)
--MYV
WHEN 'MYV'  THEN (s.sales_qty * 1000)
--RYO
WHEN 'RYO'  THEN (s.sales_qty * 1000)
--Pipe
WHEN 'TOP'  THEN (s.sales_qty * 1000)
ELSE 0
END AS Sales_Gr, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN s.sales_qty * 20
--HEETS
WHEN 'HNB' THEN ((s.sales_qty ) / sku.cigs_equiv)*1000
--Cigarillos
WHEN 'TOC' THEN s.sales_qty
--CIGARS
WHEN 'CIG' THEN s.sales_qty
--MYO (se multiplica el qty porque en la tabla de comis solo informamos el qty)
WHEN 'MYO'  THEN (s.sales_qty * 1000) / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN (s.sales_qty * 1000) / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN (s.sales_qty * 1000) / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN (s.sales_qty * 1000) / submarket.cigs_equiv
--Chewing
--WHEN 'CHE'   THEN s.sales_gr / submarket.cigs_equiv
--Snuff
--WHEN 'SUN'   THEN s.sales_gr / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4'    THEN s.sales_qty * sku.cgrt_pack
--NA
WHEN 'NA'     THEN s.sales_qty
END AS Cigs_Eqv,  CASE submarket.sub_market_code
--Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack)
WHEN 'TOT' THEN s.sales_qty * 20 * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
-- HNB 
WHEN 'HNB' THEN ((s.sales_qty * 1000)/ sku.gram_ml_per_pack) * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYO
WHEN 'MYO'  THEN (s.sales_qty * 1000) * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYV
WHEN 'MYV'  THEN (s.sales_qty * 1000) * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--RYO
WHEN 'RYO'  THEN (s.sales_qty * 1000) * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--Resto
ELSE
s.sales_qty * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE s.sales_date >= h.date_from AND s.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE s.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
END AS Revenue

FROM INTEGRATION.sims_sales_SalesDayCountyComis s
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code

--solo competencia
where
sku.company_code <> 1
--and s.sales_date >= '2021-11-01'

UNION ALL

--PMI Viene directamente de lo informado por Logista de [vSalesDayCounty]

SELECT null AS Brand_Comisionado,
Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty,
Sales_Gr,
Cigs_Eqv,
Revenue

 FROM DATA_PRODUCT.v_sims_SalesDayCounty sc
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = sc.Logista_Code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code

where sku.company_code = 1 AND Sales_Date <= (select MAX(sales_date) /*** MSC-WARNING - MSCEWI1046 - 'max' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ from INTEGRATION.sims_sales_SalesDayCountyComis)
--Desde que tenemos cargado comisionado (ago-18)
AND
Sales_Date >= '2018-08-01';






CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyFZ
AS
SELECT f.logista_product_code as Logista_Code,
sku.SKU_product_code as SKU_Code,
f.county_code as County_Code,
f.sales_date Sales_Date, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN NVL(f.sales_gr / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYO
WHEN 'MYO' THEN NVL(f.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYV
WHEN 'MYV' THEN NVL(f.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--RYO
WHEN 'RYO' THEN NVL(f.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
ELSE f.sales_qty
END AS Sales_Qty_FZ, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN f.sales_gr
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO'  THEN f.sales_gr
--MYV
WHEN 'MYV'  THEN f.sales_gr
--RYO
WHEN 'RYO'  THEN f.sales_gr
--Pipe
WHEN 'TOP'  THEN f.sales_gr
--Chewing
WHEN 'CHE'   THEN f.sales_gr
--Snuff
WHEN 'SUN'   THEN f.sales_gr
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0
--NA
WHEN 'NA' THEN 0
END AS Sales_Gr_FZ, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN f.sales_gr
--HEETS
WHEN 'HNB' THEN f.sales_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN f.sales_gr
--CIGARS
WHEN 'CIG' THEN f.sales_gr
--MYO
WHEN 'MYO'  THEN f.sales_gr / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN f.sales_gr / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN f.sales_gr / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN f.sales_gr / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN f.sales_gr / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN f.sales_gr / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN f.sales_qty * sku.cgrt_pack
--NA
WHEN 'NA' THEN f.sales_qty
END AS Cigs_Eqv_FZ,  CASE submarket.sub_market_code
--Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack
WHEN 'TOT' THEN f.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYO
WHEN 'MYO'  THEN f.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYV
WHEN 'MYV'  THEN f.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--RYO
WHEN 'RYO'  THEN f.sales_gr * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--Resto
ELSE
f.sales_qty * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
END AS Revenue_FZ,
submarket.sub_market_code as Sub_Market

FROM INTEGRATION.sims_sales_SalesDayCountyFZ f
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = f.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
--ProductFA para los packs
left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code

WHERE fa.FA_code is null OR fa.FA_code not LIKE 'PACK%'
--WHERE f.sales_date >= '2021-11-01'and fa.FA_code is null OR fa.FA_code not LIKE 'PACK%' and f.sales_date >= '2021-11-01'

UNION ALL

SELECT K.logista_product_code as Logista_Code,
sku.SKU_product_code as SKU_Code,
f.county_code as County_Code,
f.sales_date Sales_Date, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN NVL(f.sales_gr / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
--HEETS
WHEN 'HNB' THEN f.sales_qty * k.equivalence /10
--MYO
WHEN 'MYO' THEN NVL(f.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
--MYV
WHEN 'MYV' THEN NVL(f.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
--RYO
WHEN 'RYO' THEN NVL(f.sales_gr / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, f.sales_qty) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ * k.equivalence
ELSE f.sales_qty * k.equivalence
END AS Sales_Qty_FZ, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN f.sales_gr * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO'  THEN f.sales_gr * k.equivalence
--MYV
WHEN 'MYV'  THEN f.sales_gr * k.equivalence
--RYO
WHEN 'RYO'  THEN f.sales_gr * k.equivalence
--Pipe
WHEN 'TOP'  THEN f.sales_gr * k.equivalence
--Chewing
WHEN 'CHE'   THEN f.sales_gr * k.equivalence
--Snuff
WHEN 'SUN'   THEN f.sales_gr * k.equivalence
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0
--NA
WHEN 'NA' THEN 0
END AS Sales_Gr_FZ, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN f.sales_gr * k.equivalence
--HEETS
WHEN 'HNB' THEN f.sales_qty * sku.cgrt_pack * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN f.sales_gr * k.equivalence
--CIGARS
WHEN 'CIG' THEN f.sales_gr * k.equivalence
--MYO
WHEN 'MYO'  THEN f.sales_gr * k.equivalence / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN f.sales_gr * k.equivalence / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN f.sales_gr * k.equivalence / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN f.sales_gr * k.equivalence / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN f.sales_gr * k.equivalence / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN f.sales_gr * k.equivalence / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN f.sales_qty * sku.cgrt_pack	* k.equivalence
--NA
WHEN 'NA' THEN f.sales_qty * k.equivalence
END AS Cigs_Eqv_FZ,  CASE submarket.sub_market_code
--Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack
WHEN 'TOT' THEN f.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.cgrt_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--HNB
WHEN 'HNB' THEN f.sales_qty * (k.equivalence /10) * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
--MYO
WHEN 'MYO'  THEN f.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--MYV
WHEN 'MYV'  THEN f.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--RYO
WHEN 'RYO'  THEN f.sales_gr * k.equivalence * (NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ / NULLIF(sku.gram_ml_per_pack,0) /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/)
--Resto
ELSE
f.sales_qty * k.equivalence * NVL((SELECT h.price FROM STAGING.load_sims_product_PriceHistorical  h WHERE f.sales_date >= h.date_from AND f.sales_date < h.date_to AND sku.SKU_product_code = h.SKU_product_code), (SELECT w.price FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w WHERE f.sales_date = w.sales_date AND sku.SKU_product_code = w.SKU_product_code)) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
END AS Revenue_FZ,
submarket.sub_market_code as Sub_Market

FROM INTEGRATION.sims_sales_SalesDayCountyFZ f
--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = f.logista_product_code
--ProductFA para los packs
left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code
--ProductPacks
left join STAGING.load_sims_product_ProductPacks  k on logista.logista_product_code = k.logista_product_code_pack
 --LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista2 on logista2.logista_product_code = k.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista2.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code

WHERE fa.FA_code LIKE 'PACK%' ;

CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyFZDataset
AS

--Filtramos Frozen en Dataset desde ago-18 para optimizar, el historico se mostrara solo en la vista 'User'
SELECT
* FROM DATA_PRODUCT.v_sims_SalesDayCountyFZ
WHERE YEAR(Sales_Date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >= (YEAR(CURRENT_TIMESTAMP() :: TIMESTAMP) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ -2);









CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyStocks
AS
SELECT s.Logista_Code,
s.SKU_Code,
s.County_Code,
s.Sales_Date,
s.Sales_Qty, CASE submarket.sub_market_code
--HEETS
WHEN 'HNB' THEN 0
ELSE s.Sales_Gr
END AS Sales_Gr,
s.Cigs_Eqv, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN 0
--MYV
WHEN 'MYV' THEN 0
--RYO
WHEN 'RYO' THEN 0
--Pipe
WHEN 'TOP' THEN 0
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.Sales_Qty
--P1
WHEN 'ACC' THEN s.Sales_Qty
--P1
WHEN 'SLU' THEN s.Sales_Qty
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS Sales_Packs

FROM DATA_PRODUCT.v_sims_SalesDayCounty s
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on s.SKU_Code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code

WHERE s.Sales_Date >= '2011-12-01' --Desde que hay Frozen
AND sku.company_code = '1'  --solo PMI
;


































CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCustomer AS
SELECT
  s.logista_product_code as Logista_Code,
  sku.SKU_product_code as SKU_Code,
  license_code as License_Code,
  tobacconist_code as Tobacconist_Code,
  sales_date as Sales_Date,
  sales_qty as Sales_Qty,
  CASE
    submarket.sub_market_code --Conventional
    WHEN 'TOT' THEN 0 --HEETS
    WHEN 'HNB' THEN s.sales_gr --Cigarillos
    WHEN 'TOC' THEN 0 --CIGARS
    WHEN 'CIG' THEN 0 --MYO
    WHEN 'MYO' THEN s.sales_gr --MYV
    WHEN 'MYV' THEN s.sales_gr --RYO
    WHEN 'RYO' THEN s.sales_gr --Pipe
    WHEN 'TOP' THEN s.sales_gr --Chewing
    WHEN 'CHE' THEN s.sales_gr --Snuff
    WHEN 'SUN' THEN s.sales_gr --P1
    WHEN 'KIT' THEN 0 --P1
    WHEN 'ACC' THEN 0 --P1
    WHEN 'SLU' THEN 0 --P2
    WHEN 'RP2' THEN 0 --P3
    WHEN 'RP3' THEN 0 --P4
    WHEN 'RP4' THEN 0 --NA
    WHEN 'NA' THEN 0
  END AS Sales_Gr,
  CASE
    submarket.sub_market_code --Conventional
    WHEN 'TOT' THEN sales_gr --HEETS
    WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack --Cigarillos
    WHEN 'TOC' THEN sales_gr --CIGARS
    WHEN 'CIG' THEN sales_gr --MYO
    WHEN 'MYO' THEN s.sales_gr / submarket.cigs_equiv --MYV
    WHEN 'MYV' THEN s.sales_gr / submarket.cigs_equiv --RYO
    WHEN 'RYO' THEN s.sales_gr / submarket.cigs_equiv --Pipe
    WHEN 'TOP' THEN s.sales_gr / submarket.cigs_equiv --Chewing
    WHEN 'CHE' THEN s.sales_gr / submarket.cigs_equiv --Snuff
    WHEN 'SUN' THEN s.sales_gr / submarket.cigs_equiv --P1
    WHEN 'KIT' THEN 0 --P1
    WHEN 'ACC' THEN 0 --P1
    WHEN 'SLU' THEN 0 --P2
    WHEN 'RP2' THEN 0 --P3
    WHEN 'RP3' THEN 0 --P4
    WHEN 'RP4' THEN s.sales_qty * sku.cgrt_pack --NA
    WHEN 'NA' THEN s.sales_qty
  END AS Cigs_Eqv,
  CASE
    submarket.sub_market_code --Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack
    WHEN 'TOT' THEN s.sales_gr * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.cgrt_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --MYO
    WHEN 'MYO' THEN s.sales_gr * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.gram_ml_per_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --MYV
    WHEN 'MYV' THEN s.sales_gr * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.gram_ml_per_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --RYO
    WHEN 'RYO' THEN s.sales_gr * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.gram_ml_per_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --Resto
    ELSE s.sales_qty * NVL(
      (
        SELECT
          h.price
        FROM STAGING.load_sims_product_PriceHistorical  h
        WHERE
          s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
          AND sku.SKU_product_code = h.SKU_product_code
      ),
      (
        SELECT
          w.price
        FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
        WHERE
          s.sales_date = w.sales_date
          AND sku.SKU_product_code = w.SKU_product_code
      )
    )
    /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
  END AS Revenue,
  saca_id as Saca_Id
FROM INTEGRATION.sims_sales_SalesDayCustomer s --LogistaProduct 
  left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code --ProductSKU
  left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code --SubMarket
  left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code --ProductFA para los packs
  left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code --WHERE s.sales_date >= '2021-02-01'
WHERE
  fa.FA_code is null
  OR fa.FA_code not LIKE 'PACK%'
UNION
ALL
SELECT
  k.logista_product_code as Logista_Code,
  sku.SKU_product_code as SKU_Code,
  license_code as License_Code,
  tobacconist_code as Tobacconist_Code,
  sales_date as Sales_Date,
  CASE
    submarket.sub_market_code --HEETS
    WHEN 'HNB' THEN s.sales_qty * k.equivalence / 10
    ELSE sales_qty * k.equivalence
  END AS Sales_Qty,
  CASE
    submarket.sub_market_code --Conventional
    WHEN 'TOT' THEN 0 --HEETS
    WHEN 'HNB' THEN s.sales_gr * k.equivalence / 10 --Cigarillos
    WHEN 'TOC' THEN 0 --CIGARS
    WHEN 'CIG' THEN 0 --MYO
    WHEN 'MYO' THEN s.sales_gr * k.equivalence --MYV
    WHEN 'MYV' THEN s.sales_gr * k.equivalence --RYO
    WHEN 'RYO' THEN s.sales_gr * k.equivalence --Pipe
    WHEN 'TOP' THEN s.sales_gr * k.equivalence --Chewing
    WHEN 'CHE' THEN s.sales_gr * k.equivalence --Snuff
    WHEN 'SUN' THEN s.sales_gr * k.equivalence --P1
    WHEN 'KIT' THEN 0 --P1
    WHEN 'ACC' THEN 0 --P1
    WHEN 'SLU' THEN 0 --P2
    WHEN 'RP2' THEN 0 --P3
    WHEN 'RP3' THEN 0 --P4
    WHEN 'RP4' THEN 0 --NA
    WHEN 'NA' THEN 0
  END AS Sales_Gr,
  CASE
    submarket.sub_market_code --Conventional
    WHEN 'TOT' THEN sales_gr * k.equivalence --HEETS
    WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack * k.equivalence / 10 --Cigarillos
    WHEN 'TOC' THEN sales_gr * k.equivalence --CIGARS
    WHEN 'CIG' THEN sales_gr * k.equivalence --MYO
    WHEN 'MYO' THEN s.sales_gr * k.equivalence / submarket.cigs_equiv --MYV
    WHEN 'MYV' THEN s.sales_gr * k.equivalence / submarket.cigs_equiv --RYO
    WHEN 'RYO' THEN s.sales_gr * k.equivalence / submarket.cigs_equiv --Pipe
    WHEN 'TOP' THEN s.sales_gr * k.equivalence / submarket.cigs_equiv --Chewing
    WHEN 'CHE' THEN s.sales_gr * k.equivalence / submarket.cigs_equiv --Snuff
    WHEN 'SUN' THEN s.sales_gr * k.equivalence / submarket.cigs_equiv --P1
    WHEN 'KIT' THEN 0 --P1
    WHEN 'ACC' THEN 0 --P1
    WHEN 'SLU' THEN 0 --P2
    WHEN 'RP2' THEN 0 --P3
    WHEN 'RP3' THEN 0 --P4
    WHEN 'RP4' THEN s.sales_qty * sku.cgrt_pack * k.equivalence --NA
    WHEN 'NA' THEN s.sales_qty * k.equivalence
  END AS Cigs_Eqv,
  CASE
    submarket.sub_market_code --Conventional (si es convencional calculamos el Revenue partiendo de los cigs para evitar errores con los bigpack
    WHEN 'TOT' THEN s.sales_gr * k.equivalence * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.cgrt_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --HNB
    WHEN 'HNB' THEN s.sales_qty * (k.equivalence / 10) * NVL(
      (
        SELECT
          h.price
        FROM STAGING.load_sims_product_PriceHistorical  h
        WHERE
          s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
          AND sku.SKU_product_code = h.SKU_product_code
      ),
      (
        SELECT
          w.price
        FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
        WHERE
          s.sales_date = w.sales_date
          AND sku.SKU_product_code = w.SKU_product_code
      )
    )
    /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    --MYO
    WHEN 'MYO' THEN s.sales_gr * k.equivalence * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.gram_ml_per_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --MYV
    WHEN 'MYV' THEN s.sales_gr * k.equivalence * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.gram_ml_per_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --RYO
    WHEN 'RYO' THEN s.sales_gr * k.equivalence * (
      NVL(
        (
          SELECT
            h.price
          FROM STAGING.load_sims_product_PriceHistorical  h
          WHERE
            s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
            AND sku.SKU_product_code = h.SKU_product_code
        ),
        (
          SELECT
            w.price
          FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
          WHERE
            s.sales_date = w.sales_date
            AND sku.SKU_product_code = w.SKU_product_code
        )
      )
      /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
      / NULLIF(sku.gram_ml_per_pack, 0)
      /*** MSC-WARNING - MSCEWI1046 - 'NULLIF' FUNCTION MAPPED TO 'NULLIF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
    ) --Resto
    ELSE s.sales_qty * k.equivalence * NVL(
      (
        SELECT
          h.price
        FROM STAGING.load_sims_product_PriceHistorical  h
        WHERE
          s.sales_date >= h.date_FROM AND s.sales_date < h.date_to
          AND sku.SKU_product_code = h.SKU_product_code
      ),
      (
        SELECT
          w.price
        FROM STAGING.load_sims_product_PriceHistoricalBravoWAP  w
        WHERE
          s.sales_date = w.sales_date
          AND sku.SKU_product_code = w.SKU_product_code
      )
    )
    /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
  END AS Revenue,
  saca_id as Saca_Id
FROM INTEGRATION.sims_sales_SalesDayCustomer s --LogistaProduct 
  left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code --ProductSKU
  left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code --SubMarket
  left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code --ProductFA para los packs
  left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code --ProductPacks
  left join STAGING.load_sims_product_ProductPacks  k on logista.logista_product_code = k.logista_product_code_pack --WHERE s.sales_date >= '2021-02-01'
WHERE
  fa.FA_code LIKE 'PACK%';
CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyUser
AS
--Cargamos todo el historico previo al FZ
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty,
Sales_Gr,
Cigs_Eqv,
Revenue
FROM DATA_PRODUCT.v_sims_SalesDayCounty
WHERE Sales_Date < '2014-01-01'
AND Sub_Market not in ('CHE', 'SUN')

UNION ALL

--Cargamos todo el historico previo al primer comisionado ago-18 y desde que hay FZ
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty_FZ as Sales_Qty,
Sales_Gr_FZ as Sales_Gr,
Cigs_Eqv_FZ as Cigs_Eqv,
Revenue_FZ as Revenue
FROM DATA_PRODUCT.v_sims_SalesDayCountyFZ
WHERE Sales_Date between '2014-01-01' and '2018-07-31'
AND Sub_Market not in ('CHE', 'SUN')

UNION ALL

--Cargamos desde que hay comisionado (ya filtrado en la vista Comis)
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty,
Sales_Gr,
Cigs_Eqv,
Revenue
FROM DATA_PRODUCT.v_sims_SalesDayCountyComis

UNION ALL

--Cargamos Frozen cuando hay frozen posterior al ultimo Comisionado
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty_FZ AS Sales_Qty	,
Sales_Gr_FZ AS Sales_Gr,
Cigs_Eqv_FZ AS Cigs_Eqv,
Revenue_FZ
FROM DATA_PRODUCT.v_sims_SalesDayCountyFZ
WHERE Sales_Date > (SELECT MAX(Sales_Date) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ FROM DATA_PRODUCT.v_sims_SalesDayCountyComis)
--Chewing y Snuff no vienen en el comisionado
AND
Sub_Market not in ('CHE', 'SUN')

UNION ALL

  --Finalmente cargamos Online resto desde la ultima fecha de frozen
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty AS Sales_Qty	,
Sales_Gr,
Cigs_Eqv,
Revenue
FROM DATA_PRODUCT.v_sims_SalesDayCounty
WHERE Sales_Date > (SELECT MAX(Sales_Date) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ FROM DATA_PRODUCT.v_sims_SalesDayCountyFZ)
--Chewing y Snuff no vienen en el comisionado
AND
Sub_Market not in ('CHE', 'SUN')

UNION ALL

--Como Chewing y Snuff no vienen en el comisionado lo cargamos para todo el periodo desde FZ
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date, 0 AS Sales_Qty,
Sales_Gr_FZ as Sales_Gr,
Cigs_Eqv_FZ as Cigs_Eqv,
Revenue_FZ as Revenue
FROM DATA_PRODUCT.v_sims_SalesDayCountyFZ
WHERE Sub_Market in ('CHE', 'SUN')

UNION ALL

--Chewing y Snuff despues de FZ
SELECT
Logista_Code,
SKU_Code,
County_Code,
Sales_Date, 0 AS Sales_Qty,
Sales_Gr,
Cigs_Eqv,
Revenue
FROM DATA_PRODUCT.v_sims_SalesDayCounty
WHERE Sub_Market in ('CHE', 'SUN') AND Sales_Date > (SELECT MAX(Sales_Date) /*** MSC-WARNING - MSCEWI1046 - 'MAX' FUNCTION MAPPED TO 'MAX', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ FROM DATA_PRODUCT.v_sims_SalesDayCountyFZ);

CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesMonthCustomer
AS
SELECT s.logista_product_code as Logista_Code,
license_code as License_Code,
s.tobacconist_code as Tobacconist_Code,
s.sales_date as Sales_Date,
s.sales_qty as Sales_Qty,
s.sales_gr as Sales_Gr, CASE submarket.sub_market_code
 --Conventional
WHEN 'TOT' THEN sales_gr
--HEETS
WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN sales_gr
--CIGARS
WHEN 'CIG' THEN sales_gr
--MYO
WHEN 'MYO'  THEN s.sales_gr / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN s.sales_gr / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN s.sales_gr / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN s.sales_gr / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN s.sales_gr / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN s.sales_gr / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4'    THEN s.sales_qty * sku.cgrt_pack
--NA
WHEN 'NA'     THEN s.sales_qty
END AS Cigs_Eqv

FROM INTEGRATION.sims_sales_SalesMonthCustomer s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
    --ProductFA para los packs
left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code

WHERE fa.FA_code not LIKE 'PACK%'

--where s.sales_date >= '2021-01-01'

UNION ALL

---Packs

SELECT
k.logista_product_code as Logista_Code,
license_code as License_Code,
s.tobacconist_code as Tobacconist_Code,
s.sales_date as Sales_Date,
s.sales_qty * k.equivalence as Sales_Qty,
s.sales_gr * k.equivalence as Sales_Gr, CASE submarket.sub_market_code
 --Conventional
WHEN 'TOT' THEN sales_gr * k.equivalence
--HEETS
WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN sales_gr * k.equivalence
--CIGARS
WHEN 'CIG' THEN sales_gr * k.equivalence
--MYO
WHEN 'MYO'  THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN s.sales_gr * k.equivalence / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4'    THEN s.sales_qty * sku.cgrt_pack * k.equivalence
--NA
WHEN 'NA'     THEN s.sales_qty * k.equivalence
END AS Cigs_Eqv

FROM INTEGRATION.sims_sales_SalesMonthCustomer s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
    --ProductFA para los packs
left outer join STAGING.load_sims_product_ProductFA  fa on logista.logista_product_code = fa.logista_product_code
  --ProductPacks
left join STAGING.load_sims_product_ProductPacks  k on logista.logista_product_code = k.logista_product_code_pack

WHERE fa.FA_code LIKE 'PACK%'

UNION ALL

--RESTOS COMPETENCIA MENSUAL
SELECT
s.logista_product_code as Logista_Code,
license_code as License_Code,
tobacconist_code as Tobacconist_Code,
s.sales_date as Sales_Date,
s.sales_qty as Sales_Qty,
s.sales_gr as Sales_Gr, CASE submarket.sub_market_code
--Conventional
WHEN 'TOT' THEN sales_gr
--HEETS
WHEN 'HNB' THEN s.sales_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN sales_gr
--CIGARS
WHEN 'CIG' THEN sales_gr
--MYO
WHEN 'MYO'  THEN s.sales_gr / submarket.cigs_equiv
--MYV
WHEN 'MYV'  THEN s.sales_gr / submarket.cigs_equiv
--RYO
WHEN 'RYO'  THEN s.sales_gr / submarket.cigs_equiv
--Pipe
WHEN 'TOP'  THEN s.sales_gr / submarket.cigs_equiv
--Chewing
WHEN 'CHE'   THEN s.sales_gr / submarket.cigs_equiv
--Snuff
WHEN 'SUN'   THEN s.sales_gr / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4'    THEN s.sales_qty * sku.cgrt_pack
--NA
WHEN 'NA'     THEN s.sales_qty
END AS Cigs_Eqv

FROM INTEGRATION.sims_sales_SalesDayCustomer s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code

WHERE s.logista_product_code in ('80000100', '80000101', '80000102', '80000103');
-- ** MSC-WARNING - MSCEWI1040 - THE STATEMENT IS NOT SUPPORTED IN SNOWFLAKE **
----and s.sales_date >= '2021-01-01'














CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SellOut
AS

SELECT
	CAST(logista_market_code as INT) /*** MSC-WARNING - MSCEWI1046 - 'CAST' FUNCTION MAPPED TO 'CAST', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as Mercado,
county_code as County_Code,
logista_product_code as Logista_Code,
sales_date as Sales_Date,
sales_qty as Sales_QtyGr,
pct_sales_qty as Sales_Share
FROM STAGING.load_sims_core_SellOutMarketShare 

UNION ALL

--Incluimos ONL y PMI
SELECT
mercado as Mercado,
region_de_comisionado as County_Code,
codigo_SAP_de_producto as Logista_Code,
fecha_de_factura as Sales_Date,
cantidad_LLOUMB_CIG as Sales_QtyGr, 0 AS Sales_Share
FROM STAGING.load_sims_load_CSV_PANEL  p
inner join STAGING.load_sims_product_LogistaProduct  l on l.logista_product_code = p.codigo_SAP_de_producto
inner join STAGING.load_sims_product_ProductSKU  s on s.SKU_product_code = l.SKU_product_code

WHERE region_de_comisionado <> 'Total Market' AND mercado <> 20
AND S.company_code in ('1', '74')

UNION ALL

--Incluimos mercado 20
SELECT
mercado as Mercado,
region_de_comisionado as County_Code,
codigo_SAP_de_producto as Logista_Code,
fecha_de_factura as Sales_Date,
cantidad_LLOUMB_CIG as Sales_QtyGr, 0 AS Sales_Share
FROM STAGING.load_sims_load_CSV_PANEL  p
inner join STAGING.load_sims_product_LogistaProduct  l on l.logista_product_code = p.codigo_SAP_de_producto
inner join STAGING.load_sims_product_ProductSKU  s on s.SKU_product_code = l.SKU_product_code

WHERE mercado = 20 AND region_de_comisionado <> 'Total Market';





CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SellOut040
AS

SELECT sales_date as Sales_Date,
region as Region,
ean as Logista_Code,
system as System,
value as Value,
volumen as Volumen,
volumen_ML as Volumen_ML,
article as Article,
segment as Segment,
brand as Brand,
nicotine as Nicotine,
flavour_type as Flavour_Type
FROM STAGING.load_sims_load_CSV_PANELECIG 
;








CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_Product AS
SELECT
  market.market_code as Market_Code,
  market.market_name as Market,
  submarket.sub_market_name as Sub_Market,
  company.company_name as Company,
  company.company_ord as Company_Order,
  brandfamily.brand_fam_name as Brand_Family,
  sku.product_family as Product_Family,
  sku.product_detail as Product_Detail,
  sku.version as Version,
  sku.SKU_product_name as SKU,
  logista.logista_product_name as Logista_Name,
  sku.SKU_product_code as SKU_Code,
  sku.ebrom as ebrom,
  logista.logista_product_code as Logista_Code,
  logista.brand_group_code as Logista_Group_Code,
  logista.status as Status,
  productfa.fa_code as FA_Code,
  productfa.market as Geographic_Market,
  sku.price as Price,
  CASE
    WHEN sku.sub_market_code in (
      SELECT
        distinct(sub_market_code)
      FROM STAGING.load_sims_product_PriceSegment 
    )
    AND sku.cgrt_pack <> 0 THEN (
      SELECT
        price_segm_name
      FROM STAGING.load_sims_product_PriceSegment  s
      WHERE
        (sku.price / sku.cgrt_pack) >= (s.price_from / 20)
        AND (sku.price / sku.cgrt_pack) < (s.price_to / 20)
        AND sku.sub_market_code = s.sub_market_code
    )
  END AS Price_Segment,
  CASE
    WHEN sku.sub_market_code in (
      SELECT
        distinct(sub_market_code)
      FROM STAGING.load_sims_product_PriceSegment 
    )
    AND sku.cgrt_pack <> 0 THEN (
      SELECT
        price_segm_order
      FROM STAGING.load_sims_product_PriceSegment  s
      WHERE
        (sku.price / sku.cgrt_pack) >= (s.price_from / 20)
        AND (sku.price / sku.cgrt_pack) < (s.price_to / 20)
        AND sku.sub_market_code = s.sub_market_code
    )
  END AS Price_Segment_Order,
  producttype.logista_market_code as Logista_Market_Code,
  blendtype.blend_name as Blend_PMI,
  packtype.pack_type_name as Pack_Type,
  sku.add_free_ind as Additive_Free,
  sku.ment_ind as Menthol_Indicator,
  sku.nict_cont as Nicotine_Content,
  sku.co_level as Carbon_Monoxide_Level,
  sku.filter as Filter_Ind,
  thickness.thick_name as Thickness_Category,
  sku.cgrt_pack as Units_Per_Pack,
  sku.core_code as CoreBanding,
  sku.gram_ml_per_pack as Gr_Per_Pack,
  length.length_name as Length,
  logista.product_type as Logista_Product_Type,
  (
    CASE
      WHEN sku.company_code = 1 THEN 'Philip Morris'
      WHEN sku.company_code = 74 THEN 'ONL'
      ELSE 'COMPETENCIA'
    END
  ) AS Company_Case,
  (
    CASE
      WHEN sku.company_code = 1 THEN 1
      WHEN sku.company_code = 74 THEN 3
      ELSE 2
    END
  ) AS Company_Order_Case,
  (
    CASE
      WHEN sku.company_code = 1 then 'Philip Morris'
      when sku.company_code = 12 then 'J.T.I.'
      when sku.company_code = 36 then 'B.A.T.'
      when sku.company_code = 68 then 'Imperial Tobacco'
      else 'Others'
    end
  ) AS Company_Name,
  (
    CASE
      WHEN sku.company_code = 1 then 1
      when sku.company_code = 12 then 2
      when sku.company_code = 36 then 3
      when sku.company_code = 68 then 4
      else 5
    end
  ) AS Company_Order_Name
FROM STAGING.load_sims_product_LogistaProduct  logista
  left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code --Market & SubMarket
  left outer join STAGING.load_sims_product_SubMarket  submarket on sku.sub_market_code = submarket.sub_market_code
  left outer join STAGING.load_sims_product_Market  market on submarket.market_code = market.market_code --BrandFamily
  left outer join STAGING.load_sims_product_BrandFamily  brandfamily on brandfamily.brand_fam_code = sku.brand_fam_code --Company
  left outer join STAGING.load_sims_product_Company  company on company.company_code = sku.company_code --BlendType 
  left outer join STAGING.load_sims_product_BlendType  blendtype on sku.blend_code = blendtype.blend_code --Length
  left outer join STAGING.load_sims_product_Length  length on length.length_code = sku.length_code --PackType
  left outer join STAGING.load_sims_product_PackType  packtype on packtype.pack_type_code = sku.pack_type_code --PriceSegment
  left outer join STAGING.load_sims_product_PriceSegment  pricesegment on pricesegment.price_segm_code = sku.price_segm_code --Thickness
  left outer join STAGING.load_sims_product_Thickness  thickness on thickness.thick_code = sku.thick_code --ProductType
  left outer join STAGING.load_sims_product_ProductType  producttype on producttype.product_type = logista.product_type --FACode
  left outer join STAGING.load_sims_product_ProductFA  productfa on productfa.logista_product_code = logista.logista_product_code
WHERE
  sku.SKU_product_code is not null
  AND productfa.FA_code is null
  OR productfa.FA_code not LIKE 'PACK%';







CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_Stocks
AS

SELECT s.stock_date,
YEAR(s.stock_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS stock_year,
MONTHNAME(s.stock_date) /*** MSC-WARNING - MSCEWI1046 - 'DATENAME' FUNCTION MAPPED TO 'MONTHNAME', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS stock_month,
MONTH(s.stock_date) /*** MSC-WARNING - MSCEWI1046 - 'MONTH' FUNCTION MAPPED TO 'MONTH', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS stock_month_num,
s.store_code,
s.logista_product_code, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.stock_qty * sku.cgrt_pack
--HEETS
WHEN 'HNB' THEN s.stock_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN s.stock_qty
--CIGARS
WHEN 'CIG' THEN s.stock_qty
--MYO
WHEN 'MYO' THEN (s.stock_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.stock_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.stock_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.stock_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.stock_qty * sku.cgrt_pack

END AS stock_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.stock_qty
--HEETS
WHEN 'HNB' THEN s.stock_qty
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.stock_qty
--MYV
WHEN 'MYV' THEN s.stock_qty
--RYO
WHEN 'RYO' THEN s.stock_qty
--Pipe
WHEN 'TOP' THEN s.stock_qty
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.stock_qty
--P1
WHEN 'ACC' THEN s.stock_qty
--P1
WHEN 'SLU' THEN s.stock_qty
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.stock_qty

END AS stock_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.stock_qty * sku.gram_ml_per_pack
--MYV
WHEN 'MYV' THEN s.stock_qty * sku.gram_ml_per_pack
--RYO
WHEN 'RYO' THEN s.stock_qty * sku.gram_ml_per_pack
--Pipe
WHEN 'TOP' THEN s.stock_qty * sku.gram_ml_per_pack
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS stock_gr, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_alma_qty * sku.cgrt_pack
--HEETS
WHEN 'HNB' THEN s.tran_alma_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN s.tran_alma_qty
--CIGARS
WHEN 'CIG' THEN s.tran_alma_qty
--MYO
WHEN 'MYO' THEN (s.tran_alma_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.tran_alma_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.tran_alma_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.tran_alma_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_alma_qty * sku.cgrt_pack

END AS tran_alma_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_alma_qty
--HEETS
WHEN 'HNB' THEN s.tran_alma_qty
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_alma_qty
--MYV
WHEN 'MYV' THEN s.tran_alma_qty
--RYO
WHEN 'RYO' THEN s.tran_alma_qty
--Pipe
WHEN 'TOP' THEN s.tran_alma_qty
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.tran_alma_qty
--P1
WHEN 'ACC' THEN s.tran_alma_qty
--P1
WHEN 'SLU' THEN s.tran_alma_qty
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_alma_qty

END AS tran_alma_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_alma_qty * sku.gram_ml_per_pack
--MYV
WHEN 'MYV' THEN s.tran_alma_qty * sku.gram_ml_per_pack
--RYO
WHEN 'RYO' THEN s.tran_alma_qty * sku.gram_ml_per_pack
--Pipe
WHEN 'TOP' THEN s.tran_alma_qty * sku.gram_ml_per_pack
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS tran_alma_gr, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_soci_qty * sku.cgrt_pack
--HEETS
WHEN 'HNB' THEN s.tran_soci_qty * sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN s.tran_soci_qty
--CIGARS
WHEN 'CIG' THEN s.tran_soci_qty
--MYO
WHEN 'MYO' THEN (s.tran_soci_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.tran_soci_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.tran_soci_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.tran_soci_qty * sku.gram_ml_per_pack) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_soci_qty * sku.cgrt_pack

END AS tran_soci_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_soci_qty
--HEETS
WHEN 'HNB' THEN s.tran_soci_qty
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_soci_qty
--MYV
WHEN 'MYV' THEN s.tran_soci_qty
--RYO
WHEN 'RYO' THEN s.tran_soci_qty
--Pipe
WHEN 'TOP' THEN s.tran_soci_qty
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.tran_soci_qty
--P1
WHEN 'ACC' THEN s.tran_soci_qty
--P1
WHEN 'SLU' THEN s.tran_soci_qty
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_soci_qty

END AS tran_soci_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_soci_qty * sku.gram_ml_per_pack
--MYV
WHEN 'MYV' THEN s.tran_soci_qty * sku.gram_ml_per_pack
--RYO
WHEN 'RYO' THEN s.tran_soci_qty * sku.gram_ml_per_pack
--Pipe
WHEN 'TOP' THEN s.tran_soci_qty * sku.gram_ml_per_pack
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS tran_soci_gr

FROM INTEGRATION.sims_e2o_scipio_Stock s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
--FACode
left outer join STAGING.load_sims_product_ProductFA  fa on fa.logista_product_code = s.logista_product_code

WHERE stock_date >= '2011-01-01' --Desde que hay Frozen
AND fa.FA_code is null OR fa.FA_code not LIKE 'PACK%' -- No packs



UNION ALL



SELECT s.stock_date,
YEAR(s.stock_date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS stock_year,
MONTHNAME(s.stock_date) /*** MSC-WARNING - MSCEWI1046 - 'DATENAME' FUNCTION MAPPED TO 'MONTHNAME', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS stock_month,
MONTH(s.stock_date) /*** MSC-WARNING - MSCEWI1046 - 'MONTH' FUNCTION MAPPED TO 'MONTH', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS stock_month_num,
s.store_code,
k.logista_product_code, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.stock_qty * sku.cgrt_pack * k.equivalence
--HEETS
WHEN 'HNB' THEN s.stock_qty * sku.cgrt_pack * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN s.stock_qty * k.equivalence
--CIGARS
WHEN 'CIG' THEN s.stock_qty * k.equivalence
--MYO
WHEN 'MYO' THEN (s.stock_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.stock_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.stock_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.stock_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.stock_qty * sku.cgrt_pack * k.equivalence

END AS stock_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.stock_qty * k.equivalence
--HEETS
WHEN 'HNB' THEN s.stock_qty * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.stock_qty * k.equivalence
--MYV
WHEN 'MYV' THEN s.stock_qty * k.equivalence
--RYO
WHEN 'RYO' THEN s.stock_qty * k.equivalence
--Pipe
WHEN 'TOP' THEN s.stock_qty * k.equivalence
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.stock_qty * k.equivalence
--P1
WHEN 'ACC' THEN s.stock_qty * k.equivalence
--P1
WHEN 'SLU' THEN s.stock_qty * k.equivalence
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.stock_qty * k.equivalence

END AS stock_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.stock_qty * sku.gram_ml_per_pack * k.equivalence
--MYV
WHEN 'MYV' THEN s.stock_qty * sku.gram_ml_per_pack * k.equivalence
--RYO
WHEN 'RYO' THEN s.stock_qty * sku.gram_ml_per_pack * k.equivalence
--Pipe
WHEN 'TOP' THEN s.stock_qty * sku.gram_ml_per_pack * k.equivalence
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS stock_gr, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_alma_qty * sku.cgrt_pack * k.equivalence
--HEETS
WHEN 'HNB' THEN s.tran_alma_qty * sku.cgrt_pack * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN s.tran_alma_qty * k.equivalence
--CIGARS
WHEN 'CIG' THEN s.tran_alma_qty * k.equivalence
--MYO
WHEN 'MYO' THEN (s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_alma_qty * sku.cgrt_pack * k.equivalence

END AS tran_alma_cigs, CASE submarket.sub_market_code

--Conventional 
WHEN 'TOT' THEN s.tran_alma_qty * k.equivalence
--HEETS
WHEN 'HNB' THEN s.tran_alma_qty * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_alma_qty * k.equivalence
--MYV
WHEN 'MYV' THEN s.tran_alma_qty * k.equivalence
--RYO
WHEN 'RYO' THEN s.tran_alma_qty * k.equivalence
--Pipe
WHEN 'TOP' THEN s.tran_alma_qty * k.equivalence
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.tran_alma_qty * k.equivalence
--P1
WHEN 'ACC' THEN s.tran_alma_qty * k.equivalence
--P1
WHEN 'SLU' THEN s.tran_alma_qty * k.equivalence
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_alma_qty * k.equivalence

END AS tran_alma_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence
--MYV
WHEN 'MYV' THEN s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence
--RYO
WHEN 'RYO' THEN s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence
--Pipe
WHEN 'TOP' THEN s.tran_alma_qty * sku.gram_ml_per_pack * k.equivalence
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS tran_alma_gr, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_soci_qty * sku.cgrt_pack * k.equivalence
--HEETS
WHEN 'HNB' THEN s.tran_soci_qty * sku.cgrt_pack * k.equivalence /10
--Cigarillos 
WHEN 'TOC' THEN s.tran_soci_qty * k.equivalence
--CIGARS
WHEN 'CIG' THEN s.tran_soci_qty * k.equivalence
--MYO
WHEN 'MYO' THEN (s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_soci_qty * sku.cgrt_pack * k.equivalence

END AS tran_soci_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.tran_soci_qty * k.equivalence
--HEETS
WHEN 'HNB' THEN s.tran_soci_qty * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_soci_qty * k.equivalence
--MYV
WHEN 'MYV' THEN s.tran_soci_qty * k.equivalence
--RYO
WHEN 'RYO' THEN s.tran_soci_qty * k.equivalence
--Pipe
WHEN 'TOP' THEN s.tran_soci_qty * k.equivalence
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.tran_soci_qty * k.equivalence
--P1
WHEN 'ACC' THEN s.tran_soci_qty * k.equivalence
--P1
WHEN 'SLU' THEN s.tran_soci_qty * k.equivalence
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.tran_soci_qty * k.equivalence

END AS tran_soci_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence
--MYV
WHEN 'MYV' THEN s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence
--RYO
WHEN 'RYO' THEN s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence
--Pipe
WHEN 'TOP' THEN s.tran_soci_qty * sku.gram_ml_per_pack * k.equivalence
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS tran_soci_gr

FROM INTEGRATION.sims_e2o_scipio_Stock s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
--FACode
left outer join STAGING.load_sims_product_ProductFA  fa on fa.logista_product_code = s.logista_product_code
  --ProductPacks
left join STAGING.load_sims_product_ProductPacks  k on logista.logista_product_code = k.logista_product_code_pack

WHERE stock_date >= '2011-01-01' --Desde que hay Frozen 
AND fa.FA_code LIKE 'PACK%' -- Packs 
;
























CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_isms_Geo
AS
/*
left outer de la zona y territorio para que aparezcan las regiones sin hijos (ka)
*/

select
t.TerritoryId,
t.TerritoryCode,
t.TerritoryDescription,
t.PositionId Territory_PositionId,
t.EmployeeName AS Territory_EmployeeName,
z.ZoneId,
z.ZoneCode,
z.ZoneDescription,
z.PositionId Zone_PositionId,
z.EmployeeName AS Zone_EmployeeName,
r.RegionId,
r.RegionCode,
r.RegionDescription,
r.PositionId Position_PositionId,
r.EmployeeName AS Region_EmployeeName,
r.tree,
t.EmployeeMobileNo AS Territory_EmployeeMobileNo,
z.EmployeeMobileNo AS Zone_EmployeeMobileNo,
r.EmployeeMobileNo AS Region_EmployeeMobileNo,
t.EmployeeEmailAccount AS Territory_EmployeeEmail,
z.EmployeeEmailAccount AS Zone_EmployeeEmail,
r.EmployeeEmailAccount AS Region_EmployeeEmail

from
     (select r.RegionId,
r.RegionCode,
r.RegionDescription,
r.PositionId,
EmployeeName,
tree,
EmployeeMobileNo,
EmployeeEmailAccount
from INTEGRATION.isms_GeoTreeRegion r
left outer join INTEGRATION.isms_Position p on p.PositionId  = r.PositionId
left outer join INTEGRATION.isms_Employee e on p.Position_EmployeeId = e.EmployeeId
) r
left join (select z.ZoneId,
z.ZoneCode,
z.RegionId,
z.ZoneDescription,
z.PositionId,
EmployeeName,
tree,
EmployeeMobileNo,
EmployeeEmailAccount
from INTEGRATION.isms_GeoTreeZone z
left outer join INTEGRATION.isms_Position p on p.PositionId  = z.PositionId
left outer join INTEGRATION.isms_Employee e on p.Position_EmployeeId = e.EmployeeId
) z on z.RegionId = r.RegionId
left join (select t.TerritoryId,
t.TerritoryCode,
t.ZoneId,
t.TerritoryDescription,
t.PositionId,
EmployeeName,
tree,
EmployeeMobileNo,
EmployeeEmailAccount
from INTEGRATION.isms_GeoTreeTerritory t
left outer join INTEGRATION.isms_Position p on p.PositionId  = t.PositionId
left outer join INTEGRATION.isms_Employee e on p.Position_EmployeeId = e.EmployeeId
) t on t.ZoneId = z.ZoneId;


















CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_Horarios_POS_iSMS AS
SELECT
  RegionCode,
  Zonecode,
  TerritoryCode,
  CustomerCode,
  CustomerName,
  ZoneName,
  Tipo_Horario,
  CustomerHoursLastUpdatedOn,
  CASE
    WHEN CustomerOpenEveryDay = '1' THEN 'SI'
    ELSE 'NO'
  END AS OPENEVERYDAY,
  ClosingDays,
  MondayClosing,
  TuesdayClosing,
  WednesdayClosing,
  ThursdayClosing,
  FridayClosing,
  SundayClosing,
  HorarioManianaApertura,
  HorarioManianaCierre,
  HorarioTardeApertura,
  HorarioTardeCierre,
  OpenMonMor,
  ClosMonMor,
  OpenMonAft,
  ClosMonAft,
  OpenTueMor,
  ClosTueMor,
  OpenTueAft,
  ClosTueAft,
  ClosWedMor,
  OpenWedAft,
  ClosWedAft,
  OpenThuMor,
  ClosThuMor,
  OpenThuAft,
  ClosThuAft,
  OpenFriMor,
  ClosFriMor,
  OpenFriAft,
  ClosFriAft,
  OpenSatMor,
  ClosSatMor,
  OpenSatAft,
  ClosSatAft,
  OpenSunMor,
  OpenSunAft,
  ClosSunAft,
  Lunes_Mediodia_cierra,
  Martes_Mediodia_cierra,
  Miercoles_Mediodia_cierra,
  Jueves_Mediodia_cierra,
  Sabado_Mediodia_cierra,
  Domingo_Mediodia_cierra
FROM
  INFORMATION_MART.es_CustomerAll;
  
  

  
  
  

  
  
CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_MaestroProductos
AS

SELECT distinct Version
	  ,
Product_Detail
      ,
LEFT(FA_Code,8) /*** MSC-WARNING - MSCEWI1046 - 'left' FUNCTION MAPPED TO 'LEFT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as FA_Code

FROM DATA_PRODUCT.v_sims_Product
where Market = 'P1' AND Sub_Market = 'Kit'
AND FA_Code is not null AND FA_Code not LIKE 'PACK%'
order by 1,2;

CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_MaestroSWAP
AS
SELECT SPICE_ID,
Case_Number,
Date_Time_Opened,
Date_Time_Closed,
Case_Record_Type,
Type,
Sub_Type,
Resolution,
Device_Codentify,
Canal_del_caso,
Product_Family,
Product_Line,
Product_Generation,
Brand_Differentiator,
Subject_Code,
Id_de_pedido,
Propietario_del_caso,
Verbatim,
Comentarios,
Descripcion_del_material
FROM INFORMATION_MART.es_MaestroCasos
WHERE        (Type = 'Product Issues' OR Type = 'Device Issue') AND (Resolution = 'Replacement by courier' OR Resolution = 'Replacement face to face') AND (Sub_Type = 'Holder' OR Sub_Type = 'Charger');




CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_MaestroMonthlyOverview AS
SELECT
  DISTINCT A.Dispositivo,
  A.Usuario,
  A.Documento_Usuario,
  A.Email_Usuario,
  A."Móvil",
  A.Nombre_Staff,
  A.Email_Staff,
  A.Fecha_venta,
  A.Hora_venta,
  A.Dia_Venta,
  A.Anio_Venta,
  A.Mes_Venta,
  A.Semana_del_Anio_Venta,
  A.Fecha_entrega,
  A.Dia_entrega,
  A.Anio_entrega,
  A.Mes_entrega,
  A.Semana_del_anio_entrega,
  A.Customer_code,
  A.Punto_de_venta,
  A.Es_ECI,
  A.Provincia_de_venta,
  A.Region_de_venta,
  A."Código_Postal" AS "Codigo_Postal_Venta",
  A.Canal_de_venta,
  A.CA_Modificado,
  A.Lending_Cerrado,
  A.Duracion_Prestamo,
  A."Código_Producto",
  A.Descripcion,
  A.Precio_Original,
  A.Descuento,
  A.Precio_con_descuento_aplicado,
  A.LEADS,
  A."Código_Padrino_Venta",
  A."Código_Padrino_Origen",
  A."Código_MGM",
  A.Spice_Id,
  A.N_AHIJADOS_MGM,
  A.Cupon_Lead,
  A.Order_Number,
  A.Rol,
  A.Responsable,
  A.Territorio,
  A.Provincia,
  A."Código_de_Región",
  A."Código_de_Zona",
  A.Rol2,
  A.Segmento,
  A.Equipo,
  A.Business_Channel,
  A.Subchannel,
  A.N_Dispositivo_comprado,
  A.Turista,
  A."Código_promocional",
  A.Serie_prestamo,
  A."Fecha_devolución",
  A.Regalo,
  C.Documento_Usuario_Prestamo,
  C.Email_Usuario_Prestamo,
  C.Movil_Usuario_Prestamo,
  C.Email_grabador_Prestamo,
  C.Dispositivo_Prestamo,
  C.Estado_Prestamo,
  C.Inicio_Prestamo,
  C.Orden_inicio,
  C.Entrega_Prestamo,
  C.Orden_entrega,
  C.Inicio_Prestamo_real,
  C.Error_Prestamo,
  C.Tipo_Prestamo,
  D."Suscripción_de_marketing_global",
  D.Sexo,
  D.Codigo_Postal AS Codigo_Postal_Cliente,
  D.Fecha_de_nacimiento,
  E.OPT_IN_MGM,
  F.campaign,
  G.Longitud AS Longitud_Cliente,
  G.Latitud AS Latitud_Cliente,
  DATEDIFF(year, D.Fecha_de_nacimiento, GETDATE()) AS Current_Age,
  DATEDIFF(year, D.Fecha_de_nacimiento, A.Fecha_venta) AS Purchase_Age,
  CASE
    WHEN H.Spice_Id IS NOT NULL THEN 1
    ELSE 0
  END AS Flag_SWAP,
  CASE
    WHEN I.Spice_Id IS NOT NULL THEN 1
    ELSE 0
  END AS Flag_Inbound,
  CASE
    WHEN J.Consumer_ID IS NOT NULL THEN 1
    ELSE 0
  END AS Flag_Virtual_Coach_Started,
  CASE
    WHEN J.Consumer_ID IS NOT NULL
    AND J.STATUS_PROGRAM_VIRTUAL_COACH = 'COMPLETED' THEN 1
    ELSE 0
  END AS Flag_Virtual_Coach_Completed,
  CASE
    WHEN E.CODIGO_MGM IS NOT NULL
    AND E.FECHA_ACTIVA_MGM IS NOT NULL
    AND (
      E.FECHA_BAJA_MGM IS NULL
      OR E.FECHA_BAJA_MGM > A.Fecha_venta
    ) THEN 1
    ELSE 0
  END AS Flag_Estado_MGM,
  A.Descuento_PROMO,
  A.Descuento_MGM
FROM INFORMATION_MART.es_MaestroVentas AS A
  LEFT OUTER JOIN INFORMATION_MART.es_MaestroPrestamos AS C ON A.Serie_prestamo = C."Identificador_préstamo"
  LEFT OUTER JOIN INFORMATION_MART.es_MaestroClientes AS D ON A.Spice_Id = D.ID_BD_Consumidores
  LEFT OUTER JOIN STAGING.load_es_raw_UsuariosMGM  AS E ON A."Código_MGM" = E.Codigo_MGM
  LEFT OUTER JOIN INFORMATION_MART.es_MaestroLeads AS F ON A.Cupon_Lead = F.cupon_lead
  LEFT OUTER JOIN INFORMATION_MART.es_MaestroCodigosPostales AS G ON A."Código_Postal" = G.CP
  LEFT OUTER JOIN (
    SELECT
      DISTINCT Spice_Id
    from DATA_PRODUCT.v_es_MaestroSWAP
  ) AS H ON A.Spice_Id = H.Spice_Id
  LEFT OUTER JOIN (
    SELECT
      DISTINCT Spice_Id
    from INFORMATION_MART.es_MaestroCasos
  ) AS I ON A.Spice_Id = I.Spice_Id
  LEFT OUTER JOIN INFORMATION_MART.es_CompleteVirtualCoach AS J ON A.Spice_Id = J.Consumer_ID;








CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_SellOut_vPriceHistorical
AS
SELECT a.Date,
a.sku_product_code as SKU_Code,
a.price as Price_Historical,
CASE
  WHEN sku.sub_market_code in (SELECT distinct(sub_market_code) FROM STAGING.load_sims_product_PriceSegment ) THEN
(SELECT price_segm_name FROM STAGING.load_sims_product_PriceSegment  s WHERE  (a.price / sku.cgrt_pack) >= (s.price_from /20) AND (a.price / sku.cgrt_pack) < (s.price_to /20) AND s.sub_market_code = sku.sub_market_code)
END AS Price_Segment_Historical
FROM
--SELECT para agrupar los precios por mes habiendo filtrado el precio que tenia al inicio del mes (e.rn=1)
(SELECT
       CAST(DATEADD(month, DATEDIFF(month, '1900-01-01'::DATE, e.time_date) /*** MSC-WARNING - MSCEWI1046 - 'DATEDIFF' FUNCTION MAPPED TO 'DATEDIFF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, '1900-01-01'::date) /*** MSC-WARNING - MSCEWI1046 - 'DATEADD' FUNCTION MAPPED TO 'DATEADD', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ as DATE) /*** MSC-WARNING - MSCEWI1046 - 'CAST' FUNCTION MAPPED TO 'CAST', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS Date,
e.sku_product_code,
e.price
FROM (SELECT c.time_date,
p.sku_product_code,
p.price,
ROW_NUMBER ()
OVER (
PARTITION BY c.time_date, p.sku_product_code, p.price
ORDER BY c.time_date ASC) /*** MSC-WARNING - MSCEWI1046 - 'Row_number' FUNCTION MAPPED TO 'ROW_NUMBER', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ AS rn
FROM STAGING.load_sims_core_Calendar  c
inner join STAGING.load_sims_product_PriceHistorical  p on c.time_date between p.date_from and p.date_to
) e
WHERE e.rn = 1 AND e.time_date <= CURRENT_TIMESTAMP() :: TIMESTAMP GROUP BY DATEADD(month, DATEDIFF(month, '1900-01-01'::date , e.time_date) /*** MSC-WARNING - MSCEWI1046 - 'DATEDIFF' FUNCTION MAPPED TO 'DATEDIFF', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, '1900-01-01'::date ) /*** MSC-WARNING - MSCEWI1046 - 'DATEADD' FUNCTION MAPPED TO 'DATEADD', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/, e.sku_product_code, e.price) a
left outer join STAGING.load_sims_product_ProductSKU  sku on a.sku_product_code = sku.sku_product_code
inner join STAGING.load_sims_product_SubMarket  m on m.sub_market_code = sku.sub_market_code
WHERE m.market_code in ('P1','P4');


















CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_SellOut_vproduct
AS

SELECT *
FROM data_product.v_sims_Product
WHERE Market_Code in ('P1','P4');

CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_DCECheckDuplicates
AS

--BOUNCES--
SELECT 'BOUNCES' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT ClientID
,
JobId
,
EmailAddress
,
ListID
,
SMTPCode
,
BatchID
,
SubscriberID
,
organic_flag
,
Country
,
EventType
,
BounceCategory
,
BounceReason
,
TriggeredSendExternalKey
,
EventDate
,
SubscriberKey
FROM INFORMATION_MART.es_DCE_Bounces GROUP BY ClientID
, JobId
, EmailAddress
, ListID
, SMTPCode
, BatchID
, SubscriberID
, organic_flag
, Country
, EventType
, BounceCategory
, BounceReason
, TriggeredSendExternalKey
, EventDate
, SubscriberKey
having COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'count' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x
--

UNION

--CLICKS--
SELECT 'CLICKS' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT ClientID
,
JobId
,
EmailAddress
,
SubscriberID
,
ListID
,
SendURLID
,
URLID
,
BatchID
,
IsUnique
,
IsUniqueForURL
,
organic_flag
,
Country
,
EventType
,
URL
,
Alias
,
TriggeredSendExternalKey
,
Browser
,
EmailClient
,
OperatingSystem
,
Device
,
EventDate
,
SubscriberKey
FROM INFORMATION_MART.es_DCE_Clicks GROUP BY ClientID
, JobId
, EmailAddress
, SubscriberID
, ListID
, SendURLID
, URLID
, BatchID
, IsUnique
, IsUniqueForURL
, organic_flag
, Country
, EventType
, URL
, Alias
, TriggeredSendExternalKey
, Browser
, EmailClient
, OperatingSystem
, Device
, EventDate
, SubscriberKey
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x
--

UNION

--CURRENT SEGMENTS--
SELECT 'CURRENT SEGMENTS' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT CreatedBy
,
CreatedDate
,
Derived_Attribute_Category
,
Derived_Attribute_Code
,
Derived_Attribute_Data_Type
,
Derived_Attribute_Value
,
Derived_Attributes_Identifier
,
Country
,
Identity_Identifier
,
LastModifiedBy
,
LastModifiedDate
,
Organic_Flag
,
Persona_Identifier
FROM INFORMATION_MART.es_DCE_Current_Segments GROUP BY CreatedBy
, CreatedDate
, Derived_Attribute_Category
, Derived_Attribute_Code
, Derived_Attribute_Data_Type
, Derived_Attribute_Value
, Derived_Attributes_Identifier
, Country
, Identity_Identifier
, LastModifiedBy
, LastModifiedDate
, Organic_Flag
, Persona_Identifier
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x
--

UNION

--HISTORICAL SEGMENTS--
SELECT 'HISTORICAL SEGMENTS' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT CreatedBy
,
CreatedDate
,
Derived_Attribute_Category
,
Derived_Attribute_Code
,
Derived_Attribute_Data_Type
,
Derived_Attribute_Value
,
Derived_Attributes_Identifier
,
Country
,
Identity_Identifier
,
LastModifiedBy
,
LastModifiedDate
,
Organic_Flag
,
Persona_Identifier
FROM INFORMATION_MART.es_DCE_Historical_Segments GROUP BY CreatedBy
, CreatedDate
, Derived_Attribute_Category
, Derived_Attribute_Code
, Derived_Attribute_Data_Type
, Derived_Attribute_Value
, Derived_Attributes_Identifier
, Country
, Identity_Identifier
, LastModifiedBy
, LastModifiedDate
, Organic_Flag
, Persona_Identifier
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ > 1
) x
--

UNION

--JOURNEY--
SELECT 'JOURNEY' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT LastPublishedDate
,
MID
,
Country
,
organic_flag
,
VersionID
,
JourneyID
,
JourneyName
,
VersionNumber
,
CreatedDate
,
ModifiedDate
,
JourneyStatus
FROM INFORMATION_MART.es_DCE_Journey GROUP BY LastPublishedDate
, MID
, Country
, organic_flag
, VersionID
, JourneyID
, JourneyName
, VersionNumber
, CreatedDate
, ModifiedDate
, JourneyStatus
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x
--

UNION

--JOURNEY ACTIVITY--
SELECT 'JOURNEY ACTIVITY' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT ActivityName
,
JourneyActivityObjectID
,
ActivityType
,
MID
,
Country
,
organic_flag
,
ActivityID
,
VersionID
,
ActivityExternalKey
FROM INFORMATION_MART.es_DCE_JourneyActivity GROUP BY ActivityName
, JourneyActivityObjectID
, ActivityType
, MID
, Country
, organic_flag
, ActivityID
, VersionID
, ActivityExternalKey
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x
--

UNION

--NOT SENT--
SELECT 'NOT SENT' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
  select ClientID
,
JobId
,
EmailAddress
,
SubscriberID
,
ListID
,
BatchID
,
organic_flag
,
Country
,
EventType
,
TriggeredSendExternalKey
,
Reason
,
EventDate
,
SubscriberKey
from INFORMATION_MART.es_DCE_NotSent GROUP BY ClientID
, JobId
, EmailAddress
, SubscriberID
, ListID
, BatchID
, organic_flag
, Country
, EventType
, TriggeredSendExternalKey
, Reason
, EventDate
, SubscriberKey
having COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'count' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ > 1
) x
--

UNION

--OPENS--
SELECT 'OPENS' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT ClientID
,
JobId
,
EmailAddress
,
SubscriberID
,
ListID
,
BatchID
,
IsUnique
,
organic_flag
,
Country
,
EventType
,
TriggeredSendExternalKey
,
Browser
,
EmailClient
,
OperatingSystem
,
Device
,
EventDate
,
SubscriberKey
FROM INFORMATION_MART.es_DCE_Opens GROUP BY ClientID
, JobId
, EmailAddress
, SubscriberID
, ListID
, BatchID
, IsUnique
, organic_flag
, Country
, EventType
, TriggeredSendExternalKey
, Browser
, EmailClient
, OperatingSystem
, Device
, EventDate
, SubscriberKey
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x
--

UNION

--SENT--
SELECT 'SENT' "table",
COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ _Repeats
FROM (
SELECT ClientID
,
EmailAddress
,
SubscriberID
,
ListID
,
CampaignID
,
Country
,
organic_flag
,
EventType
,
TriggeredSendExternalKey
,
EventDate
,
SubscriberKey
,
BatchID
,
JobId
,
TriggererSendDefinitionObjectID
FROM INFORMATION_MART.es_DCE_Sent GROUP BY ClientID
, EmailAddress
, SubscriberID
, ListID
, CampaignID
, Country
, organic_flag
, EventType
, TriggeredSendExternalKey
, EventDate
, SubscriberKey
, BatchID
, JobId
, TriggererSendDefinitionObjectID
HAVING COUNT(*) /*** MSC-WARNING - MSCEWI1046 - 'COUNT' FUNCTION MAPPED TO 'COUNT', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >1
) x;
CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_Calendar
AS
SELECT time_date AS Date,
time_day AS Day,
time_week AS Week,
time_month AS Month_Num, 
(CONCAT('Q', DATE_PART(QUARTER, time_date))) AS Quarter,
time_year AS Year,
time_month_desc AS Month,
time_day_desc AS Week_Day,
bank_holiday AS Bank_Holiday

FROM STAGING.load_sims_core_Calendar ;







CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_County
AS

SELECT county_code as County_Code,
county_postal_code as Postal_Code,
county_name as County,
region_code as Region_Code,
region_name as Region,
CCAA_name as CCAA,
county_group as County_Group,
ceumel_ind as Ceuta_Melilla_Ind
FROM STAGING.load_sims_core_County ;




CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_IMS_Sales_PBI
AS
select VTA.Sales_Date SalesDate
,
RTRIM(PRV.County) Province
,
PRV.Region
,
PRV.County_Code CountyCode
,
PRD.Market SuperMarketName
,
PRD.Sub_Market MarketName
,
PRD.Brand_Family ProductGroupName
,
VTA.SKU_Code ProductCode
,
PRD.SKU ProductName
,
VTA.Sales_Qty
,
VTA.Cigs_Eqv Sales_Cigs
from DATA_PRODUCT.v_sims_SalesDayCountyUser VTA
left outer join DATA_PRODUCT.v_sims_Product PRD on VTA.Logista_Code = PRD.Logista_Code
left outer join DATA_PRODUCT.v_sims_County PRV on VTA.County_Code = PRV.County_Code
where VTA.Sales_Date >= '2018-01-01' AND PRD.Market_Code = 'CIGS';







CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_GIT
AS

SELECT s.store_code,
s.logista_product_code,
s.GIT_date, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.GIT_qty
--HEETS
WHEN 'HNB' THEN s.GIT_qty
--Cigarillos
WHEN 'TOC' THEN s.GIT_qty
--CIGARS
WHEN 'CIG' THEN s.GIT_qty
--MYO
WHEN 'MYO' THEN s.GIT_qty / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN s.GIT_qty / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN s.GIT_qty / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN s.GIT_qty / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN s.GIT_qty / submarket.cigs_equiv
--Snuff
WHEN 'SUN' THEN s.GIT_qty / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.GIT_qty * sku.cgrt_pack

END AS GIT_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.GIT_qty / sku.cgrt_pack
--HEETS
WHEN 'HNB' THEN s.GIT_qty / sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.GIT_qty / sku.gram_ml_per_pack
--MYV
WHEN 'MYV' THEN s.GIT_qty / sku.gram_ml_per_pack
--RYO
WHEN 'RYO' THEN s.GIT_qty / sku.gram_ml_per_pack
--Pipe
WHEN 'TOP' THEN 0
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.GIT_qty
--P1
WHEN 'ACC' THEN s.GIT_qty
--P1
WHEN 'SLU' THEN s.GIT_qty
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS GIT_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.GIT_qty
--MYV
WHEN 'MYV' THEN s.GIT_qty
--RYO
WHEN 'RYO' THEN s.GIT_qty
--Pipe
WHEN 'TOP' THEN s.GIT_qty
--Chewing
WHEN 'CHE' THEN s.GIT_qty
--Snuff
WHEN 'SUN' THEN s.GIT_qty
--P1
WHEN 'Kit' THEN 0
--P1
WHEN 'Accessory' THEN 0
--P1
WHEN 'Single Line Up' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS GIT_gr

FROM INTEGRATION.sims_e2o_scipio_GIT s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
--FACode
left outer join STAGING.load_sims_product_ProductFA  fa on fa.logista_product_code = s.logista_product_code

WHERE fa.FA_code is null OR fa.FA_code not LIKE 'PACK%'


UNION ALL


SELECT s.store_code,
k.logista_product_code,
s.GIT_date, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN s.GIT_qty * k.equivalence
--HEETS
WHEN 'HNB' THEN s.GIT_qty * k.equivalence /10
--Cigarillos
WHEN 'TOC' THEN s.GIT_qty * k.equivalence
--CIGARS
WHEN 'CIG' THEN s.GIT_qty * k.equivalence
--MYO
WHEN 'MYO' THEN (s.GIT_qty * k.equivalence) / submarket.cigs_equiv
--MYV
WHEN 'MYV' THEN (s.GIT_qty * k.equivalence) / submarket.cigs_equiv
--RYO
WHEN 'RYO' THEN (s.GIT_qty * k.equivalence) / submarket.cigs_equiv
--Pipe
WHEN 'TOP' THEN (s.GIT_qty * k.equivalence) / submarket.cigs_equiv
--Chewing
WHEN 'CHE' THEN (s.GIT_qty * k.equivalence) / submarket.cigs_equiv
--Snuff
WHEN 'SUN' THEN (s.GIT_qty * k.equivalence) / submarket.cigs_equiv
--P1
WHEN 'KIT' THEN 0
--P1
WHEN 'ACC' THEN 0
--P1
WHEN 'SLU' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN s.GIT_qty * sku.cgrt_pack * k.equivalence

END AS GIT_cigs, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN (s.GIT_qty * k.equivalence) / sku.cgrt_pack
--HEETS
WHEN 'HNB' THEN (s.GIT_qty * k.equivalence /10) / sku.cgrt_pack
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN (s.GIT_qty * k.equivalence) / sku.gram_ml_per_pack
--MYV
WHEN 'MYV' THEN (s.GIT_qty * k.equivalence) / sku.gram_ml_per_pack
--RYO
WHEN 'RYO' THEN (s.GIT_qty * k.equivalence) / sku.gram_ml_per_pack
--Pipe
WHEN 'TOP' THEN 0
--Chewing
WHEN 'CHE' THEN 0
--Snuff
WHEN 'SUN' THEN 0
--P1
WHEN 'KIT' THEN s.GIT_qty * k.equivalence
--P1
WHEN 'ACC' THEN s.GIT_qty * k.equivalence
--P1
WHEN 'SLU' THEN s.GIT_qty * k.equivalence
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS GIT_pack, CASE submarket.sub_market_code

--Conventional
WHEN 'TOT' THEN 0
--HEETS
WHEN 'HNB' THEN 0
--Cigarillos
WHEN 'TOC' THEN 0
--CIGARS
WHEN 'CIG' THEN 0
--MYO
WHEN 'MYO' THEN s.GIT_qty * k.equivalence
--MYV
WHEN 'MYV' THEN s.GIT_qty * k.equivalence
--RYO
WHEN 'RYO' THEN s.GIT_qty * k.equivalence
--Pipe
WHEN 'TOP' THEN s.GIT_qty * k.equivalence
--Chewing
WHEN 'CHE' THEN s.GIT_qty * k.equivalence
--Snuff
WHEN 'SUN' THEN s.GIT_qty * k.equivalence
--P1
WHEN 'Kit' THEN 0
--P1
WHEN 'Accessory' THEN 0
--P1
WHEN 'Single Line Up' THEN 0
--P2
WHEN 'RP2' THEN 0
--P3
WHEN 'RP3' THEN 0
--P4
WHEN 'RP4' THEN 0

END AS GIT_gr

FROM INTEGRATION.sims_e2o_scipio_GIT s

--LogistaProduct 
left outer join STAGING.load_sims_product_LogistaProduct  logista on logista.logista_product_code = s.logista_product_code
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code
--FACode
left outer join STAGING.load_sims_product_ProductFA  fa on fa.logista_product_code = s.logista_product_code
--ProductPacks
left join STAGING.load_sims_product_ProductPacks  k on logista.logista_product_code = k.logista_product_code_pack

WHERE fa.FA_code LIKE 'PACK%' ;


















CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_Customer AS
SELECT
  logc.tobacconist_code as "Código_Expendeduría_Logista",
  isms.tobacconistcode as "Código_Expendeduría",
  (
    SELECT
      descripcion
    from
      STAGING.load_sims_core_CustomerStatus 
    WHERE
      status = logc.status
  ) AS Estado_Logista,
  logc.tobacconist_name as Nombre_Comercial_Logista,
  isms.CustomerName as Nombre_Comercial,
  logc.address as "Dirección_Logista",
  isms.CustomerAddress as "Dirección",
  isms.StreetType as "Tipo_Vía",
  isms.StreetName as "Nombre_Vía",
  isms.StreetNum as "N_Vía",
  logc.city_name as "Población_Logista",
  isms.City as "Población",
  logc.county_code as "Código_Provincia_Logista",
  isms.ProvinceCode as "Código_Provincia",
  logc.zip_code as "Código_Postal_Logista",
  isms.ZipCode as "Código_Postal",
  logc.telephone as "Teléfono_Logista",
  isms.PhoneN as "Teléfono",
  logc.saca as Letra_de_Saca_Logista,
  LogistaLetter Letra_de_Saca,
  logc.order_freq as Frecuencia_de_Pedido_Logista,
  isms.CustomerCode as "Código_Cliente",
  isms.CUstomerStatus as Estado_Cliente,
  --CustomerTypeCode as "Código_Tipo_de_Cliente", 
  isms.CustomerTypeDescription as Tipo_de_Cliente,
  logc.license_code as "Código_Licenciatario_Logista",
  isms.LicenseeCode as "Código_Licenciatario",
  --UreSegment as Segmento_de_URE, 
  isms.TerritoryCode as "Código_de_Territorio",
  isms.TerritoryName as Territorio,
  isms.Zonecode as "Código_de_Zona",
  isms.ZoneName as Zona,
  isms.RegionCode as "Código_de_Región",
  isms.RegionName as "Región",
  isms.SalesRep_Name as Vendedor,
  isms.SalesSup_Name as Supervisor,
  isms.SalesJR_Name as Jefe_Regional,
  isms.ClosingDays as "Días_de_Cierre",
  isms.CustomerLastVisitDate as Fecha_Ultima_Visita,
  isms.CreationDate as "Fecha_de_Creación",
  isms.InactivationDate as "Fecha_de_Inactivación",
  isms.ReactivationDate as "Fecha_de_Reactivación",
  isms.HadSalesLastMonth as Tiene_Venta_Ultimo_Mes,
  isms.ProvinceDescription as Provincia,
  isms.VolumeClusterCode as "Código_Categoría_Volúmen",
  isms.VolumeClusterDescription as "Categoría_Volúmen_Cigarrillos",
  isms.VolumeClusterCodeOTP as "Código_Categoría_Volúmen_OTP",
  ifnull(Categoria_Volumen_Nacional, '-') + ' (' + RTRIM(VolumeClusterCode) + ', ' + RTRIM(VolumeClusterCodeOTP) + ')' as VOL,
  --VolumeClusterDescriptionOTP as "Categoría_Volúmen_OTP", 
  isms.Categoria_Volumen_Nacional as "Categoría_Volúmen",
  isms.SegmentationCode as "Código_Segmento",
  isms.SegmentationDescription as Segmento,
  isms.Ticketsperday as "Tickets_por_Día",
  isms.Border as Frontera,
  isms.Coast as Costa,
  isms.IndCeutaMelilla as Indicador_CeutaMelilla,
  county.CCAA_Code as "Código_Comunidad_Autónoma",
  county.CCAA_Name as "Comunidad_Autónoma",
  county.county_group as Grupo_Provincial,
  --NumCust, 
  isms.PrioridadMarca1 as Prioridad_Marca_1,
  isms.PrioridadMarca2 as Prioridad_Marca_2,
  --EsNoche, 
  --EdicionLimitada, 
  isms.Esta_Blindado as Esta_Blindado,
  almacen_fiscal as "Almacén_Fiscal",
  --EsCarcel, 
  isms.CustomerLongitude as Longitud,
  isms.CustomerLatitude as Latitud,
  isms.PantallaDigitalInstaladas as Pantalla_Digital_Instalada,
  isms.RecogeMonedasInstalados as Recoge_Monedas_Instalado,
  case
    when PantallaDigitalInstaladas = 1
    or RecogeMonedasInstalados = 1 then 'S'
    else 'N'
  end as Pantalla_Digital_o_Recoge_Monedas_Instalado,
  case
    when CustomerName like '%Corte Ingles%' then 'S'
    else 'N'
  end as Es_ECI,
  CASE
    WHEN iart.TobacconistCode IS NOT NULL THEN 'S'
    WHEN iart.TobacconistCode IS NULL THEN 'N'
  END as Es_Artobacco,
  art.SalerName as Vendedor_Artobacco,
  art.SupervisorName as Supervisor_Artobacco,
  isms.customerLocationURL as Customer_Location_URL,
  isms.Isla,
  logc.registrant_name as Titular_POS_Logista,
  --titular,
  isms.OperadorUnicoCallCenter as Operador_Unico_Call_Center,
  isms.OperadorUnicoCallCenterCode as Operador_Unico_Call_Center_Code,
 CASE
    WHEN CoberturaDigital = 1 THEN 'S'
    WHEN CoberturaDigital = 0 THEN 'N'
  END as   Cobertura_Digital,
  CASE
    WHEN EstanteriaTPD = 1 THEN 'S'
    WHEN EstanteriaTPD = 0 THEN 'N'
  END as "Estantería_TDP",
  --PMI_FC_ConversionRate as PMI_FC_Conversion_Rate,
  isms.Expendedor_Fumador as Expendedor_Fumador,
  isms.Expendedor_Convertido as Expendedor_Convertido,
  isms.Dependiente_Fumador as Dependiente_Fumador,
  isms.Dependiente_Convertido as Dependiente_Convertido,
  isms.POSTuristicoSummer as POS_Turistico_Summer,
  isms.SalesRep_EmployeeMobileNo as "Móvil_Vendedor",
  isms.SalesSup_EmployeeMobileNo as "Móvil_Supervisor",
  isms.SalesJR_EmployeeMobileNo as "Móvil_Jefe_Regional",
  isms.SalesRep_EmployeeEmail as Mail_Vendedor,
  isms.SalesSup_EmployeeEmail as Mail_Supervisor,
  isms.SalesJR_EmployeeEmail as Mail_Jefe_Regional,
  isms.TradeCategoryDescription as Tipo_de_Establecimiento,
  art.Art_FC as Es_Artobacco_FineCut,
  art.Art_FC_2021 as Es_Artobacco_2021_FineCut,
  art.Art_CC as Call_Center_Artobacco,
  art.Art_EXP_CC as "Expansión_Call_Center_Artobacco",
  conv.Convetional_Cigs,
  isms.PickUpPoint as Pick_Up_Point,
  isms.TerritoryRanks as Ranking_Territorio,
  case
    isms.SegmentationCode
    when 'CL' then 'S'
    else 'N'
  end as Piloto_Call_Center
  /*Selecionamos del maestro Logista de estancos el tobacconist que tiene el Código
   licenciatario mayor (el más reciente)*/
FROM
  (
    SELECT
      *
    FROM
      (
        SELECT
          c.*,
          Row_number ()  OVER (
            PARTITION BY tobacconist_code
            ORDER BY
              CAST(license_code AS int) DESC) as rn
      
    FROM STAGING.load_sims_core_Customer  c
  ) e WHERE e.rn = 1) logc
  --left join STAGING.load_sims_core_Customer  logc on logc.license_code = isms.LicenseeCode
  left outer join STAGING.load_sims_core_CustomerAll  isms on logc.tobacconist_code = isms.TobacconistCode
  left outer join STAGING.load_sims_core_County  County on isms.provincecode = County.county_code
  left outer join STAGING.load_sims_core_OrgArtobacco  art ON art.TobacconistCode = isms.TobacconistCode
  left outer join STAGING.load_sims_core_OrgArtobacco_db  iart on iart.TobacconistCode = isms.TobacconistCode
  left outer join STAGING.load_sims_core_POS_Conventional  conv on conv.TobacconistCode = isms.TobacconistCode --WHERE isms.CustomerTypeCode = '1C'
UNION
ALL
SELECT
  CustomerOtherPOS.tobacconist_code as "Código_Expendeduría_Logista",
  CustomerOtherPOS.tobacconist_code as "Código_Expendeduría",
  NULL,
  CustomerOtherPOS.tobacconist_name as Nombre_Comercial_Llogista,
  CustomerOtherPOS.tobacconist_name as Nombre_Comercial,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  --NULL, 
  NULL,
  CustomerOtherPOS.license_code as "Código_Licenciatario_Logista",
  NULL,
  --NULL, 
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  --NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  --NULL,
  NULL,
  NULL,
  --NULL,
  --NULL,
  NULL,
  NULL,
  --NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  --NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  --NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL
from
  STAGING.load_sims_core_CustomerOtherPOS  CustomerOtherPOS;
  
CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_LogistaStores
AS

SELECT a.store_code as Store_Code,
a.store_name as Store_Name,
b.store_group_name as Store_Group
FROM INTEGRATION.sims_e2o_scipio_LogistaStore a
left outer join INTEGRATION.sims_e2o_scipio_LogistaStoreGroup b
on a.store_group_code = b.store_group_code;





CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_es_customer_sales_pbi AS
SELECT
  VTA.Sales_Date AS Salesdate,
  VTA.SKU_Code AS ProductCode,
  PRD.SKU AS ProductName,
  PRD.Brand_Family AS ProductGroupName,
  PRD.Sub_Market AS MarketName,
  PRD.Market AS SuperMarketName,
  VTA.Tobacconist_Code AS TobacconistCode,
  CST."Código_Cliente" AS CustomerCode,
  CST.Nombre_Comercial AS CustomerName,
  CST."Código_Postal" AS ZipCode,
  CST."Código_Provincia" AS ProvinceCode,
  PRV.County AS Province,
  CST.Estado_Cliente AS CustomerStatus,
  CST."Fecha_de_Creación" AS CreationDate,
  CST."Fecha_de_Inactivación" AS InactivationDate,
  CST."Fecha_de_Reactivación" AS ReactivationDate,
  CST."Región" AS RegionName,
  CST.Zona AS ZoneName,
  CST."Código_de_Territorio" AS TerritoryCode,
  CST.Latitud,
  VTA.Cigs_Eqv AS Sales_Cigs,
  CST."Código_de_Zona" AS ZoneCode,
  CST."Código_de_Región" AS RegionCode,
  CST."Población" as Poblacion
FROM DATA_PRODUCT.v_sims_SalesDayCustomer AS VTA
  LEFT OUTER JOIN DATA_PRODUCT.v_sims_Product AS PRD ON VTA.Logista_Code = PRD.Logista_Code
  LEFT OUTER JOIN DATA_PRODUCT.v_sims_Customer AS CST ON VTA.Tobacconist_Code = CST."Código_Expendeduría"
  LEFT OUTER JOIN DATA_PRODUCT.v_sims_County AS PRV ON CST."Código_Provincia" = PRV.County_Code
WHERE
  (VTA.Sales_Date >= '2018-01-01')
  AND (PRD.Market_Code = 'CIGS');



CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_Obj
AS
SELECT s.SKU_product_code,
s.sales_date,
s.sales_qty as Sales_Qty,
s.version as Version, CASE submarket.sub_market_code
--Conventional (Viene en Mio Cigs)
WHEN 'TOT' THEN s.sales_qty *1000000
--HEETS (Viene en TH)
WHEN 'HNB' THEN s.sales_qty *1000
--Cigarillos
WHEN 'TOC' THEN s.sales_qty
--CIGARS
WHEN 'CIG' THEN s.sales_qty
--MYO (Viene en GR)
WHEN 'MYO'  THEN s.sales_qty / submarket.cigs_equiv
--MYV (Viene en GR)
WHEN 'MYV'  THEN s.sales_qty / submarket.cigs_equiv
--RYO (Viene en GR)
WHEN 'RYO'  THEN s.sales_qty / submarket.cigs_equiv
--Pipe 
WHEN 'TOP'  THEN s.sales_qty / submarket.cigs_equiv
--Chewing 
WHEN 'CHE'   THEN s.sales_qty / submarket.cigs_equiv
--Snuff 
WHEN 'SUN'   THEN s.sales_qty / submarket.cigs_equiv
--P1
WHEN 'RP1'    THEN s.sales_qty
--P2
WHEN 'RP2'    THEN 0
--P3
WHEN 'RP3'    THEN 0
--P4
WHEN 'RP4'    THEN s.sales_qty
--NA
WHEN 'NA'     THEN s.sales_qty
END AS Cigs_Eqv, CASE submarket.sub_market_code
--Conventional (Viene en Mio Cigs)
WHEN 'TOT' THEN null
--HEETS (Viene en TH)
WHEN 'HNB' THEN null
--Cigarillos
WHEN 'TOC' THEN null
--CIGARS
WHEN 'CIG' THEN null
--MYO (Viene en GR)
WHEN 'MYO'  THEN s.sales_qty
--MYV (Viene en GR)
WHEN 'MYV'  THEN s.sales_qty
--RYO (Viene en GR)
WHEN 'RYO'  THEN s.sales_qty
--Pipe 
WHEN 'TOP'  THEN s.sales_qty
--Chewing 
WHEN 'CHE'   THEN s.sales_qty
--Snuff 
WHEN 'SUN'   THEN s.sales_qty
--P1
WHEN 'RP1'    THEN null
--P2
WHEN 'RP2'    THEN null
--P3
WHEN 'RP3'    THEN null
--P4
WHEN 'RP4'    THEN null
--NA
WHEN 'NA'     THEN null
END AS Gr_OB, CASE submarket.sub_market_code
--Conventional (Viene en Mio Cigs)
WHEN 'TOT' THEN null
--HEETS (Viene en TH)
WHEN 'HNB' THEN null
--Cigarillos
WHEN 'TOC' THEN null
--CIGARS
WHEN 'CIG' THEN null
--MYO (Viene en GR)
WHEN 'MYO'  THEN null
--MYV (Viene en GR)
WHEN 'MYV'  THEN null
--RYO (Viene en GR)
WHEN 'RYO'  THEN null
--Pipe 
WHEN 'TOP'  THEN null
--Chewing 
WHEN 'CHE'   THEN null
--Snuff 
WHEN 'SUN'   THEN null
--P1
WHEN 'RP1'    THEN s.sales_qty
--P2
WHEN 'RP2'    THEN s.sales_qty
--P3
WHEN 'RP3'    THEN s.sales_qty
--P4
WHEN 'RP4'    THEN s.sales_qty
--NA
WHEN 'NA'     THEN null
END AS Packs_OB

FROM STAGING.load_sims_core_Obj  s
--ProductSKU
left outer join STAGING.load_sims_product_ProductSKU  sku on s.SKU_product_code = sku.SKU_product_code
--SubMarket
left outer join STAGING.load_sims_product_SubMarket  submarket on submarket.sub_market_code = sku.sub_market_code;
-- ** MSC-WARNING - MSCEWI1040 - THE STATEMENT IS NOT SUPPORTED IN SNOWFLAKE **
----WHERE s.version = 'OB'

----UNION ALL

---- SELECT 
----		m.[SKU_product_code],
----        m.[sales_date],
----        m.[sales_qty] as [Sales_Qty],
----		[Cigs_Eqv] = cast(CASE submarket2.sub_market_code
----			--Conventional (Viene en Mio Cigs)
----			WHEN 'TOT' THEN m.[sales_qty]*1000000
----			--HEETS (Viene en TH)
----			WHEN 'HNB' THEN m.[sales_qty]*1000
----			--Cigarillos
----			WHEN 'TOC' THEN m.[sales_qty]
----			--CIGARS
----			WHEN 'CIG' THEN m.[sales_qty]
----			--MYO (Viene en GR)
----			WHEN 'MYO'  THEN m.[sales_qty] / submarket2.cigs_equiv
----			--MYV (Viene en GR)
----			WHEN 'MYV'  THEN m.[sales_qty] / submarket2.cigs_equiv
----			--RYO (Viene en GR)
----			WHEN 'RYO'  THEN m.[sales_qty] / submarket2.cigs_equiv
----			--Pipe 
----			WHEN 'TOP'  THEN m.[sales_qty] / submarket2.cigs_equiv
----			--Chewing 
----			WHEN 'CHE'   THEN m.[sales_qty] / submarket2.cigs_equiv
----			--Snuff 
----			WHEN 'SUN'   THEN m.[sales_qty] / submarket2.cigs_equiv
----			--P1
----			WHEN 'RP1'    THEN m.[sales_qty]
----			--P2
----			WHEN 'RP2'    THEN 0 
----			--P3
----			WHEN 'RP3'    THEN 0 
----			--P4
----			WHEN 'RP4'    THEN m.sales_qty
----			--NA
----			WHEN 'NA'     THEN m.sales_qty 		 
----		END as numeric (18,2))

----FROM STAGING.load_sims_core_ObjMarket  m
----  --ProductSKU
----  left outer join STAGING.load_sims_product_ProductSKU  sku2 on m.SKU_product_code = sku2.SKU_product_code
----  --SubMarket
----  left outer join STAGING.load_sims_product_SubMarket  submarket2 on submarket2.sub_market_code = sku2.sub_market_code


















CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_PANEL
AS

SELECT a.region_de_comisionado as Region_Comisionado,
a.mercado as Mercado, 'Canal I' AS Panel,
a.codigo_SAP_de_producto as Logista_Code,
a.fecha_de_factura as Sales_Date, CASE a.codigo_SAP_de_producto

WHEN 999999 THEN a.cantidad_LLOUMB_CIG - NVL((SELECT SUM(b.cantidad_LLOUMB_CIG) /*** MSC-WARNING - MSCEWI1046 - 'SUM' FUNCTION MAPPED TO 'SUM', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
FROM STAGING.load_sims_load_CSV_PANEL2  b WHERE b.codigo_SAP_de_producto = 888010 AND a.fecha_de_factura = b.fecha_de_factura AND a.region_de_comisionado = b.region_de_comisionado), 0) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/

ELSE a.cantidad_LLOUMB_CIG - NVL((SELECT SUM(b.cantidad_LLOUMB_CIG) /*** MSC-WARNING - MSCEWI1046 - 'SUM' FUNCTION MAPPED TO 'SUM', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/
FROM STAGING.load_sims_load_CSV_PANEL2  b WHERE a.codigo_SAP_de_producto = b.codigo_SAP_de_producto AND a.fecha_de_factura = b.fecha_de_factura AND a.region_de_comisionado = b.region_de_comisionado), 0) /*** MSC-WARNING - MSCEWI1046 - 'ISNULL' FUNCTION MAPPED TO 'NVL', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/

END AS Sales_Qty

FROM STAGING.load_sims_load_CSV_PANEL  a
WHERE a.region_de_comisionado = 'Total Market' AND a.mercado = 10

UNION ALL

--Panel II solo trae mercado 10
SELECT
region_de_comisionado as Region_Comisionado,
mercado as Mercado, 'Canal II' AS Panel,
codigo_SAP_de_producto as Logista_Code,
fecha_de_factura as Sales_Date,
cantidad_LLOUMB_CIG as Sales_Qty

FROM STAGING.load_sims_load_CSV_PANEL2  WHERE region_de_comisionado <> 'Total Market';












CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_PriceHistorical
AS

SELECT c.time_date as Date,
p.sku_product_code as SKU_Code,
p.price as Price_Historical,
CASE
  WHEN sku.sub_market_code in (SELECT distinct(sub_market_code) FROM STAGING.load_sims_product_PriceSegment ) THEN
(SELECT price_segm_name FROM STAGING.load_sims_product_PriceSegment  s WHERE  (p.price / sku.cgrt_pack) >= (s.price_from /20) AND (p.price / sku.cgrt_pack) < (s.price_to /20) AND s.sub_market_code = sku.sub_market_code)
END AS Price_Segment_Historical

FROM STAGING.load_sims_core_Calendar  c
inner join STAGING.load_sims_product_PriceHistorical  p on c.time_date between p.date_from and p.date_to
left outer join STAGING.load_sims_product_ProductSKU  sku on p.sku_product_code = sku.sku_product_code
WHERE c.time_date <= CURRENT_TIMESTAMP() :: TIMESTAMP;














CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_Product AS
SELECT
  market.market_code as Market_Code,
  market.market_name as Market,
  submarket.sub_market_name as Sub_Market,
  company.company_name as Company,
  company.company_ord as Company_Order,
  brandfamily.brand_fam_name as Brand_Family,
  sku.product_family as Product_Family,
  sku.product_detail as Product_Detail,
  sku.version as Version,
  sku.SKU_product_name as SKU,
  logista.logista_product_name as Logista_Name,
  sku.SKU_product_code as SKU_Code,
  sku.ebrom as ebrom,
  logista.logista_product_code as Logista_Code,
  logista.brand_group_code as Logista_Group_Code,
  logista.status as Status,
  productfa.fa_code as FA_Code,
  productfa.market as Geographic_Market,
  sku.price as Price,
  CASE
    WHEN sku.sub_market_code in (
      SELECT
        distinct(sub_market_code)
      FROM STAGING.load_sims_product_PriceSegment 
    )
    AND sku.cgrt_pack <> 0 THEN (
      SELECT
        price_segm_name
      FROM STAGING.load_sims_product_PriceSegment  s
      WHERE
        (sku.price / sku.cgrt_pack) >= (s.price_from / 20)
        AND (sku.price / sku.cgrt_pack) < (s.price_to / 20)
        AND sku.sub_market_code = s.sub_market_code
    )
  END AS Price_Segment,
  CASE
    WHEN sku.sub_market_code in (
      SELECT
        distinct(sub_market_code)
      FROM STAGING.load_sims_product_PriceSegment 
    )
    AND sku.cgrt_pack <> 0 THEN (
      SELECT
        price_segm_order
      FROM STAGING.load_sims_product_PriceSegment  s
      WHERE
        (sku.price / sku.cgrt_pack) >= (s.price_from / 20)
        AND (sku.price / sku.cgrt_pack) < (s.price_to / 20)
        AND sku.sub_market_code = s.sub_market_code
    )
  END AS Price_Segment_Order,
  producttype.logista_market_code as Logista_Market_Code,
  blendtype.blend_name as Blend_PMI,
  packtype.pack_type_name as Pack_Type,
  sku.add_free_ind as Additive_Free,
  sku.ment_ind as Menthol_Indicator,
  sku.nict_cont as Nicotine_Content,
  sku.co_level as Carbon_Monoxide_Level,
  sku.filter as Filter_Ind,
  thickness.thick_name as Thickness_Category,
  sku.cgrt_pack as Units_Per_Pack,
  sku.core_code as CoreBanding,
  sku.gram_ml_per_pack as Gr_Per_Pack,
  length.length_name as Length,
  logista.product_type as Logista_Product_Type,
  (
    CASE
      WHEN sku.company_code = 1 THEN 'Philip Morris'
      WHEN sku.company_code = 74 THEN 'ONL'
      ELSE 'COMPETENCIA'
    END
  ) AS Company_Case,
  (
    CASE
      WHEN sku.company_code = 1 THEN 1
      WHEN sku.company_code = 74 THEN 3
      ELSE 2
    END
  ) AS Company_Order_Case,
  (
    CASE
      WHEN sku.company_code = 1 then 'Philip Morris'
      when sku.company_code = 12 then 'J.T.I.'
      when sku.company_code = 36 then 'B.A.T.'
      when sku.company_code = 68 then 'Imperial Tobacco'
      else 'Others'
    end
  ) AS Company_Name,
  (
    CASE
      WHEN sku.company_code = 1 then 1
      when sku.company_code = 12 then 2
      when sku.company_code = 36 then 3
      when sku.company_code = 68 then 4
      else 5
    end
  ) AS Company_Order_Name
FROM STAGING.load_sims_product_LogistaProduct  logista
  left outer join STAGING.load_sims_product_ProductSKU  sku on logista.SKU_product_code = sku.SKU_product_code --Market & SubMarket
  left outer join STAGING.load_sims_product_SubMarket  submarket on sku.sub_market_code = submarket.sub_market_code
  left outer join STAGING.load_sims_product_Market  market on submarket.market_code = market.market_code --BrandFamily
  left outer join STAGING.load_sims_product_BrandFamily  brandfamily on brandfamily.brand_fam_code = sku.brand_fam_code --Company
  left outer join STAGING.load_sims_product_Company  company on company.company_code = sku.company_code --BlendType 
  left outer join STAGING.load_sims_product_BlendType  blendtype on sku.blend_code = blendtype.blend_code --Length
  left outer join STAGING.load_sims_product_Length  length on length.length_code = sku.length_code --PackType
  left outer join STAGING.load_sims_product_PackType  packtype on packtype.pack_type_code = sku.pack_type_code --PriceSegment
  left outer join STAGING.load_sims_product_PriceSegment  pricesegment on pricesegment.price_segm_code = sku.price_segm_code --Thickness
  left outer join STAGING.load_sims_product_Thickness  thickness on thickness.thick_code = sku.thick_code --ProductType
  left outer join STAGING.load_sims_product_ProductType  producttype on producttype.product_type = logista.product_type --FACode
  left outer join STAGING.load_sims_product_ProductFA  productfa on productfa.logista_product_code = logista.logista_product_code
WHERE
  sku.SKU_product_code is not null
  AND productfa.FA_code is null
  OR productfa.FA_code not LIKE 'PACK%';



CREATE VIEW  IF NOT EXISTS DATA_PRODUCT.v_sims_SalesDayCountyReport
AS

SELECT Logista_Code,
SKU_Code,
County_Code,
Sales_Date,
Sales_Qty,
Sales_Gr,
Cigs_Eqv
FROM DATA_PRODUCT.v_sims_SalesDayCountyUser
WHERE YEAR(Sales_Date) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ >= (YEAR(CURRENT_TIMESTAMP() :: TIMESTAMP) /*** MSC-WARNING - MSCEWI1046 - 'YEAR' FUNCTION MAPPED TO 'YEAR', FUNCTIONAL EQUIVALENCE VERIFICATION PENDING ***/ -2);


