-- Author : Dominic Giles
-- Date : 21/7/2016
-- File : create_tables.sql
-- Description : Relational table definitions and test data for ORDS Demo
-- Run As : This script should be run by the app user. soe in this example

DROP TABLE PRODUCT_INFORMATION purge;
DROP TABLE USER_LIKES purge;

CREATE TABLE PRODUCT_INFORMATION
  (
    PRODUCT_ID          NUMBER(6) CONSTRAINT PRODUCT_PRODUCT_ID_NN NOT NULL,
    PRODUCT_NAME        VARCHAR2(50) CONSTRAINT PRODUCT_PRODUCT_NAME_NN NOT NULL,
    PRODUCT_DESCRIPTION VARCHAR2(200),
    CATEGORY_ID         NUMBER(4) CONSTRAINT PRODUCT_CATEGORY_ID_NN NOT NULL,
    WEIGHT_CLASS        NUMBER(1),
    WARRANTY_PERIOD     INTERVAL YEAR (2) TO MONTH,
    SUPPLIER_ID         NUMBER(6),
    PRODUCT_STATUS      VARCHAR2(20),
    LIST_PRICE          NUMBER(8,2),
    MIN_PRICE           NUMBER(8,2),
    CATALOG_URL         VARCHAR2(50),
    CONSTRAINT PRODUCT_STATUS_LOV CHECK (product_status IN ('orderable' ,'planned' ,'under development' ,'obsolete')),
    CONSTRAINT PRODUCT_INFORMATION_PK PRIMARY KEY (PRODUCT_ID) USING INDEX
  );

