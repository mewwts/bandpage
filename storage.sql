BEGIN TRANSACTION;
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add permission',1,'add_permission');
INSERT INTO "auth_permission" VALUES(2,'Can change permission',1,'change_permission');
INSERT INTO "auth_permission" VALUES(3,'Can delete permission',1,'delete_permission');
INSERT INTO "auth_permission" VALUES(4,'Can add group',2,'add_group');
INSERT INTO "auth_permission" VALUES(5,'Can change group',2,'change_group');
INSERT INTO "auth_permission" VALUES(6,'Can delete group',2,'delete_group');
INSERT INTO "auth_permission" VALUES(7,'Can add user',3,'add_user');
INSERT INTO "auth_permission" VALUES(8,'Can change user',3,'change_user');
INSERT INTO "auth_permission" VALUES(9,'Can delete user',3,'delete_user');
INSERT INTO "auth_permission" VALUES(10,'Can add content type',4,'add_contenttype');
INSERT INTO "auth_permission" VALUES(11,'Can change content type',4,'change_contenttype');
INSERT INTO "auth_permission" VALUES(12,'Can delete content type',4,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(13,'Can add session',5,'add_session');
INSERT INTO "auth_permission" VALUES(14,'Can change session',5,'change_session');
INSERT INTO "auth_permission" VALUES(15,'Can delete session',5,'delete_session');
INSERT INTO "auth_permission" VALUES(16,'Can add site',6,'add_site');
INSERT INTO "auth_permission" VALUES(17,'Can change site',6,'change_site');
INSERT INTO "auth_permission" VALUES(18,'Can delete site',6,'delete_site');
INSERT INTO "auth_permission" VALUES(19,'Can add log entry',7,'add_logentry');
INSERT INTO "auth_permission" VALUES(20,'Can change log entry',7,'change_logentry');
INSERT INTO "auth_permission" VALUES(21,'Can delete log entry',7,'delete_logentry');
INSERT INTO "auth_permission" VALUES(22,'Can add concert',8,'add_concert');
INSERT INTO "auth_permission" VALUES(23,'Can change concert',8,'change_concert');
INSERT INTO "auth_permission" VALUES(24,'Can delete concert',8,'delete_concert');
INSERT INTO "auth_permission" VALUES(25,'Can add landingpage',9,'add_landingpage');
INSERT INTO "auth_permission" VALUES(26,'Can change landingpage',9,'change_landingpage');
INSERT INTO "auth_permission" VALUES(27,'Can delete landingpage',9,'delete_landingpage');
INSERT INTO "auth_permission" VALUES(28,'Can add photo',10,'add_photo');
INSERT INTO "auth_permission" VALUES(29,'Can change photo',10,'change_photo');
INSERT INTO "auth_permission" VALUES(30,'Can delete photo',10,'delete_photo');
INSERT INTO "auth_permission" VALUES(31,'Can add sales link',11,'add_saleslink');
INSERT INTO "auth_permission" VALUES(32,'Can change sales link',11,'change_saleslink');
INSERT INTO "auth_permission" VALUES(33,'Can delete sales link',11,'delete_saleslink');
INSERT INTO "auth_permission" VALUES(34,'Can add album',12,'add_album');
INSERT INTO "auth_permission" VALUES(35,'Can change album',12,'change_album');
INSERT INTO "auth_permission" VALUES(36,'Can delete album',12,'delete_album');
INSERT INTO "auth_permission" VALUES(37,'Can add song',13,'add_song');
INSERT INTO "auth_permission" VALUES(38,'Can change song',13,'change_song');
INSERT INTO "auth_permission" VALUES(39,'Can delete song',13,'delete_song');
INSERT INTO "auth_permission" VALUES(40,'Can add video',14,'add_video');
INSERT INTO "auth_permission" VALUES(41,'Can change video',14,'change_video');
INSERT INTO "auth_permission" VALUES(42,'Can delete video',14,'delete_video');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$10000$yBfJYh3LEuIC$rMVXJyCsv5C3EjD7yTlXeMbeHofHBteUGAF7dwbGmC8=','2013-09-21 09:04:06.245430',1,'krk','','','',1,1,'2013-08-03 19:01:53.347136');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(2,'group','auth','group');
INSERT INTO "django_content_type" VALUES(3,'user','auth','user');
INSERT INTO "django_content_type" VALUES(4,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(5,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(6,'site','sites','site');
INSERT INTO "django_content_type" VALUES(7,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(8,'concert','concerts','concert');
INSERT INTO "django_content_type" VALUES(9,'landingpage','landingpage','landingpage');
INSERT INTO "django_content_type" VALUES(10,'photo','photos','photo');
INSERT INTO "django_content_type" VALUES(11,'sales link','music','saleslink');
INSERT INTO "django_content_type" VALUES(12,'album','music','album');
INSERT INTO "django_content_type" VALUES(13,'song','music','song');
INSERT INTO "django_content_type" VALUES(14,'video','videos','video');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('5p1o9ytikmao4uhavde27ffjz67qudfo','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-08-17 19:02:02.457758');
INSERT INTO "django_session" VALUES('jcdfaj5m0vjwkgw109c56k5uei4nerxb','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-08-17 20:13:48.427418');
INSERT INTO "django_session" VALUES('zp6b3jiieqoyugko9cxqgo8s4e9yv24r','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-09-04 17:17:53.520681');
INSERT INTO "django_session" VALUES('ayf1sphrrrhpfhclg83ykq6r0t1i44n2','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-09-04 18:45:23.526319');
INSERT INTO "django_session" VALUES('uy6gz07rxbhhi6qoyi2qm7zxejppmmjy','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-09-18 18:48:24.466598');
INSERT INTO "django_session" VALUES('5ikbew3vzs9tvrpmckazqhd1po7l9u7m','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-09-18 22:43:29.641883');
INSERT INTO "django_session" VALUES('xz7ot07adyh3tkia48zs8yxv9139e2q9','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-10-04 14:44:11.425481');
INSERT INTO "django_session" VALUES('irre12mdwk9xwj7be5cpwzdw9shrjts7','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-10-04 19:38:30.708021');
INSERT INTO "django_session" VALUES('ep85f1pspvqtzw6a2qvqg6ixgn2p7gjx','NDgxYjZjMzFlZmJkN2Y5ZGU4YjZhMDlkMjljODMyMTY4NzFjMzhjNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu','2013-10-05 09:04:06.248743');
CREATE TABLE "django_site" (
    "id" integer NOT NULL PRIMARY KEY,
    "domain" varchar(100) NOT NULL,
    "name" varchar(50) NOT NULL
);
INSERT INTO "django_site" VALUES(1,'example.com','example.com');
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "content_type_id" integer REFERENCES "django_content_type" ("id"),
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2013-08-03 19:02:09.044459',1,12,'1','Natsa',1,'');
INSERT INTO "django_admin_log" VALUES(2,'2013-08-03 19:02:11.035781',1,13,'1','Supersangen',1,'');
INSERT INTO "django_admin_log" VALUES(3,'2013-08-03 19:02:34.259513',1,13,'1','Supersangen',2,'Changed lyrics.');
INSERT INTO "django_admin_log" VALUES(4,'2013-08-03 20:13:56.704614',1,8,'1','test5-2013-08-03 22:13:52+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(5,'2013-08-03 20:25:09.014027',1,8,'2','asd-2013-08-03 22:25:05+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(6,'2013-08-03 20:29:55.522541',1,8,'3','asdasd-2013-08-03 22:29:48+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(7,'2013-08-03 20:36:02.017969',1,8,'4','asd2-2013-08-29 22:35:56+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(8,'2013-08-03 20:42:12.328656',1,8,'5','Feskerby-2013-08-27 22:42:04+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(9,'2013-08-03 20:51:14.600750',1,8,'6','asdfasdf-2013-08-03 22:51:09+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(10,'2013-08-03 20:55:32.369671',1,8,'7','jasdjasdf-2013-08-03 22:55:27+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(11,'2013-08-03 20:56:38.722256',1,8,'8','asdfasdfasdfasdfasdf-2013-08-03 22:56:34+02:00',1,'');
INSERT INTO "django_admin_log" VALUES(12,'2013-08-03 21:10:53.965510',1,10,'1','Testbilde',1,'');
INSERT INTO "django_admin_log" VALUES(13,'2013-08-03 21:18:35.542472',1,10,'2','Testbilde2',1,'');
INSERT INTO "django_admin_log" VALUES(14,'2013-08-03 21:22:55.261070',1,10,'3','Testbilde3',1,'');
INSERT INTO "django_admin_log" VALUES(15,'2013-08-03 21:55:22.253479',1,10,'4','asd',1,'');
INSERT INTO "django_admin_log" VALUES(16,'2013-08-03 23:02:47.932756',1,12,'1','Natsa',2,'Added sales link "sy Asdasd".');
INSERT INTO "django_admin_log" VALUES(17,'2013-08-03 23:03:23.217601',1,12,'1','Natsa',2,'Added sales link "di asdasdasdasdasd".');
INSERT INTO "django_admin_log" VALUES(18,'2013-08-03 23:04:08.607607',1,12,'2','Feskslog',1,'');
INSERT INTO "django_admin_log" VALUES(19,'2013-08-03 23:05:58.517153',1,12,'2','Feskslog',2,'Changed is_vinyl, vinyl_release_date and vinyl_artwork_img.');
INSERT INTO "django_admin_log" VALUES(20,'2013-08-03 23:06:33.405532',1,13,'2','Test',1,'');
INSERT INTO "django_admin_log" VALUES(21,'2013-08-03 23:07:03.416563',1,13,'2','Test',2,'Changed is_single and single_artwork_img.');
INSERT INTO "django_admin_log" VALUES(22,'2013-08-21 17:18:31.495759',1,10,'5','Krk',1,'');
INSERT INTO "django_admin_log" VALUES(23,'2013-08-21 17:21:22.786251',1,10,'4','asd',3,'');
INSERT INTO "django_admin_log" VALUES(24,'2013-08-21 17:21:22.789279',1,10,'3','Testbilde3',3,'');
INSERT INTO "django_admin_log" VALUES(25,'2013-08-21 17:21:22.790418',1,10,'2','Testbilde2',3,'');
INSERT INTO "django_admin_log" VALUES(26,'2013-08-21 17:21:22.791608',1,10,'1','Testbilde',3,'');
INSERT INTO "django_admin_log" VALUES(27,'2013-08-21 18:33:21.878701',1,10,'5','Krk',3,'');
INSERT INTO "django_admin_log" VALUES(28,'2013-08-21 18:33:36.765908',1,10,'1','Mongo',1,'');
INSERT INTO "django_admin_log" VALUES(29,'2013-08-21 18:45:46.246047',1,8,'3','asdasd-2013-08-03 22:29:48+02:00',2,'Changed ticket_url and facebook_url.');
INSERT INTO "django_admin_log" VALUES(30,'2013-08-22 18:44:40.148454',1,12,'2','Feskslog',2,'Changed artwork_img.');
INSERT INTO "django_admin_log" VALUES(31,'2013-08-22 19:41:30.523261',1,13,'2','Test',2,'Changed single_artwork_img.');
INSERT INTO "django_admin_log" VALUES(32,'2013-08-22 20:33:42.829930',1,12,'1','Natsa',2,'Changed is_vinyl, vinyl_release_date and vinyl_artwork_img.');
INSERT INTO "django_admin_log" VALUES(33,'2013-08-22 20:35:59.432072',1,12,'1','Natsa',2,'Changed text for sales link "sy Asdasd". Changed type and text for sales link "cd asdasdasdasdasd".');
INSERT INTO "django_admin_log" VALUES(34,'2013-08-22 20:36:17.944986',1,12,'1','Natsa',2,'Changed type and text for sales link "di Asdasd".');
INSERT INTO "django_admin_log" VALUES(35,'2013-08-22 20:36:42.225395',1,12,'1','Natsa',2,'Changed description for sales link "di Link til itunes". Changed description for sales link "cd Link til platekomp".');
INSERT INTO "django_admin_log" VALUES(36,'2013-08-23 12:50:56.806250',1,13,'1','Supersangen',2,'Changed is_single and single_artwork_img.');
INSERT INTO "django_admin_log" VALUES(37,'2013-08-23 12:51:22.684399',1,12,'2','Feskslog',2,'Changed artwork_img.');
INSERT INTO "django_admin_log" VALUES(38,'2013-08-23 12:51:32.750317',1,12,'2','Feskslog',2,'Changed artwork_img.');
INSERT INTO "django_admin_log" VALUES(39,'2013-08-23 12:51:50.703221',1,12,'1','Natsa',2,'Changed artwork_img.');
INSERT INTO "django_admin_log" VALUES(40,'2013-08-27 16:30:18.314794',1,12,'1','Natsa',2,'Changed vinyl_artwork_img.');
INSERT INTO "django_admin_log" VALUES(41,'2013-08-27 18:17:25.671655',1,12,'2','Feskslog',2,'Changed vinyl_artwork_img.');
INSERT INTO "django_admin_log" VALUES(42,'2013-09-04 18:22:31.930609',1,9,'1','Lorem ipsum dolor sit ametdark',1,'');
INSERT INTO "django_admin_log" VALUES(43,'2013-09-04 18:42:12.022841',1,9,'1','Lorem ipsum dolor sit ametdark',2,'Changed link_text.');
INSERT INTO "django_admin_log" VALUES(44,'2013-09-04 18:43:51.838064',1,9,'1','alle gode tingdark',2,'Changed title and text.');
INSERT INTO "django_admin_log" VALUES(45,'2013-09-04 18:44:10.080793',1,9,'1','alle gode tingdark',2,'Changed link_text.');
INSERT INTO "django_admin_log" VALUES(46,'2013-09-04 18:48:28.696309',1,9,'1','alle gode tinglite',2,'Changed theme.');
INSERT INTO "django_admin_log" VALUES(47,'2013-09-04 19:05:36.040310',1,9,'1','alle gode tinglite',2,'Changed cover_image.');
INSERT INTO "django_admin_log" VALUES(48,'2013-09-04 19:09:19.256681',1,9,'1','alle gode tinglite',2,'Changed cover_image.');
INSERT INTO "django_admin_log" VALUES(49,'2013-09-04 19:10:33.954402',1,9,'1','alle gode tinglite',2,'Changed cover_image.');
INSERT INTO "django_admin_log" VALUES(50,'2013-09-04 19:15:42.821722',1,9,'1','alle gode tinglite',2,'No fields changed.');
INSERT INTO "django_admin_log" VALUES(51,'2013-09-04 21:20:25.176504',1,9,'2','alle gode ting 2dark',1,'');
INSERT INTO "django_admin_log" VALUES(52,'2013-09-04 21:20:40.667144',1,9,'2','alle gode ting 2dark',2,'Changed homepage.');
INSERT INTO "django_admin_log" VALUES(53,'2013-09-04 22:44:04.909500',1,14,'1','Sapp',1,'');
INSERT INTO "django_admin_log" VALUES(54,'2013-09-04 22:47:59.149341',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(55,'2013-09-04 22:48:13.072337',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(56,'2013-09-20 14:44:24.019569',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(57,'2013-09-20 14:48:46.617578',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(58,'2013-09-20 14:48:56.745254',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(59,'2013-09-20 14:49:04.337366',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(60,'2013-09-20 14:49:05.216093',1,9,'2','alle gode ting 2dark',2,'No fields changed.');
INSERT INTO "django_admin_log" VALUES(61,'2013-09-20 14:56:32.085215',1,9,'2','alle gode ting 2dark',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(62,'2013-09-20 14:57:08.476233',1,9,'2','alle gode ting 2lite',2,'Changed theme.');
INSERT INTO "django_admin_log" VALUES(63,'2013-09-20 14:58:18.518705',1,9,'2','alle gode ting 2lite',2,'Changed cover_image.');
INSERT INTO "django_admin_log" VALUES(64,'2013-09-20 15:00:54.882092',1,9,'2','alle gode ting 2lite',2,'Changed cover_image.');
INSERT INTO "django_admin_log" VALUES(65,'2013-09-20 15:01:03.551534',1,9,'2','alle gode ting 2dark',2,'Changed theme.');
INSERT INTO "django_admin_log" VALUES(66,'2013-09-20 15:47:33.098251',1,13,'2','Test',2,'Changed lyrics and is_single.');
INSERT INTO "django_admin_log" VALUES(67,'2013-09-20 15:47:39.029117',1,13,'2','Test',2,'Changed single_artwork_img.');
INSERT INTO "django_admin_log" VALUES(68,'2013-09-20 15:49:50.163643',1,13,'2','Test',2,'No fields changed.');
INSERT INTO "django_admin_log" VALUES(69,'2013-09-20 16:11:10.096739',1,13,'2','Stødig som en bauta',2,'Changed title and lyrics.');
INSERT INTO "django_admin_log" VALUES(70,'2013-09-20 16:13:16.873442',1,13,'2','Stødig som en bauta',2,'Changed lyrics.');
INSERT INTO "django_admin_log" VALUES(71,'2013-09-20 17:35:09.937137',1,14,'1','Sapp',2,'Changed text.');
INSERT INTO "django_admin_log" VALUES(72,'2013-09-21 09:24:32.261936',1,14,'1','Fox',1,'');
INSERT INTO "django_admin_log" VALUES(73,'2013-09-21 09:25:13.871174',1,14,'2','Hellz yeah man',1,'');
CREATE TABLE "concerts_concert" (
    "id" integer NOT NULL PRIMARY KEY,
    "date" datetime NOT NULL,
    "city" varchar(30) NOT NULL,
    "venue" varchar(100) NOT NULL,
    "ticket_url" varchar(200),
    "facebook_url" varchar(200),
    "is_sold_out" bool NOT NULL
);
INSERT INTO "concerts_concert" VALUES(1,'2013-08-03 20:13:52','Test4','test5','','',0);
INSERT INTO "concerts_concert" VALUES(2,'2013-08-03 20:25:05','asd','asd','','',0);
INSERT INTO "concerts_concert" VALUES(3,'2013-08-03 20:29:48','asdasd','asdasd','http://db.no/','http://facebook.com/',0);
INSERT INTO "concerts_concert" VALUES(4,'2013-08-29 20:35:56','asdasd2','asd2','','',0);
INSERT INTO "concerts_concert" VALUES(5,'2013-08-27 20:42:04','Feskermann','Feskerby','','',0);
INSERT INTO "concerts_concert" VALUES(6,'2013-08-03 20:51:09','fittebyen','asdfasdf','','',0);
INSERT INTO "concerts_concert" VALUES(7,'2013-08-03 20:55:27','jajajajaj','jasdjasdf','','',0);
INSERT INTO "concerts_concert" VALUES(8,'2013-08-03 20:56:34','asdfasdfasdfasdfasdfasdf','asdfasdfasdfasdfasdf','','',0);
CREATE TABLE "landingpage_landingpage" (
    "id" integer NOT NULL PRIMARY KEY,
    "slug" varchar(30) NOT NULL,
    "title" varchar(100) NOT NULL,
    "text" text,
    "link_url" varchar(200),
    "link_text" varchar(200) NOT NULL,
    "cover_image" varchar(100),
    "theme" varchar(4) NOT NULL,
    "homepage" bool NOT NULL
);
INSERT INTO "landingpage_landingpage" VALUES(1,'','alle gode ting','To år etter forrige utgivelse er Kråkesølv klare med sitt tredje album. Alle gode ting inneholder tolv låter, inkludert singlene «Stødig som en bauta» og «Sjalusien som driv dæ».','http://feskslog.feskslog.com/','Kjøp album','temp/folder/masthead01_inverse_1.png','lite',0);
INSERT INTO "landingpage_landingpage" VALUES(2,'','alle gode ting 2','To år etter forrige utgivelse er Kråkesølv klare med sitt tredje album. Alle gode ting inneholder tolv låter, inkludert singlene «Stødig som en bauta» og «Sjalusien som driv dæ».

test','http://lorem.ipsum.dolor.sit/','Kjøp album','landingpages/masthead01.png','dark',1);
CREATE TABLE "photos_photo" (
    "id" integer NOT NULL PRIMARY KEY,
    "title" varchar(400) NOT NULL,
    "photographer" varchar(200),
    "thumbnail" varchar(100) NOT NULL,
    "image" varchar(100) NOT NULL
);
INSERT INTO "photos_photo" VALUES(1,'Mongo','Leon','thumbs/tor.png','images/tor.png');
CREATE TABLE "music_saleslink" (
    "id" integer NOT NULL PRIMARY KEY,
    "type" varchar(2) NOT NULL,
    "text" varchar(100) NOT NULL,
    "description" varchar(100) NOT NULL,
    "url" varchar(200) NOT NULL,
    "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"),
    "object_id" integer unsigned NOT NULL
);
INSERT INTO "music_saleslink" VALUES(1,'di','MP3','Link til itunes','http://test.com/',12,1);
INSERT INTO "music_saleslink" VALUES(2,'cd','CD','Link til platekomp','http://vg.no/',12,1);
INSERT INTO "music_saleslink" VALUES(3,'cd','Cd','feskslog','http://cd.com/',12,2);
CREATE TABLE "music_album" (
    "id" integer NOT NULL PRIMARY KEY,
    "title" varchar(200) NOT NULL,
    "release_date" date NOT NULL,
    "artwork_img" varchar(100) NOT NULL,
    "is_vinyl" bool NOT NULL,
    "vinyl_release_date" date,
    "vinyl_artwork_img" varchar(100) NOT NULL
);
INSERT INTO "music_album" VALUES(1,'Natsa','2013-08-03','art/album/bilde.JPG',1,'2013-08-22','art/vinyl/DSC03194.jpeg');
INSERT INTO "music_album" VALUES(2,'Feskslog','2013-08-04','art/album/old.png',1,'2013-08-04','art/vinyl/tor.png');
CREATE TABLE "music_song_album" (
    "id" integer NOT NULL PRIMARY KEY,
    "song_id" integer NOT NULL,
    "album_id" integer NOT NULL REFERENCES "music_album" ("id"),
    UNIQUE ("song_id", "album_id")
);
INSERT INTO "music_song_album" VALUES(3,1,1);
INSERT INTO "music_song_album" VALUES(4,2,1);
CREATE TABLE "music_song" (
    "id" integer NOT NULL PRIMARY KEY,
    "title" varchar(200) NOT NULL,
    "release_date" date NOT NULL,
    "composer" varchar(100) NOT NULL,
    "lyrics" text NOT NULL,
    "is_single" bool NOT NULL,
    "single_artwork_img" varchar(100) NOT NULL
);
INSERT INTO "music_song" VALUES(1,'Supersangen','2013-08-03','Mats','Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. Mats er kul. Mats er fin. ',1,'art/single/IMG_4608.JPG');
INSERT INTO "music_song" VALUES(2,'Stødig som en bauta','2013-08-04','Peppi','æ trur at æ hold maska men æ har barneansikt  
du les mæ helt perfekt men æ lar dæ få tvil  
snor mæ unna nekta straffskyld så du føl dæ paranoid  
men æ lura liksom også mæ sjøl så æ har alibi  
æ har ikke én grunn til det men æ tar dæ for gitt  
feigheta mi sir mæ at alt klarna på sikt

om æ hold mæ stødig som en bauta  
kald og passiv  
så kald og passiv  
men stødig som en bauta  
kald og passiv  
men så standhaftig  

kanskje æ må innse at min tørst og jag etter vin  
avslør et plaga sinn som trekkes mot jag etter vind  
eller det kan vær et godt tegn i en verden som e lagd av plastikk  
kem vet men feigheta mi sir mæ at alt klarna på sikt

om æ hold mæ stødig som en bauta  
kald og passiv  
så kald og passiv  
men stødig som en bauta  
kald og passiv  
men så standhaftig',0,'');
CREATE TABLE "videos_video" (
    "id" integer NOT NULL PRIMARY KEY,
    "title" varchar(400) NOT NULL,
    "type" varchar(3) NOT NULL,
    "category" varchar(2) NOT NULL,
    "text" text,
    "date_published" date NOT NULL,
    "song_id" integer REFERENCES "music_song" ("id"),
    "video_id" varchar(60) NOT NULL
);
<<<<<<< HEAD
INSERT INTO "videos_video" VALUES(1,'Sapp','you','mv','Offisiell musikkvideo for "Husk At Livet Går Fort"  
Premiere på Tromsø International Filmfestival 16. januar 2013

Isak Gjertsen, regi, produsent, animatør  
Matt Willis-Jones, fargekorrigering  
NN+, finansiering

Kinoversjon:  
DCP, Knut Erik Evensen  
5.1 lydmiks, Håvard Christensen','2013-09-05',1,'RsS4uCRrN_Y');
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
=======
INSERT INTO "videos_video" VALUES(1,'Fox','you','tv','# Supert

## wooops','2013-09-21',1,'ztoMQrHmIso');
INSERT INTO "videos_video" VALUES(2,'Hellz yeah man','vim','mv','# happy days

## happy ','2013-09-21',2,'68307465');
>>>>>>> b5e73792189bfc025922520794e2e5e7f7f2e2f4
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "music_saleslink_37ef4eb4" ON "music_saleslink" ("content_type_id");
CREATE INDEX "music_song_album_0cc685f0" ON "music_song_album" ("song_id");
CREATE INDEX "music_song_album_6781e42a" ON "music_song_album" ("album_id");
CREATE INDEX "videos_video_0cc685f0" ON "videos_video" ("song_id");
COMMIT;
