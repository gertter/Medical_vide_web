/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50727
Source Host           : 39.107.77.145:3306
Source Database       : medical

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-01-11 17:48:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('2', '所有的视频');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('2', '2', '52');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add collection_doctor', '7', 'add_collection_doctor');
INSERT INTO `auth_permission` VALUES ('26', 'Can change collection_doctor', '7', 'change_collection_doctor');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete collection_doctor', '7', 'delete_collection_doctor');
INSERT INTO `auth_permission` VALUES ('28', 'Can view collection_doctor', '7', 'view_collection_doctor');
INSERT INTO `auth_permission` VALUES ('29', 'Can add collection_video', '8', 'add_collection_video');
INSERT INTO `auth_permission` VALUES ('30', 'Can change collection_video', '8', 'change_collection_video');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete collection_video', '8', 'delete_collection_video');
INSERT INTO `auth_permission` VALUES ('32', 'Can view collection_video', '8', 'view_collection_video');
INSERT INTO `auth_permission` VALUES ('33', 'Can add commet', '9', 'add_commet');
INSERT INTO `auth_permission` VALUES ('34', 'Can change commet', '9', 'change_commet');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete commet', '9', 'delete_commet');
INSERT INTO `auth_permission` VALUES ('36', 'Can view commet', '9', 'view_commet');
INSERT INTO `auth_permission` VALUES ('37', 'Can add doctor', '10', 'add_doctor');
INSERT INTO `auth_permission` VALUES ('38', 'Can change doctor', '10', 'change_doctor');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete doctor', '10', 'delete_doctor');
INSERT INTO `auth_permission` VALUES ('40', 'Can view doctor', '10', 'view_doctor');
INSERT INTO `auth_permission` VALUES ('41', 'Can add patient', '11', 'add_patient');
INSERT INTO `auth_permission` VALUES ('42', 'Can change patient', '11', 'change_patient');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete patient', '11', 'delete_patient');
INSERT INTO `auth_permission` VALUES ('44', 'Can view patient', '11', 'view_patient');
INSERT INTO `auth_permission` VALUES ('45', 'Can add recode', '12', 'add_recode');
INSERT INTO `auth_permission` VALUES ('46', 'Can change recode', '12', 'change_recode');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete recode', '12', 'delete_recode');
INSERT INTO `auth_permission` VALUES ('48', 'Can view recode', '12', 'view_recode');
INSERT INTO `auth_permission` VALUES ('49', 'Can add video', '13', 'add_video');
INSERT INTO `auth_permission` VALUES ('50', 'Can change video', '13', 'change_video');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete video', '13', 'delete_video');
INSERT INTO `auth_permission` VALUES ('52', 'Can view video', '13', 'view_video');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$150000$X1JYgIK4DSKK$1d3HRpWQHu0MBF8MTIPBBIS01PFqw2Pd015+19PvvrA=', '2020-01-08 15:54:59.113814', '1', 'admin', '', '', '13914052033@qq.com', '1', '1', '2019-12-31 12:09:15.329900');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-12-31 12:11:25.042585', '1', '所有的病人', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-12-31 12:13:12.321505', '2', '所有的视频', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-12-31 12:43:49.181951', '1', '所有的病人', '3', '', '3', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'Medical_system', 'collection_doctor');
INSERT INTO `django_content_type` VALUES ('8', 'Medical_system', 'collection_video');
INSERT INTO `django_content_type` VALUES ('9', 'Medical_system', 'commet');
INSERT INTO `django_content_type` VALUES ('10', 'Medical_system', 'doctor');
INSERT INTO `django_content_type` VALUES ('11', 'Medical_system', 'patient');
INSERT INTO `django_content_type` VALUES ('12', 'Medical_system', 'recode');
INSERT INTO `django_content_type` VALUES ('13', 'Medical_system', 'video');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'Medical_system', '0001_initial', '2019-12-29 12:44:00.879259');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0001_initial', '2019-12-29 12:44:01.390851');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-12-29 12:44:03.509272');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0001_initial', '2019-12-29 12:44:04.996292');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0002_logentry_remove_auto_add', '2019-12-29 12:44:05.304497');
INSERT INTO `django_migrations` VALUES ('6', 'admin', '0003_logentry_add_action_flag_choices', '2019-12-29 12:44:05.453065');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2019-12-29 12:44:05.943752');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2019-12-29 12:44:06.155191');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2019-12-29 12:44:06.362635');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2019-12-29 12:44:06.499268');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2019-12-29 12:44:06.716693');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2019-12-29 12:44:06.838358');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2019-12-29 12:44:06.970005');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2019-12-29 12:44:07.171468');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2019-12-29 12:44:07.389887');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0010_alter_group_name_max_length', '2019-12-29 12:44:07.604309');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0011_update_proxy_permissions', '2019-12-29 12:44:07.921465');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2019-12-29 12:44:08.289509');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3js3c5gokn4otxdm6yqtb3t8gbehuyx2', 'YTEwMWY3OWE3YzUzZGQ2MDE0NDUwZDczMWVhMzEzODZlNjkxODI1Yjp7InBhdGllbnQiOmZhbHNlLCJkb2N0b3IiOmZhbHNlfQ==', '2020-01-18 15:02:40.115286');
INSERT INTO `django_session` VALUES ('g7oo26a2orzmghdh4x3ira1g7nammbx7', 'MjZiZDY3M2YxYzU0MzE2ZGQxZjFhMzQ4NjEwMTY2NDMyYzZmMzIyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2ZiZDAwMGE1ZTA0ZWRkMGI0NjcxNDgxY2Y1MTU1MDk4MjY0NTA5Iiwic3VwZXJfbWFuYWdlciI6eyJzdXBlcl9tYW5hZ2VyIjp0cnVlfX0=', '2020-01-22 17:49:53.697566');
INSERT INTO `django_session` VALUES ('gh1xli00v9fhmap7c1h67pr4ljdyw8nr', 'YjA1ZmM2MWM4OTE5YWRkMGI2OGMzOTI4ZWY1NWQyNGU0NDE2MmZmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwY2ZiZDAwMGE1ZTA0ZWRkMGI0NjcxNDgxY2Y1MTU1MDk4MjY0NTA5IiwiZG9jdG9yIjpmYWxzZSwicGF0aWVudCI6eyJpZCI6MSwiZW1haWwiOiIxMzkxNDA1QHFxLmNvbSIsIm5hbWUiOiJcdTU0NjhcdTY3NzBcdTRmMjYiLCJyb2xlIjoicGF0aWVudCJ9fQ==', '2020-01-15 14:37:24.654206');
INSERT INTO `django_session` VALUES ('olgnjeu4k859v9no2159rolw0urf3drk', 'NDAyZDg5M2VlNTFhZjVhOTNlOGU1MjU0MmJkYTNiOTEyMWYwOWUwYjp7InBhdGllbnQiOnsiaWQiOjEsImVtYWlsIjoiMTM5MTQwNUBxcS5jb20iLCJuYW1lIjoiXHU1NDY4XHU2NzcwXHU0ZjI2Iiwicm9sZSI6InBhdGllbnQifSwiZG9jdG9yIjpmYWxzZX0=', '2020-01-17 09:15:04.848852');
INSERT INTO `django_session` VALUES ('t5zi11x659kxg7d4sy5y619ok2ro3286', 'NmIxZjI2YWM1NWIzNTE1ZjVjMjQxZDNhYWYwYWY5ZTY2MzgyYTViZDp7InBhdGllbnQiOnsiaWQiOjIsImVtYWlsIjoiNTIwMTMxNEBxcS5jb20iLCJuYW1lIjoiXHU2Nzk3XHU0ZmNhXHU2NzcwIiwicm9sZSI6InBhdGllbnQifSwiZG9jdG9yIjpmYWxzZSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBjZmJkMDAwYTVlMDRlZGQwYjQ2NzE0ODFjZjUxNTUwOTgyNjQ1MDkifQ==', '2020-01-18 13:10:45.506530');

