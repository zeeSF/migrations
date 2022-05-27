
Use database $${db};
create or replace TABLE STAGING.LOAD_CI_PDM_SASTOCKORDERS (
	MERCADO VARCHAR(255) COLLATE 'en-ci-as',
	ID_STOCK_ORDER NUMBER(38,0),
	ID_PUNTO_DE_VENTA NUMBER(38,0),
	PUNTO_DE_VENTA VARCHAR(255) COLLATE 'en-ci-as',
	NUMERO_SAP NUMBER(38,0),
	ISLA VARCHAR(255) COLLATE 'en-ci-as',
	TIPO_DE_PUNTO_DE_VENTA VARCHAR(255) COLLATE 'en-ci-as',
	DIRECCION VARCHAR(255) COLLATE 'en-ci-as',
	CIUDAD VARCHAR(255) COLLATE 'en-ci-as',
	CODIGO_POSTAL VARCHAR(255) COLLATE 'en-ci-as',
	TELEFONO VARCHAR(255) COLLATE 'en-ci-as',
	PROVINCIA VARCHAR(255) COLLATE 'en-ci-as',
	CODIGO_ISMS VARCHAR(255) COLLATE 'en-ci-as',
	CERRADO VARCHAR(255) COLLATE 'en-ci-as',
	HABILITAR_LA_VISIBILIDAD_DEL_CALL_CENTER VARCHAR(255) COLLATE 'en-ci-as',
	ESTADO VARCHAR(255) COLLATE 'en-ci-as',
	COMENTARIOS VARCHAR(4000) COLLATE 'en-ci-as',
	COMENTARIOS_DE_RECHAZO VARCHAR(4000) COLLATE 'en-ci-as',
	CREADO TIMESTAMP_NTZ(9),
	RECIBIDO TIMESTAMP_NTZ(9),
	HORA_RECIBIDA TIME,
	PRODUCTO VARCHAR(255) COLLATE 'en-ci-as',
	OPERACION VARCHAR(255) COLLATE 'en-ci-as',
	CANTIDAD NUMBER(38,0),
	LATITUDE VARCHAR(255) COLLATE 'en-ci-as',
	LONGITUDE VARCHAR(255) COLLATE 'en-ci-as',
	HORA_DE_CREACION TIME,
	_ETL_LOAD_DATETIME TIMESTAMP_NTZ(9),
	_ETL_SOURCE VARCHAR(16777216) COLLATE 'en-ci',
	_ETL_RUN_ID NUMBER(38,0),
	_ETL_JOB_ID NUMBER(38,0),
	SOURCE_FILE_NAME VARCHAR(16777216) COLLATE 'en-ci'
);
--table owner changed


CREATE or REPLACE TABLE STAGING.load_ci_sellout_Customer (
customer_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
category VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
predominant_sale VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);


CREATE or REPLACE TABLE  STAGING.load_ci_sellout_Sales (
customer_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
POS_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
year VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
month VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
quantity NUMERIC(18, 2) NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
