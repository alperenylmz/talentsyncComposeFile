/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     12/19/2023 2:44:00 PM                        */
/*==============================================================*/


drop table Application;

drop table Company;

drop table Messages;

drop table TSUser;

drop table advert;

drop table authenticationLogsTable;

drop table employerPreferences;

drop table jobCategories;

drop table jobCategoriesUser;

drop table matchesTable;

/*==============================================================*/
/* Table: Application                                           */
/*==============================================================*/
create table Application (
   applicationId        DECIMAL(10)          not null,
   userId               DECIMAL(10)          null,
   advertId             DECIMAL(10)          null,
   interest_or_apply    INT4                 null,
   applicationDate      DATE                 null,
   constraint PK_APPLICATION primary key (applicationId)
);

/*==============================================================*/
/* Table: Company                                               */
/*==============================================================*/
create table Company (
   companyId            DECIMAL(10)          not null,
   companyName          VARCHAR(64)          not null,
   phoneNumber          VARCHAR(12)          not null,
   companyMail          VARCHAR(255)         not null,
   website              VARCHAR(255)         null,
   constraint PK_COMPANY primary key (companyId)
);

/*==============================================================*/
/* Table: Messages                                              */
/*==============================================================*/
create table Messages (
   messageId            DECIMAL(10)          not null,
   matchId              DECIMAL(10)          null,
   messageContent       VARCHAR(255)         not null,
   "timeStamp"          DATE                 not null,
   originator           INT4                 not null,
   seen                 INT4                 null,
   constraint PK_MESSAGES primary key (messageId)
);

/*==============================================================*/
/* Table: TSUser                                                */
/*==============================================================*/
create table TSUser (
   userId               DECIMAL(10)          not null,
   companyId            DECIMAL(10)          null,
   userName             VARCHAR(64)          not null,
   email                VARCHAR(255)         not null,
   phoneNumber          VARCHAR(12)          not null,
   cv                   VARCHAR(255)         not null,
   photo                VARCHAR(255)         null,
   jobsDone             INT4                 not null,
   role                 INT4                 not null,
   status               INT4                 not null,
   createDate           DATE                 not null,
   latestUpdate         DATE                 not null,
   constraint PK_TSUSER primary key (userId)
);

/*==============================================================*/
/* Table: advert                                                */
/*==============================================================*/
create table advert (
   advertId             DECIMAL(10)          not null,
   userId               DECIMAL(10)          null,
   advertTitle          VARCHAR(255)         not null,
   advertPhoto          VARCHAR(255)         null,
   adverStatus          INT4                 not null,
   price                DECIMAL(11)          null,
   publishDate          DATE                 not null,
   latestUpdate         DATE                 null,
   constraint PK_ADVERT primary key (advertId)
);

/*==============================================================*/
/* Table: authenticationLogsTable                               */
/*==============================================================*/
create table authenticationLogsTable (
   logId                DECIMAL(10)          not null,
   userId               DECIMAL(10)          null,
   loginTimeStamp       DATE                 not null,
   logoutTimeStamp      DATE                 not null,
   loginIpAdress        INT8                 not null,
   loginDeviceInfo      VARCHAR(255)         not null,
   loginStatus          INT4                 not null,
   constraint PK_AUTHENTICATIONLOGSTABLE primary key (logId)
);

/*==============================================================*/
/* Table: employerPreferences                                   */
/*==============================================================*/
create table employerPreferences (
   epId                 DECIMAL(10)          not null,
   categoryId           DECIMAL(10)          null,
   advertId             DECIMAL(10)          null,
   constraint PK_EMPLOYERPREFERENCES primary key (epId)
);

/*==============================================================*/
/* Table: jobCategories                                         */
/*==============================================================*/
create table jobCategories (
   categoryId           DECIMAL(10)          not null,
   categoryName         VARCHAR(255)         not null,
   parentId             DECIMAL(10)          not null,
   constraint PK_JOBCATEGORIES primary key (categoryId)
);

/*==============================================================*/
/* Table: jobCategoriesUser                                     */
/*==============================================================*/
create table jobCategoriesUser (
   jcuId                DECIMAL(10)          not null,
   categoryId           DECIMAL(10)          null,
   userId               DECIMAL(10)          null,
   constraint PK_JOBCATEGORIESUSER primary key (jcuId)
);

/*==============================================================*/
/* Table: matchesTable                                          */
/*==============================================================*/
create table matchesTable (
   matchId              DECIMAL(10)          not null,
   employerUserId       DECIMAL(10)          null,
   employeeUserId       DECIMAL(10)          null,
   matchStatus          INT4                 not null,
   dealStatus           INT4                 not null,
   notificationStatus   INT4                 not null,
   constraint PK_MATCHESTABLE primary key (matchId)
);

alter table Application
   add constraint FK_APPLICAT_ADVERTAPP_ADVERT foreign key (advertId)
      references advert (advertId)
      on delete restrict on update restrict;

alter table Application
   add constraint FK_APPLICAT_USERAPPLI_TSUSER foreign key (userId)
      references TSUser (userId)
      on delete restrict on update restrict;

alter table Messages
   add constraint FK_MESSAGES_MATCHMESS_MATCHEST foreign key (matchId)
      references matchesTable (matchId)
      on delete restrict on update restrict;

alter table TSUser
   add constraint FK_TSUSER_USERCOMPA_COMPANY foreign key (companyId)
      references Company (companyId)
      on delete restrict on update restrict;

alter table advert
   add constraint FK_ADVERT_USERADVER_TSUSER foreign key (userId)
      references TSUser (userId)
      on delete restrict on update restrict;

alter table authenticationLogsTable
   add constraint FK_AUTHENTI_USERLOG_TSUSER foreign key (userId)
      references TSUser (userId)
      on delete restrict on update restrict;

alter table employerPreferences
   add constraint FK_EMPLOYER_ADVERTEMP_ADVERT foreign key (advertId)
      references advert (advertId)
      on delete restrict on update restrict;

alter table employerPreferences
   add constraint FK_EMPLOYER_JOBCATEGO_JOBCATEG foreign key (categoryId)
      references jobCategories (categoryId)
      on delete restrict on update restrict;

alter table jobCategoriesUser
   add constraint FK_JOBCATEG_R01_JOBCATEG foreign key (categoryId)
      references jobCategories (categoryId)
      on delete restrict on update restrict;

alter table jobCategoriesUser
   add constraint FK_JOBCATEG_R02_TSUSER foreign key (userId)
      references TSUser (userId)
      on delete restrict on update restrict;

alter table matchesTable
   add constraint FK_MATCHEST_RELATIONS_TSUSER foreign key (employerUserId)
      references TSUser (userId)
      on delete restrict on update restrict;

alter table matchesTable
   add constraint FK_MATCHEST_USERMATCH_TSUSER foreign key (employeeUserId)
      references TSUser (userId)
      on delete restrict on update restrict;

