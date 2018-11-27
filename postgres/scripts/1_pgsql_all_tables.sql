CREATE DATABASE umls OWNER postgres;

\c umls;
CREATE SCHEMA umls;

set search_path to umls;

/************************************************************** 
Add more things like user creation, change names or antying else here. I din't
 bother with chaning the user from postgres - but usally it is nice to do it.
***************************************************************/

CREATE TABLE MRCOLS (
	COL	varchar(20),
	DES	varchar(200),
	REF	varchar(20),
	MIN	int,
	AV	numeric(5,2),
	MAX	int,
	FIL	varchar(50),
	DTY	varchar(20),
	dummy char(1)
);
copy MRCOLS from '/data/MRCOLS.RRF' with delimiter as '|' null as '';
alter table mrcols drop column dummy;


CREATE TABLE MRCONSO (
	CUI	char(8) NOT NULL,
	LAT	char(3) NOT NULL,
	TS	char(1) NOT NULL,
	LUI	varchar(10) NOT NULL,
	STT	varchar(3) NOT NULL,
	SUI	varchar(10) NOT NULL,
	ISPREF	char(1) NOT NULL,
	AUI	varchar(9) NOT NULL,
	SAUI	varchar(50),
	SCUI	varchar(100),
	SDUI	varchar(100),
	SAB	varchar(40) NOT NULL,
	TTY	varchar(40) NOT NULL,
	CODE	varchar(100) NOT NULL,
	STR	text NOT NULL,
	SRL	int NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);
copy MRCONSO from '/data/MRCONSO.RRF' with delimiter as '|' null as '';
alter table mrconso drop column dummy;


CREATE TABLE MRCUI (
	CUI1	char(8) NOT NULL,
	VER	varchar(10) NOT NULL,
	REL	varchar(4) NOT NULL,
	RELA	varchar(100),
	MAPREASON	text,
	CUI2	char(8),
	MAPIN	char(1),
	dummy char(1)
);
copy MRCUI from '/data/MRCUI.RRF' with delimiter as '|' null as '';
alter table mrcui drop column dummy;


CREATE TABLE MRDEF (
	CUI	char(8) NOT NULL,
	AUI	varchar(9) NOT NULL,
	ATUI	varchar(11) NOT NULL,
	SATUI	varchar(50),
	SAB	varchar(40) NOT NULL,
	DEF	text NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);
copy MRDEF from '/data/MRDEF.RRF' with delimiter as '|' null as '';
alter table mrdef drop column dummy;


CREATE TABLE MRDOC (
	DOCKEY	varchar(50) NOT NULL,
	VALUE	varchar(200),
	TYPE	varchar(50) NOT NULL,
	EXPL	text,
	dummy char(1)
);
copy MRDOC from '/data/MRDOC.RRF' with delimiter as '|' null as '';
alter table mrdoc drop column dummy;


CREATE TABLE MRFILES (
	FIL	varchar(50),
	DES	varchar(200),
	FMT	text,
	CLS	int,
	RWS	int,
	BTS	bigint,
	dummy char(1)
);
copy MRFILES from '/data/MRFILES.RRF' with delimiter as '|' null as '';
alter table mrfiles drop column dummy;


CREATE TABLE MRHIER (
	CUI	char(8) NOT NULL,
	AUI	varchar(9) NOT NULL,
	CXN	int NOT NULL,
	PAUI	varchar(9),
	SAB	varchar(40) NOT NULL,
	RELA	varchar(100),
	PTR	text,
	HCD	varchar(150),
	CVF	int,
	dummy char(1)
);
copy MRHIER from '/data/MRHIER.RRF' with delimiter as '|' null as '';
alter table mrhier drop column dummy;


CREATE TABLE MRHIST (
	CUI	char(8) NOT NULL,
	SOURCEUI	varchar(50) NOT NULL,
	SAB	varchar(40) NOT NULL,
	SVER	varchar(20) NOT NULL,
	CHANGETYPE	text NOT NULL,
	CHANGEKEY	text NOT NULL,
	CHANGEVAL	text NOT NULL,
	REASON	text,
	CVF	int,
	dummy char(1)
);
copy MRHIST from '/data/MRHIST.RRF' with delimiter as '|' null as '';
alter table mrhist drop column dummy;


