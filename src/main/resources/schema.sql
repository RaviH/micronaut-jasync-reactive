
-- Create syntax for TABLE 'hibernate_sequence'
CREATE TABLE `hibernate_sequence` (
  `next_val` BIGINT(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'service'
CREATE TABLE `service` (
  `id` BIGINT(20) NOT NULL,
  `call_sign` VARCHAR(255) DEFAULT NULL,
  `created_date` DATETIME DEFAULT NULL,
  `hd` BIT(1) NOT NULL,
  `i_guide_id` VARCHAR(255) DEFAULT NULL,
  `last_modified_date` DATETIME DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `passport_id` VARCHAR(255) DEFAULT NULL,
  `premium` BIT(1) NOT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  `tms_id` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'site'
CREATE TABLE `site` (
  `id` BIGINT(20) NOT NULL,
  `code` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `time_zone` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'channel'
CREATE TABLE `channel` (
  `id` BIGINT(20) NOT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `number` INT(11) DEFAULT NULL,
  `service_id` BIGINT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKivhd2ddda6l0gdqbviqvrr4wo` (`service_id`),
  CONSTRAINT `FKivhd2ddda6l0gdqbviqvrr4wo` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'channel_attribute'
CREATE TABLE `channel_attribute` (
  `id` BIGINT(20) NOT NULL,
  `channel_attr` VARCHAR(255) DEFAULT NULL,
  `channel_attr_value` VARCHAR(255) DEFAULT NULL,
  `channel_id` BIGINT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7a22iklisx6832qbwjdd9w2p6` (`channel_id`),
  CONSTRAINT `FK7a22iklisx6832qbwjdd9w2p6` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


-- Create syntax for TABLE 'lineup'
CREATE TABLE `lineup` (
  `id` BIGINT(20) NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `lineup_id` INT(11) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `site_id` BIGINT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK21b0j7jp46rv2qrtvr7pfrc09` (`site_id`),
  CONSTRAINT `FK21b0j7jp46rv2qrtvr7pfrc09` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'lineup_channel'
CREATE TABLE `lineup_channel` (
  `lineup_id` BIGINT(20) NOT NULL,
  `channels_id` BIGINT(20) NOT NULL,
  KEY `FKirmrvhhr5dy7hqgryf78p9tcy` (`lineup_id`),
  CONSTRAINT `FK57oayavpn8k4alknb3ut3dsy3` FOREIGN KEY (`channels_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `FKirmrvhhr5dy7hqgryf78p9tcy` FOREIGN KEY (`lineup_id`) REFERENCES `lineup` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;



