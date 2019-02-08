/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     6/02/2019 10:12:21 p. m.                     */
/*==============================================================*/


alter table ACCIONPERMITIDA
   drop constraint FK_ACCIONPE_REFERENCE_ACCIONP;

alter table ACCIONPERMITIDAPLANTILLA
   drop constraint FK_ACCIONPE_REFERENCE_ACCIONPE;

alter table ACCIONPERMITIDAPLANTILLA
   drop constraint FK_ACCIONPE_REFERENCE_PLANTILL;

alter table ACCIONPERMITIDAPORUSUARIO
   drop constraint FK_ACCIONPE_REFERENCE_USUARIO;

alter table ACCIONPERMITIDAPORUSUARIO
   drop constraint FK_ACCIONPE_REFERENCE_ACCIO;

alter table DEPARTAMENTO
   drop constraint FK_DEPARTAM_REFERENCE_PAIS;

alter table ESTADOUSUARIO
   drop constraint FK_ESTADOUS_REFERENCE_ESTADO;

alter table ESTADOUSUARIO
   drop constraint FK_ESTADOUS_REFERENCE_USUARIO;

alter table MUNICIPIO
   drop constraint FK_MUNICIPI_REFERENCE_DEPARTAM;

alter table PERSONA
   drop constraint FK_PERSONA_REFERENCE_MUNICIPI;

alter table TELEFONO
   drop constraint FK_TELEFONO_REFERENCE_PERSONA;

alter table TELEFONO
   drop constraint FK_TELEFONO_REFERENCE_TIPOTELE;

alter table USUARIO
   drop constraint FK_USUARIO_REFERENCE_PERSONA;

drop index UNIQUE_CODIGO;

drop table ACCIONPERMITIDA cascade constraints;

drop table ACCIONPERMITIDAPLANTILLA cascade constraints;

drop table ACCIONPERMITIDAPORUSUARIO cascade constraints;

drop index UNIQUE_CODIGODEPTO;

drop table DEPARTAMENTO cascade constraints;

drop index UNIQUE_CODIGOESTADO;

drop table ESTADO cascade constraints;

drop table ESTADOUSUARIO cascade constraints;

drop index UNIQUE_CODIGOMUNICIPIO;

drop table MUNICIPIO cascade constraints;

drop index UNIQUE_CODIGOPAIS;

drop table PAIS cascade constraints;

drop index UNIQUE_CORREO;

drop index UNIQUE_IDENTIFICACION;

drop table PERSONA cascade constraints;

drop index UNIQUE_CODIGOAP;

drop table PLANTILLAACCIONPERMITIDA cascade constraints;

drop table TELEFONO cascade constraints;

drop index UNIQUE_TIPOTELEFONO;

drop table TIPOTELEFONO cascade constraints;

drop index UNIQUE_NOMBREUSUARIO;

drop table USUARIO cascade constraints;

drop sequence SQACCIONPERMITIDA;

drop sequence SQACCIONPERMITIDAPLANTILLA;

drop sequence SQACCIONPORUSUARIO;

drop sequence SQDEPARTAMENTO;

drop sequence SQESTADO;

drop sequence SQESTADOUSUARIO;

drop sequence SQMUNICIPIO;

drop sequence SQPAIS;

drop sequence SQPERSONA;

drop sequence SQPLANTILLAACCIONPERMITIDA;

drop sequence SQTELEFONO;

drop sequence SQTIPOTELEFONO;

drop sequence SQUSUARIO;

create sequence SQACCIONPERMITIDA
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQACCIONPERMITIDAPLANTILLA
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQACCIONPORUSUARIO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQDEPARTAMENTO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQESTADO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQESTADOUSUARIO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQMUNICIPIO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQPAIS
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQPERSONA
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQPLANTILLAACCIONPERMITIDA
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQTELEFONO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQTIPOTELEFONO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

create sequence SQUSUARIO
increment by 1
start with 1
 minvalue 1
nocycle
 nocache;

/*==============================================================*/
/* Table: ACCIONPERMITIDA                                       */
/*==============================================================*/
create table ACCIONPERMITIDA 
(
   PK_ACCIONPERMITIDA   NUMBER               not null,
   FK_ACCIONPERMITIDA   NUMBER,
   CODIGO               VARCHAR2(20)         not null,
   DESCRIPCION          VARCHAR2(500)        not null,
   RUTA                 VARCHAR2(500)        not null,
   constraint PK_ACCIONPERMITIDA primary key (PK_ACCIONPERMITIDA)
);

/*==============================================================*/
/* Index: UNIQUE_CODIGO                                         */
/*==============================================================*/
create unique index UNIQUE_CODIGO on ACCIONPERMITIDA (
   CODIGO ASC
);