CREATE TABLE MRMAP (
	MAPSETCUI	char(8),
	MAPSETSAB	varchar(40),
	MAPSUBSETID	varchar(10),
	MAPRANK	int,
	MAPID	varchar(50),
	MAPSID	varchar(50),
	FROMID	varchar(50),
	FROMSID	varchar(50),
	FROMEXPR	text,
	FROMTYPE	varchar(50),
	FROMRULE	text,
	FROMRES	text,
	REL	varchar(4),
	RELA	varchar(100),
	TOID	varchar(50),
	TOSID	varchar(50),
	TOEXPR	text,
	TOTYPE	varchar(50),
	TORULE	text,
	TORES	text,
	MAPRULE	text,
	MAPRES	text,
	MAPTYPE	varchar(50),
	MAPATN	varchar(20),
	MAPATV	text,
	CVF	int,
	dummy char(1)
);
copy MRMAP from '/data/MRMAP.RRF' with delimiter as '|' null as '';
alter table mrmap drop column dummy;


CREATE TABLE MRRANK (
	RANK	int NOT NULL,
	SAB	varchar(40) NOT NULL,
	TTY	varchar(40) NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	dummy char(1)
);
copy MRRANK from '/data/MRRANK.RRF' with delimiter as '|' null as '';
alter table mrrank drop column dummy;


CREATE TABLE MRREL (
	CUI1	char(8) NOT NULL,
	AUI1	varchar(9),
	STYPE1	varchar(50) NOT NULL,
	REL	varchar(4) NOT NULL,
	CUI2	char(8) NOT NULL,
	AUI2	varchar(9),
	STYPE2	varchar(50) NOT NULL,
	RELA	varchar(100),
	RUI	varchar(10) NOT NULL,
	SRUI	varchar(50),
	SAB	varchar(40) NOT NULL,
	SL	varchar(40) NOT NULL,
	RG	varchar(10),
	DIR	varchar(1),
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);
copy MRREL from '/data/MRREL.RRF' with delimiter as '|' null as '';
alter table mrrel drop column dummy;


CREATE TABLE MRSAB (
	VCUI	char(8),
	RCUI	char(8),
	VSAB	varchar(100),
	RSAB	varchar(100),
	SON	text,
	SF	varchar(20),
	SVER	varchar(20),
	VSTART	char(10),
	VEND	char(10),
	IMETA	varchar(10),
	RMETA	varchar(10),
	SLC	text,
	SCC	text,
	SRL	int NOT NULL,
	TFR	int,
	CFR	int,
	CXTY	varchar(50),
	TTYL	varchar(200),
	ATNL	text,
	LAT	char(3),
	CENC	varchar(20),
	CURVER	char(1),
	SABIN	char(1),
	SSN	text,
	SCIT	text,
	dummy char(1)
);
copy MRSAB from '/data/MRSAB.RRF' with delimiter as '|' null as '';
alter table mrsab drop column dummy;


CREATE TABLE MRSAT (
	CUI	char(8) NOT NULL,
	LUI	varchar(10),
	SUI	varchar(10),
	METAUI	varchar(50),
	STYPE	varchar(50) NOT NULL,
	CODE	varchar(100),
	ATUI	varchar(11) NOT NULL,
	SATUI	varchar(50),
	ATN	varchar(100) NOT NULL,
	SAB	varchar(40) NOT NULL,
	ATV	text,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);
copy MRSAT from '/data/MRSAT.RRF' with delimiter as '|' null as '';
alter table mrsat drop column dummy;


CREATE TABLE MRSMAP (
	MAPSETCUI	char(8),
	MAPSETSAB	varchar(40),
	MAPID	varchar(50),
	MAPSID	varchar(50),
	FROMEXPR	text,
	FROMTYPE	varchar(50),
	REL	varchar(4),
	RELA	varchar(100),
	TOEXPR	text,
	TOTYPE	varchar(50),
	CVF	int,
	dummy char(1)
);
copy MRSMAP from '/data/MRSMAP.RRF' with delimiter as '|' null as '';
alter table mrsmap drop column dummy;


CREATE TABLE MRSTY (
	CUI	char(8) NOT NULL,
	TUI	char(4) NOT NULL,
	STN	varchar(100) NOT NULL,
	STY	varchar(50) NOT NULL,
	ATUI	varchar(11) NOT NULL,
	CVF	int,
	dummy char(1)
);
copy MRSTY from '/data/MRSTY.RRF' with delimiter as '|' null as '';
alter table mrsty drop column dummy;