-- ----------------------------
-- Table structure for Medical_system_collection_doctor
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_collection_doctor`;
CREATE TABLE `Medical_system_collection_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient` int(11) NOT NULL,
  `doctor` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_collection_doctor
-- ----------------------------
INSERT INTO `Medical_system_collection_doctor` VALUES ('2', '1', '1', '2019-12-30 19:18:55.414104');
INSERT INTO `Medical_system_collection_doctor` VALUES ('3', '2', '3', '2020-01-04 12:53:52.329725');

-- ----------------------------
-- Table structure for Medical_system_collection_video
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_collection_video`;
CREATE TABLE `Medical_system_collection_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient` int(11) NOT NULL,
  `video` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_collection_video
-- ----------------------------
INSERT INTO `Medical_system_collection_video` VALUES ('3', '1', '5', '2019-12-30 18:44:28.105868');
INSERT INTO `Medical_system_collection_video` VALUES ('5', '1', '4', '2019-12-30 19:23:57.555865');
INSERT INTO `Medical_system_collection_video` VALUES ('6', '1', '7', '2020-01-04 12:38:08.377272');

-- ----------------------------
-- Table structure for Medical_system_commet
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_commet`;
CREATE TABLE `Medical_system_commet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient` int(11) NOT NULL,
  `video` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `info` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_commet
-- ----------------------------
INSERT INTO `Medical_system_commet` VALUES ('2', '1', '5', '2019-12-30 22:20:01.056643', '有点用，可以收藏试试');
INSERT INTO `Medical_system_commet` VALUES ('3', '1', '4', '2020-01-04 10:12:28.981209', '挺好的。');
INSERT INTO `Medical_system_commet` VALUES ('4', '2', '9', '2020-01-04 13:04:46.117382', '我看了 ，非常好');
INSERT INTO `Medical_system_commet` VALUES ('5', '1', '5', '2020-01-04 15:02:22.494100', '真的挺好的，');

-- ----------------------------
-- Table structure for Medical_system_doctor
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_doctor`;
CREATE TABLE `Medical_system_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `email` varchar(20) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `address` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `person_info` varchar(100) NOT NULL,
  `hospital_info` varchar(100) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_doctor
-- ----------------------------
INSERT INTO `Medical_system_doctor` VALUES ('1', '天天医院', '李医生', '男', '13914056@qq.com', '15896898789', '三东省济南', '123', '负责禽流感的治疗。', '各种疾病都可以治疗。', '2019-12-31 14:10:28');
INSERT INTO `Medical_system_doctor` VALUES ('3', '吾乃医院', '李伟杰', '女', '1314520@qq.com', '18598687845', '海南海口', '456123', '疑难杂症。毫无科学依据的疾病', '各种疾病防治等。', '2020-01-04 12:44:45');

-- ----------------------------
-- Table structure for Medical_system_patient
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_patient`;
CREATE TABLE `Medical_system_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `email` varchar(20) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `address` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `info` varchar(100) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_patient
-- ----------------------------
INSERT INTO `Medical_system_patient` VALUES ('1', '周杰伦', '女', '1391405@qq.com', '15879868542', '浙江绍兴', '123456', '一个容易生病的人，所以想看看本站。\r\n                    ', '2019-12-30 16:43:00');
INSERT INTO `Medical_system_patient` VALUES ('2', '林俊杰', '男', '5201314@qq.com', '1526885968', '湖南省张家界', '8520', '主要想知道，预防疾病的方法。', '2020-01-04 12:52:23');

-- ----------------------------
-- Table structure for Medical_system_recode
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_recode`;
CREATE TABLE `Medical_system_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient` int(11) NOT NULL,
  `video` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_recode
