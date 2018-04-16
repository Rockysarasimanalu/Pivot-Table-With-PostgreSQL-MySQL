CREATE TABLE sscwarung
(
  warungid integer NOT NULL DEFAULT nextval(('sequence_sscWarung'::text)::regclass),
  agentinvitationcodeid integer,		--taken
  CONSTRAINT sscwarung_pkey PRIMARY KEY (warungid)
)