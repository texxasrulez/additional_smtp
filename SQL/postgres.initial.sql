/*
 * Roundcube Additional IMAP Schema
 *
 * @author Gene Hawkins <texxasrulez@yahoo.com>
 *
 * @licence GNU AGPL
 */

CREATE SEQUENCE additional_smtp_seq;

CREATE TABLE IF NOT EXISTS additional_smtp (
  id int check (id > 0) NOT NULL DEFAULT NEXTVAL ('additional_smtp_seq'),
  user_id int check (user_id > 0) NOT NULL,
  iid int check (iid > 0) NOT NULL,
  username varchar(256) DEFAULT NULL,
  password text,
  server varchar(256) DEFAULT NULL,
  enabled int check (enabled > 0) NOT NULL DEFAULT '0',
  nosavesent int check (nosavesent > 0) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=1 */;

CREATE INDEX user_id ON additional_smtp (user_id);
CREATE INDEX iid ON additional_smtp (iid);

ALTER TABLE additional_smtp
  ADD CONSTRAINT additional_smtp_ibfk_2 FOREIGN KEY (iid) REFERENCES identities (identity_id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT additional_smtp_ibfk_1 FOREIGN KEY (user_id) REFERENCES `users` (user_id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE additional_smtp_hosts_seq;

CREATE TABLE IF NOT EXISTS additional_smtp_hosts (
  id int NOT NULL DEFAULT NEXTVAL ('additional_smtp_hosts_seq'),
  domain varchar(255) NOT NULL,
  host varchar(255) DEFAULT NULL,
  ts timestamp(0) NOT NULL,
  PRIMARY KEY (id)
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=1 */;

REPLACE INTO `system` (name, value) SELECT ('tx-additional-smtp-version', '2020080200');
