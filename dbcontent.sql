PGDMP  ;    $                {            postgres    16.1 (Debian 16.1-1.pgdg120+1)    16.0 /    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            d           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false            e           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3428            �            1259    16413    advert    TABLE     (  CREATE TABLE public.advert (
    advertid numeric(10,0) NOT NULL,
    userid numeric(10,0),
    adverttitle character varying(255) NOT NULL,
    advertphoto character varying(255),
    adverstatus integer NOT NULL,
    price numeric(11,0),
    publishdate date NOT NULL,
    latestupdate date
);
    DROP TABLE public.advert;
       public         heap    postgres    false            �            1259    16389    application    TABLE     �   CREATE TABLE public.application (
    applicationid numeric(10,0) NOT NULL,
    userid numeric(10,0),
    advertid numeric(10,0),
    interest_or_apply integer,
    applicationdate date
);
    DROP TABLE public.application;
       public         heap    postgres    false            �            1259    16420    authenticationlogstable    TABLE     +  CREATE TABLE public.authenticationlogstable (
    logid numeric(10,0) NOT NULL,
    userid numeric(10,0),
    logintimestamp date NOT NULL,
    logouttimestamp date NOT NULL,
    loginipadress bigint NOT NULL,
    logindeviceinfo character varying(255) NOT NULL,
    loginstatus integer NOT NULL
);
 +   DROP TABLE public.authenticationlogstable;
       public         heap    postgres    false            �            1259    16394    company    TABLE     �   CREATE TABLE public.company (
    companyid numeric(10,0) NOT NULL,
    companyname character varying(64) NOT NULL,
    phonenumber character varying(12) NOT NULL,
    companymail character varying(255) NOT NULL,
    website character varying(255)
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    16425    employerpreferences    TABLE     �   CREATE TABLE public.employerpreferences (
    epid numeric(10,0) NOT NULL,
    categoryid numeric(10,0),
    advertid numeric(10,0)
);
 '   DROP TABLE public.employerpreferences;
       public         heap    postgres    false            �            1259    16430    jobcategoriesuser    TABLE     �   CREATE TABLE public.jobcategoriesuser (
    jcuid numeric(10,0) NOT NULL,
    categoryid numeric(10,0),
    userid numeric(10,0)
);
 %   DROP TABLE public.jobcategoriesuser;
       public         heap    postgres    false            �            1259    16435    jobcategroies    TABLE     �   CREATE TABLE public.jobcategroies (
    categoryid numeric(10,0) NOT NULL,
    categoryname character varying(255) NOT NULL,
    parentid numeric(10,0) NOT NULL
);
 !   DROP TABLE public.jobcategroies;
       public         heap    postgres    false            �            1259    16440    matchestable    TABLE     �   CREATE TABLE public.matchestable (
    matchid numeric(10,0) NOT NULL,
    employeruserid numeric(10,0),
    employeeuserid numeric(10,0),
    matchstatus integer NOT NULL,
    dealstatus integer NOT NULL,
    notificationstatus integer NOT NULL
);
     DROP TABLE public.matchestable;
       public         heap    postgres    false            �            1259    16401    messages    TABLE     �   CREATE TABLE public.messages (
    messageid numeric(10,0) NOT NULL,
    matchid numeric(10,0),
    messagecontent character varying(255) NOT NULL,
    "timeStamp" date NOT NULL,
    originator integer NOT NULL,
    seen integer
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    16406    tsuser    TABLE     �  CREATE TABLE public.tsuser (
    userid numeric(10,0) NOT NULL,
    companyid numeric(10,0),
    username character varying(64) NOT NULL,
    email character varying(255) NOT NULL,
    phonenumber character varying(12) NOT NULL,
    cv character varying(255) NOT NULL,
    photo character varying(255),
    jobsdone integer NOT NULL,
    role integer NOT NULL,
    status integer NOT NULL,
    createdate date NOT NULL,
    latestupdate date NOT NULL
);
    DROP TABLE public.tsuser;
       public         heap    postgres    false            Y          0    16413    advert 
   TABLE DATA           {   COPY public.advert (advertid, userid, adverttitle, advertphoto, adverstatus, price, publishdate, latestupdate) FROM stdin;
    public          postgres    false    219   �@       U          0    16389    application 
   TABLE DATA           j   COPY public.application (applicationid, userid, advertid, interest_or_apply, applicationdate) FROM stdin;
    public          postgres    false    215   �@       Z          0    16420    authenticationlogstable 
   TABLE DATA           �   COPY public.authenticationlogstable (logid, userid, logintimestamp, logouttimestamp, loginipadress, logindeviceinfo, loginstatus) FROM stdin;
    public          postgres    false    220   �@       V          0    16394    company 
   TABLE DATA           \   COPY public.company (companyid, companyname, phonenumber, companymail, website) FROM stdin;
    public          postgres    false    216   �@       [          0    16425    employerpreferences 
   TABLE DATA           I   COPY public.employerpreferences (epid, categoryid, advertid) FROM stdin;
    public          postgres    false    221   �@       \          0    16430    jobcategoriesuser 
   TABLE DATA           F   COPY public.jobcategoriesuser (jcuid, categoryid, userid) FROM stdin;
    public          postgres    false    222   A       ]          0    16435    jobcategroies 
   TABLE DATA           K   COPY public.jobcategroies (categoryid, categoryname, parentid) FROM stdin;
    public          postgres    false    223   6A       ^          0    16440    matchestable 
   TABLE DATA           |   COPY public.matchestable (matchid, employeruserid, employeeuserid, matchstatus, dealstatus, notificationstatus) FROM stdin;
    public          postgres    false    224   SA       W          0    16401    messages 
   TABLE DATA           e   COPY public.messages (messageid, matchid, messagecontent, "timeStamp", originator, seen) FROM stdin;
    public          postgres    false    217   pA       X          0    16406    tsuser 
   TABLE DATA           �   COPY public.tsuser (userid, companyid, username, email, phonenumber, cv, photo, jobsdone, role, status, createdate, latestupdate) FROM stdin;
    public          postgres    false    218   �A       �           2606    16419    advert pk_advert 
   CONSTRAINT     T   ALTER TABLE ONLY public.advert
    ADD CONSTRAINT pk_advert PRIMARY KEY (advertid);
 :   ALTER TABLE ONLY public.advert DROP CONSTRAINT pk_advert;
       public            postgres    false    219            �           2606    16393    application pk_application 
   CONSTRAINT     c   ALTER TABLE ONLY public.application
    ADD CONSTRAINT pk_application PRIMARY KEY (applicationid);
 D   ALTER TABLE ONLY public.application DROP CONSTRAINT pk_application;
       public            postgres    false    215            �           2606    16424 2   authenticationlogstable pk_authenticationlogstable 
   CONSTRAINT     s   ALTER TABLE ONLY public.authenticationlogstable
    ADD CONSTRAINT pk_authenticationlogstable PRIMARY KEY (logid);
 \   ALTER TABLE ONLY public.authenticationlogstable DROP CONSTRAINT pk_authenticationlogstable;
       public            postgres    false    220            �           2606    16400    company pk_company 
   CONSTRAINT     W   ALTER TABLE ONLY public.company
    ADD CONSTRAINT pk_company PRIMARY KEY (companyid);
 <   ALTER TABLE ONLY public.company DROP CONSTRAINT pk_company;
       public            postgres    false    216            �           2606    16429 *   employerpreferences pk_employerpreferences 
   CONSTRAINT     j   ALTER TABLE ONLY public.employerpreferences
    ADD CONSTRAINT pk_employerpreferences PRIMARY KEY (epid);
 T   ALTER TABLE ONLY public.employerpreferences DROP CONSTRAINT pk_employerpreferences;
       public            postgres    false    221            �           2606    16434 &   jobcategoriesuser pk_jobcategoriesuser 
   CONSTRAINT     g   ALTER TABLE ONLY public.jobcategoriesuser
    ADD CONSTRAINT pk_jobcategoriesuser PRIMARY KEY (jcuid);
 P   ALTER TABLE ONLY public.jobcategoriesuser DROP CONSTRAINT pk_jobcategoriesuser;
       public            postgres    false    222            �           2606    16439    jobcategroies pk_jobcategroies 
   CONSTRAINT     d   ALTER TABLE ONLY public.jobcategroies
    ADD CONSTRAINT pk_jobcategroies PRIMARY KEY (categoryid);
 H   ALTER TABLE ONLY public.jobcategroies DROP CONSTRAINT pk_jobcategroies;
       public            postgres    false    223            �           2606    16444    matchestable pk_matchestable 
   CONSTRAINT     _   ALTER TABLE ONLY public.matchestable
    ADD CONSTRAINT pk_matchestable PRIMARY KEY (matchid);
 F   ALTER TABLE ONLY public.matchestable DROP CONSTRAINT pk_matchestable;
       public            postgres    false    224            �           2606    16405    messages pk_messages 
   CONSTRAINT     Y   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT pk_messages PRIMARY KEY (messageid);
 >   ALTER TABLE ONLY public.messages DROP CONSTRAINT pk_messages;
       public            postgres    false    217            �           2606    16412    tsuser pk_tsuser 
   CONSTRAINT     R   ALTER TABLE ONLY public.tsuser
    ADD CONSTRAINT pk_tsuser PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.tsuser DROP CONSTRAINT pk_tsuser;
       public            postgres    false    218            �           2606    16465 !   advert fk_advert_useradver_tsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.advert
    ADD CONSTRAINT fk_advert_useradver_tsuser FOREIGN KEY (userid) REFERENCES public.tsuser(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.advert DROP CONSTRAINT fk_advert_useradver_tsuser;
       public          postgres    false    3245    219    218            �           2606    16445 (   application fk_applicat_advertapp_advert    FK CONSTRAINT     �   ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_applicat_advertapp_advert FOREIGN KEY (advertid) REFERENCES public.advert(advertid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.application DROP CONSTRAINT fk_applicat_advertapp_advert;
       public          postgres    false    3247    215    219            �           2606    16450 (   application fk_applicat_userappli_tsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_applicat_userappli_tsuser FOREIGN KEY (userid) REFERENCES public.tsuser(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.application DROP CONSTRAINT fk_applicat_userappli_tsuser;
       public          postgres    false    215    3245    218            �           2606    16470 2   authenticationlogstable fk_authenti_userlog_tsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.authenticationlogstable
    ADD CONSTRAINT fk_authenti_userlog_tsuser FOREIGN KEY (userid) REFERENCES public.tsuser(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.authenticationlogstable DROP CONSTRAINT fk_authenti_userlog_tsuser;
       public          postgres    false    3245    220    218            �           2606    16475 0   employerpreferences fk_employer_advertemp_advert    FK CONSTRAINT     �   ALTER TABLE ONLY public.employerpreferences
    ADD CONSTRAINT fk_employer_advertemp_advert FOREIGN KEY (advertid) REFERENCES public.advert(advertid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public.employerpreferences DROP CONSTRAINT fk_employer_advertemp_advert;
       public          postgres    false    3247    221    219            �           2606    16480 2   employerpreferences fk_employer_jobcatego_jobcateg    FK CONSTRAINT     �   ALTER TABLE ONLY public.employerpreferences
    ADD CONSTRAINT fk_employer_jobcatego_jobcateg FOREIGN KEY (categoryid) REFERENCES public.jobcategroies(categoryid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.employerpreferences DROP CONSTRAINT fk_employer_jobcatego_jobcateg;
       public          postgres    false    3255    221    223            �           2606    16485 *   jobcategoriesuser fk_jobcateg_r01_jobcateg    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobcategoriesuser
    ADD CONSTRAINT fk_jobcateg_r01_jobcateg FOREIGN KEY (categoryid) REFERENCES public.jobcategroies(categoryid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.jobcategoriesuser DROP CONSTRAINT fk_jobcateg_r01_jobcateg;
       public          postgres    false    3255    222    223            �           2606    16490 (   jobcategoriesuser fk_jobcateg_r02_tsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobcategoriesuser
    ADD CONSTRAINT fk_jobcateg_r02_tsuser FOREIGN KEY (userid) REFERENCES public.tsuser(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.jobcategoriesuser DROP CONSTRAINT fk_jobcateg_r02_tsuser;
       public          postgres    false    3245    222    218            �           2606    16495 )   matchestable fk_matchest_relations_tsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.matchestable
    ADD CONSTRAINT fk_matchest_relations_tsuser FOREIGN KEY (employeruserid) REFERENCES public.tsuser(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.matchestable DROP CONSTRAINT fk_matchest_relations_tsuser;
       public          postgres    false    3245    224    218            �           2606    16500 )   matchestable fk_matchest_usermatch_tsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.matchestable
    ADD CONSTRAINT fk_matchest_usermatch_tsuser FOREIGN KEY (employeeuserid) REFERENCES public.tsuser(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.matchestable DROP CONSTRAINT fk_matchest_usermatch_tsuser;
       public          postgres    false    224    218    3245            �           2606    16455 '   messages fk_messages_matchmess_matchest    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_messages_matchmess_matchest FOREIGN KEY (matchid) REFERENCES public.matchestable(matchid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.messages DROP CONSTRAINT fk_messages_matchmess_matchest;
       public          postgres    false    224    217    3257            �           2606    16460 "   tsuser fk_tsuser_usercompa_company    FK CONSTRAINT     �   ALTER TABLE ONLY public.tsuser
    ADD CONSTRAINT fk_tsuser_usercompa_company FOREIGN KEY (companyid) REFERENCES public.company(companyid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.tsuser DROP CONSTRAINT fk_tsuser_usercompa_company;
       public          postgres    false    3241    218    216            Y      x������ � �      U      x������ � �      Z      x������ � �      V      x������ � �      [      x������ � �      \      x������ � �      ]      x������ � �      ^      x������ � �      W      x������ � �      X      x������ � �     