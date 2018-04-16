CREATE TABLE sscwarunguser
(
  warunguserid integer NOT NULL DEFAULT nextval(('sequence_sscWarungUser'::text)::regclass),
  userid integer NOT NULL,
  warungid integer NOT NULL,
  CONSTRAINT sscwarunguser_pkey PRIMARY KEY (warunguserid)
)