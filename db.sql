/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     17/12/2022 17:01:07                          */
/*==============================================================*/


drop table GUSTO;

drop table JUGADOR;

drop table REGALO;

drop table USUARIO;

/*==============================================================*/
/* Table: GUSTO                                                 */
/*==============================================================*/
create table GUSTO (
   COLOR                VARCHAR(250)         null,
   DISH                 VARCHAR(250)         not null,
   TSHIT_SIZE           VARCHAR(250)         not null,
   JACKE_SIZE           VARCHAR(250)         not null,
   SHOES_SIZE           VARCHAR(250)         not null,
   MUSIC                VARCHAR(250)         not null,
   ID_LIKE              SERIAL               not null,
   PHONE                VARCHAR(250)         null,
   OTHERS               VARCHAR(500)         not null,
   constraint PK_GUSTO primary key (ID_LIKE)
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR (
   ID_PLAYER            SERIAL               not null,
   PHONE                VARCHAR(250)         null,
   STATE                BOOL                 not null,
   constraint PK_JUGADOR primary key (ID_PLAYER)
);

/*==============================================================*/
/* Table: REGALO                                                */
/*==============================================================*/
create table REGALO (
   PHONE                VARCHAR(250)         null,
   ID_PLAYER            INT4                 null,
   ID_GIF               CHAR(10)             not null,
   constraint PK_REGALO primary key (ID_GIF)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   NAME                 VARCHAR(250)         not null,
   LAST_NAME            VARCHAR(250)         not null,
   PHONE                VARCHAR(250)         not null,
   PASSWORD             VARCHAR(60)          not null,
   constraint PK_USUARIO primary key (PHONE)
);

alter table GUSTO
   add constraint FK_GUSTO_REFERENCE_USUARIO foreign key (PHONE)
      references USUARIO (PHONE)
      on delete restrict on update restrict;

alter table JUGADOR
   add constraint FK_JUGADOR_REFERENCE_USUARIO foreign key (PHONE)
      references USUARIO (PHONE)
      on delete restrict on update restrict;

alter table REGALO
   add constraint FK_REGALO_REFERENCE_USUARIO foreign key (PHONE)
      references USUARIO (PHONE)
      on delete restrict on update restrict;

alter table REGALO
   add constraint FK_REGALO_REFERENCE_JUGADOR foreign key (ID_PLAYER)
      references JUGADOR (ID_PLAYER)
      on delete restrict on update restrict;