CREATE TABLE MRXNS_ENG (
	LAT	char(3) NOT NULL,
	NSTR	text NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXNS_ENG from '/data/MRXNS_ENG.RRF' with delimiter as '|' null as '';
alter table mrxns_eng drop column dummy;


CREATE TABLE MRXNW_ENG (
	LAT	char(3) NOT NULL,
	NWD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXNW_ENG from '/data/MRXNW_ENG.RRF' with delimiter as '|' null as '';
alter table mrxnw_eng drop column dummy;


CREATE TABLE MRAUI (
	AUI1	varchar(9) NOT NULL,
	CUI1	char(8) NOT NULL,
	VER	varchar(10) NOT NULL,
	REL	varchar(4),
	RELA	varchar(100),
	MAPREASON	text NOT NULL,
	AUI2	varchar(9) NOT NULL,
	CUI2	char(8) NOT NULL,
	MAPIN	char(1) NOT NULL,
	dummy char(1)
);
copy MRAUI from '/data/MRAUI.RRF' with delimiter as '|' null as '';
alter table mraui drop column dummy;


CREATE TABLE MRXW_BAQ (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_BAQ from '/data/MRXW_BAQ.RRF' with delimiter as '|' null as '';
alter table mrxw_baq drop column dummy;


CREATE TABLE MRXW_CZE (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_CZE from '/data/MRXW_CZE.RRF' with delimiter as '|' null as '';
alter table mrxw_cze drop column dummy;


CREATE TABLE MRXW_DAN (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_DAN from '/data/MRXW_DAN.RRF' with delimiter as '|' null as '';
alter table mrxw_dan drop column dummy;


CREATE TABLE MRXW_DUT (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_DUT from '/data/MRXW_DUT.RRF' with delimiter as '|' null as '';
alter table mrxw_dut drop column dummy;


CREATE TABLE MRXW_ENG (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_ENG from '/data/MRXW_ENG.RRF' with delimiter as '|' null as '';
alter table mrxw_eng drop column dummy;


CREATE TABLE MRXW_FIN (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_FIN from '/data/MRXW_FIN.RRF' with delimiter as '|' null as '';
alter table mrxw_fin drop column dummy;


CREATE TABLE MRXW_FRE (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_FRE from '/data/MRXW_FRE.RRF' with delimiter as '|' null as '';
alter table mrxw_fre drop column dummy;


CREATE TABLE MRXW_GER (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_GER from '/data/MRXW_GER.RRF' with delimiter as '|' null as '';
alter table mrxw_ger drop column dummy;


CREATE TABLE MRXW_HEB (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_HEB from '/data/MRXW_HEB.RRF' with delimiter as '|' null as '';
alter table mrxw_heb drop column dummy;


CREATE TABLE MRXW_HUN (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_HUN from '/data/MRXW_HUN.RRF' with delimiter as '|' null as '';
alter table mrxw_hun drop column dummy;


CREATE TABLE MRXW_ITA (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_ITA from '/data/MRXW_ITA.RRF' with delimiter as '|' null as '';
alter table mrxw_ita drop column dummy;


CREATE TABLE MRXW_JPN (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_JPN from '/data/MRXW_JPN.RRF' with delimiter as '|' null as '';
alter table mrxw_jpn drop column dummy;


CREATE TABLE MRXW_NOR (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_NOR from '/data/MRXW_NOR.RRF' with delimiter as '|' null as '';
alter table mrxw_nor drop column dummy;


CREATE TABLE MRXW_POR (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_POR from '/data/MRXW_POR.RRF' with delimiter as '|' null as '';
alter table mrxw_por drop column dummy;


CREATE TABLE MRXW_RUS (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_RUS from '/data/MRXW_RUS.RRF' with delimiter as '|' null as '';
alter table mrxw_rus drop column dummy;


CREATE TABLE MRXW_SPA (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_SPA from '/data/MRXW_SPA.RRF' with delimiter as '|' null as '';
alter table mrxw_spa drop column dummy;


CREATE TABLE MRXW_SWE (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	varchar(10) NOT NULL,
	SUI	varchar(10) NOT NULL,
	dummy char(1)
);
copy MRXW_SWE from '/data/MRXW_SWE.RRF' with delimiter as '|' null as '';
alter table mrxw_swe drop column dummy;


CREATE TABLE AMBIGSUI (
	SUI	varchar(10) NOT NULL,
	CUI	char(8) NOT NULL,
	dummy char(1)
);
copy AMBIGSUI from '/data/AMBIGSUI.RRF' with delimiter as '|' null as '';
alter table ambigsui drop column dummy;


CREATE TABLE AMBIGLUI (
	LUI	varchar(10) NOT NULL,
	CUI	char(8) NOT NULL,
	dummy char(1)
);
copy AMBIGLUI from '/data/AMBIGLUI.RRF' with delimiter as '|' null as '';
alter table ambiglui drop column dummy;

