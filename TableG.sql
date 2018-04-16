CREATE TABLE sscorder
(
  orderid bigint NOT NULL DEFAULT nextval(('sequence_sscOrder'::text)::regclass),  --taken
  vendorid bigint DEFAULT 0,		--taken
  ordernumber bigint,					--taken
  completed character varying(100),		--taken
  timestamporderpaid character varying(45),		--taken
  warunguserid integer,		--taken
  CONSTRAINT sscorder_pkey PRIMARY KEY (orderid)
)