/*==============================================================*/
/* Table: ACCIONPERMITIDAPLANTILLA                              */
/*==============================================================*/
create table ACCIONPERMITIDAPLANTILLA 
(
   PK_ACCIONPERMITIDAPLANTILLA NUMBER(6)            not null,
   FK_ACCIONPERMITIDA   NUMBER               not null,
   FK_PLANTILLAACCIONPERMITIDA INTEGER              not null,
   constraint PK_ACCIONPERMITIDAPLANTILLA primary key (PK_ACCIONPERMITIDAPLANTILLA)
);

/*==============================================================*/
/* Table: ACCIONPERMITIDAPORUSUARIO                             */
/*==============================================================*/
create table ACCIONPERMITIDAPORUSUARIO 
(
   PK_ACCPERUSU         NUMBER               not null,
   FK_USUARIO           NUMBER               not null,
   FK_ACCIONPERMITIDA   NUMBER               not null,
   constraint PK_ACCIONPERMITIDAPORUSUARIO primary key (PK_ACCPERUSU)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   PK_DEPARTAMENTO      NUMBER               not null,
   FK_PAIS              NUMBER               not null,
   CODIGO               NVARCHAR2(20)        not null,
   NOMBRE               NVARCHAR2(100)       not null,
   constraint PK_DEPARTAMENTO primary key (PK_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: UNIQUE_CODIGODEPTO                                    */
/*==============================================================*/
create unique index UNIQUE_CODIGODEPTO on DEPARTAMENTO (
   CODIGO ASC
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO 
(
   PK_ESTADO            NUMBER               not null,
   CODIGO               VARCHAR2(20)         not null,
   DESCRIPCION          VARCHAR2(100)        not null,
   constraint PK_ESTADO primary key (PK_ESTADO)
);

/*==============================================================*/
/* Index: UNIQUE_CODIGOESTADO                                   */
/*==============================================================*/
create unique index UNIQUE_CODIGOESTADO on ESTADO (
   CODIGO ASC
);

/*==============================================================*/
/* Table: ESTADOUSUARIO                                         */
/*==============================================================*/
create table ESTADOUSUARIO 
(
   PK_ESTADOUSUARIO     NUMBER               not null,
   FK_USUARIO           NUMBER               not null,
   FK_ESTADO            NUMBER               not null,
   FECHAINICIO          DATE                 not null,
   FECHAFIN             DATE,
   constraint PK_ESTADOUSUARIO primary key (PK_ESTADOUSUARIO)
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO 
(
   PK_MUNICIPIO         NUMBER               not null,
   FK_DEPARTAMENTO      NUMBER,
   CODIGO               NVARCHAR2(20)        not null,
   NOMBRE               NVARCHAR2(100)       not null,
   constraint PK_MUNICIPIO primary key (PK_MUNICIPIO)
);

/*==============================================================*/
/* Index: UNIQUE_CODIGOMUNICIPIO                                */
/*==============================================================*/
create unique index UNIQUE_CODIGOMUNICIPIO on MUNICIPIO (
   CODIGO ASC
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS 
(
   PK_PAIS              NUMBER               not null,
   CODIGO               NVARCHAR2(20)        not null,
   NOMBRE               NVARCHAR2(100)       not null,
   constraint PK_PAIS primary key (PK_PAIS)
);

/*==============================================================*/
/* Index: UNIQUE_CODIGOPAIS                                     */
/*==============================================================*/
create unique index UNIQUE_CODIGOPAIS on PAIS (
   CODIGO ASC
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA 
(
   PK_PERSONA           NUMBER               not null,
   FK_MUNICIPIOORIGEN   NUMBER               not null,
   IDENTIFICACION       NVARCHAR2(20)        not null,
   NOMBRES              NVARCHAR2(500)       not null,
   APELLIDOS            VARCHAR2(500)        not null,
   FECHANACIMIENTO      DATE                 not null,
   DIRECCION            VARCHAR2(500),
   CORREO               VARCHAR2(100),
   constraint PK_PERSONA primary key (PK_PERSONA)
);

/*==============================================================*/
/* Index: UNIQUE_IDENTIFICACION                                 */
/*==============================================================*/
create unique index UNIQUE_IDENTIFICACION on PERSONA (
   IDENTIFICACION ASC
);

/*==============================================================*/
/* Index: UNIQUE_CORREO                                         */
/*==============================================================*/
create unique index UNIQUE_CORREO on PERSONA (
   CORREO ASC
);

/*==============================================================*/
/* Table: PLANTILLAACCIONPERMITIDA                              */
/*==============================================================*/
create table PLANTILLAACCIONPERMITIDA 
(
   PK_PLANTILLAACCIONPERMITIDA NUMBER               not null,
   CODIGO               VARCHAR2(20)         not null,
   DESCRIPCION          VARCHAR2(100)        not null,
   constraint PK_PLANTILLAACCIONPERMITIDA primary key (PK_PLANTILLAACCIONPERMITIDA)
);

/*==============================================================*/
/* Index: UNIQUE_CODIGOAP                                       */
/*==============================================================*/
create unique index UNIQUE_CODIGOAP on PLANTILLAACCIONPERMITIDA (
   CODIGO ASC
);

/*==============================================================*/
/* Table: TELEFONO                                              */
/*==============================================================*/
create table TELEFONO 
(
   PK_TELEFONO          NUMBER               not null,
   FK_PERSONA           NUMBER               not null,
   FK_TIPOTELEFONO      NUMBER               not null,
   NUMERO               INTEGER              not null,
   constraint PK_TELEFONO primary key (PK_TELEFONO)
);

/*==============================================================*/
/* Table: TIPOTELEFONO                                          */
/*==============================================================*/
create table TIPOTELEFONO 
(
   PK_TIPOTELEFONO      NUMBER               not null,
   CODIGO               VARCHAR2(20)         not null,
   DESCRIPCION          VARCHAR2(100)        not null,
   constraint PK_TIPOTELEFONO primary key (PK_TIPOTELEFONO)
);

/*==============================================================*/
/* Index: UNIQUE_TIPOTELEFONO                                   */
/*==============================================================*/
create index UNIQUE_TIPOTELEFONO on TIPOTELEFONO (
   CODIGO ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   PK_USUARIO           NUMBER               not null,
   FK_PERSONA           NUMBER               not null,
   NOMBREUSUARIO        VARCHAR2(200)        not null,
   CONTRASENA           VARCHAR2(200)        not null,
   TIPOUSUARIOENUM      SMALLINT             not null,
   constraint PK_USUARIO primary key (PK_USUARIO)
);

/*==============================================================*/
/* Index: UNIQUE_NOMBREUSUARIO                                  */
/*==============================================================*/
create unique index UNIQUE_NOMBREUSUARIO on USUARIO (
   NOMBREUSUARIO ASC
);

alter table ACCIONPERMITIDA
   add constraint FK_ACCIONPE_REFERENCE_ACCIONP foreign key (FK_ACCIONPERMITIDA)
      references ACCIONPERMITIDA (PK_ACCIONPERMITIDA);

alter table ACCIONPERMITIDAPLANTILLA
   add constraint FK_ACCIONPE_REFERENCE_ACCIONPE foreign key (FK_ACCIONPERMITIDA)
      references ACCIONPERMITIDA (PK_ACCIONPERMITIDA);

alter table ACCIONPERMITIDAPLANTILLA
   add constraint FK_ACCIONPE_REFERENCE_PLANTILL foreign key (FK_PLANTILLAACCIONPERMITIDA)
      references PLANTILLAACCIONPERMITIDA (PK_PLANTILLAACCIONPERMITIDA);

alter table ACCIONPERMITIDAPORUSUARIO
   add constraint FK_ACCIONPE_REFERENCE_USUARIO foreign key (FK_USUARIO)
      references USUARIO (PK_USUARIO);

alter table ACCIONPERMITIDAPORUSUARIO
   add constraint FK_ACCIONPE_REFERENCE_ACCIO foreign key (FK_ACCIONPERMITIDA)
      references ACCIONPERMITIDA (PK_ACCIONPERMITIDA);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (FK_PAIS)
      references PAIS (PK_PAIS);

alter table ESTADOUSUARIO
   add constraint FK_ESTADOUS_REFERENCE_ESTADO foreign key (FK_ESTADO)
      references ESTADO (PK_ESTADO);

alter table ESTADOUSUARIO
   add constraint FK_ESTADOUS_REFERENCE_USUARIO foreign key (FK_USUARIO)
      references USUARIO (PK_USUARIO);

alter table MUNICIPIO
   add constraint FK_MUNICIPI_REFERENCE_DEPARTAM foreign key (FK_DEPARTAMENTO)
      references DEPARTAMENTO (PK_DEPARTAMENTO);

alter table PERSONA
   add constraint FK_PERSONA_REFERENCE_MUNICIPI foreign key (FK_MUNICIPIOORIGEN)
      references MUNICIPIO (PK_MUNICIPIO);

alter table TELEFONO
   add constraint FK_TELEFONO_REFERENCE_PERSONA foreign key (FK_PERSONA)
      references PERSONA (PK_PERSONA);

alter table TELEFONO
   add constraint FK_TELEFONO_REFERENCE_TIPOTELE foreign key (FK_TIPOTELEFONO)
      references TIPOTELEFONO (PK_TIPOTELEFONO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PERSONA foreign key (FK_PERSONA)
      references PERSONA (PK_PERSONA);

