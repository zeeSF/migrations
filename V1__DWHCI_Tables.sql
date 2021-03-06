CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Actividades (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subjetc_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_ActividadesPromos (
Account_Id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
User_Username VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Last_Modified_Date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Job_Definition_List VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Response_Value VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
State VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_gspr_actuals (
market VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
consolidated_data_version VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_category VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
trademark_owner VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_family VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ebrom VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ebrom_c VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pmi_price_class VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pmi_tar_class VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tar_content FLOAT NULL,
menthol_indicator VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
filter_indicator VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
items_per_pack FLOAT NULL,
thickness_category VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pack_type VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
marketed_length_category VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_date VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_qty FLOAT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Answers (
ActivityDate DATETIME NULL,
AnswerValue VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
SubjectCode VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
SubjectDescription VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CustomerCode VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
VisitCode VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_AtributosList (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
attribute_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
attribute VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
value VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_AUX_VentasHistorico (
parent_supi_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
SWAP VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Canal VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Subcanal VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Canal_Old VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Subcanal_Old VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Isla_Venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
FECHA_VENTA DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_BudgetControl (
contract_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_value DECIMAL(21, 8) NULL,
contract_actual_start_date DATETIME NULL,
contract_actual_end_date DATETIME NULL,
gained_points DECIMAL(38, 6) NULL,
rewarded_points DECIMAL(38, 6) NULL,
pendind_points DECIMAL(38, 8) NULL,
gained_points_YTD DECIMAL(38, 6) NULL,
rewarded_points_YTD DECIMAL(38, 6) NULL,
pending_points_last_year DECIMAL(38, 8) NULL,
pending_poins_jan DECIMAL(38, 8) NULL,
pending_poins_feb DECIMAL(38, 8) NULL,
pending_poins_mar DECIMAL(38, 8) NULL,
pending_poins_apr DECIMAL(38, 8) NULL,
pending_poins_may DECIMAL(38, 8) NULL,
pending_poins_jun DECIMAL(38, 8) NULL,
pending_poins_jul DECIMAL(38, 8) NULL,
pending_poins_aug DECIMAL(38, 8) NULL,
pending_poins_sep DECIMAL(38, 8) NULL,
pending_poins_oct DECIMAL(38, 8) NULL,
pending_poins_nov DECIMAL(38, 8) NULL,
pending_poins_dec DECIMAL(38, 8) NULL,
pending_poins_N_jan DECIMAL(38, 8) NULL,
pending_poins_N_feb DECIMAL(38, 8) NULL,
pending_points_DTY DECIMAL(38, 8) NULL,
customer_located_at_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_CallCardGenLeads (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_CallCardInfoEmpleados (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_CallCardProgramGenLead (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_wit_Clientes (
codigo INT NULL,
descripcion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_fiscal VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_comercial VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ISMS VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
NIF VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
telefono VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
direccion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_postal VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
localidad VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
GPS_latitud NUMERIC(18, 2) NULL,
GPS_longitud NUMERIC(18, 2) NULL,
clasificacion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_consumidor VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cadena VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
venta_media INT NULL,
creado_el VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fecha_ultima_visita VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
off VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Contact (
id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
prefix VARCHAR(6) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
title VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
first_name VARCHAR(75) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
last_name VARCHAR(75) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fax VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mobile VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
notes VARCHAR(256) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mod_date DATETIME NULL,
DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
DDM_batch INT NULL,
dni VARCHAR(50) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_ContactType (
contact_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_type_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_type_visibility_from DATETIME NULL,
contract_type_visibility_to DATETIME NULL,
contact_type_mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_type_mod_date DATETIME NULL,
contact_type_DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_type_DDM_batch INT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Contract (
id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
desc VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_template BOOLEAN NULL,
status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_level_is_read_only BOOLEAN NULL,
validity_start_date DATETIME NULL,
validity_start_date_is_read_only BOOLEAN NULL,
validity_end_date DATETIME NULL,
validity_end_date_is_read_only BOOLEAN NULL,
print_compliance_report VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
print_compliance_report_is_read_only BOOLEAN NULL,
planned_rewarding_date DATETIME NULL,
planned_rewarding_date_is_read_only BOOLEAN NULL,
rewarding_period_is_read_only BOOLEAN NULL,
all_reward_types BOOLEAN NULL,
all_reward_types_is_read_only BOOLEAN NULL,
past_points INT NULL,
relationship_building_points INT NULL,
comment VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comment_is_read_only BOOLEAN NULL,
add_objective_is_disabled BOOLEAN NULL,
add_objective_from_template_is_disabled BOOLEAN NULL,
add_objective_in_open_state_only BOOLEAN NULL,
remove_objective_in_openstate_only BOOLEAN NULL,
template_contract_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_level_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_period_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
compliance_allowed_after_contract_end BOOLEAN NULL,
compliance_allowed_after_contract_end_is_read_only BOOLEAN NULL,
finish_when_not_complied BOOLEAN NULL,
finish_when_not_complied_read_only BOOLEAN NULL,
delete_remaining_points_at_end BOOLEAN NULL,
delete_remaining_points_at_end_read_only BOOLEAN NULL,
rewarding_contract_period_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
query_definition_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
query_result_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cancellation_reason_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
data_sync_pool_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
confirmation_position_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
visibility_from DATETIME NULL,
visibility_to DATETIME NULL,
mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mod_date DATETIME NULL,
DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
DDM_batch INT NULL,
actual_start_date DATETIME NULL,
actual_end_date DATETIME NULL,
actual_end_date_is_read_only BOOLEAN NULL,
max_value DECIMAL(17, 4) NULL,
max_value_is_read_only BOOLEAN NULL,
max_value_currency_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
max_installments INT NULL,
max_installments_is_read_only BOOLEAN NULL,
allow_compliance_during_start_period BOOLEAN NULL,
force_auto_compliance BOOLEAN NULL,
force_auto_compliance_points INT NULL,
force_auto_compliance_points_is_read_only BOOLEAN NULL,
compliance_periods_are_read_only BOOLEAN NULL,
target_query_result_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
target_query_definition_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
force_auto_compliance_is_read_only BOOLEAN NULL,
allow_compliance_during_start_period_is_read_only BOOLEAN NULL,
has_unscheduled_compliance BOOLEAN NULL,
has_unscheduled_compliance_is_read_only BOOLEAN NULL,
value DECIMAL(17, 4) NULL,
value_is_read_only BOOLEAN NULL,
financial_value DECIMAL(17, 4) NULL,
financial_value_is_read_only BOOLEAN NULL,
duration_in_month INT NULL,
is_for_HH BOOLEAN NULL,
contract_actual_start_date_is_read_only BOOLEAN NULL,
has_simple_compliance BOOLEAN NULL,
compliance_check_type VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
attachment_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_ControlPresupuestario (
rewarded_points_YTD DECIMAL(38, 6) NULL,
gained_points_YTD DECIMAL(38, 6) NULL,
contract_value DECIMAL(21, 8) NULL,
customer_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
rewarded_points DECIMAL(38, 6) NULL,
Field7 DECIMAL(38, 6) NULL,
pending_points DECIMAL(38, 8) NULL,
gained_points DECIMAL(38, 6) NULL,
pending_points_DTY DECIMAL(38, 8) NULL,
pending_points_sep DECIMAL(38, 8) NULL,
pending_points_oct DECIMAL(38, 8) NULL,
pending_points_nov DECIMAL(38, 8) NULL,
pending_points_may DECIMAL(38, 8) NULL,
pending_points_mar DECIMAL(38, 8) NULL,
pending_points_jun DECIMAL(38, 8) NULL,
pending_points_jul DECIMAL(38, 8) NULL,
pending_points_N_feb DECIMAL(38, 8) NULL,
pending_points_feb DECIMAL(38, 8) NULL,
pending_points_N_jan DECIMAL(38, 8) NULL,
pending_points_jan DECIMAL(38, 8) NULL,
pending_points_dec DECIMAL(38, 8) NULL,
pending_points_last_year DECIMAL(38, 8) NULL,
pending_points_aug DECIMAL(38, 8) NULL,
pending_points_apr DECIMAL(38, 8) NULL,
geo_tree_area_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
quality_classification_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_code_1 VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Field29 VARCHAR(5) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_registered_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_actual_start_date DATETIME NULL,
contract_actual_end_date DATETIME NULL,
contract_status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
trade_category_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_description_1 VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_Customer (
customer_code INT NOT NULL,
name VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
name_2 VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
hierarchy VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_group VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
VAT_regno VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
central_posting_block VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
posting_block_company_code VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ord_block_all_sales_area VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ord_block_sel_sales_area VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
del_block_all_sales_area VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
del_block_sel_sales_area VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
blk_sales_support_all_sales_area VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
blk_sales_support_sel_sales_area VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_Customer PRIMARY KEY (customer_code /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                     WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                            
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                             ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellout_Customer (
customer_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pos_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
island VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pos_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
territory VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
code_isms VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
category VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
consumer_type VARCHAR(50) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_category VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Customer (
customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_registered_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_internal_company_code VARCHAR(40) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_tax_office VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_tax_number VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_registration_number VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_selling_license_number VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_trade_category_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_sub_trade_category_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_price_category_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_purchase_price_category_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_customer_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_customer_type_detail_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_payment_term_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_bank_branch_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_bank_account VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_finance_code VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_industry_classification_level_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_industry_classification_calculated BOOLEAN NULL,
customer_industry_classification_last_update_date DATETIME NULL,
customer_internal_classification_level_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_internal_classification_calculated BOOLEAN NULL,
customer_internal_classification_last_update_date DATETIME NULL,
customer_quality_classification_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_quality_classification_calculated BOOLEAN NULL,
customer_quality_classification_last_update_date DATETIME NULL,
customer_currency_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_doc_currency_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_monday_opening_hour INT NULL,
customer_monday_closing_hour INT NULL,
customer_monday_lunch_break BOOLEAN NULL,
customer_tuesday_opening_hour INT NULL,
customer_tuesday_closing_hour INT NULL,
customer_tuesday_lunch_break BOOLEAN NULL,
customer_wednesday_opening_hour INT NULL,
customer_wednesday_closing_hour INT NULL,
customer_wednesday_lunch_break BOOLEAN NULL,
customer_thursday_opening_hour INT NULL,
customer_thursday_closing_hour INT NULL,
customer_thursday_lunch_break BOOLEAN NULL,
customer_friday_opening_hour INT NULL,
customer_friday_closing_hour INT NULL,
customer_friday_lunch_break BOOLEAN NULL,
customer_saturday_opening_hour INT NULL,
customer_saturday_closing_hour INT NULL,
customer_saturday_lunch_break BOOLEAN NULL,
customer_sunday_opening_hour INT NULL,
customer_sunday_closing_hour INT NULL,
customer_sunday_lunch_break BOOLEAN NULL,
customer_is_delivery_point BOOLEAN NULL,
customer_is_billing_point BOOLEAN NULL,
customer_is_payment_point BOOLEAN NULL,
customer_is_marketing_point BOOLEAN NULL,
customer_is_credit_customer BOOLEAN NULL,
customer_is_order_point BOOLEAN NULL,
customer_is_blocked BOOLEAN NULL,
customer_is_wholesaler BOOLEAN NULL,
customer_credit_limit DECIMAL(30, 4) NULL,
customer_available_credit_limit DECIMAL(30, 4) NULL,
customer_notes VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_industry_volume BIGINT NULL,
customer_industry_volumen_calculated BOOLEAN NULL,
customer_industry_volume_last_update_date DATETIME NULL,
customer_internal_volume BIGINT NULL,
customer_internal_volume_calculated BOOLEAN NULL,
customer_internal_volume_last_update_date DATETIME NULL,
customer_customer_distribution_method_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_DSD_frequency_per_week DECIMAL(30, 4) NULL,
customer_merch_frequency_per_cycle DECIMAL(30, 4) NULL,
customer_DSD_visit_sequence DECIMAL(30, 4) NULL,
customer_merch_visit_sequence DECIMAL(30, 4) NULL,
customer_exclude_from_CSU BOOLEAN NULL,
customer_depot_sales BOOLEAN NULL,
customer_group_parent BOOLEAN NULL,
customer_visibility_from DATETIME NULL,
customer_visibility_to DATETIME NULL,
customer_mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_mod_date DATETIME NULL,
customer_DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_DDM_batch INT NULL,
customer_credit_limit_update_date DATETIME NULL,
customer_group_parent_customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_basic_DDM_batch INT NULL,
customer_credit_note_limit DECIMAL(30, 4) NULL,
customer_available_credit_note DECIMAL(30, 4) NULL,
customer_is_pre_sales_point BOOLEAN NULL,
customer_is_flag_1 BOOLEAN NULL,
customer_is_flag_2 BOOLEAN NULL,
customer_is_flag_3 BOOLEAN NULL,
customer_is_flag_4 BOOLEAN NULL,
customer_is_flag_5 BOOLEAN NULL,
customer_work_day_1 VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_work_day_2 VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_product_exchange_price_category_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_monday_morning_opening_hour INT NULL,
customer_monday_morning_closing_hour INT NULL,
customer_monday_afternoon_opening_hour INT NULL,
customer_monday_afternoon_closing_hour INT NULL,
customer_tuesday_morning_opening_hour INT NULL,
customer_tuesday_morning_closing_hour INT NULL,
customer_tuesday_afternoon_opening_hour INT NULL,
customer_tuesday_afternoon_closing_hour INT NULL,
customer_wednesday_morning_opening_hour INT NULL,
customer_wednesday_morning_closing_hour INT NULL,
customer_wednesday_afternoon_opening_hour INT NULL,
customer_wednesday_afternoon_closing_hour INT NULL,
customer_thursday_morning_opening_hour INT NULL,
customer_thursday_morning_closing_hour INT NULL,
customer_thursday_afternoon_opening_hour INT NULL,
customer_thursday_afternoon_closing_hour INT NULL,
customer_friday_morning_opening_hour INT NULL,
customer_friday_morning_closing_hour INT NULL,
customer_friday_afternoon_opening_hour INT NULL,
customer_friday_afternoon_closing_hour INT NULL,
customer_saturday_morning_opening_hour INT NULL,
customer_saturday_morning_closing_hour INT NULL,
customer_saturday_afternoon_opening_hour INT NULL,
customer_saturday_afternoon_closing_hour INT NULL,
customer_sundat_morning_opening_hour INT NULL,
customer_sunday_morning_closing_hour INT NULL,
customer_sunday_afternoon_opening_hour INT NULL,
customer_sunday_afternoon_closing_hour INT NULL,
customer_is_VM_operator BOOLEAN NULL,
customer_is_VM_owner BOOLEAN NULL,
customer_profdile_classification_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_profile_classification_last_update_date DATETIME NULL,
customer_is_parent BOOLEAN NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_CustomerPriceHistoryAllCustomer (
answer_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
customer_located_at_id VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
dispositivo_venta VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
tipo_consumidor VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pregunta VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
tipo_venta VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cod_marca VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
marca VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
price DECIMAL(18, 2) NULL,
date DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_Customers (
customer_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_CustomerWholesaler (
id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
wholesaler_customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
external_customer_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mod_date DATETIME NULL,
DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
DDM_batch INT NULL,
is_def_or_primary BOOLEAN NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Distribucion (
cod_cliente VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sale_type VARCHAR(3) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sale_device VARCHAR(3) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
client_code VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
price DECIMAL(18, 2) NULL,
input_date DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_wit_Empresas (
codigo INT NULL,
nombre VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_HorarioPOS (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mon_morning_opening INT NULL,
mon_morning_closing INT NULL,
mon_afternoon_opening INT NULL,
mon_afternoon_closing INT NULL,
tue_morning_opening INT NULL,
tue_morning_closing INT NULL,
tue_afternoon_opening INT NULL,
tue_afternoon_closing INT NULL,
wed_morning_opening INT NULL,
wed_morning_closing INT NULL,
wed_afternoon_opening INT NULL,
wed_afternoon_closing INT NULL,
thu_morning_opening INT NULL,
thu_morning_closing INT NULL,
thu_afternoon_opening INT NULL,
thu_afternoon_closing INT NULL,
fri_morning_opening INT NULL,
fri_morning_closing INT NULL,
fri_afternoon_opening INT NULL,
fri_afternoon_closing INT NULL,
sat_morning_opening INT NULL,
sat_morning_closing INT NULL,
sat_afternoon_opening INT NULL,
sat_afternoon_closing INT NULL,
sun_morning_opening INT NULL,
sun_morning_closing INT NULL,
sun_afternoon_opening INT NULL,
sun_afternoon_closing INT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_InvoiceType (
invoice_type VARCHAR(4) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
description VARCHAR(50) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
CONSTRAINT PK_InvoiceType PRIMARY KEY (invoice_type /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                       WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                              
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                               ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_iqos_prices (
price_date DATE NOT NULL,
year_month INT NOT NULL,
version VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
price DECIMAL(18, 0) NOT NULL,
clave VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingConfigurationMarket (
id INT NOT NULL,
value INT NULL,
market_id INT NULL,
configuration_id INT NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingConfigurationMarket PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                   
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                    ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingConfigurations (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingConfigurations PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                       WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                              
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                               ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingConsumerTypes (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingConsumerTypes PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingLendingKits (
id INT NOT NULL,
identifier VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codentify VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
child_codentify_1 VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
child_codentify_2 VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_point_id INT NULL,
stock_status_id INT NULL,
exported_at DATETIME NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
product_model_id INT NULL,
product_color_id INT NULL,
owner_id INT NULL,
enable_to_creation INT NULL,
stock_substatus_id INT NULL,
CONSTRAINT PK_LendingLendingKits PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                           
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                            ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingLendingPoints (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
isms_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nif VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lat VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lng VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address_2 VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zipcode VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
city VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_point_type_id INT NULL,
exported_at DATETIME NULL,
username VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
sap_number INT NULL,
phone_prefix INT NULL,
phone INT NULL,
owner VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
touchpoint_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
enable_lending_creation INT NULL,
lending_point_trace_id INT NULL,
enable_add_lending_kit INT NULL,
market_id INT NULL,
CONSTRAINT PK_LendingLendingPoints PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingLendingPointTraces (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingLendingPointTraces PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                           WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                  
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                   ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingLendingPointTypes (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingLendingPointTypes PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                          WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                 
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                  ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingMarkets (
id INT NOT NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
abbreviation VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingMarkets PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                       
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                        ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingNoSoldReasons (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
code INT NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
abbreviation VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LendingNoSoldReasons PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingOrderMovements (
id INT NOT NULL,
order_id INT NULL,
order_status_id INT NULL,
lending_point_id INT NULL,
exported_at DATETIME NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LendingOrderMovements PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                       WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                              
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                               ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingOrders (
id INT NOT NULL,
lending_point_id INT NULL,
lending_kit_id INT NULL,
no_sold_reason_id INT NULL,
firstname VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lastname VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
document_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
dni VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
delivery VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_sold INT NULL,
start_lending_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
end_lending_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address_2 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zipcode VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
city VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
order_status_id INT NULL,
origin_id INT NULL,
exported_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
referer VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
follow_up INT NULL,
no_sold_reason VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
observations VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pickup_phone VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pickup_address VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pickup_address_2 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pickup_zipcode VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pickup_city VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
consumer_type_id INT NULL,
sell_order_number VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
birthdate VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
gender VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
device VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user_id_created VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user_id_updated VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user_id_deleted VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone_prefix VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
processed INT NULL,
terms_and_conditions INT NULL,
real_end_lending_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_point_external_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_point_reserved_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LendingOrders PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                               WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                      
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                       ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingOrderStatuses (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingOrderStatuses PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingOrigins (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingOrigins PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                       
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                        ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingOwners (
id INT NOT NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingOwners PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                               WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                      
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                       ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingProductColors (
id INT NOT NULL,
ref_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingProductColors PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingProductModels (
id INT NOT NULL,
ref_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingProductModels PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingRoles (
id INT NOT NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ad_group_name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingRoles PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                     
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                      ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingStockMovements (
id INT NOT NULL,
lending_kit_id INT NULL,
lending_point_id INT NULL,
stock_status_id INT NULL,
exported_at DATETIME NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingStockMovements PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                       WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                              
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                               ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingStockStatuses (
id INT NOT NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingStockStatuses PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingStockSubstatuses (
id INT NOT NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user_id_updated VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user_id_deleted VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LendingStockSubstatuses PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                 ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingTemplates (
id INT NOT NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_point_type_id INT NULL,
body VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
market_id INT NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
CONSTRAINT PK_LendingTemplates PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                         
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                          ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LendingUsers (
id INT NOT NULL,
username VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
alert_email VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_point_id INT NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
user_id_created INT NULL,
user_id_updated INT NULL,
user_id_deleted INT NULL,
role_id INT NULL,
auth_source VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
exported_at DATETIME NULL,
show_lp_selector INT NULL,
last_lp_switched DATETIME NULL,
market_id INT NULL,
open_role VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LendingUsers PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                     
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                      ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_LoadNoMapping (
invoice_num VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_bill_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sku_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
invoice_date DATETIME NULL,
invoice_type VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
store VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_qty DECIMAL(11, 3) NULL,
sales_value DECIMAL(11, 3) NULL,
sales_ct DECIMAL(11, 3) NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_LoadSales (
bill_t VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
d_chl VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
plant VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
bill_to VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
br_fam VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
period VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ref_doc_no VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
item VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
value_tcur VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
curr VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
quantity VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
um VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pstg_date VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
trace VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_Logins (
Account_ID VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
User_Contact_ID VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Login_Date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerDevice (
id INT NOT NULL,
consumer_id INT NULL,
device_id INT NULL,
godfather_id INT NULL,
lead_generator_id INT NULL,
reseller_basic_id INT NULL,
partner_id INT NULL,
campaign_id INT NULL,
godfather_points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
godson_points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user_id INT NULL,
dissociated_at DATETIME NULL,
dissociated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
origin VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comments VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
territory_id INT NULL,
partner_category_id INT NULL,
number_device VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
voucher_id INT NULL,
lead_id INT NULL,
pos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
seller VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
registration_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
promo_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
promo_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
partner_territory_id INT NULL,
openuser VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
openuser_lg VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
voucher_code_used VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
voucher_value DECIMAL(18, 2) NULL,
tradein_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyConsumerDevice PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                       WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                              
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                               ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerDeviceRaffle (
consumer_device_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
raffle_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerPointsLogs (
id INT NULL,
consumer_id INT NULL,
points DECIMAL(12, 2) NULL,
justification VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at DATETIME NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
balance DECIMAL(12, 2) NULL,
expires_at DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerPoolFollowUps (
id INT NOT NULL,
consumer_pool_id INT NULL,
communication_attempt VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comment VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
result VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
conversion_status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
result_comment VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
date DATETIME NULL,
type VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyConsumerPoolFollowUps PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                     
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                      ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerPools (
id INT NOT NULL,
consumer_device_id INT NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
assigned_to VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
notes VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
status_control DATETIME NULL,
CONSTRAINT PK_LoyaltyConsumerPools PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerPoolsLogs (
id INT NOT NULL,
consumer_pool_id INT NULL,
status VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
user VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
details VARCHAR(500) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL,
deleted_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
notes VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_incidence VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_communication VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyConsumerPoolsLogs PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                          WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                 
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                  ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumers (
id INT NOT NULL,
market_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
godfather_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
referral_code_id INT NULL,
level_id INT NULL,
sales_force_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
spice_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
first_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
last_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
birth_date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
gender VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
document_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
document VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone_prefix VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
api_token VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
password VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
password_updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
last_login_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
street_number VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
apartment_number VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zip_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
city VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
status_points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
opt_in VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
locale VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
origin VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
remember_token VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
employee VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lead_generator_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by_dce_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
welcome_sent_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyConsumers PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                         
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                          ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyConsumerVisitLogs (
id INT NULL,
consumer_id INT NULL,
visit_date DATETIME NULL,
deleted_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by INT NULL,
updated_by INT NULL,
deleted_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyDevices (
id INT NOT NULL,
aggregation_date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
disaggregation_date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
parent_product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
parent_supi_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
child_product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
child_supi_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyDevices PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                       
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                        ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_LoyaltyDevices (
parent_product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
price DECIMAL(18, 0) NULL,
clave VARCHAR(125) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyEcProducts (
id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_voucher VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
image VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
about VARCHAR(4000) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
points_cost VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
total_stock VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
price VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
hidden VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyEcVariationValues (
id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
e_commerce_variation_type_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyIntervals (
id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
min VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
max VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyLeadgenerators (
id INT NOT NULL,
name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
short_description VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
agreement_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
qr_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
isms_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_force_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
audience_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
territory_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pixel_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyLeadgenerators PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                       WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                              
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                               ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyLeads (
id INT NOT NULL,
lead_generator_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
territory_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
first_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
last_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
document_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
document VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone_prefix VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
status VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_later_count VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
assigned_to VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_time VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending_order_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
next_contact_date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
notes VARCHAR(4000) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
status_control VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
godfather_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyLeads PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                     
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                      ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyLevels (
id INT NOT NULL,
market_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
about VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
multiplier VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
badge VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyLevels PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                               WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                      
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                       ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyPartners (
id INT NOT NULL,
market_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_force_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mkpc_agreement_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pos_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
city VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zip_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
image VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
audience_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reseller_category_id INT NULL,
immediate_pickup VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
vouchers VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
heets VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_care VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lending VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lat VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lng VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyPartners PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                        
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                         ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyProductCodes (
id INT NOT NULL,
product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
product_id INT NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyProductCodes PRIMARY KEY (product_code /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                               WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                      
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                       ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyProducts (
id INT NOT NULL,
image VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
about VARCHAR(2500) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
godfather_points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
godson_points VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyProducts PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                        
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                         ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyRaffles (
id INT NULL,
title VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
start_date DATETIME NULL,
end_date DATETIME NULL,
file VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
checkbox_text VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
active INT NULL,
created_by INT NULL,
updated_by INT NULL,
deleted_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at DATETIME NULL,
updated_at DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyRedeems (
id INT NOT NULL,
consumer_id INT NULL,
redeemable_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
redeemable_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
e_commerce_variation_value_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
voucher_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
points_used VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
points_earned VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pms_redeemable_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyRedeems PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                       
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                        ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyReferralCodes (
id INT NOT NULL,
market_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyReferralCodes PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                             
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                              ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyResellerBasics (
id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
market_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_force_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mkpc_agreement_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pos_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
city VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zip_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
phone VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
coords VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
image VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
audience_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyResellerCategories (
id INT NOT NULL,
name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyResellerCategories PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                           WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                                  
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                                   ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyRoles (
id INT NOT NULL,
name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ad_group_name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyRoles PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                     
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                      ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyTerritories (
id INT NOT NULL,
title VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
_lft VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
_rgt VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
parent_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyTerritories PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                           
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                            ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyUsers (
id INT NOT NULL,
username VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
role_id1 INT NULL,
territory_id INT NULL,
auth_source VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
market_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
partner_id INT NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
created_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_by VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lead_generator_id INT NULL,
CONSTRAINT PK_LoyaltyUsers PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                     
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                      ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_LoyaltyVoucher (
id INT NOT NULL,
consumer_id INT NULL,
code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
valid_through VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
used_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
partner_id INT NULL,
created_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
updated_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
deleted_at VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
voucher_import_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_LoyaltyVoucher PRIMARY KEY (id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                       
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                        ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_MainQuery (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
posm VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_MappingIqos (
ID FLOAT NULL,
username VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
name VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
isla_IQOS_coach VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
trace VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_MappingProduct (
code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
description VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_category VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
compatibilidad VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
wave VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
color VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
trace VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_MasterPOS (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fiscal_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
NIF VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
main_sale VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sale_vol BIGINT NULL,
pmi_vol BIGINT NULL,
address_type VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address_name VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address_district VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
address_num VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zip_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
municipality VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
island VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
lat DECIMAL(17, 6) NULL,
lon DECIMAL(17, 6) NULL,
area VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
territory VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
last_visit DATETIME NULL,
category VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
chain VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
consumer_type VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
buying_class VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_MasterPOS PRIMARY KEY (client_id /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                         
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                          ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_MueblesConvencional (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
question_desc VARCHAR(128) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_OOS (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_OOS VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
OOS_date DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_OpenUsersIqosClub (
Contact_ID VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Username VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Profile VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Salesforce_ID VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Account_Id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Account_Name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_actionsdata_Orders (
albaran VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
orderno VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fecha_pedido DATETIME NULL,
hora_pedido TIME NULL,
header_gross VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
header_gross_original VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
metodo_pago VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
telefono VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
direccion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_postal VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
provincia VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
estado_del_pedido VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fecha_entrega DATETIME NULL,
articleno VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_de_producto VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
version VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
color VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
descripcion_articulo VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
descripcion_maestro VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
unidades VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
total_con_descuentos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
total_sin_descuentos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
precio_unidad_con_descuentos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
precio_unidad_sin_descuentos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
iva_aplicado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
descuento_aplicado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
descuento_aplicado_pedido VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
estado_asignacion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
kit VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
charger VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
holder VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
categoria VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
agrupacion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
market_code_asociado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
estado_cliente VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_pedido VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fecha_nacimiento VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_PageviewsOpen (
Date VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Contact_ID VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Session_Id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Page_Title VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Time_On_Page VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Timestamp VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Hit_Number VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Is_Bounce VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_PagosDirectos (
customer_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_date DATETIME NULL,
movement_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
movement_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
movement_status VARCHAR(10) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
movement_legal_number VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
movement_SAP_request_number VARCHAR(15) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_description VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_quantity INT NULL,
reward_product_points INT NULL,
geo_tree_area_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_code_1 VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_registered_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_description_1 VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_PeticionesPagos (
customer_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contract_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_date DATETIME NULL,
internal_order_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
internal_order_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
internal_order_status VARCHAR(10) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
internal_order_reference_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
internal_order_SAP_request_number VARCHAR(15) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_description VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_quantity INT NULL,
reward_product_points INT NULL,
geo_tree_area_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_code_1 VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_registered_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
country_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
geo_tree_area_description_1 VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Petrol (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
question_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
question_desc VARCHAR(128) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_POSM (
Cod_Cliente VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Nombre_Comercial VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
SubjectCode VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
POSM VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Fecha_Imput_Activ DATETIME NULL,
Value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_POSVM (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fiscal_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
machine_id VARCHAR(12) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
machine_desc VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
vm_model VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
vm_serial VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
operated_by VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
owner VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_vmtransfer BOOLEAN NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_POSVMC (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fiscal_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
machine_id VARCHAR(12) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
machine_desc VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
vm_model VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
vm_serial VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
operated_by VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
owner VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
is_vmtransfer BOOLEAN NULL,
installation_date DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Precio (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sale_type VARCHAR(3) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sale_device VARCHAR(3) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
client_code VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
price DECIMAL(18, 2) NULL,
input_date DATETIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_wit_Preguntas (
codgio INT NULL,
nombre VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
fecha DATETIME NULL,
tipo_de_pregunta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cantidad_total INT NULL,
cantidad_por_pregunta INT NULL,
fecha_inicio DATETIME NULL,
fecha_fin DATETIME NULL,
"categor??a_de_pregunta" VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
"clasificaci??n_de_pregunta" INT NULL,
activar_para_local VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_para_turista VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
bloqueo_de_pregunta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
importante VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
"posici??n" INT NULL,
numero_de_decimales INT NULL,
cantidad_minimo FLOAT NULL,
cantidad_maximo FLOAT NULL,
n_de_respuestas_para_validar INT NULL,
comentario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comentario_visible VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comentario_para_la_pregunta_texto VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mostrar_texto_de_pregunta_cliente VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_1 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_2 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_3 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_4 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_5 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_6 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_7 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_8 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_9 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_10 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_11 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_12 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_13 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_14 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_15 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_16 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_17 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_18 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_19 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_20 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_1 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_2 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_3 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_4 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_5 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_6 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_7 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_8 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_9 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_10 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_11 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_12 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_13 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_14 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_15 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_16 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_17 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_18 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_19 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activar_20 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cantidad_minimo_1 FLOAT NULL,
cantidad_maximo_1 INT NULL,
cantidad_minimo_2 FLOAT NULL,
cantidad_maximo_2 INT NULL,
cantidad_minimo_3 FLOAT NULL,
cantidad_maximo_3 INT NULL,
cantidad_minimo_4 FLOAT NULL,
cantidad_maximo_4 INT NULL,
cantidad_minimo_5 INT NULL,
cantidad_maximo_5 INT NULL,
cantidad_minimo_6 INT NULL,
cantidad_maximo_6 INT NULL,
cantidad_minimo_7 INT NULL,
cantidad_maximo_7 INT NULL,
cantidad_minimo_8 INT NULL,
cantidad_maximo_8 INT NULL,
cantidad_minimo_9 INT NULL,
cantidad_maximo_9 INT NULL,
cantidad_minimo_10 INT NULL,
cantidad_maximo_10 INT NULL,
cantidad_minimo_11 INT NULL,
cantidad_maximo_11 INT NULL,
cantidad_minimo_12 INT NULL,
cantidad_maximo_12 INT NULL,
cantidad_minimo_13 INT NULL,
cantidad_maximo_13 INT NULL,
cantidad_minimo_14 INT NULL,
cantidad_maximo_14 INT NULL,
cantidad_minimo_15 INT NULL,
cantidad_maximo_15 INT NULL,
cantidad_minimo_16 INT NULL,
cantidad_maximo_16 INT NULL,
cantidad_minimo_17 INT NULL,
cantidad_maximo_17 INT NULL,
cantidad_minimo_18 INT NULL,
cantidad_maximo_18 INT NULL,
cantidad_minimo_19 INT NULL,
cantidad_maximo_19 INT NULL,
cantidad_minimo_20 INT NULL,
cantidad_maximo_20 INT NULL,
cantidad_predefinida_1 FLOAT NULL,
cantidad_predefinida_2 FLOAT NULL,
cantidad_predefinida_3 FLOAT NULL,
cantidad_predefinida_4 FLOAT NULL,
cantidad_predefinida_5 INT NULL,
cantidad_predefinida_6 INT NULL,
cantidad_predefinida_7 INT NULL,
cantidad_predefinida_8 INT NULL,
cantidad_predefinida_9 INT NULL,
cantidad_predefinida_10 INT NULL,
cantidad_predefinida_11 INT NULL,
cantidad_predefinida_12 INT NULL,
cantidad_predefinida_13 INT NULL,
cantidad_predefinida_14 INT NULL,
cantidad_predefinida_15 INT NULL,
cantidad_predefinida_16 INT NULL,
cantidad_predefinida_17 INT NULL,
cantidad_predefinida_18 INT NULL,
cantidad_predefinida_19 INT NULL,
cantidad_predefinida_20 INT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_wit_PreguntasVisitas (
codigo_visita INT NULL,
codigo_pregunta_de_la_visita INT NULL,
fecha DATETIME NULL,
codigo_empresa INT NULL,
nombre_empresa VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_cliente INT NULL,
nombre_cliente VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_pregunta INT NULL,
nombre_pregunta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_de_pregunta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
si_o_no VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cantidad INT NULL,
rechazada VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comentario_rechazada VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
opcion_de_pregunta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
texto_de_respuesta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
mes INT NULL,
ano INT NULL,
nombre_1 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_2 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_3 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_4 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_5 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_6 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_7 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_8 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_9 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_10 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_11 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_12 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_13 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_14 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_15 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_16 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_17 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_18 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_19 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
nombre_20 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cantidad_1 INT NULL,
cantidad_2 INT NULL,
cantidad_3 INT NULL,
cantidad_4 INT NULL,
cantidad_5 INT NULL,
cantidad_6 INT NULL,
cantidad_7 INT NULL,
cantidad_8 INT NULL,
cantidad_9 INT NULL,
cantidad_10 INT NULL,
cantidad_11 INT NULL,
cantidad_12 INT NULL,
cantidad_13 INT NULL,
cantidad_14 INT NULL,
cantidad_15 INT NULL,
cantidad_16 INT NULL,
cantidad_17 INT NULL,
cantidad_18 INT NULL,
cantidad_19 INT NULL,
cantidad_20 INT NULL,
respuesta_1 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_2 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_3 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_4 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_5 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_6 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_7 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_8 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_9 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_10 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_11 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_12 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_13 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_14 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_15 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_16 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_17 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_18 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_19 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
respuesta_20 VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
creado_el VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_usuario INT NULL,
nombre_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
modificado_el VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellout_Product (
sku VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
price_segment VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_family VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
company VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
customer_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pack_type VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_Product (
sku_code VARCHAR(11) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
SAP_description VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sku VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_family VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cigs_per_CT INT NULL,
company VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_category VARCHAR COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
CONSTRAINT PK_ProductSKU PRIMARY KEY (sku_code /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                                  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                         
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                          ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_Products (
sku_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
brand_family VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Reward (
reward_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_date DATETIME NULL,
reward_points INT NULL,
reward_contract_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_visit_activity_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_reward_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_internal_order_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_movement_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_customer_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_recipient VARCHAR(60) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_mod_date DATETIME NULL,
reward_DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_DDM_batch INT NULL,
reward_credit_note_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_RewardProduct (
reward_product_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_reward_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_product_conversion_rule_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_quantity INT NULL,
reward_product_points INT NULL,
reward_product_reason_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_mod_date DATETIME NULL,
reward_product_DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_product_DDM_batch INT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_RewardType (
reward_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_description VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_all_products BOOLEAN NULL,
reward_type_is_for_incentive BOOLEAN NULL,
reward_type_is_for_request_for_reward BOOLEAN NULL,
reward_type_is_for_direct_reward BOOLEAN NULL,
reward_type_customer_signature_required BOOLEAN NULL,
reward_type_movement_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_internal_order_type_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_print_output_definition_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_visibility_from DATETIME NULL,
reward_type_visibility_to DATETIME NULL,
reward_type_mod_user_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_mod_date DATETIME NULL,
reward_type_DDM_site_id VARCHAR(36) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
reward_type_DDM_batch INT NULL,
reward_type_is_for_credit_note_reward BOOLEAN NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellout_Sales (
customer_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pos_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
product_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_year VARCHAR(50) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_month VARCHAR(50) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
sales_date DATETIME NULL,
quantity BIGINT NULL,
box_qty DECIMAL(37, 3) NULL,
pack_qty DECIMAL(38, 3) NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_Sales (
invoice_num DECIMAL(10, 0) NOT NULL,
customer_code INT NOT NULL,
customer_bill_code INT NOT NULL,
sku_code VARCHAR(11) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
invoice_date DATETIME NOT NULL,
invoice_type VARCHAR(4) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
store VARCHAR(4) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
sales_qty DECIMAL(11, 3) NOT NULL,
sales_value DECIMAL(11, 3) NOT NULL,
sales_ct DECIMAL(11, 3) NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_SAStockOrders (
mercado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
id_stock_order BIGINT NULL,
id_punto_de_venta BIGINT NULL,
punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
numero_sap BIGINT NULL,
isla VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_de_punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
direccion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ciudad VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_postal VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
telefono VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
provincia VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_isms VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cerrado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
habilitar_la_visibilidad_del_call_center VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
estado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comentarios VARCHAR(4000) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
comentarios_de_rechazo VARCHAR(4000) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
creado DATETIME NULL,
recibido DATETIME NULL,
hora_recibida TIME NULL,
producto VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
operacion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cantidad BIGINT NULL,
latitude VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
longitude VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
hora_de_creacion TIME NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_SAStockPOS (
mercado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
id BIGINT NULL,
punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
isla VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_de_punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
direccion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
ciudad VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
zip_code VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
telefono VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
cerrado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
producto VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
disponible BIGINT NULL,
reservado BIGINT NULL,
rotos_en_el_pos BIGINT NULL,
bloqueado BIGINT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_pdm_SASwapOrders (
mercado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
dispositivos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
creado DATETIME NULL,
hora_de_creacion TIME(7) NULL,
fecha_de_recogida DATETIME NULL,
hora_de_recogida TIME(7) NULL,
cerrado DATETIME NULL,
hora_de_cerrado TIME(7) NULL,
estado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
documento_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
movil_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
id BIGINT NULL,
id_de_caso_dce VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
productos VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
origen VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_de_documento VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
motivo_de_cancelacion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
old_devices VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
direccion_de_punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
isla VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
tipo_de_punto_de_venta VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
provincia VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_isms VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
pos_cerrado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_SBClass (
sbclass_code VARCHAR(3) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
name VARCHAR(20) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_StockRemote (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
subject_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
activity VARCHAR(32) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
input_date DATETIME NULL,
value VARCHAR(64) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
question_code VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
question_desc VARCHAR(128) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_sellin_Stores (
store VARCHAR(4) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
description VARCHAR(30) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NOT NULL,
CONSTRAINT PK_plant PRIMARY KEY (store /*** MSC-WARNING - MSCEWI4011 - Column sorting is not supported in Snowflake ***/)
-- ** MSC-WARNING - MSCEWI1042 - Commented WITH INDEX - THIS IS NON-RELEVANT **
--                                                                                                                          WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
                                                                                                                                                                                                                                                 
-- ** MSC-WARNING - MSCEWI1042 - Commented ON PRIMARY - THIS IS NON-RELEVANT **
--                                                                                                                                                                                                                                                  ON PRIMARY
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_tmpSourceExport (
fileText TEXT COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_UserPos (
Digit_Record_ID VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
First_Name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Last_Name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Profile VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Username VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Active VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Account_Id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
Account_Name VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_wit_Usuarios (
codigo INT NULL,
email VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
descripcion VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
contact_id VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
es_propietario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
es_empleado VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_isms_Visitas (
client_id VARCHAR(100) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
commercial_name VARCHAR(70) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
visit_date DATETIME NULL,
visit_code VARCHAR(12) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);
CREATE TABLE IF NOT EXISTS $${db}.STAGING.load_ci_wit_Visitas (
codigo INT NULL,
fecha DATETIME NULL,
codigo_empresa INT NULL,
nombre_empresa VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_cliente INT NULL,
nombre_cliente VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
GPS_Latitud NUMERIC(18, 6) NULL,
GPS_longitud NUMERIC(18, 6) NULL,
respuestas INT NULL,
preguntas INT NULL,
mes INT NULL,
"a??o" INT NULL,
creado_el VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
codigo_usuario INT NULL,
nombre_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
email_usuario VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL,
modificado_el VARCHAR(255) COLLATE 'EN-CI-AS' /*** MSC-WARNING - MSCEWI4004 - COLLATION FOR VALUE CP1 NOT SUPPORTED ***/ NULL
,
_ETL_Load_Datetime  Timestamp,
_ETL_SOURCE  Varchar,
_ETL_Run_id  Number,
_ETL_Job_Id  Number,
Source_File_Name Varchar);