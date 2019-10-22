
-- Drop table

-- DROP TABLE service;

CREATE TABLE service (
	id int8 NOT NULL,
	call_sign varchar(255) NULL,
	created_date timestamp NULL,
	hd bool NOT NULL,
	i_guide_id varchar(255) NULL,
	last_modified_date timestamp NULL,
	"name" varchar(255) NULL,
	passport_id varchar(255) NULL,
	premium bool NOT NULL,
	status varchar(255) NULL,
	tms_id varchar(255) NULL,
	CONSTRAINT service_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE site;

CREATE TABLE site (
	id int8 NOT NULL,
	code varchar(255) NULL,
	"name" varchar(255) NULL,
	time_zone varchar(255) NULL,
	CONSTRAINT site_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE channel;

CREATE TABLE channel (
	id int8 NOT NULL,
	"name" varchar(255) NULL,
	"number" int4 NULL,
	service_id int8 NULL,
	CONSTRAINT channel_pkey PRIMARY KEY (id),
	CONSTRAINT fkivhd2ddda6l0gdqbviqvrr4wo FOREIGN KEY (service_id) REFERENCES service(id)
);

-- Drop table

-- DROP TABLE channel_attribute;

CREATE TABLE channel_attribute (
	id int8 NOT NULL,
	channel_attr varchar(255) NULL,
	channel_attr_value varchar(255) NULL,
	channel_id int8 NULL,
	CONSTRAINT channel_attribute_pkey PRIMARY KEY (id),
	CONSTRAINT fk7a22iklisx6832qbwjdd9w2p6 FOREIGN KEY (channel_id) REFERENCES channel(id)
);

-- Drop table

-- DROP TABLE lineup;

CREATE TABLE lineup (
	id int8 NOT NULL,
	description varchar(255) NULL,
	lineup_id int4 NULL,
	"name" varchar(255) NULL,
	site_id int8 NULL,
	CONSTRAINT lineup_pkey PRIMARY KEY (id),
	CONSTRAINT fk21b0j7jp46rv2qrtvr7pfrc09 FOREIGN KEY (site_id) REFERENCES site(id)
);

-- Drop table

-- DROP TABLE lineup_channel;

CREATE TABLE lineup_channel (
	lineup_id int8 NOT NULL,
	channels_id int8 NOT NULL,
	CONSTRAINT fk57oayavpn8k4alknb3ut3dsy3 FOREIGN KEY (channels_id) REFERENCES channel(id),
	CONSTRAINT fkirmrvhhr5dy7hqgryf78p9tcy FOREIGN KEY (lineup_id) REFERENCES lineup(id)
);
