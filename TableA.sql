CREATE TABLE sscagentinvitationcode
(
  agentinvitationcodeid bigint NOT NULL DEFAULT nextval(('sequence_sscAgentInvitationCode'::text)::regclass),
  communityname character varying(255),
  invitationcode character varying(255),
  communitytype integer DEFAULT 0, -- Community Type including 0 = MENTIMUN, 1 = BNI, etc
  CONSTRAINT sscagentinvitationcode_pkey PRIMARY KEY (agentinvitationcodeid),
)