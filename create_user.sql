-- Author : Dominic Giles
-- Date : 21/7/2016
-- File : create_user.sql
-- Description : Create database user and tablespace soe for ORDS Demo
-- Run As : This script should be run by a user with DBA privileges i.e. sys or system

CREATE TABLESPACE soe DATAFILE SIZE 100M;

CREATE USER soe IDENTIFIED BY soe;

ALTER USER soe QUOTA UNLIMITED ON soe;
ALTER USER soe DEFAULT TABLESPACE soe;
GRANT CONNECT TO soe;
GRANT CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO soe;
