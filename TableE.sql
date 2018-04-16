CREATE TABLE product
(
  productid bigint NOT NULL DEFAULT nextval(('sequence_sscProduct'::text)::regclass),
  name character varying(255),
  lotteproductcode character varying(100),
  CONSTRAINT sscproduct_pkey PRIMARY KEY (productid),
)