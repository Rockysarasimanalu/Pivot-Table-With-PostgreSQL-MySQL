CREATE TABLE sscmpmcustomerdata
(
  mpmcustomerdataid bigint NOT NULL DEFAULT nextval(('sequence_sscMPMCustomerData'::text)::regclass), 
  mpmcustomerid character varying(30),
  mpmcustomername character varying(255),	
  CONSTRAINT sscmpmcustomerdata_pkey PRIMARY KEY (mpmcustomerdataid),
)