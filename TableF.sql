CREATE TABLE sscorderitem
(
  orderitemid bigint NOT NULL DEFAULT nextval(('sequence_sscOrderItem'::text)::regclass),
 orderid bigint,		
 quantity bigint NOT NULL, 
  productid bigint,		
  unitprice numeric(20,4),	
  pricefromdealerbeforetaxed numeric(16,2),		
  taxtype integer,		
  CONSTRAINT sscorderitem_pkey PRIMARY KEY (orderitemid),
)