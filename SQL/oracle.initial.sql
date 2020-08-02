/*
 * Roundcube Additional IMAP Schema
 *
 * @author Gene Hawkins <texxasrulez@yahoo.com>
 *
 * @licence GNU AGPL
 */

CREATE TABLE additional_smtp (
  id number(10) check (id > 0) NOT NULL,
  user_id number(10) check (user_id > 0) NOT NULL,
  iid number(10) check (iid > 0) NOT NULL,
  username varchar2(256) DEFAULT NULL,
  password clob,
  server varchar2(256) DEFAULT NULL,
  enabled number(10) DEFAULT '0' check (enabled > 0) NOT NULL,
  nosavesent number(10) DEFAULT '0' check (nosavesent > 0) NOT NULL,
  PRIMARY KEY (id)
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=1 */;

-- Generate ID using sequence and trigger
CREATE SEQUENCE additional_smtp_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER additional_smtp_seq_tr
 BEFORE INSERT ON additional_smtp FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT additional_smtp_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE INDEX user_id ON additional_smtp (user_id);
CREATE INDEX iid ON additional_smtp (iid);

ALTER TABLE additional_smtp
  ADD CONSTRAINT additional_smtp_ibfk_2 FOREIGN KEY (iid) REFERENCES identities (identity_id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT additional_smtp_ibfk_1 FOREIGN KEY (user_id) REFERENCES `users` (user_id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE additional_smtp_hosts (
  id number(10) NOT NULL,
  domain varchar2(255) NOT NULL,
  host varchar2(255) DEFAULT NULL,
  ts timestamp(0) NOT NULL,
  PRIMARY KEY (id)
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=1 */;

-- Generate ID using sequence and trigger
CREATE SEQUENCE additional_smtp_hosts_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER additional_smtp_hosts_seq_tr
 BEFORE INSERT ON additional_smtp_hosts FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT additional_smtp_hosts_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

REPLACE INTO `system` (name, value) SELECT  'tx-additional-smtp-version', '2020080200'  FROM dual;
