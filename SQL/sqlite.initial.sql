/*
 * Roundcube Additional SMTP Schema
 *
 * @author Gene Hawkins <texxasrulez@yahoo.com>
 *
 * @licence GNU AGPL
 */

-- import to SQLite by running: sqlite3.exe db.sqlite3 -init sqlite.sql

PRAGMA journal_mode = MEMORY;
PRAGMA synchronous = OFF;
PRAGMA foreign_keys = OFF;
PRAGMA ignore_check_constraints = OFF;
PRAGMA auto_vacuum = NONE;
PRAGMA secure_delete = OFF;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS 'additional_smtp' (
'id' INTEGER NOT NULL PRIMARY KEY ASC,
'user_id' INTEGER NOT NULL,
'iid' INTEGER NOT NULL,
'username' TEXT DEFAULT NULL,
'password' text,
'server' TEXT DEFAULT NULL,
'enabled' INTEGER NOT NULL DEFAULT '0',
FOREIGN KEY ('user_id') REFERENCES 'users'
('user_id') ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE additional_smtp ADD nosavesent SMALLINT NOT NULL DEFAULT '0';
CREATE TABLE IF NOT EXISTS 'additional_smtp_hosts' (
'id' INTEGER NOT NULL PRIMARY KEY ASC,
'domain' TEXT NOT NULL,
'host' TEXT DEFAULT NULL,
'ts' datetime NOT NULL
);
CREATE INDEX additional_smtp_iid ON 'additional_smtp'('iid');





COMMIT;
PRAGMA ignore_check_constraints = ON;
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;