-- ----------------------------
INSERT INTO `Medical_system_recode` VALUES ('3', '1', '4', '2020-01-04 10:12:30.139166');
INSERT INTO `Medical_system_recode` VALUES ('4', '1', '5', '2020-01-04 15:02:28.515494');
INSERT INTO `Medical_system_recode` VALUES ('5', '1', '7', '2020-01-04 12:38:10.941449');
INSERT INTO `Medical_system_recode` VALUES ('6', '2', '9', '2020-01-04 13:04:47.363018');

-- ----------------------------
-- Table structure for Medical_system_video
-- ----------------------------
DROP TABLE IF EXISTS `Medical_system_video`;
CREATE TABLE `Medical_system_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` datetime(6) NOT NULL,
  `info` varchar(100) NOT NULL,
  `doctor` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Medical_system_video
-- ----------------------------
INSERT INTO `Medical_system_video` VALUES ('4', '禽流感如何预防', 'files/20191230/a.mp4', '2019-12-30 15:56:18.509521', '详细介绍怎么预防禽流感，治疗禽流感。', '1');
INSERT INTO `Medical_system_video` VALUES ('5', '异常感冒怎么判断', 'files/20191230/f.mp4', '2019-12-30 15:57:38.654556', '介绍了怎么知道自己是否感冒，怎么预防感冒等。', '1');
INSERT INTO `Medical_system_video` VALUES ('7', '药物的正确服用方法', 'files/20191230215853/f.mp4', '2019-12-30 21:58:53.468264', '教大家如何在生活中正确服用药品，保存身体健康。', '1');
INSERT INTO `Medical_system_video` VALUES ('8', '腰部疼痛如何预防', 'files/20200104124928/muv.mp4', '2020-01-04 12:49:28.187173', '学会了。大家以后再也不会了腰痛，', '3');
INSERT INTO `Medical_system_video` VALUES ('9', '让所有疾病都远离你', 'files/20200104125550/muv.mp4', '2020-01-04 12:55:50.137807', '如果你还在被疾病困扰，那就关注我。', '3');