CREATE TABLE USER_LIKES
  (
    USER_ID             VARCHAR2(60 BYTE) NOT NULL ,
    LIKE_TABLE          VARCHAR2(20 BYTE) NOT NULL ,
    ROW_LIKED           VARCHAR2(20 BYTE) NOT NULL ,
    CONSTRAINT USER_LIKES_PK PRIMARY KEY (USER_ID,LIKE_TABLE,ROW_LIKED)
  )
  ORGANIZATION INDEX;

Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('eddie.dean','product_information','1');
Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('jake.chambers','product_information','1');
Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('jake.chambers','product_information','2');
Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('alain.johns','product_information','1');
Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('jake.chambers','product_information','7');
Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('cuthbert.allgood','product_information','8');
Insert into USER_LIKES (USER_ID,LIKE_TABLE,ROW_LIKED) values ('dominic.giles','product_information','6');

Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (1,'G kH7Er6UJY58 PMd','Zy9qEonVn3 OxXJ6J 3XU2 8GOA831k5kVtzxxbjxDxO7iBIvqPgXtitfz4hLHhnZ4dPE9yyzQn qzs8oOay5m5aQRETfeEK tGNBZKFeH6WCPQCQr6 ullqbX D',130,7,'+68-01',533637,'orderable',4257,357,'0BARd3VvczAJqfcVEX7AJG2N9y13qfx');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (2,'cgLdYRMM Bpz','E GC0Qw30D9d2Xyz38cn AaC16t pR i49WVDsiHkCY6Ia8rou7HexIdG5  jRfPWL',38,7,'+85-01',668589,'under development',4824,2742,'HSgmIfaSLYBxzSK62x');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (3,'m KbW8Vxrg3guoHdrSx7iEMms9JP8H8t74','QLwUeKNrwTCp 2DCKJYUaYaZ3SkIbPHP6SjFi goexRk0pdDTRVUD1Gbv8G2mqupnUsurX1P7loyAZcf2zXR Dj 1L3x2YXu1HaikKpNTIpt',138,2,'+83-01',749271,'obsolete',2452,4583,'4Qbuie765FmPUhCX');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (4,'i   JsQjG dBEOjarYV','F9plE77 SLay9y64IK6 fGR3b k 7wtz9Tla6NM9YKR5  yebbM4IUZ ICLDzZGyonetFjxcCwA8',164,7,'+86-01',606942,'planned',172,663,'RwoyxZmL4aqhXTNzghTHqiD7uQ6o');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (5,'xmypABVINBpn G4PUvL drqee X7iRm','HOrm  25e5D8zyV7SsTF CBGq3kzjpd0J 9C3FLIAqurceyT99rc ZBN5J iismTyBw 42BdwyScXaHprkNGIcS',15,8,'+18-01',387725,'orderable',2494,1410,'Uz5kJ7SYhnQH7SgjDrw');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (6,'0bHJxG9ldS','g4yonnd8JZw7HBpYWBtFIOZpAG64uAgRNpQ0KU0Z39HTbT1B9Lpqj 4Dt9  I9ZBC0VTN J9p yQ5 MNVBF IE5DjyX1Ywdm zxU  4Tqwfdy',127,9,'+86-01',450396,'under development',3903,3923,'lOoHU5jnRbdz0oCsQAeU2ACQfd');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (7,'yiwHQh3VptRXiLbdvjXgaBwpvFaaKa qmU','Xcb8ExVj7taB3dI1QBA3mbSwwCE6LdA7EkJRE2yO5pPtzXenwiDPAqFC07AR',135,8,'+75-01',155193,'planned',2899,2063,'0twXTD7FFd8');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (8,'q ym1JA9SGlRs','U4p9Cgtcar g 7NF1NoSdhYdXCOdlZuA07CN BZhfEbQIJ3jy 6zaX77otVHI0B9ftS yiUzAJTh6CGGMLzkvbXVz5yAqKdqj9oagNfY6wi4tUUJUL115 9VieVGwg5 IdpWWli',121,3,'+61-01',119093,'planned',4173,3277,'KWWfTW4Jd7TD7fj3PUfotKaWJBqB');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (9,'R 3egAKUB9NFOz','uNhMw0wz1PXMB0SXkN4OsgVugT6jYCX5EGkbjUH95yoDTGve2AyZRHq',10,5,'+32-01',573446,'under development',4279,221,'0RRFzMCFc');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (10,'TKfpcApYIIWdxpjkN lmh9ihH',' v4ESSKm1vlREPhLTsRct 0 DBkA9oRZ Q   mXOwwA4QRqc3ecBFBZCbU9nsRyx1y1d KPb1ckK9cZ4rZgpMjFEA1CHtyv0FHMkHX RzLLa cMJBPVfZODxN w l9iVspZIhsY8CxjcXP',23,4,'+69-01',230466,'under development',4303,1739,'BrImPj1tb8bvkWnlBz6mqgC');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (11,'l EDpILtiBO qkb0 ','8fjQ7oRYFZrZPPZzhizxE4 N j78Gg1GcZzfMG2Gdq9RUITU V222Q9sDWrY',171,9,'+72-01',97761,'orderable',2146,4148,'jYephsVgLz5r');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (12,'r8B9JWAVnGlJ tMEwhfr x0 zPusXX','aBdR2t NV VljlDn301DsLJ SdM eQvSfUETJKs rrWshlxKtXHET7',31,2,'+36-01',300569,'under development',1160,3036,'05R4GcZ5zMPtQ5ZATP2h1');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (13,'i TSN7bgvgZK 0jq0qhMGS2N','2P7zJ9tqdhuqlhqQVpDJ W0c yFu8uSepnpsdA1w2nkM22rxFT1tSZAu0TvHOS  SiZcFrzOsAwLPrlGp3zQ jwV5OZ  p5e6yXgMoeNSCErC ',73,1,'+42-01',886541,'under development',2107,1721,'i6x4AOs1NmJH');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (14,'quPZpFYTwFkdEbRlNqbCUwS','0FVBqYlJx5u2h 7uyv1Tq9rOYUUiAqa0LzkP 1csC3CAVInW1PPzkUT2Y',61,4,'+79-01',250969,'planned',40,2921,'rZHN5TbnhF');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (15,'C9jh Y2 p4NJr ue','YyFEOT7vIQNyU6mOeaaZJFuFQ AMRcQ yXl8r5xJcYq RFdBYb3z rQ33b gdfOn MptH10a hu0bumEI1v5hcB8gMjgcYtl',108,9,'+39-01',170087,'obsolete',2738,3417,'PbbyQPUN3MoApUqBRnR4t1X1h6IS');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (16,'iuGc5SjLdfNaVVebvAJDd','eDQ7WU01gG1Hs0fQTXIm Upu7e2 2g jbO7HcZeMLOu26UhxrOy',157,3,'+15-01',599371,'orderable',291,2290,'uxsnrXl4OkK');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (17,'rA y Q6R7cqt7rqn 4ohMWdUHBG2 Ikpwt','OalOGjPxYKF8FMN0QHLXMzWdauLSYbzkGq rKv9Q1EH6w5P9jN Q2NLlYgY4a336f5PD2z1F6OMF PT31hD3dS0 B7K46gGe3xCi9Iz9iTSP8ZH1k Gq',20,1,'+78-01',370828,'obsolete',4907,1894,'MV6pYkeIfybxMXauVRfUf2');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (18,'gENoDlBPhJi','x XLX49r0b1uZV TxAiJFqkd0 dyoN2QrYqE5jhOk 0vwxvx1F7lJpG GTeS26 Dw5 gF',142,1,'+55-01',205415,'under development',2749,1993,'orGpbjoxz');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (19,'FZz0pqSlfFoGZHft05gGOu7JkLWNFLn',' UZJFJfjqc vCyo BSae0YUjQ edevSgQz2zmNbGVltX ARqjKBh1wYee5UkK3J mlly91JOPzCXnduRFc53l6CY7gc1st8UrXmEo9AFmZzpACcat',30,7,'+79-01',408560,'obsolete',132,3952,'CXBnqj6');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (20,'gcwXMRKlXUd i','R7UjvD6ZmIYPADJWJ8Os9 xSrrNJE60 bDZ P8xSrjsyLhnIZnjrUTcn  iFneDc nyVuORQ89Zy6Z 1y6wMYkLoX6rCg',11,2,'+49-01',420503,'obsolete',395,3924,'nVlncmKD5WHc8wb11');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (21,'clRSpaO N0T gPTzdE','tbklT  1Otb2V0bl 3qKrhJe4VMR06dqOdNeyRmQYG 8XGTNPnB87  f3h9A9niuy58ZWIC0tjrrvPkUeLORuAeBCQBd',114,6,'+03-01',594215,'planned',293,4055,'myGCoiJuvAJOc1lsjlb');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (22,'JoFRPfqUMoWZ2wIk1','EXsHpCU72S3e80AwcAd5fIRdVStVCfjAdR8dX5xMUFkPStukclmH2I1ZDqOZy3R13jadOIWaDAr2wJuS85BSNp Z',166,7,'+19-01',872884,'obsolete',4115,2245,'8GNNTBRS');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (23,'EiYn 3FPSFzYC8ZJm3','Qj5s783 xC1pLsOmeKQHbF7V8 JPphAh4 H  kvHk7hush9KFiWOX0neYMb9UNZNHzA4440n1 nTGxcgBK585eds6L8h4VafxAse1Uy zD  TORtOcAq UDCHDxUZ0tIFgpDEAP0XZoK3NKRy91K',101,4,'+75-01',466296,'orderable',3156,1962,'KD6AbOtY');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (24,'W4jfN Ip5ug mFZ3uymEFambZd8xrS4','a 1XJ3M rofCBZC3a5nAAnGMqiD4pqqcX5xyhFHVJK1GppMJTBQFotegN5EFuCo8ibD10HuIr Y7t8O8xTgKq a0JUyDeUfSk4M4RcqhfGngMfF lAVOZMd5 Y4pJxukq2zs7ypjUK',49,5,'+10-01',962583,'orderable',1467,3153,'uxKL8qd9YbyGsP0LhPihz');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (25,'YYuOcd6WrFhtw1k 9F B 5G0sbmsr','M5R9 eqNzwOqYJ44B91jWl9FMTJ7Tn kQI3mp9 A Lqn vn40MI8LlmV0 HWffRI l4yqrtwuedGpATJQPIuwQwVVILcq',147,8,'+78-01',855246,'under development',174,4243,'tM4PaIB4BjMryk4YB8f1t5');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values (26,'V9zKgIK88E zZHm EHNzqPA 7uarp7GT','F UVnPpwaXPdO1oxjg7jg9HtY0DGLcu3E0Vm9 mzdnygyxnDd I9xeIchZm24x8ZTp6cORWByPKvq0eeLj9swRe9Ekabt4tOQz6dvtW 9J 2cdePuBB8omiEfrC0egI VPfbkO45z5ME',186,2,'+91-01',451682,'obsolete',4035,4135,'bkmBgfW1p');

commit;