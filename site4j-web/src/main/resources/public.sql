/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 90609
 Source Host           : localhost:5432
 Source Catalog        : site4j
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90609
 File Encoding         : 65001

 Date: 25/03/2019 22:25:26
*/


-- ----------------------------
-- Sequence structure for biz_article_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_article_id_seq";
CREATE SEQUENCE "public"."biz_article_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for biz_article_look_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_article_look_id_seq";
CREATE SEQUENCE "public"."biz_article_look_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for biz_article_love_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_article_love_id_seq";
CREATE SEQUENCE "public"."biz_article_love_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for biz_article_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_article_tags_id_seq";
CREATE SEQUENCE "public"."biz_article_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for biz_comment_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_comment_id_seq";
CREATE SEQUENCE "public"."biz_comment_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for biz_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_tags_id_seq";
CREATE SEQUENCE "public"."biz_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for biz_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."biz_type_id_seq";
CREATE SEQUENCE "public"."biz_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for search_count_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."search_count_id_seq";
CREATE SEQUENCE "public"."search_count_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for search_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."search_history_id_seq";
CREATE SEQUENCE "public"."search_history_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_config_id_seq";
CREATE SEQUENCE "public"."sys_config_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_link_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_link_id_seq";
CREATE SEQUENCE "public"."sys_link_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_notice_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_notice_id_seq";
CREATE SEQUENCE "public"."sys_notice_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_resources_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_resources_id_seq";
CREATE SEQUENCE "public"."sys_resources_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_role_id_seq";
CREATE SEQUENCE "public"."sys_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_role_resources_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_role_resources_id_seq";
CREATE SEQUENCE "public"."sys_role_resources_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_template_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_template_id_seq";
CREATE SEQUENCE "public"."sys_template_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_user_id_seq";
CREATE SEQUENCE "public"."sys_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for biz_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_article";
CREATE TABLE "public"."biz_article" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_article_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "original_link" varchar(128) COLLATE "pg_catalog"."default",
  "original_author" varchar(64) COLLATE "pg_catalog"."default",
  "user_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "cover_image" varchar(255) COLLATE "pg_catalog"."default",
  "qrcode_path" varchar(255) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default",
  "content_md" text COLLATE "pg_catalog"."default",
  "type_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(300) COLLATE "pg_catalog"."default",
  "keywords" varchar(200) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "comment" bool,
  "original" bool,
  "recommended" bool,
  "top" bool,
  "is_markdown" bool,
  "status" int2
)
;
COMMENT ON COLUMN "public"."biz_article"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."biz_article"."type_id" IS '类型';
COMMENT ON TABLE "public"."biz_article" IS '文章';

-- ----------------------------
-- Records of biz_article
-- ----------------------------
INSERT INTO "public"."biz_article" VALUES ('05f0a0f3f4a14f7793fd1da8f0c9cd7e', '3', '3', '3', '1', '', NULL, '<p>1</p>
', '1', 'b4b6d877c52d4cd8b568c5d5f95b42c4', '3', '3', '2019-02-10 13:48:27+08', '2019-02-10 13:48:27+08', 't', 't', NULL, NULL, 't', 1);
INSERT INTO "public"."biz_article" VALUES ('0b77c93c1e48430bbd7208e63381f83a', '5', '3', '3', '1', '', NULL, '<p>1</p>
', '1', 'b4b6d877c52d4cd8b568c5d5f95b42c4', '3', '4', '2019-02-10 13:49:39+08', '2019-02-16 22:23:20+08', 't', 't', NULL, NULL, 't', 1);

-- ----------------------------
-- Table structure for biz_article_look
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_article_look";
CREATE TABLE "public"."biz_article_look" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_article_look_id_seq'::regclass),
  "article_id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(32) COLLATE "pg_catalog"."default",
  "user_ip" varchar(50) COLLATE "pg_catalog"."default",
  "look_time" timestamptz(0),
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "article_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."biz_article_look"."article_id" IS '文章ID';
COMMENT ON COLUMN "public"."biz_article_look"."user_id" IS '已登录用户ID';
COMMENT ON COLUMN "public"."biz_article_look"."article_name" IS '文章名称';

-- ----------------------------
-- Records of biz_article_look
-- ----------------------------
INSERT INTO "public"."biz_article_look" VALUES ('cf93c79fb5184005a8fe087e601983f1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-02-10 17:19:13+08', '2019-02-10 17:19:13+08', '2019-02-10 17:19:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('74f3a29267a14d1a8b50f8026b78d043', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-02-10 17:21:39+08', '2019-02-10 17:21:39+08', '2019-02-10 17:21:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1ec1465124d24c7eb28d9bce499b135e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-02-10 17:22:27+08', '2019-02-10 17:22:27+08', '2019-02-10 17:22:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('de5d10ed9e7245a6b1a1a582d3af080d', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-02-10 20:31:29+08', '2019-02-10 20:31:29+08', '2019-02-10 20:31:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6f1d6b2a8ab544f399659910f13fc857', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-02-10 20:34:01+08', '2019-02-10 20:34:01+08', '2019-02-10 20:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('49edfb3347a14aa3be6b0faaf2624dfd', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-02-10 20:34:40+08', '2019-02-10 20:34:40+08', '2019-02-10 20:34:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1dc2e8f1503545e7b68f90513fdcd9f8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-02-11 11:03:34+08', '2019-02-11 11:03:34+08', '2019-02-11 11:03:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b9da07dabb9b4841ae4eb9be539577ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-02-11 14:24:56+08', '2019-02-11 14:24:56+08', '2019-02-11 14:24:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c005f96c92be433daad9d8c71532451e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-02-16 22:09:06+08', '2019-02-16 22:09:06+08', '2019-02-16 22:09:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9d895baef1c24ddbb747dd4e67a21a7d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:33:41+08', '2019-03-01 22:33:41+08', '2019-03-01 22:33:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('936851360cbb4c29959f49d2e924ed86', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:33:46+08', '2019-03-01 22:33:46+08', '2019-03-01 22:33:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('395e6d77e5ee4d35a0b8a131fce72fd9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:33:55+08', '2019-03-01 22:33:55+08', '2019-03-01 22:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd7d31a5f5a945f4a57119bed2bfa5ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:33:59+08', '2019-03-01 22:33:59+08', '2019-03-01 22:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f14a847d1150437d8a2bdb1ed67cd356', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:34:04+08', '2019-03-01 22:34:04+08', '2019-03-01 22:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b58d72c300dc44d6880774b4ead72dae', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:34:10+08', '2019-03-01 22:34:10+08', '2019-03-01 22:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8d9c96f3f9464599a24fba02aa1a3213', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:34:15+08', '2019-03-01 22:34:15+08', '2019-03-01 22:34:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3e497ef8882c4424a86b7343a2e58cf6', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:34:25+08', '2019-03-01 22:34:25+08', '2019-03-01 22:34:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('028709e9d02240be8fe369a64019ba39', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:34:44+08', '2019-03-01 22:34:44+08', '2019-03-01 22:34:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('495d06c792994af4acd50fc15f8bac69', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:35:00+08', '2019-03-01 22:35:00+08', '2019-03-01 22:35:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f8d8e91e147246628442b5769361d1e8', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:35:16+08', '2019-03-01 22:35:16+08', '2019-03-01 22:35:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0b48195481f745aca361d81b5dfae35c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:35:33+08', '2019-03-01 22:35:33+08', '2019-03-01 22:35:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8edd72c2717842708f102f76c74ef5e5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:42:59+08', '2019-03-01 22:42:59+08', '2019-03-01 22:42:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4d387a6154aa4ecaa60b350e44d7e2e6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:44:05+08', '2019-03-01 22:44:05+08', '2019-03-01 22:44:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('962cb8ffc94a4bc6aec97137e54cfa6a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:44:08+08', '2019-03-01 22:44:08+08', '2019-03-01 22:44:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3fe2cdf5226045d8b0334e439c0b130a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:44:08+08', '2019-03-01 22:44:08+08', '2019-03-01 22:44:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('04e720cb083a4699a88bb8cbe4de159f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:44:08+08', '2019-03-01 22:44:08+08', '2019-03-01 22:44:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3cb36917a7004db883e034ea6fae518f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:44:14+08', '2019-03-01 22:44:14+08', '2019-03-01 22:44:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e73077246db440a9e740681d92d1629', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:01+08', '2019-03-01 22:45:02+08', '2019-03-01 22:45:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7d3d2d3cc7d3414b8ebc8267fa627b1d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:11+08', '2019-03-01 22:45:12+08', '2019-03-01 22:45:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bfb69ae221f5412faaf111ab20a6df0c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:14+08', '2019-03-01 22:45:14+08', '2019-03-01 22:45:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e9980abd61b418196a3c9b8ba335118', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:14+08', '2019-03-01 22:45:15+08', '2019-03-01 22:45:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf8e43c6835d4d09aa8b990c584b98fe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:16+08', '2019-03-01 22:45:16+08', '2019-03-01 22:45:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f8bad1414e1746899c57b98a32fbd3e7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:17+08', '2019-03-01 22:45:17+08', '2019-03-01 22:45:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c76da32a6f1c4971b72c9029975198b0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:17+08', '2019-03-01 22:45:17+08', '2019-03-01 22:45:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('676d09c9a2e64d97930bfe4bb47101d3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:19+08', '2019-03-01 22:45:19+08', '2019-03-01 22:45:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9533a47e4c2c480f965dc8046812e4d9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:20+08', '2019-03-01 22:45:20+08', '2019-03-01 22:45:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a4eda1f23c3b4a5cae4e7f4f6aba62ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:20+08', '2019-03-01 22:45:21+08', '2019-03-01 22:45:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3896b5c02fb442929a08f14c60180ee5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:20+08', '2019-03-01 22:45:21+08', '2019-03-01 22:45:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dde4f6fd5d88471a848f1db3c432f45e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:21+08', '2019-03-01 22:45:22+08', '2019-03-01 22:45:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7bab93cd91fb441cb53d0e3d12b12fdb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:22+08', '2019-03-01 22:45:23+08', '2019-03-01 22:45:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7bdc9d441e641fd9cd971bd50f64617', '0b77c93c1e48430bbd7208e63381f83a', NULL, '''', '2019-03-01 22:45:25+08', '2019-03-01 22:45:25+08', '2019-03-01 22:45:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1caf71faa0524e6c870716965c25623e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%27', '2019-03-01 22:45:26+08', '2019-03-01 22:45:26+08', '2019-03-01 22:45:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5ee8735d8a4840a89d91d3e1665bdcb2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%2527', '2019-03-01 22:45:27+08', '2019-03-01 22:45:27+08', '2019-03-01 22:45:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b9dc2bfe10b4216affc31b3fd252acc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '&quot;', '2019-03-01 22:45:28+08', '2019-03-01 22:45:28+08', '2019-03-01 22:45:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9a015f8a7abe44c8b4a824e5bf421816', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:28+08', '2019-03-01 22:45:28+08', '2019-03-01 22:45:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6216a8a16b234f659722a50772102d08', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%c0%a7', '2019-03-01 22:45:29+08', '2019-03-01 22:45:29+08', '2019-03-01 22:45:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('938ce179587a4a12b7cf0844b6e568e2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:29+08', '2019-03-01 22:45:29+08', '2019-03-01 22:45:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1d28f69aa2bf4b0881ebb8c8e2524fca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:30+08', '2019-03-01 22:45:30+08', '2019-03-01 22:45:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e10d3c09dac3494a9d1c507c6a8adcd9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:31+08', '2019-03-01 22:45:31+08', '2019-03-01 22:45:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f9b005228f8a4fd28d14ee1905e3e19d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:32+08', '2019-03-01 22:45:32+08', '2019-03-01 22:45:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a6b77ad06294f01a13351397394ea81', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:33+08', '2019-03-01 22:45:33+08', '2019-03-01 22:45:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ebcd9a4254774fadab4ce96e1f021d03', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:33+08', '2019-03-01 22:45:33+08', '2019-03-01 22:45:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('429def48b9564bf480021ea2efe4458c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:34+08', '2019-03-01 22:45:34+08', '2019-03-01 22:45:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('42c7113bd9d341c68ff46f1dd835b9c9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:36+08', '2019-03-01 22:45:36+08', '2019-03-01 22:45:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f76c9d4cf97049c19240edf2f139835b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:37+08', '2019-03-01 22:45:37+08', '2019-03-01 22:45:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('04b401fc6aca45dabad597e6c122c58e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:41+08', '2019-03-01 22:45:41+08', '2019-03-01 22:45:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b775c2a71846442ba49997e28a5d3fe3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:41+08', '2019-03-01 22:45:41+08', '2019-03-01 22:45:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c25725feec43437aaf92ae3cbd405a46', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:43+08', '2019-03-01 22:45:43+08', '2019-03-01 22:45:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cd07d712b2f34d98a256bcfd562a0f61', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:43+08', '2019-03-01 22:45:43+08', '2019-03-01 22:45:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f8314ba444ba4512ab04529b5fb4896a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:44+08', '2019-03-01 22:45:44+08', '2019-03-01 22:45:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6b18779732b44b839c3830f57da7d4ff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:45:50+08', '2019-03-01 22:45:50+08', '2019-03-01 22:45:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('030a894c20bf4d8a82a468b00f3c0822', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:07+08', '2019-03-01 22:46:07+08', '2019-03-01 22:46:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6f175962b2084350aebc30a433035316', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:08+08', '2019-03-01 22:46:08+08', '2019-03-01 22:46:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a41613a888c34608a4001f39a1445f38', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:09+08', '2019-03-01 22:46:09+08', '2019-03-01 22:46:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1df6c4a193124d6988f3b947af11e5ae', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:09+08', '2019-03-01 22:46:09+08', '2019-03-01 22:46:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5acbacce12694c56bf034e701edfb63a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:10+08', '2019-03-01 22:46:10+08', '2019-03-01 22:46:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('00a6a10929bc44c48480b4ec56197bd3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:10+08', '2019-03-01 22:46:10+08', '2019-03-01 22:46:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bf267dcd214448018fdf63da08b48b88', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:10+08', '2019-03-01 22:46:10+08', '2019-03-01 22:46:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8bc0ea381a464cbaaeb31797722f9479', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:13+08', '2019-03-01 22:46:13+08', '2019-03-01 22:46:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('869329204fa841e981cd10b48e23658e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:13+08', '2019-03-01 22:46:13+08', '2019-03-01 22:46:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('db16e14a379e496c936c4b05a248fbcc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:14+08', '2019-03-01 22:46:14+08', '2019-03-01 22:46:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('39a04ce310164704b5d6eecebd5a61ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:14+08', '2019-03-01 22:46:14+08', '2019-03-01 22:46:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('539cd87fb51e46c2ae4212298ccc4771', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:15+08', '2019-03-01 22:46:15+08', '2019-03-01 22:46:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('64843fde1ee04635aa58a35bac37aa2d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:15+08', '2019-03-01 22:46:15+08', '2019-03-01 22:46:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('024a5b91dc77407b9f361d4cb3369eec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '''', '2019-03-01 22:46:21+08', '2019-03-01 22:46:21+08', '2019-03-01 22:46:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0a0cbd71802f418a9d20ef8e14bf4a1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%27', '2019-03-01 22:46:23+08', '2019-03-01 22:46:23+08', '2019-03-01 22:46:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e321a22b6d14724bbc4303e594f39ea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%2527', '2019-03-01 22:46:23+08', '2019-03-01 22:46:23+08', '2019-03-01 22:46:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('737c2c82f902480387ffe07bf6df11dd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '&quot;', '2019-03-01 22:46:24+08', '2019-03-01 22:46:24+08', '2019-03-01 22:46:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('57d024b2d78e47b889e3db69b5640f2d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%c0%a7', '2019-03-01 22:46:24+08', '2019-03-01 22:46:24+08', '2019-03-01 22:46:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1ab65baff9943ada56e7a975c2ec3f2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:25+08', '2019-03-01 22:46:25+08', '2019-03-01 22:46:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('843b95c24710496aadb691fdff956f2d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:26+08', '2019-03-01 22:46:26+08', '2019-03-01 22:46:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60733fb4fc954761a7c3072777736bdd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:26+08', '2019-03-01 22:46:26+08', '2019-03-01 22:46:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3b3957e2bcfa42dc9aa111615798d0cc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:27+08', '2019-03-01 22:46:27+08', '2019-03-01 22:46:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b378a81279b047fab79eec36765a687a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:27+08', '2019-03-01 22:46:27+08', '2019-03-01 22:46:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf3c23563a4345c1bde8b843da5b0510', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:33+08', '2019-03-01 22:46:33+08', '2019-03-01 22:46:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0145cec778dd470e8798934ee8679a9a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:36+08', '2019-03-01 22:46:36+08', '2019-03-01 22:46:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('14a1e2b5619d48b8b1ec0cf016959114', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:36+08', '2019-03-01 22:46:36+08', '2019-03-01 22:46:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2240559103354211a9bf4607c7c7aac1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:37+08', '2019-03-01 22:46:37+08', '2019-03-01 22:46:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('94b8eb813e2c4054a7981bdf7e4daf0a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:37+08', '2019-03-01 22:46:37+08', '2019-03-01 22:46:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d3a5aae8257e4cd286a43f007b88dbee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:37+08', '2019-03-01 22:46:37+08', '2019-03-01 22:46:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('965d004c89ef4d189ba6b60a39781a70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:39+08', '2019-03-01 22:46:39+08', '2019-03-01 22:46:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a892392f5f6e4c4b950309143acbd0a7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:40+08', '2019-03-01 22:46:40+08', '2019-03-01 22:46:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('20f0ca82ebf6431998b2e77101cf5d12', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:41+08', '2019-03-01 22:46:41+08', '2019-03-01 22:46:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9f75ce4879b94a1fbc03ca87220921c3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:42+08', '2019-03-01 22:46:42+08', '2019-03-01 22:46:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4d18ee086c93469da0512d1fc0f134f8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:43+08', '2019-03-01 22:46:43+08', '2019-03-01 22:46:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('781731db283b4b3da153965a0d90ef3d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:45+08', '2019-03-01 22:46:45+08', '2019-03-01 22:46:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('abcf7a0f2e3c4ac08de274ba56c14a9e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:47+08', '2019-03-01 22:46:47+08', '2019-03-01 22:46:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b274319103484bf68bbb7d886302c45b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:47+08', '2019-03-01 22:46:47+08', '2019-03-01 22:46:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('08d8138d6ed84bff9176285447ffc32f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:49+08', '2019-03-01 22:46:49+08', '2019-03-01 22:46:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('95ea2d29a7054cfea829043391d6cbdf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:49+08', '2019-03-01 22:46:49+08', '2019-03-01 22:46:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2b3290c47ae14efb8e0c8b3fd61dc8c2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:50+08', '2019-03-01 22:46:50+08', '2019-03-01 22:46:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fce3d740fa1843a09dc45d16ad91aee5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:50+08', '2019-03-01 22:46:50+08', '2019-03-01 22:46:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eadf15ac501b497d922df1c8b612dfcb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:50+08', '2019-03-01 22:46:50+08', '2019-03-01 22:46:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('13a99af5565d4148adababb5ba6fb1c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:51+08', '2019-03-01 22:46:51+08', '2019-03-01 22:46:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ef9fcc7ce88e485188d870f69299237d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:51+08', '2019-03-01 22:46:51+08', '2019-03-01 22:46:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('091920086cc0427eaca7371b822d9ee4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:52+08', '2019-03-01 22:46:52+08', '2019-03-01 22:46:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e4bda955f10b4b958726b3651705a1a1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:52+08', '2019-03-01 22:46:52+08', '2019-03-01 22:46:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e3020f4aae14807b81d3b92edecbfa6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:54+08', '2019-03-01 22:46:54+08', '2019-03-01 22:46:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f88d10737c634a7a90baf8584feec548', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:46:58+08', '2019-03-01 22:46:58+08', '2019-03-01 22:46:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dbc1a936af95482f896334374e72322d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:04+08', '2019-03-01 22:47:04+08', '2019-03-01 22:47:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e71ca15d330b435fa1de1bb5b45c95ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:06+08', '2019-03-01 22:47:06+08', '2019-03-01 22:47:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('237a6423abe647bcb563a26c6ea04ec0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:07+08', '2019-03-01 22:47:07+08', '2019-03-01 22:47:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f3f5cc28f6b6461d9cb1976d45c07f51', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:08+08', '2019-03-01 22:47:08+08', '2019-03-01 22:47:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a362015efd02454a8b87dea8b69a0873', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:08+08', '2019-03-01 22:47:08+08', '2019-03-01 22:47:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9f16e10894654576878320df2eaec7e7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:08+08', '2019-03-01 22:47:08+08', '2019-03-01 22:47:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('992ed7ec6a084f8db5fb6d8b73138b7a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8c3281faa3d34cf39ec6877185db636d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c7708a106b934e92b1ec32e62e7c88ce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7de2bb30dbfb4d21bda1619189f9b899', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1c0a216baeef49ca938bd48b4538af10', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:11+08', '2019-03-01 22:47:11+08', '2019-03-01 22:47:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e021e7d37c3f4a1894135d99f36c45cb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:20+08', '2019-03-01 22:47:20+08', '2019-03-01 22:47:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('72c740ae3699403ea5470b045c7fe360', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:20+08', '2019-03-01 22:47:20+08', '2019-03-01 22:47:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc91e319ab784f3ca52419e2c1d3c18e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:26+08', '2019-03-01 22:47:26+08', '2019-03-01 22:47:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8fae6c16a0944b75a18bd4c38771e2c6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:43+08', '2019-03-01 22:47:43+08', '2019-03-01 22:47:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c07e352967a241d2a53ccc4f76a66090', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('39fbbcbf51a040fd9dc528bf6edcefab', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8f61adee51774111a8cb55fe5b2d8f0b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b4f261eebd304cdca5b86051b4abd24f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aaa56f1281f94b04a92833d6e8aa39d1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('caef0dd069dd4c3a9fa66ed43541a3dd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f16923ffc779471b933c5fca5d0d2be8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a6722cbce8564d1c9047a9be42ec9008', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a872b5b9496d463292015ec8fd4b5706', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3ca29c765a424bdfb24892952b2e60c6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('801f1af64ad24b249d260d90535340a3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd1894770d6c49fa9210c7cb60d014ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('95e77fa870814fdf81322e390026cf59', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fb46879748f74ee7bf5731ee7aa6c84a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ba2e525b912842a6863651dcb29366b6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7efd9e48f2ac472196c94977a7f6903d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', '2019-03-01 22:47:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('56d15c285bb941e6834e968c7b724cb3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d9624051141c418788613f0f3295f2fc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a489f2351af7407790d12ef7d767e4c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:10+08', '2019-03-01 22:47:11+08', '2019-03-01 22:47:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb6d0b7dc6474063a9df2d3f6ef3d5db', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b18b2e232fd547279054fe1326879624', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ed0bb91ad3044e53b96135ae796ff47b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('44a8858361e749d1bad7514219e3d8f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4ea9830f8068418191d0895a7c190d1f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ce18b2d12df74831802b44a1bcb6ae4a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4bbe345415d74ac18bbab4accd1507dd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:35+08', '2019-03-01 22:47:35+08', '2019-03-01 22:47:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8231f754b0a64ef6890b922e3190c302', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:36+08', '2019-03-01 22:47:36+08', '2019-03-01 22:47:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('adc895dd9906443a8b912333f63f1114', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:38+08', '2019-03-01 22:47:38+08', '2019-03-01 22:47:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('071782630b7d44db9903db5dd4f818fc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:39+08', '2019-03-01 22:47:39+08', '2019-03-01 22:47:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4dc1e47377804b3cb2796a825993f4cb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c1bb30ce2ee94c74b378e3dfd1541e55', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('342016abe742407b8032234a2df72a4b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('316ab1e684e24a3bb71d414ff70f5178', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fc64205efea944928d8ada6ebfa6c35e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7d21f7f020204b26b2aac50f69a21662', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('489c030adb6f41c5a41767013a099baf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('696ce0f5e0504406bd037452098378ec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a8200265056d4e38b9d46c84bd8e9107', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('47bff47ae21a47a489751945eaf6d34f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0cee3297c3144b9daa0e95317046d282', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b32244a282ed48969acb78dafab952a8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('10e34373d01d46c78b2cf456b1e3729b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f10964500b6642eaa2067b0e02077646', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dbfe3ed1f7e44e719d7625cd0311b743', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ff13af469eb44c94a96ee00fc21adb92', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('af375af76e8542b9829fdaae3d90fb5f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f62d437a4c394df19a81019deaf26814', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ab13a7aa452a408494e89993f5fca279', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3170283f0fec43eba6c817ae81c51ef2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d18b02fb5f644391a785e2a823bb78ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aa6046f7578c4ce9924db3866490ff74', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eff3f848b1484fcbb648bb5b9dd81c2e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6cc47c13d9284451b8dc0a4accbaa2cd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('984c88f164b842ec82d2a66465371bb2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('26fb6ad3995c476999a4b76d89c4f9c1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2548ffa65b194e2789d6b58b8e1b956c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('99158e3cf9c6406da7f67cffc6319db6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7453a27cee694423842ecdd5d69904a9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ea7c96b05beb4a5b8815c9ab0b422200', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4ec0dcd67fc440e48c3fa92fefe0c15f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('213dabb2334f49d188c5acace6b0bd16', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:50+08', '2019-03-01 22:47:50+08', '2019-03-01 22:47:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cddcb20b1b894d1697e623caed992859', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:50+08', '2019-03-01 22:47:50+08', '2019-03-01 22:47:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('622e4ed8a9de4efca27045326357c5fd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:50+08', '2019-03-01 22:47:50+08', '2019-03-01 22:47:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c2de3bf456c4ed9889906a0eed2db31', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9d1ef04cd7df4922829936d8e2412897', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('628ffb2e5d9444cba0a18b8789bd0f36', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('22a52dfa01644f30bd9febb7c7b44c28', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e981d1b4f57491a8c8a53f0ecadaeb8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('21ce89d7f9b142debd14222bbc909a0a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ae7878fe5a864f9f8416e0e6f37d4e63', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a85adb3a57a94492a4e6f37561adfd47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:59+08', '2019-03-01 22:47:59+08', '2019-03-01 22:47:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1e9ed66fb3746cb866cd935ee1664a5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('afd83ec058da4574913270790357abc0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7394cf9f51aa4df782bbb06ad1214cb7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b257e974ea3434491612d1579e66336', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6c00104defaa4591b79b328c8734bdd6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4bd8ec60bd1e44478f70a8e301099cf6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e86e9fe8df224a7ea60126a91c8f17f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b88f741f78234a0aad71946e0187d1c4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5922e4b76e6242b68099f19dc9773928', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('063b9a5996f446e99385a18dd227ee1e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e4967dd0f8ac46f585c70c4af464bc95', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ea63fe9247e9473881b6280b3ddf110e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('259298a2dff5432682c5c111751f34b0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('195d1e84ee4948ce88c363927ae4b0c3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e05622feae64a909737d26abfbb3041', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7f5f15ba999341249704b58c6c4e2a56', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('148b5a6d64184cc1af55cadd1a6a7102', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0f4e3afc0f2a42768e38e9d99c58a717', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e76c1d4d732439bb76eeeb4a8e4d937', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', '2019-03-01 22:47:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7338a9c8fd3f4c229105e91559fa5dbb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:12+08', '2019-03-01 22:47:12+08', '2019-03-01 22:47:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dfef186a886442dea23d3e8db4e92722', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:13+08', '2019-03-01 22:47:13+08', '2019-03-01 22:47:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb4e2c1b356a4d25bbd688bf888f8faf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:14+08', '2019-03-01 22:47:14+08', '2019-03-01 22:47:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('189222837d4b4682a0139149eb5bb2b1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:23+08', '2019-03-01 22:47:23+08', '2019-03-01 22:47:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('92d4d4a7fd5a40f68afb455c574826da', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:23+08', '2019-03-01 22:47:23+08', '2019-03-01 22:47:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('71b7d062dd414e0491fa35cda557e190', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:25+08', '2019-03-01 22:47:25+08', '2019-03-01 22:47:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('476ccc8924944d4c8ca410e8a40f9bb3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:27+08', '2019-03-01 22:47:27+08', '2019-03-01 22:47:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1ea0252c9ee144efb39f4350d138be14', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c523d8a251c94bd9a19cd4f7c3568de2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('88a91dfb470f40f396781d8772cf64ae', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', '2019-03-01 22:47:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a5c1b00012b48e2a132fb31c49f8c6a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ce7f0831cc844f69b1b037161b39a963', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf3cff6dc9894d6c872ce0724ddee8b6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4f496139d8464173825cc8a432513052', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', '2019-03-01 22:47:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5969089548364327a14e5c308d310f01', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bd11b8c68592427caea3eb5d1ad79658', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e46ba4fa964437ea107e371e593a68c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1b13cddf7b12447faee68de1584d929d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d30d5770d7a74da584ee9be310f8aea4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e578b678c0e147fdb7f35c4afa2d677c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('608555c8b5d146e7a6627d76aa355a86', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eb5e2923d0d144b6a000566414c5027b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e0dee42f8e44bb0b9d6e33d85bfab4a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9d994525597f4f6db39e856124d51b8c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('11b85dfb943e4aed8fd71fba8c0abc32', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:41+08', '2019-03-01 22:47:41+08', '2019-03-01 22:47:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('17846ddc272045f79a3dafe26f0b97f4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8366bf2d932d4fdda8c29142ca0625c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', '2019-03-01 22:47:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('778729f8b3ac49ef8ccc02e73f62f331', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:43+08', '2019-03-01 22:47:43+08', '2019-03-01 22:47:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('89ac0e2d7f674892a59cb9443489c122', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45c11a05cd8e4ecfa6a428f80e055de1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2e49a554c8df44c9a6e438e0c66695e2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5be2c1e9b0ae4bc58b1a1027efd6eb5a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd7f701404cb46e295a371e515f9c401', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d52ddb30e814484e9e59e61cd8b64acd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('208272cb9d5b4220aacd5f16b143fff2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c4c5c0aad5dc4cf8bf1ec2fc1585632e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0f950b5d7f84d118bccca92d5fffef4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('43d2c654903d422dad48965dfa8b5362', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb76ed000d1b403aa18f079b072499c6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7e0b44fd1444494a90bde5bf03bc25d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2f7b62fdef48410e99751895a15f9701', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('75199a2b389f423ebcfb8e0c528d5de9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('589fefbae507461080f1ba89b0640328', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8aa6ba124a9d4add88377a71c8d71ae2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d45fd56fe2164b92b5f4c5cba218c85e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6d9dd044c3344824a19568946f689ac6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd41473ec42145b8962636894630de55', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('78cb205b258948cda5d21690b63840c9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', '2019-03-01 22:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2203b2591aa4412d99bd5a3819b2444e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('23d9258e3e8f4d61bd1af5ad731ef7cc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:51+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dba100de3f29449d96dd65c0ad4708c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ad022e735b5463da0cd95b38365b59d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('79f89c28174e4b5b95cd457514bb3d3d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('286ac364555a480eb09f57371ebb6796', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ca2bbcc8154c403f9ba80522c2968147', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('59f544d9c905463c9cec639ec72c2aad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1a852804d34b474ebf0b203f1ccf50aa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd0851b9095b4910980f46ba625d7543', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:18+08', '2019-03-01 22:47:18+08', '2019-03-01 22:47:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('991f37b9a5f0448680764a82e747d4b5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:21+08', '2019-03-01 22:47:21+08', '2019-03-01 22:47:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8cc5d3f7613f43f9b3ce2bdbed6850b4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:21+08', '2019-03-01 22:47:21+08', '2019-03-01 22:47:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eb04cd8b91a549d5a65322d5d61255b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:26+08', '2019-03-01 22:47:26+08', '2019-03-01 22:47:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ebd3453bf2624d87ab23e4e372762b71', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:39+08', '2019-03-01 22:47:39+08', '2019-03-01 22:47:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f219f15bc4374575a98ffafa86b69f6d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:40+08', '2019-03-01 22:47:40+08', '2019-03-01 22:47:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aa0b8926e3f948e4aff37a95549af14b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6c7cd598f20f463e95bfdf2b710eb22b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf9b5c85d0e74f0c9e5a2bda87a68be2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:25+08', '2019-03-01 22:47:25+08', '2019-03-01 22:47:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('060647a0e8b743a7893e24c867c5e203', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9f4fef699f324a1ba92634e41e276f44', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d7b8ab5be806443da64c94978e464b09', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9e8eaf200add438abb657a621edd2408', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', '2019-03-01 22:47:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c665198e8f6c411392ed352d836e5d12', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', '2019-03-01 22:47:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a3844d5dac684e6cbd699eba32f5c459', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d1cbb7f4ed94c4f829dfb5ecf66fb66', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', '2019-03-01 22:47:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d6a14ee8ea0049b0a432dbce7a8f4f61', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:37+08', '2019-03-01 22:47:37+08', '2019-03-01 22:47:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d2f83664b36b422c8fff1bb553d66ff0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:43+08', '2019-03-01 22:47:43+08', '2019-03-01 22:47:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5090e4f594e34c7b912ff78df4631519', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', '2019-03-01 22:47:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f5593fe5f9b6499ba3c5a3d0087e605c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', '2019-03-01 22:47:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('65a56e5d1b5c45ae9e3bb9bd96f84e1e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4fc624dba532409e8f0df1c7b8733e60', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', '2019-03-01 22:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d6459e55f90f4eeebe882df159225ca0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('299f830b67b743dcbc1f32cade738f39', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('218b5283b2fc49bca9ee273737cfe7cf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', '2019-03-01 22:47:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f5b2ce9961a544fb961423034b4a3bfe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', '2019-03-01 22:47:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2131300347c94d71922e076e77cbbb65', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', '2019-03-01 22:47:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a719376e72d04358b9c5326f11e2bc91', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('143cf15d3b7140dfb9d53091ec3b8ebb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', '2019-03-01 22:47:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8a0b88932d7545eb80514035cc4dfa30', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:52+08', '2019-03-01 22:47:53+08', '2019-03-01 22:47:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ce33004e17014e368dbfac9d4aeb5dc7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', '2019-03-01 22:47:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2b46a172238141d093d0154d28cdec3d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('256ebc5eef6e41c59a5afa682862e1bd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('872fa91167534489988bdfa7b76a4a90', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0555849ed5a74126940f4ce9b4311cea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ac328799ff6141f0b991f0069d296bb5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('18e2318d112f4ab799f44a564ed7002b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('38dece4c5d1e44c79cc37e86f73619e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dfe6c72cde184aafbdf7f529ead16f89', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1acdfe25ae345e0a7d75c6a35049f4a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('081a53fa82514f5cbd60850ff3c62139', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c7d6bcc5901447f5ab7f93245fbdcfa2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4d77189ad11c49a19cf2d1d7bc71340c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4137a61248504f049874a08c8a29bf87', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b56fdbfb11e41b2a37a3b63093bf55d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:58+08', '2019-03-01 22:47:58+08', '2019-03-01 22:47:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5062951d49cc447f856b800b14cfda74', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:58+08', '2019-03-01 22:47:58+08', '2019-03-01 22:47:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('07dda8df9735440dbbe154be253a1b95', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5858287ac68d4fa8bac99b942eb3e019', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0aefe3130574ce38052f4127a2c9a56', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b8e6690cda04b4fb298c9e26d6ae8d3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('613289b190c8403bb68d36d55b982fe8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b9f044e6133648c8adf5dfbe870223fb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', '2019-03-01 22:48:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d7e99eb8da7544118b1f02028c5d4866', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96ba6bd7ada24317bc7197480d1c22f1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e0bbbc5116d40b1b3c382b98b4ad9be', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4e8593caa8fb46f2bef681997fedde3b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9187055576a24b5d9febd41de979c4cb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('130bfc5d174c4a5f906fd9fc7d6224a4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', '2019-03-01 22:48:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0869dcf257c444678d63f066fc11c17d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a99bb141c9cf4a20bbe3b189ed682574', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('335bede2ab094d5f997ed578129833b9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', '2019-03-01 22:48:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d489bef8cb074866b16dcd98ab661019', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bf896eca123b437c9c3179240e470800', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4dadec9609d84e7488b5856667cddcfe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3735b872d70c40d79c102c4279bacf70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e21aa25a40214f4dbf0e1f13a4debc89', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', '2019-03-01 22:48:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('16359a36ef06420890a6a2dd5de76f9d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d640edeece80455abe518e7e836a5eda', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c3325ca2939d40b4ba5b9c3319ee919a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', '2019-03-01 22:47:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('99a60d0bf77c4c27a21a3994f895c748', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('11d5fb9053ff4553b87a9e015381759d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e3b752977829436085243822ab96be8a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8d5167e92a74473c8a4409b82b1577d8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', '2019-03-01 22:47:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ac81551b48e342e9aa3bc9524e19c9d5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:57+08', '2019-03-01 22:47:57+08', '2019-03-01 22:47:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7c0f2ba5cdfb463e8840118fa050bc3b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:47:57+08', '2019-03-01 22:47:57+08', '2019-03-01 22:47:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('64af464d18be4948b99437317ae306f6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e6e4069e7b0c4ce5bbe7877aa08f7bce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', '2019-03-01 22:48:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1f91f32a385e4998b61b306c339559d8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', '2019-03-01 22:48:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4f93a8c42fbd4170bb27bfbba6d6a57a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', '2019-03-01 22:48:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb35c85c843f4930bbabcefea52cf5cf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9c4834029ec44424ac2279cf16268c7e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e460c003adfa4c82a83e8a8fa513f621', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7152ecd2cac145d7800734cd1106570f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('07de8dd544c340b5a27a843d0bf4f999', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('54fb5b5e29ea4f3d93d0389463d1c325', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('79ec30db0efa43c7b259713d58b1f87a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ffe32da7d6414b03bd2f6aeaa1987bd3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('34fe6729c89c43f59e2dac6acdb1f692', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('02f28da6b90540aeb28e3ae84c39f2d1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', '2019-03-01 22:48:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ddfbcf95a052470e94ee4cd4d5af3081', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:07+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('03f4431b745c41c8b7853b293b037972', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2cbc0e7660634061a5f7b3290677d34f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('03f0f53065cb43888ff6f73fc07e5ef6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8a35148285a34c53be1df0d67adf842e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('557cf036d62047bda36971404b209020', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('99e3bda6e8e84b0d88af0c4c9a4d40d0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9dd92cfa5da440d0a44479346e3ccd93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ca5b83f3b1ec44bc91ad443360854e4f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('108f231e85a44fd593b9fa8b8a9de6ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d3dff4bf81234293940f98c8fd6609ff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8abda05d61574e5cb623538e7e3bd7b4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a031e96a7dd84085b7134eeb1d0e535a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', '2019-03-01 22:48:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('350d64239a264b1aa0f30aae7cb6dee6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('55695de1f3fe4142975451272bcc4535', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d5d46897370d497c9c4c2a38a9c718ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('70caf5d52ec5417f8007447a10c862c3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('31133e4c5f2a459f8f88f9ab81fb2fa3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf6e0f5857224951b48d4bc993d565e5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b7342ec7d891456bb178fc3259ec876b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b4e091b9376545ca8d532d2f88aa8287', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('75e86e92d41643d082bc7d13fe395174', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('89277514ac984ed6aeb0f56fd5727556', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f62126ec8d524cc9aa2bbf492c1f3f2e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c6764053de964686a90e751716f0f859', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', '2019-03-01 22:48:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('50148812facc4bbe9029f0e9d308386a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('194e889754684f7f9eb49e9f0ecdf468', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fb0fd5ec4b5243eea394a9305db1681e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('20a0fb7c32c848869fa991fedacb1aa1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e941dd2a49cb4393826f3fd0968bba02', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('63c39007b84545918be0350c58c26398', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('11c6e2961b62496a9bba3650de469287', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6f697d8f9440454f86ee808bf66d1efb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', '2019-03-01 22:48:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c54344e9d8234582b925b928a4f5df1e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3b9228c2e67744cab10e338118487ec7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('937cfc9cc4b7418bb5902a2f0250a203', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cd9531c995e04f89aa855505cfc0024c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('38523b36bf7d4af5a4cf061745426019', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', '2019-03-01 22:48:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('66e135a7ac4b41d08728b9da3a954f10', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:15+08', '2019-03-01 22:48:15+08', '2019-03-01 22:48:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1386a8b5ac5c4a0dbda36c8bb3b868ff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:16+08', '2019-03-01 22:48:16+08', '2019-03-01 22:48:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ef96a4bcb33d4c7fb58369a35fbc09af', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ff10524dc58d4b31bb95944736dd72c3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86ff9a68ad4d4e29b13dc136a583d6d5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2f23473517814755a20a0f1b50e67a4a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:43+08', '2019-03-01 22:48:43+08', '2019-03-01 22:48:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1e745fc5af90496192476f0c177057fc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:12+08', '2019-03-01 22:48:12+08', '2019-03-01 22:48:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a268fd66fa446608b8fd2e34860b1f8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:13+08', '2019-03-01 22:48:13+08', '2019-03-01 22:48:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1fa15f84289948f9ae9b08738e9da2dd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:16+08', '2019-03-01 22:48:16+08', '2019-03-01 22:48:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ca45d065be5a417485f671e3ac803dc1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:19+08', '2019-03-01 22:48:19+08', '2019-03-01 22:48:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f59f43b981c04dddac44ea84704a6ca4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:21+08', '2019-03-01 22:48:21+08', '2019-03-01 22:48:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('84370189500d4a4ab84d647688283528', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1c6c602cea29438eb6de894129919324', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aaef1ce3d6ca4c70bab75c33e1a740fb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('694394ad762e451397323e995edbb712', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:24+08', '2019-03-01 22:48:24+08', '2019-03-01 22:48:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('67dbb2b285d3465ca6565fe3fba0b168', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:24+08', '2019-03-01 22:48:24+08', '2019-03-01 22:48:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1b377ff98de84b50beedfa500850afb5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5d384a40c6d410284c33d2a2cf5046c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('93feae13f7724ea2924c1aa41600972c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e9b791a18e504a098af9631fa99e61d2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bc717e4e49df4768afd61dbb35d57d73', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2e78d8a9ed4e4f69b0678c2537933ca2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4852e908fbdd4dc8a9bfd7fd760bc88a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5d999583fbb472fa203aa9c2393a003', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('50ff88db1b8244ad9f1735773c6541f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3a0d13acabe0456a9406776581b34e22', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eaa15f39ece447f19c6a1123cea262db', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('934db3e56f534a5e9c8ece367f67b12d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:31+08', '2019-03-01 22:48:31+08', '2019-03-01 22:48:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d4eea55ff22c48e4ad8b66402ded09e6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:31+08', '2019-03-01 22:48:31+08', '2019-03-01 22:48:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8a6698675c884e6cb1d64d8ea2436064', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:32+08', '2019-03-01 22:48:32+08', '2019-03-01 22:48:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1f09d3035fba4800acbff94e454ba751', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:33+08', '2019-03-01 22:48:33+08', '2019-03-01 22:48:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('658fbc809ea24cbeae277e74dfbf581f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:33+08', '2019-03-01 22:48:33+08', '2019-03-01 22:48:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('46b8d60fe435407fad07989ec992c45b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:34+08', '2019-03-01 22:48:34+08', '2019-03-01 22:48:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('026d26e98672443e8c227f236fb1eca2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:37+08', '2019-03-01 22:48:37+08', '2019-03-01 22:48:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('74caf85a7c1447949f9ba08bb84da3df', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2be86d41ba604ce088b342bc8770281b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:12+08', '2019-03-01 22:48:12+08', '2019-03-01 22:48:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1000ab9b7e274b1383e7c2edf49dfc46', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:19+08', '2019-03-01 22:48:19+08', '2019-03-01 22:48:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a11fa9d3afe1490ca424a74374d3bf07', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:22+08', '2019-03-01 22:48:22+08', '2019-03-01 22:48:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c46f269e83044077a5b47eb216e4c0b4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:22+08', '2019-03-01 22:48:22+08', '2019-03-01 22:48:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fe0be473195146ce9bf30b2403b1ed5f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', '2019-03-01 22:48:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7477d2beef444607b6284f6bda888943', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('54fcd5967614447c98a08c35c1c65379', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', '2019-03-01 22:48:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('95ad3fae184246109489cc7253ef3ee7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('320a0209e8ec4af992a1551580df391a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('db82444baded40778c8e50707501967d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('489f629774934b0aab8adbdf4f34287b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('625987f084a549b2868007779e759949', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0a05a5a7266c432880ae03b9c18bc307', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e26cc0ab1715454ba76ee385206b4fee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3bf455bd765144d8b017918f1f36585f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:38+08', '2019-03-01 22:48:38+08', '2019-03-01 22:48:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6a0cf9ff44a54ac585f7da87048c937e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:39+08', '2019-03-01 22:48:39+08', '2019-03-01 22:48:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2ac49bfd3ce343df8b7e74934720f3ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', '2019-03-01 22:48:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('47ad87cf3c0b421c8db50ec316a622ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:21+08', '2019-03-01 22:48:21+08', '2019-03-01 22:48:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86c9272f87e74ff5b11498770c4781af', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4bd45204aa54455c8708548d03303446', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1a421248326e48108cee3edf86d9c725', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('704469c69bb84ca28ab686429d9b3812', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7a11bb5a51f4fc982a9daa49b2f29f2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ac9fac43d554753a32c527e22274d9a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ecc7f215e6a4454ab3b707075d85604f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', '2019-03-01 22:48:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('77376058b93a45f6a704480d6f16e706', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('16f5f1910fb94733b150fcd63dc5ed1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8bdbd302209f4b87ad6fbec2f9c19705', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:36+08', '2019-03-01 22:48:36+08', '2019-03-01 22:48:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b167ca7e2b084d828de3fc558a8dccb1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:24+08', '2019-03-01 22:48:24+08', '2019-03-01 22:48:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('492b0177cf8546b2b190324d4b72039e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', '2019-03-01 22:48:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cdf3bb74f1994eec8c82187112fba091', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8726ea8b17834d6dbce63e59c18a5a2e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('216a1bb049af48e585af66935d84252c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', '2019-03-01 22:48:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ddef99606a74d36afa99003ef164c15', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0830d6ac502f45829fe2dde0af8cc0d3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6d338bf0ce324492aca142fc0d5938bd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dad465cc99bd4dcb856f173aa140fdac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', '2019-03-01 22:48:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3725651c24644792a019648fe9f31b7e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('97699b8887444ba3bfde6013601b4388', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0019219220f247cfb29aa30d409f73bf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', '2019-03-01 22:48:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('473007c453294f81bcaa431061415736', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:31+08', '2019-03-01 22:48:31+08', '2019-03-01 22:48:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2038ca7c20ac4897b8678237e0f75a91', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:33+08', '2019-03-01 22:48:33+08', '2019-03-01 22:48:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('15434655398d49c88927f94f53c175b4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:34+08', '2019-03-01 22:48:34+08', '2019-03-01 22:48:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fec38547e3864fdf88c969522cfae773', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:34+08', '2019-03-01 22:48:34+08', '2019-03-01 22:48:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bd29f90fb49246a89bfa0671dde20c0c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:35+08', '2019-03-01 22:48:35+08', '2019-03-01 22:48:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee91b3c369c84b34a024a5d72e187050', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:37+08', '2019-03-01 22:48:37+08', '2019-03-01 22:48:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3ef0cc816dc2434f9e02120b446bcc94', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:48:38+08', '2019-03-01 22:48:38+08', '2019-03-01 22:48:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1f6143c7ca89422c8a9159ead3cb9be1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:02+08', '2019-03-01 22:53:02+08', '2019-03-01 22:53:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('71507ab73a97495d91e5a68a963935d0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:05+08', '2019-03-01 22:53:05+08', '2019-03-01 22:53:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ef135aba7d23458fa12d492d5e86c723', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:06+08', '2019-03-01 22:53:06+08', '2019-03-01 22:53:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee93fb205e97495b9db6a199e598e262', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:07+08', '2019-03-01 22:53:07+08', '2019-03-01 22:53:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('602df40621134536800a4f3284822183', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:08+08', '2019-03-01 22:53:08+08', '2019-03-01 22:53:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('724bf5044f54494ba29f7a3a6896f7df', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:09+08', '2019-03-01 22:53:09+08', '2019-03-01 22:53:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e7fa922694ea44b38dfc42e3c6994fdb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:31+08', '2019-03-01 22:53:31+08', '2019-03-01 22:53:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1a9c164071e4171b2583aa6ad263b0a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:34+08', '2019-03-01 22:53:34+08', '2019-03-01 22:53:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('947afaddeb1844608209e25f3b92dd7c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:34+08', '2019-03-01 22:53:34+08', '2019-03-01 22:53:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('403efed37f5c4c23bf94b6f1d820070e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:34+08', '2019-03-01 22:53:34+08', '2019-03-01 22:53:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7056fe613690405cb21d6d0cbf453843', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3bc54214cd6b4956b6e3a654ad01589a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7ab9ce700157415ab7fc7f7b86f3a934', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('be5672b14277491bb50a2c4620276770', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3118f44ef1734efd9fedfbda52ad7b82', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c6dd3e668dc8444ab319af29a8b4e65f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', '2019-03-01 22:53:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d89f864bc4824a718e1c7214b8b80b66', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:36+08', '2019-03-01 22:53:36+08', '2019-03-01 22:53:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('855fe68d95394f36893e38e42ec8c33c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:36+08', '2019-03-01 22:53:36+08', '2019-03-01 22:53:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ba5bfa36852649b6b4278d1fe79d9133', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:40+08', '2019-03-01 22:53:40+08', '2019-03-01 22:53:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3730e5e0641d4fd19116e3679c9ada11', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:41+08', '2019-03-01 22:53:41+08', '2019-03-01 22:53:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b35e13ebad4d406c99523e454703af54', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:47+08', '2019-03-01 22:53:47+08', '2019-03-01 22:53:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9bcb01c61afb4136a8293115703792e2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:48+08', '2019-03-01 22:53:48+08', '2019-03-01 22:53:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fe5bd7370e48466f87855ac040f288e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:48+08', '2019-03-01 22:53:48+08', '2019-03-01 22:53:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8473b16b02c94bcf818eac904bbf6ab5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:48+08', '2019-03-01 22:53:48+08', '2019-03-01 22:53:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9eefe7fee2a34ca9857622b9d9e8bbf2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:49+08', '2019-03-01 22:53:49+08', '2019-03-01 22:53:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5b18c9b8f8d2484b9d80e08fcf8b7e95', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:50+08', '2019-03-01 22:53:50+08', '2019-03-01 22:53:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a31bc5b4758149ca94301400a3ad1e59', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:51+08', '2019-03-01 22:53:51+08', '2019-03-01 22:53:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6cea8a043c2848efb9ef8771ac6e0576', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:52+08', '2019-03-01 22:53:52+08', '2019-03-01 22:53:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4e235e97854740d5982a7df89a6c69b8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:53+08', '2019-03-01 22:53:53+08', '2019-03-01 22:53:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5430b462a2743bdbbfd0d00816e58d2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:54+08', '2019-03-01 22:53:54+08', '2019-03-01 22:53:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7cccfaebd1bd493698ddb96af71b4347', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:54+08', '2019-03-01 22:53:54+08', '2019-03-01 22:53:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5e519a0467d9404ebafe6c0348daef94', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:54+08', '2019-03-01 22:53:54+08', '2019-03-01 22:53:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7115a7ae429949898e87d1b7c2940227', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:55+08', '2019-03-01 22:53:55+08', '2019-03-01 22:53:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('113dc36e6b2142dc9ca94f1cc4ac67a7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:55+08', '2019-03-01 22:53:55+08', '2019-03-01 22:53:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a708e7148734e63bcd5bddbc9082d1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:56+08', '2019-03-01 22:53:56+08', '2019-03-01 22:53:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('312effcd29264147939dae0201d2b3e9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:56+08', '2019-03-01 22:53:56+08', '2019-03-01 22:53:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e926c39e7aa447cb9b757efffdb2ff56', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:56+08', '2019-03-01 22:53:56+08', '2019-03-01 22:53:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7fc4f95dce114360a44111dbd3d00b66', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:57+08', '2019-03-01 22:53:57+08', '2019-03-01 22:53:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('31aa27a36a1142be9599777fa674aa1e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:58+08', '2019-03-01 22:53:58+08', '2019-03-01 22:53:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('465ee717c8bb4927814173d465e596aa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:53:59+08', '2019-03-01 22:53:59+08', '2019-03-01 22:53:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c9762aa2ad4145bb828b99c8ff565bfb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:15:56+08', '2019-03-01 23:15:56+08', '2019-03-01 23:15:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('68b2e801fd8c4030af26050ba6e9de1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:01+08', '2019-03-01 23:16:01+08', '2019-03-01 23:16:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2970556ec7474064b6ac1ce1baa28029', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:10+08', '2019-03-01 23:16:10+08', '2019-03-01 23:16:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('41faebf6a6744464885e81683288c444', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:33+08', '2019-03-01 23:16:33+08', '2019-03-01 23:16:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d883cecff03447618bbe42eee6275d90', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:39+08', '2019-03-01 23:16:39+08', '2019-03-01 23:16:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3827b0737ebd4acaa2af33c854942f06', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:45+08', '2019-03-01 23:16:45+08', '2019-03-01 23:16:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f4cc1ac57e54480799a6a2f5b53f7828', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:49+08', '2019-03-01 23:16:49+08', '2019-03-01 23:16:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('514069eeba6c489d9d174f07cfdd7ba7', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:16:53+08', '2019-03-01 23:16:53+08', '2019-03-01 23:16:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2639c375abc34f6baba4520a5a81eb5a', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:17:06+08', '2019-03-01 23:17:06+08', '2019-03-01 23:17:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b04a7a3ed2e945b8a35bc449891c63eb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:20:13+08', '2019-03-01 23:20:13+08', '2019-03-01 23:20:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0d80815e3ab4a3b95a2beaa08a63add', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:20:26+08', '2019-03-01 23:20:26+08', '2019-03-01 23:20:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('626aed39f4e4447abccc425fa3657344', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:20:31+08', '2019-03-01 23:20:31+08', '2019-03-01 23:20:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a198fb9b10bc4367ad6ac44cfc39e322', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:21:02+08', '2019-03-01 23:21:02+08', '2019-03-01 23:21:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e24500475b7a4a1ca10435b331d04e3a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:23:15+08', '2019-03-01 23:23:15+08', '2019-03-01 23:23:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('37cc34dded8b47faba659ddc5c9226f9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:28+08', '2019-03-01 23:25:29+08', '2019-03-01 23:25:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('63d73d3899744af9b0823b667271e2c4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:36+08', '2019-03-01 23:25:36+08', '2019-03-01 23:25:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('693ea12062484a52bf098b61f6752d1d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:37+08', '2019-03-01 23:25:37+08', '2019-03-01 23:25:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eb3ab74dd7dc4f43bf645b50415316ce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:40+08', '2019-03-01 23:25:40+08', '2019-03-01 23:25:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4e44cc7ae45f461185208e66bfe6086d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '''', '2019-03-01 23:25:49+08', '2019-03-01 23:25:49+08', '2019-03-01 23:25:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd133f1acdc94fbaa132a652e54a1b51', '0b77c93c1e48430bbd7208e63381f83a', NULL, '&quot;', '2019-03-01 23:25:52+08', '2019-03-01 23:25:52+08', '2019-03-01 23:25:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0698be1eff414e9182b01bbbefc6a410', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:54:01+08', '2019-03-01 22:54:01+08', '2019-03-01 22:54:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3818e4d259a44e808e838a0e1c38f83a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:37+08', '2019-03-01 23:24:37+08', '2019-03-01 23:24:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7fac8a5cb7fc47078682a633d5197c1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:54:01+08', '2019-03-01 22:54:01+08', '2019-03-01 22:54:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c1aa54b0929b41d6bc51aa4e13168f9f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:32+08', '2019-03-01 23:25:32+08', '2019-03-01 23:25:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0450a4e48a834dc9855d2a153cfd5cf2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:36+08', '2019-03-01 23:25:36+08', '2019-03-01 23:25:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1386e12153c245abb45aec44d55af448', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:40+08', '2019-03-01 23:25:40+08', '2019-03-01 23:25:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2163bad5d37b443f8b36950062bd8bd6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:57+08', '2019-03-01 23:25:57+08', '2019-03-01 23:25:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('98d651abce7d4201b64b308338874313', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:00+08', '2019-03-01 23:26:00+08', '2019-03-01 23:26:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('76fe165a898c463daf12211e61a3260a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 22:54:02+08', '2019-03-01 22:54:02+08', '2019-03-01 22:54:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c1ab66f59a8e4d6e99b2aebb00b5a8dc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:37+08', '2019-03-01 23:25:37+08', '2019-03-01 23:25:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5d32c530c810435e910da1f4998e4994', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%2527', '2019-03-01 23:25:51+08', '2019-03-01 23:25:51+08', '2019-03-01 23:25:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c075a7ae4de14650b3892e231fea2769', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:59+08', '2019-03-01 23:25:59+08', '2019-03-01 23:25:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('705659761ee84433aa797eb689d536e6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:59+08', '2019-03-01 23:25:59+08', '2019-03-01 23:25:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8f7f62e1260549ccb5fdae4f5967cc77', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:26+08', '2019-03-01 23:24:26+08', '2019-03-01 23:24:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f11f3bcca12d4d7189b34b86eed28ad4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:29+08', '2019-03-01 23:24:29+08', '2019-03-01 23:24:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f664c97d6a194dcfb63d12df22338564', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:29+08', '2019-03-01 23:24:29+08', '2019-03-01 23:24:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e6099e94897644ffac3c1bf30583e900', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:30+08', '2019-03-01 23:24:30+08', '2019-03-01 23:24:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('edc012b9c69e46269c19f6642b8036a0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:37+08', '2019-03-01 23:24:37+08', '2019-03-01 23:24:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('17a40d101803472aa47dd19422c5bf59', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:25+08', '2019-03-01 23:25:25+08', '2019-03-01 23:25:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('62356284e21349539729a6085cfbd6cd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:31+08', '2019-03-01 23:25:31+08', '2019-03-01 23:25:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0fad69c0eca0443985a1582649f83118', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:34+08', '2019-03-01 23:25:34+08', '2019-03-01 23:25:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8a179b4e889d499f8a612c8a50e3af44', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%27', '2019-03-01 23:25:50+08', '2019-03-01 23:25:50+08', '2019-03-01 23:25:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b2aa1ab2033e4adf9823775721eba5a1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%c0%a7', '2019-03-01 23:25:53+08', '2019-03-01 23:25:53+08', '2019-03-01 23:25:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5e6b52df1623486d8b90214f8cb4174e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:56+08', '2019-03-01 23:25:56+08', '2019-03-01 23:25:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d679d3d10094d939d4164bad3c161e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:57+08', '2019-03-01 23:25:57+08', '2019-03-01 23:25:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1c68464338d1438fab10e9bc99a34d48', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:00+08', '2019-03-01 23:26:00+08', '2019-03-01 23:26:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4187d44a48d74f26a3fe33b50d361bf9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:02+08', '2019-03-01 23:26:02+08', '2019-03-01 23:26:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7db097ce6b24cde81a997166837363b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:03+08', '2019-03-01 23:26:03+08', '2019-03-01 23:26:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d00acb7121e34384847c4627859e39a6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:06+08', '2019-03-01 23:26:06+08', '2019-03-01 23:26:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7899dea247db4b90b219fcbbc6121a7d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:06+08', '2019-03-01 23:26:06+08', '2019-03-01 23:26:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5666ad96754b40a3938fe2464b374df4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:24:38+08', '2019-03-01 23:24:38+08', '2019-03-01 23:24:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('800c03c48b6b491fab47d72f5f7f3fd1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:38+08', '2019-03-01 23:25:39+08', '2019-03-01 23:25:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a38240b54cba4b34a6653899406e4c05', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:00+08', '2019-03-01 23:26:00+08', '2019-03-01 23:26:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5a8abd8eb68d49529639df92daf67981', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:01+08', '2019-03-01 23:26:01+08', '2019-03-01 23:26:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1836bd5d8f994ff38c31ca9796a80113', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:07+08', '2019-03-01 23:26:07+08', '2019-03-01 23:26:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('72734d88a69f43e082cb92a45abfdc98', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:08+08', '2019-03-01 23:26:08+08', '2019-03-01 23:26:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3fce86b0c1734538ab180e2ec83231a6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:33+08', '2019-03-01 23:25:33+08', '2019-03-01 23:25:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('631ca807ddec4934aa805f6c65543005', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:55+08', '2019-03-01 23:25:55+08', '2019-03-01 23:25:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7b65f5debf5490ab4b14c24f883ba38', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:25:56+08', '2019-03-01 23:25:56+08', '2019-03-01 23:25:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e6a67f211d8417f9bee16f7ea563040', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:09+08', '2019-03-01 23:26:09+08', '2019-03-01 23:26:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c29042645d1e496dad410e7a190de150', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:13+08', '2019-03-01 23:26:13+08', '2019-03-01 23:26:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9d309f3f5830473e90d5ba147e7e2e23', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:20+08', '2019-03-01 23:26:20+08', '2019-03-01 23:26:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1d9d6459b4584f1eaa70d795d2b3bec3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:20+08', '2019-03-01 23:26:20+08', '2019-03-01 23:26:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('71752ce8127c45028f2b45dc7c5d4ac8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:24+08', '2019-03-01 23:26:24+08', '2019-03-01 23:26:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('84f801862cfd43dda6cbe0fae95c51c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:24+08', '2019-03-01 23:26:24+08', '2019-03-01 23:26:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e3c1ea5a4d2d4e1c8075adaf3abca39a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0577ff7cfbea48eaacaf2d9359bbd588', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4eec9bf723d442358ab50957567ffe29', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('59fa4c3f3ca2492b8dd318639a6eacd3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0be949c4c70342168bf0c6ed14f4e594', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ecc15f7a43d74d4a87bf88804e18a719', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ffb71d2a275b425dbb31e914c60c0c6d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', '2019-03-01 23:26:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('14f05148311c44889f9d5d5c5ecc39b7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:26+08', '2019-03-01 23:26:26+08', '2019-03-01 23:26:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('23323a827a844dd3a3a5a93b8c5a449b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:26+08', '2019-03-01 23:26:26+08', '2019-03-01 23:26:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('70b291d06a53450ebf5e3a53d600e9ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '''', '2019-03-01 23:26:26+08', '2019-03-01 23:26:26+08', '2019-03-01 23:26:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b0123095399046d0af325aa8e85dfe1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%27', '2019-03-01 23:26:27+08', '2019-03-01 23:26:27+08', '2019-03-01 23:26:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8eb40eaac21d4e96b299e3f7f0d65eaf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:27+08', '2019-03-01 23:26:27+08', '2019-03-01 23:26:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('65ce173773cd4f95a58ef4f3ac130f2e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%2527', '2019-03-01 23:26:27+08', '2019-03-01 23:26:27+08', '2019-03-01 23:26:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('513e45f9fb8e452291fc46861f688c75', '0b77c93c1e48430bbd7208e63381f83a', NULL, '&quot;', '2019-03-01 23:26:28+08', '2019-03-01 23:26:28+08', '2019-03-01 23:26:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1128e529a44e4a63b948db9e7152c2fa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:28+08', '2019-03-01 23:26:28+08', '2019-03-01 23:26:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('afee411a50eb4a08981113ea1a20020c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%c0%a7', '2019-03-01 23:26:28+08', '2019-03-01 23:26:28+08', '2019-03-01 23:26:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('997ea096a60d459ab7ea555a32de4a7a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:29+08', '2019-03-01 23:26:29+08', '2019-03-01 23:26:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bf24cda2967d4124821eae877a8c6d24', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:29+08', '2019-03-01 23:26:29+08', '2019-03-01 23:26:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('227b6887d3584f7f8c5b2c561f3766ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:30+08', '2019-03-01 23:26:30+08', '2019-03-01 23:26:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d9a4c550c42d4116984ccefe01f8300e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:30+08', '2019-03-01 23:26:30+08', '2019-03-01 23:26:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45a0845feebd4ba49900d955e1c0bba1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:31+08', '2019-03-01 23:26:31+08', '2019-03-01 23:26:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('029d9dfc3f1145fab5d407947f48710c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:31+08', '2019-03-01 23:26:31+08', '2019-03-01 23:26:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d6263dba9b1343bab37a4fd51d5a4f22', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:33+08', '2019-03-01 23:26:34+08', '2019-03-01 23:26:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6cec794c9e08425eba21056415e576ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:40+08', '2019-03-01 23:26:40+08', '2019-03-01 23:26:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2c82d72a406243d985a47ca0a2d3cbe7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:41+08', '2019-03-01 23:26:41+08', '2019-03-01 23:26:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8de85a5b1427435db6af062496441159', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:41+08', '2019-03-01 23:26:41+08', '2019-03-01 23:26:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c35d919f8e7e45fbbe38ac3e1daaeeba', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:41+08', '2019-03-01 23:26:41+08', '2019-03-01 23:26:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ad083e67b47c4065ae9aab5c14e41614', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:42+08', '2019-03-01 23:26:42+08', '2019-03-01 23:26:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bb7b49940a7b4ed3ac9a2b1735dd5914', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:42+08', '2019-03-01 23:26:43+08', '2019-03-01 23:26:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c17cfabfd1264c7b8c8bccd9625cfb42', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:43+08', '2019-03-01 23:26:43+08', '2019-03-01 23:26:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('644593fe57824764ab1b5f016617c8e8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:43+08', '2019-03-01 23:26:43+08', '2019-03-01 23:26:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('30fd061bdb1248fd89983b1af95eec9e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:44+08', '2019-03-01 23:26:44+08', '2019-03-01 23:26:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ffa07c49653f4bd0847d7f37c0e4de32', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:44+08', '2019-03-01 23:26:45+08', '2019-03-01 23:26:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c64c5a9b43ec46d7974bc2607ba6074a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:48+08', '2019-03-01 23:26:48+08', '2019-03-01 23:26:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('63e3f5522e9a487f858c105475d9fdf0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:49+08', '2019-03-01 23:26:49+08', '2019-03-01 23:26:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1cf40ea35b8848d5afc1cdf3dcf39a36', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:49+08', '2019-03-01 23:26:49+08', '2019-03-01 23:26:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6c595463c9f84017b04a79e9c1604546', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:26:50+08', '2019-03-01 23:26:50+08', '2019-03-01 23:26:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d170cdb671543cab1d6b7f23ca2b797', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:27+08', '2019-03-01 23:27:27+08', '2019-03-01 23:27:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0b5dc7f9caf8494ca7ceb25c9889fb02', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:28+08', '2019-03-01 23:27:28+08', '2019-03-01 23:27:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1486c4ba103b4bed96b3a09f952f0f4e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:30+08', '2019-03-01 23:27:30+08', '2019-03-01 23:27:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5378a533be7e4b658e694a3b78b57909', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:30+08', '2019-03-01 23:27:30+08', '2019-03-01 23:27:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('010c229bdb274bacbe93362464940355', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e074cf4fd3c444e8bd4f6fe29384782b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('58d3794b72aa4727b47aef8ccb316b2f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a294f814082464d838502ae058fd232', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0a3fa00166ec4dc1adb2b13a6c1b5cfa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('69712722427b48b38e4eb76e64a5b7ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('082bca9bb82f4490b10c7577607c633e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', '2019-03-01 23:27:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b924d9dd14a4b49be31c2e3921f2dea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7f22b86b46474054ae2c951064331911', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6a8f61234ef5468ab38c5c273442242b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fc4f9e4cacba4091ae8f0c5b0585cad9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '''', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('531d819a5c294c2885ecbf8f680e9d28', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2f43e52b9eab45fa9f24f5375800d9c4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:35+08', '2019-03-01 23:27:35+08', '2019-03-01 23:27:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0c90c0e434c946ecbf64f83a51969eb4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3714ffd5ed4647389f0019a90e8e74d4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e7149ed0244c4a358eaa9ce9138695c6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c0b0de2c0e0a4f8682fdb1b968ba9d29', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', '2019-03-01 23:27:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45c91b5a60fc4bbf81ec82d8c4d56a29', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5e337f44fdfa41b69854d18068e2b045', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:34+08', '2019-03-01 23:27:34+08', '2019-03-01 23:27:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('660b6d2e1312432bab49df2e8162c9b2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%2527', '2019-03-01 23:27:34+08', '2019-03-01 23:27:34+08', '2019-03-01 23:27:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a75175b0cc645148a13d3f061e0a068', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:35+08', '2019-03-01 23:27:35+08', '2019-03-01 23:27:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9131c504a081453fb08eea607ad4521e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '&quot;', '2019-03-01 23:27:35+08', '2019-03-01 23:27:35+08', '2019-03-01 23:27:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('accb5117239c45e385f44522dfa4ffbf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%c0%a7', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('905095fa18be4425a90311488644fb4b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1bfcef69432740c1a2c38843d09c2c78', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('30869f68b06144b180d1b97fd9580a83', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e051354455ae4bd3bd6216b669559bb4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1609323c6e284705a931968a5471dee9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:00+08', '2019-03-01 23:28:00+08', '2019-03-01 23:28:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bc7dbefb26b4411699fc157329bf9136', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:00+08', '2019-03-01 23:28:00+08', '2019-03-01 23:28:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bd50a75012e342ea89eec6db0b77edb3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b5c12ac19b7940b2a9bb2dbf367027a0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:04+08', '2019-03-01 23:28:04+08', '2019-03-01 23:28:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('06a55b0379a44007b8d3e0d3d886f94e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:05+08', '2019-03-01 23:28:05+08', '2019-03-01 23:28:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('65ffe2d267c14723a3db644b5801d731', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', '2019-03-01 23:27:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('772bf907e5dd4ab09ab965e09639a97c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9e2226f0c9004b418949b06c04f8f79b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5e5787670c24115abe9bd8f6c41e3a5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1b16b6c842e4e3dba564d22ddb09eba', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a46a62dddd04983b97684137464e8e6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:41+08', '2019-03-01 23:27:41+08', '2019-03-01 23:27:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ddc3eb8d777e4e478c049b17aa473ff1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:49+08', '2019-03-01 23:27:49+08', '2019-03-01 23:27:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('730d5e03d0534eb3a32108b200b59711', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:53+08', '2019-03-01 23:27:53+08', '2019-03-01 23:27:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('351e35b1967643d88b6838e6ceaaf863', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:54+08', '2019-03-01 23:27:54+08', '2019-03-01 23:27:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('262babc1936f45979ad685405a803d6b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:58+08', '2019-03-01 23:27:58+08', '2019-03-01 23:27:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d4ff5bc916ba4d7baf377f454f387a74', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', '2019-03-01 23:28:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('434872ee6e2f49a9a38671265bc0d9ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:02+08', '2019-03-01 23:28:02+08', '2019-03-01 23:28:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('62cf4244aa3f4cb8ae4fda8f8ee36368', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:02+08', '2019-03-01 23:28:02+08', '2019-03-01 23:28:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5a54676e7c8341208455ff1cf7649180', '0b77c93c1e48430bbd7208e63381f83a', NULL, '%27', '2019-03-01 23:27:34+08', '2019-03-01 23:27:34+08', '2019-03-01 23:27:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fdf7a893977845a7926d13e02629d95a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('093f00931d174c1b8d0a827ae8507c26', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', '2019-03-01 23:27:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e6ca2dfc4404be7b0c34be6e5f4b3e8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('54c2b18dd08841d59897c59ac3561985', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e8395ddd1eba435da603f9d38941809e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5d681c5662ec475daae1650ab963313d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bd9f12ed0c984c4ab5b5736d82c8972c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('044b1ef69a5e4ee5a6ba3f597a75fcf2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('14577b7aa42140e4b7f7602dbc191817', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb32ee86c8ae44f787d2898114c70cef', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2c02139c96dd4df2a0f75ab4de9d0422', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e2c2cbf2a504bc7bca93335a4b26cc1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('045c5e904b49406b9fa59b0faefc9988', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:45+08', '2019-03-01 23:27:45+08', '2019-03-01 23:27:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f58b2cc8364347d4a8f5078024e158c0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:49+08', '2019-03-01 23:27:49+08', '2019-03-01 23:27:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('950f162bb0e54fcb977483520a638e2b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:50+08', '2019-03-01 23:27:50+08', '2019-03-01 23:27:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('46ec4e9058044277a6bd781d16baca5c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:51+08', '2019-03-01 23:27:51+08', '2019-03-01 23:27:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a32aaf6e10b245769225780a07a5d92d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:51+08', '2019-03-01 23:27:51+08', '2019-03-01 23:27:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b921db63ba94dcf98bfcaace4b6adc8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:52+08', '2019-03-01 23:27:52+08', '2019-03-01 23:27:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cfa35f1e18564a7bafd1b19ffc7a2a93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:53+08', '2019-03-01 23:27:53+08', '2019-03-01 23:27:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f9a3e0012b904408b3a54ef406bab131', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:54+08', '2019-03-01 23:27:54+08', '2019-03-01 23:27:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c50c1621fdd349149e63e2ace3ad21e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:54+08', '2019-03-01 23:27:54+08', '2019-03-01 23:27:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d75219856ac04f60a814b4d477a89ffe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:55+08', '2019-03-01 23:27:55+08', '2019-03-01 23:27:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('61d3c2c67d1a4f21ac9acb3576a9992a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:57+08', '2019-03-01 23:27:57+08', '2019-03-01 23:27:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96a7f2f9a8da4cd1bc1035984e781006', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:59+08', '2019-03-01 23:27:59+08', '2019-03-01 23:27:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a23e3e2962b54012a1d4d37c38091e19', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('13f72101d3ce45bfa018adde9d3e5524', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', '2019-03-01 23:27:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('93bf3986c1004e0098403a74e66d1ab8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32f86d37ef5b419dbdbd0b1d22d92b93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('238e212d285c42568d4891390c3577fa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', '2019-03-01 23:27:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aec83e19bb8b4dffb043be04d4c6560d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', '2019-03-01 23:27:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('785cd87dc24c45cc9a5295be29edcb0b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bb5c91165f334490b2a52df646148f49', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', '2019-03-01 23:27:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0d7c1a477ee843ba9bb810af609ee1fa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:47+08', '2019-03-01 23:27:47+08', '2019-03-01 23:27:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e2958ee8fcb4787b2977a3371d7479f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:48+08', '2019-03-01 23:27:48+08', '2019-03-01 23:27:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32e0ac2ec2dd46e6af24e745c00abaf0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:51+08', '2019-03-01 23:27:51+08', '2019-03-01 23:27:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c885dbe9f1004e778880b9c8e5927dad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:52+08', '2019-03-01 23:27:52+08', '2019-03-01 23:27:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4cd8fadbaf304b27b59c0451d13d2e0e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:27:53+08', '2019-03-01 23:27:53+08', '2019-03-01 23:27:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1d15799fad994b6084036f85dd6f03bc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:02+08', '2019-03-01 23:28:02+08', '2019-03-01 23:28:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eb25200b474d466aa2f7f90c25981c50', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f0bf6ef74fad47ad9b1a39b46146eca0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc2287e09e4f461da0828c8fbec7c125', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('50caa828ab81451eb01785b91b3bcdf6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', '2019-03-01 23:28:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c45a3515419a4dd58004bf54bdc52b03', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:04+08', '2019-03-01 23:28:04+08', '2019-03-01 23:28:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d9b03e07ac25493bbb3b54e897782467', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:05+08', '2019-03-01 23:28:05+08', '2019-03-01 23:28:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('db4bf17d6c934234a40ff88c69c231ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:05+08', '2019-03-01 23:28:05+08', '2019-03-01 23:28:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bec9e886464d4dcaa1e590c49f142f65', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:09+08', '2019-03-01 23:28:09+08', '2019-03-01 23:28:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('adeee089904845ac8f2bd01b0e6bdfe2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:10+08', '2019-03-01 23:28:10+08', '2019-03-01 23:28:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f0bb6b546e104b77810d54290816fd69', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:11+08', '2019-03-01 23:28:11+08', '2019-03-01 23:28:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0338411110004e518c5abf61d71ed620', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:11+08', '2019-03-01 23:28:11+08', '2019-03-01 23:28:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('074a24f5fcee4c91b6d3437c2fee50c9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:11+08', '2019-03-01 23:28:11+08', '2019-03-01 23:28:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b4cbeecd11c745269ebe46cc0df7a273', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('da861aba61c044ffa019e33b1826d234', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0be8314cb4c346bcb5df285e6b5b7aac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6ab3f669752f4597acfa7fa4d3083e93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c96e78ba0284dbfb7ab3575b65430cb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a65c135c6ce45b4b6d0e6b84866c4b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('356659e9332d4a2aa5095a6c4bd10b62', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', '2019-03-01 23:28:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a45b8207bd7f4e81a5f1e14303656aa3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:13+08', '2019-03-01 23:28:13+08', '2019-03-01 23:28:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f4b846222ee44ddaaf5b3ddad185d8ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:13+08', '2019-03-01 23:28:13+08', '2019-03-01 23:28:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1025788a31af4f1181446792edf15b3f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:48+08', '2019-03-01 23:28:48+08', '2019-03-01 23:28:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('55d603260e91454384cc0b6580188356', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:49+08', '2019-03-01 23:28:49+08', '2019-03-01 23:28:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a90a51b53bb14751a28d280f9be53d52', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:28:56+08', '2019-03-01 23:28:56+08', '2019-03-01 23:28:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('93dd406502074a619bd214db7205d052', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:01+08', '2019-03-01 23:29:01+08', '2019-03-01 23:29:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b3824598d66645aebcb3c8c60a3ace4a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:01+08', '2019-03-01 23:29:01+08', '2019-03-01 23:29:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('38ba955c112c40339f31c73abc96bf57', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:02+08', '2019-03-01 23:29:02+08', '2019-03-01 23:29:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60825e32b0e744f0b5069ce2fa0ff73e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:02+08', '2019-03-01 23:29:02+08', '2019-03-01 23:29:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a61b037489c048edbf995300d9945770', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:02+08', '2019-03-01 23:29:02+08', '2019-03-01 23:29:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fef2ae73f9ca4e07953e32fa43ca54f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:03+08', '2019-03-01 23:29:03+08', '2019-03-01 23:29:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('36cc6dfaada140b0ac1397aa45673ef8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:03+08', '2019-03-01 23:29:03+08', '2019-03-01 23:29:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('471528c91c6c4de5bce5946473549550', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:06+08', '2019-03-01 23:29:06+08', '2019-03-01 23:29:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a77388f143d345edb3cdfd9fa1af0127', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:06+08', '2019-03-01 23:29:06+08', '2019-03-01 23:29:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a36e88024c54266a0edc7206ab06838', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:08+08', '2019-03-01 23:29:08+08', '2019-03-01 23:29:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d10bfe941001409482b309e5edb5cf70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:08+08', '2019-03-01 23:29:08+08', '2019-03-01 23:29:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('793ff51d1fdf4670b6c22f6f29a2ca35', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:08+08', '2019-03-01 23:29:08+08', '2019-03-01 23:29:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aeed22b43a934a8b9add6aecc81eef24', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:09+08', '2019-03-01 23:29:09+08', '2019-03-01 23:29:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d125e6a50c4c47c89431a5a225d4a29c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:09+08', '2019-03-01 23:29:09+08', '2019-03-01 23:29:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c7287b4878074c87bbf99179810deb8f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:09+08', '2019-03-01 23:29:09+08', '2019-03-01 23:29:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c9cf7184506a4f1ab68f05e7ca7c16a6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:09+08', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b765ab20523b49909cafada67019bd6d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1e41e3f55d0e4beca0e10b320b68c3e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5ba7f1acf7fa43e3aa28bb065b9cdd3c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', '2019-03-01 23:29:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eb68239e8b564abe850cecfda067be35', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:11+08', '2019-03-01 23:29:11+08', '2019-03-01 23:29:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc5c13b0500740298bfe586fb1a0a3b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:20+08', '2019-03-01 23:29:20+08', '2019-03-01 23:29:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c3bf40c99c6d4b55afc1e31600cf0baf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d14d078cf8034fdf9aca031989c36688', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7ca3b619359447968f21016f7313b62a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('58bd13a4d7754d4196039282e88b8b47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('52262b72684942219063d02e8c2c4a13', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b2e65298176c42bcb2133a0a1f08353f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b4da0b06c8044134a6f71a468914a100', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('665280a23e2b4bf390da7786f1821a1e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('92ad32a8bc0847d9b97b102abd7650b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0de09fbaf9914d14ad453aefdd82cee4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cec2ec2338954250ad588d5f0fa3a6f5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fdb102fb9ca7480994d8a9eea6ee9049', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a66580699a7d45ab9b86cbf5575a1795', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4f0a4985eaba4265b212f561e6895d06', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c9922fea56274d80a9d5d2443d5c1269', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a4d95c2006d44f38848ab949bf8575c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('84cb090128e949cbbee853415938b920', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f85de1a11ff64c78a23b74e1db1777ce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e69c4feb9e448c7929b900a1a4902a3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f886fed75a4e440099e0447425335941', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6148a904aa2d479d946a077bbd3b9c30', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3a547b456ea74651ac0cd9584843d375', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7a91c5daea04b75bf0bb0e2f8f1cfcf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eac1346f39ea48a8809d177c8cbb997d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1324a5ee97e94100ae389f4bf84ab509', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ad3cef5f421940188685cfa765735960', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8ea225a4c9504bc29827bd35f1d25729', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1186260924a746919a5bc57311f782b5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d3090db013114465a55205371f91701b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('589375aea8064bc68c3d546ccd4b376a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c529bb2790f649708e0b5ccbaeb29333', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0a3235aee1e4e1abe38d2fe6066cff6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b6bc801db3ad4bc99fcab53d55871258', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ba942ece3483451fa2a1682c84c99b34', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b0035435e0d9496599600b7e929c7459', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d232f69e281c4f6584b087fa30799db2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('29aea56ee0d4415b848251ab73c60a71', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7391c65d6a644e849770856097705408', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('70976cbada4a4ac0b45e02ce8d25a278', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dcb440552b2743f68437d30ae4e7c330', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4d5365d12e2148fda47c15686027d9e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6f748907960146d38b253a4a0303b84d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0abf3d07af444bbea6f94d9f38dbb847', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('93ca6d72f02e4529baad8271d6b9e28b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('983163cd860b46e79287f0a6c310c075', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f9beb1679cb74823a76dc20297da926b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3a5444c3eb174f20a668bce02636f281', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7b789d90a4c54d0da1513a2e5b9c4e9c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b5f35827b5d14585822c7bb7b1941e58', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d4976fced6a048d7865babf5ffa04441', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('34294bfdf8b2464eaca8712f87c0f6d3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('03fb9e58f341429f843a98476973135b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1302af15868b40e380f15a111d775a72', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d433378087824e88a8d6186235889e4c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dea01fc796504e17b2179f15557cd832', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1290d54fa4f64d1890435b4d8dad7739', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:20+08', '2019-03-01 23:29:20+08', '2019-03-01 23:29:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d39ff69ca081455e935ebbfb6058df93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a2a815dbf87e4302ae7ac8f39ad451ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2f224ca904e04e70ab85b5fc59480f10', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b76bc34090b941d98ca2fcc4bcbf9352', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('23ea16e8bd494292be5232bf008d0b3a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7492c6b2454b40b0950d79482c8bb001', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('be4172f3a1c84315862b28125818df96', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9404fe0599ee4e7eb3f62c1618adb795', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('31ecd3519a3a4158b6a7e7c98f55ec93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e8985941bc34e96a932226f7ce16fff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee47927ce6484217b5a160557cf409c7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('16b1951260d34574a270360cac2ffc2c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e31a65ae8a9e4fafbc86b9d6f51b1174', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1144c2cbc02e401cb9e39fc3f7bdc409', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3b2917eac8974ddab5f5536445fd3c9a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('991849a33db34ea1bb0078ed935c7099', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bbd4f736bf8040b4b9f1b0a6c5eee514', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aad6c9a67e0c4a1f99f98c775f91e7b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('680becd6984b4c1e899430fad57b6bf8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('78a0a4ad25394b5c9022eb6733efeee1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('836d444bc48a4277aa64834380a1336f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('970b55a6348d43398193a7b5b5c95cde', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d0ad100abf074b1b831b7c5fc886be97', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e6c1f54820ae45d699ff6a4ee22f248d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4087921d862a457f9c7ff93ce0a45a66', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('95288a45a5854e98b07cf850707bb5c0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6d1d6e3a21ab4125a4b376f6e13514b6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3aa89699eb2042ae9d00c02cfd164ba9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5e60ff428dd14fa4a8d018c5f6d25df6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1aaf7d771c94285980e20acc570c89c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b86277a08e9c483c80bde7994a3006f1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9307931c0bae41c18e49ac4aab1134c9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86abdc5799ee45fd9ec151d71991bf18', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c8ce75e9a4be42b6b753011fec5c30ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e31e59b6bb3e418b80a7e2809f9da1b5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2c93a293781f49068d87725bd1469465', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0da45b08b8a14de3a550209aa59b9528', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('394cb3cedc044e06988ae716576b49d8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('116647df5105404b8d3810ef56f25b0c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4db2a618f8f647d086c4a5aa1b4e2798', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('97c1596661314c2bb558377f9803c07c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2cad98197f0a4805bc7411cdf26f1f28', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('df35e47a7c1b447485783045e8a5811b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee194954be0542ce9041cfdf26b68da1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f0e769877fa748c990fee704d197f42f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e53376e913cb4f8095064631bbcc94f6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e9e78106fdd04283881fcc85e778fbbd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a1c40078ca524d72a4637b13d1cb5a3d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ed11e5fc42d4e408bda01c8ff6404eb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('916cc279d0f04a08a3c992408c51cfcf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1a79e9b9d9134103bd81a5fc49af276e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4dd2c2c5f9af4eff974c574ff214842d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d39fdf7cbef5453cb89ff7da3265db6b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4bcb9a8603c3484582fd7f0e6ef84f9f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('57e77e86ea0f443f88349fe0f04e9852', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e366f02f97c64a1aa55817ed1fa0c858', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a5f0d9b999643029f35d8bbc38909e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b44ee283ce9e4e22822495e8da7b3abd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eff1666aabeb44bdbb8610e5f1798848', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:22+08', '2019-03-01 23:29:22+08', '2019-03-01 23:29:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1fdea6e284d245f5a1a35b79c604c3f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3875145d875d43c49e17be62e4a61ae0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d8c1396408a47799ede19f806ba86eb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45c96d211a764972ac2af7abb339cb4b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('00273385e4bf460b8eab060c1f88b940', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2efa3586aca0431fa92647510c867213', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('914b49111a6246b6b2850d1143c08fa9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('de7a1a2ee5484820ab5e0a87149d9106', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8ed6186c44094dc59b2e647c4ee468c5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d4a468816d744bb7bd0ab8ad120f004d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('343b4c2b20194e719d65ea1ce104abcd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('21bf5f049c2247489de119d1ca010e69', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('efd7b842a9734443ba2361b510636d5e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('66c042229604406ebf3c04f29a2c9c99', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('17ab330af2cd4afa96d512efd5f57187', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8dc864a506434581b666199ea2b210ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6a3b6ce857d74f93b0b1719e9c9b9e3b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bc11b9ce5b794611ad307f61eb156e58', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cd9ab74d6b924e7ca3f7f94007e64a70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b31302c9e99a4e5391cd39f84e558349', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6371015160334276a20ea1df5044d401', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('08be0282f1ff4d9e88c3a9882d6fa182', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('68d9be032b7a4f7f97f638bac1b0fae4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('922d76a01f6e4adf94b99d0652b8109d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('af84e29654d5493cba6a8caba1dc426b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3d84f44b4bc94e3b9e41d2a00a2d66b9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('07059c0107834db3ae5ee85a56eacbdc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7df20fca273d484b8e28b1063a1280a7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f5c1e9b6f9634ddda92f39f511d67bd1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c32159021ae9443a93d127ad1d91533b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f98c9b9b8fca46adb2282cdb18e8b2df', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0093cd71befb4f1daca2fb314b1a68aa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f9ff3f64a6874fcaa07ad0908239e2ba', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ab1f9a3fb11b4995be82ab3e8ee722a8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b381348476e6423eb8dfc86090276a79', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', '2019-03-01 23:29:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7f574b8aa9d45aa9013d259e697462e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('50466ef595bc4335bdcbfbc9e0234ed9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d5958f0b83934e8eb0a10603955dff32', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('787bfaff61df40998956f5c5c65e1826', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('83ef35b79feb45eb978453459f344fed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c4535d31f7c4d3c8c24400a09b34d04', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9840a80c05674f0783b8317c373a00bc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1e9c1e94e1dc4b69a4d48abb9ed25ff7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d59723362a314110ae81cba5421d2589', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7aa2a5f0ca3541c38e5c193c28bee7ba', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b9093ba86da54b5ebd071fccfce2bac5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96a810ab132149d9adfd6409d26bd211', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('88223abb0b36435fb77e5977f24d3ade', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a7a84c0baa484d83bc6980d21cc1a307', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e982868f8d6d4a8f9b9b299c1e3ba609', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cdc51abe8abd4d9e8642380146ca78de', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d4e7892c71ba4efba07c58cbcbe6c44e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a15d47eed32f4795b1a6455a85fd0af5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('518efbc8ade64f5f99c2a504e0efeac0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('688e05bc546f40069f2a06c895e9bb84', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0aaabbd3f314447b81649c3e09c0ac36', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b744fa7b2a43414b8a2ff64243c27307', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', '2019-03-01 23:29:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f293564cbe774f619a343e77b789fad0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:22+08', '2019-03-01 23:29:22+08', '2019-03-01 23:29:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f65da4859aaf479392c2819dbb689e1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('de37eaeec956484dba730cb857876516', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('63da4050a481459380b19467e22ec090', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fa183e0684e44eeabb7d77921c8a902e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('83812cdcb6fc400da2d82df59624b0d4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9d7ddae0772f4b62ab5dbce0a877e287', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', '2019-03-01 23:29:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a118948a91d47a2a8b5e05b232327ea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ea0c49d8ec5a432baee65187d6825b6a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('64d21b5a00bb41b894d5104ea49d5019', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d36db88527dc43ccb65b0c4d810c8a08', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('10e773632bb04092a09d656d5a2bbae7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e8b5291fc4454d3fbe760862cf3c19d3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bb8a532a9fcf47f5bd9548c564e4d33d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6d75528cbc564755b8b5fc1a24fcee6c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd63cf573c664823b56f956269693742', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cadcc57c05c0496385c8f3648e8974d1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e43fecbb9309412dad23edfd55a1eb23', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ceadc704a4684c0f8d4572c47469c19c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b698dee5b5694bfa96d0b51aaa0b83b5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('957620a90d1b4a14a4f254eb5ca46109', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6186da9c4d1f4c0098cb835af7063352', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f185af046ed14c46ac4d08a237eaffb9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('68eb6cb8511646ca8a9241338aa3f211', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', '2019-03-01 23:29:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('99e351fb43fa4484ab0a79601f8c726d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1011ece7c8364a6ab04e375d92b1add7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', '2019-03-01 23:29:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('db792f440a9d46baaa1328e072fc168c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bb88d3172a4848be8d3ace12f4f8a339', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b56139ceae5e4799b8f7c36b4a42a729', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b903fbff130d4dce925d380938af42e8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', '2019-03-01 23:29:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('47e0827cbe0d495abd4dc8bc4d0b2ae4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3f2c49783e5d4026b821d509837f5aa0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb0ccf3f2f4a4266bbe30fae4ae8cbf5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5fc70a16003145d68517197174bc72f9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f748cfbd46a5482eb59d3bc58288f4a1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a5b23e73f2194837a63ac88983dc03a6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd865f9db90048c4951d7dd1ae307f2e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('94068dec2d2b4ee0b93399ea7e3a941a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd669a454d8f43c7b71fda87404f058b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a1c94ff27934a1b99f0851875074dce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60b77bd736124d72b412952afaf78f5c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fe72428af85d41a4becb10530439f039', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('458e83c35faf49b481fbc5238bd51719', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('36a505d09c9e4091975937a38de34a6c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c6c8825263c24cf9beb37d24d2326c4b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4737618aa0fa42e28b6417d621006954', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('42e4f0216965471a84bbf26c85551d38', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('59adcb13c86442e8baac885031cbdf9c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6435459a25b444e1b74d7cf511383699', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('731de167dd8b4b65b8752bde79ee99ea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('da377eea9eb040219105c370bf29b2a9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dfddfb9809fa42929505dbe620e76b68', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3b53f65911ad440aa995e5bddef3cd1d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('05f372219a7d4c13afd256391fd11828', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e98f1fea8eb4a35b21703512ad5ef6d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e24e63e3330b44a697e714959cc94ace', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fa47de0ffa664b35a3910aea677c27ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2f728135d15542db87a83b6132467830', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:22+08', '2019-03-01 23:29:22+08', '2019-03-01 23:29:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5b9403ebfb82409bb09e0d126f4782b1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:22+08', '2019-03-01 23:29:23+08', '2019-03-01 23:29:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32592343f89248baa8544180627d4c0c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', '2019-03-01 23:29:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d74c129d9ca04b5984e5a64defe4bb53', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('077a00833d594c2ea84172aab331a7dd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e01dc71f5def459b88bdc84833db8cf1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ad824869bba54dec82555ed2f6c4fbe2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', '2019-03-01 23:29:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1ff61742a9f8445e9f502314a0d295d0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ef59f2da91a840b4844032c617180664', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('342c854a509b4b25ba38247e92337e74', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', '2019-03-01 23:29:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1adbd45260ba45388706209e22fbc299', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c8980e0285394010891b360424969c30', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7a4fe5b7720047d3b7750d21243b904d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ff17a3fee5c64dafb76246a0b1a02289', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8fec6d9433f74b8bbab091ec3dea4041', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b31369c56d194379a514731d5b3d0d52', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0b712f13e8ac4a0788634cf4c663aa98', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd61ec839e5045f5b53245fce064c676', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fb203b9ca9504523a1f5d497dcdf9971', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', '2019-03-01 23:29:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('31bb89efada345eca4364c5dab33a702', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('81fee7c2fd60457a84474e387c7d4521', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d5fa81eafda34509bca81ecf6cfdebfc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3a3e11461fb746cdaa298cfc87486aef', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ec5a6799b7e84c25ad6be66b0f3ef4b7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1a2304418b6f44b5ae76b09af7479e93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f89271559bd74e419b6640771360ad22', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a6cd95a598a749699593fad27ba16fcb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b36925beb9494ec6be4d23c2c62447e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a35ff7ff4bcc4147bd4666e104952b40', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('72c417c8077c42eda72ed9803a18280b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e32999282e1845beab09983141c001cc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1862e3b0f7d245c8b7c3a299ba5ac560', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('57ea5f6c20e84e45a4964120913fd950', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('283d98d8bb1d4d61834013f08e5e06b8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('998baec183ed4d1c85d108701114c4b2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('66fdbac3f24a4d45b61a1d63a032540a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1634051d9c45489cb9b740f05d762d7a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bed79c2539ef4e2e9d6e926058e0479b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e1835de400fe4eff848cf24a08ec5aea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0d037e5c1a054ca780ade1411630abc5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9c92ac4136dd49f5a423649056fc1b2d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b13445c9fdd146b89a9ff3c5592b334e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('43e0b1f57f9f4913aaf1a27b3c65537e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ff47217930164c478f389f1c03a578c0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e02cfea5fc94e9eb6591844c566e4a1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8dcb27fdb56b4f19a88d659e8c9465a2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('54709cddc41f4014a911c0299b756036', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6c420285d7e54e8d9fc90b9ff82744cd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a600bbd2fd64977b88db68d62db7a96', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd8392dca30847c49bf3bccba410570a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', '2019-03-01 23:29:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a2f7f4616bc94153a15c0cc2bfb981ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', '2019-03-01 23:29:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('421b5817c9dd47d3aba36ea41d26e63c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', '2019-03-01 23:29:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('256b3040cebb43a2a5ae86802458d77d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb0faec612b44d8da68647e42ebad388', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3c21b3bb770a4285a4408cf991ff2e07', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', '2019-03-01 23:29:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8a98ee17a3df47449aa2027c3580b9bd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2ab4368d9a7d4ec1b70d6d9d6c190791', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('871e008d5f0b4d16aa1b3c6a19b91905', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', '2019-03-01 23:29:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b75b42bdb7d43e482045d2d3d49eb56', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9c8b7ae74ea14c1d8a3967cfb1245e2a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1daa1437560b4696944c874b9a2119b5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', '2019-03-01 23:29:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('917d3c6511584ac0b72d5e39021d8989', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b3037077ab94c7b91867b5d5ca73750', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c73eb679f32e4a7ab09f65f18cac0043', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', '2019-03-01 23:29:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a820d5406ad3424aa3d745e4225a6627', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c4030e1dad4b4f0cafe68d592eae5901', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('de6218707ba04b82a993f8c429e860f7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b481bc137c8d4b7b963d940284ed0b9e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b246e7249ec54bd48ee67e2f06c745b8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', '2019-03-01 23:29:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8825b60440ee422a869a56c88f336b3b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', '2019-03-01 23:29:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('05e2c694c84448029b9b545bb1f06c25', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4cd2c977f6f448a5aab0b4b9232ee45c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5506138003fa4024a94f451a6ab751f7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ce962110667243b081407d33b3624fd7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bd21a26b60ec4fd681ddb60099bec5d0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('228017d2c9cb4773aaa1a236e62cfcfc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5822ed685b65439ba9c3a2d95a16a534', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b67df96fc1994bd78b07de6fc9e8670f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2729a674c6f2452badda6f84a2edb02b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf32ab3faab948e69288a5c2ec75b1a9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('21e8e81c39f44de0a63ba429dd136d52', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e25e4b7c8c1e42738e0657a8ef40fbab', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('465bf3a84c6e45b9a2bb9ac5dd0c2550', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('93e3a6dc8c5c438dafb8eae4be8d1c72', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ec92e45c4e5f4f1c899d81547d1d90e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('403a5708b6fc4b2c9235fc5455f2e9d6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7fa645638c73466d964676d2f4305482', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3291fc6e163b4b05a9e4c2dc5e4f4989', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('de34f529b4c245c890fbfe20987aaaa3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9a77a70b6b294e7abd49899219703e76', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('72555dcbf9174419a29d321fef710169', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('af78ee54914d4399a56c429a68675ea4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5d46b1ddcc924f69be4e39c73c7a9d25', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2447a224ae73444ba04383c4e6ca5d0f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('00b737c55c7c49ec9516d6758258aa8c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('43bb6df1e17f404f986ecd89a2bad321', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d28faa15156e4a95838c33a2a26f0af0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a554951b4244b08bc5a72c792e7e634', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('397bb90206d24459a0f827dfec37870a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', '2019-03-01 23:29:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('16087e15ea7644399a5100a8209adfe5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:42+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('38f06d78c43d472d8e5926db5fb3c3d5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d0dede6373ca44d7962ca89ae09e0c83', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9d1d947a9c3a4509b71cb1fc3867ba7b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', '2019-03-01 23:29:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3f412b99565b4ab6aca23cccb9ca5f91', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', '2019-03-01 23:29:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e6fa728d0acd465a94a1e07a84c814dd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ad5842514ff647d8a5c144a493e4fc1f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9255b78e6a3f4483ae8db9f675ca9ed7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a5479d991b234541b3dc78ebcf0cd73d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a989fd4765d9458b9619c4992de096fb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8701a2ec364e4820bb29ca77ed6bfa09', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('393b77790f744017ac7c155587d8f17c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('798e23138fd04990af9c07584e238bc7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('07d970aa61f140bf8eb41958c975a3bf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4db7ccd185b741f8921c7fe6df24fd6a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('505049e56efc4e6db745de4c1009394a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('89042d8062964192a6c4c3703138dcb3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', '2019-03-01 23:29:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dc10692bc8794c589fedd9c5a4ad14b1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c36e53c5f2a147249d2b981df2334f98', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8fe6648a7efe4652a31d8a8371c91057', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7f32f8a10f7042159ec7391f19bba9ff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', '2019-03-01 23:29:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('72fa505863984fbaa113fd33778b15a8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ad3b675123cf43f6bd22a1c715fbd519', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0a1791ca6884f7f9d92ac6ef3a774d7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3cc25cadf3da4c259cda04a761d19380', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('368eae9bb1404b8fac58b062660991f7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', '2019-03-01 23:29:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('673db6a940d240b4b29811305d3413ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6fb25c5cc0e9457dadb59196b8867bb8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b4eb9037f6724e0293f7ecc3b05e6c96', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc4d5083f3ab4c43a8cbb7c492d879a4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5e0a70689e9946849531812f13ce7252', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', '2019-03-01 23:29:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1332575d5534446b90b6d0aeab2bb914', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c70dcdffb44d4fefae6b06ec2ee47343', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('79fd6753f43b4b6fb2114f49179abc3b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a79fd301199e4a608864a96670d8f852', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', '2019-03-01 23:29:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('65bb6882ac734d7795e3329dfe417850', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e21bfdf9bd74e1e902c3e786cb8396a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('46df5657b1aa41c4aace650906aba1cf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9726de4903224330b67b953a0785e636', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('297a554fb0db4b9a84570f9bc6573308', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c9a77d76e98a445fada72fe9ae67dceb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('090129f196fd4357a9fa8eb0ece27ce1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ff809abd2aa4529875b09f774a036ea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f329669568b3472c801346fb89bbd359', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('870564e93abe4288b56f7d9f53d9b34c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1ab2230854134f55a41b1a2d415fe25b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4f363aec45ee41529a54cd342b89dda3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('db95d004d6424488afac989993dc78d6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', '2019-03-01 23:29:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ae305ff50d1b42f5936653e02ee87481', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('373184470c174d6d9f465e42180b9237', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6dc955c8a1d4459cb677c3da70863ace', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96586e755bf04ca3a1bce665c2586c39', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f6927a2bad3e4d3aa23d53b9851ff49d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', '2019-03-01 23:29:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e80a8d32dd0143299818857d993ecc5b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7133b635568c4c56ad098912c3687fac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('87dfec8dacec4e78bba68b5fcd8f75ff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e1eb814aaeb346f09208f27a79e3ca19', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d7b295e48516449bad90b55b24dbfabd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee925c97ea644bcebfb175d8e8042a64', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4df2b8e1e2c74e869419298efddfe146', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('650bcbdc623d45c2ba85113d1d9efb3c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('42e88935b55e48789b5bba699aeb7c9b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7c087c5f842a497db0eafcc0a5edca93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('35fc9bf991cf49a4973c583a442fa075', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b6b74ae0665f41d4b3263c9bda906123', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('80591fa7ceb949d79d5295701eadaafd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c7c4ae1858345daa7dac1c19b49cc8e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32a0017a18a54eecad361349555f6dc5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4db327ed4e804de388ec7ae92d4142c6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('caa9ccae5f0743ff9443055c6ba2f6ea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('030ac314cf0641adae794714faa44e51', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c6d56d88958d4e0cbed2cc8436aa6f87', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f0ef39baa8b145b195cc54815b0bf495', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('11cb84f590fb453e8b6beb910a1d3bdc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b7b148d96cde4c67b85b068dd62b790c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a41062aa00e4fbcbcd0b227fd1a0430', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4bc6073cdecb4095a0102663e359326b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('77718794e80f484da6703d943325040f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('760459948ad14ca4961e734ea7d24a6c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('309930a51960435a8e46b6ca49dc7ee6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', '2019-03-01 23:30:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f612cc9742a54d6196288229a9e04431', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:02+08', '2019-03-01 23:30:02+08', '2019-03-01 23:30:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('82da7a54a9004165b33c220b2e3506c5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:02+08', '2019-03-01 23:30:02+08', '2019-03-01 23:30:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3c9604267fac46389cba8d233769036e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d6f07f7572a94d64bfd099dffaaf3c47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fcc4cf93c0cb466e81c6f7ca8785a2f5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('455facb5704d4805a1eac7ebb5ee14e8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5672d7f1b0db44b3b463a0cd66e47bb9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c088a4fe031e43d4b1dcceb63b8d384e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e2baf5e63e0f40609aa932d36e39eae6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('503f03273d514ee29f86ffb29ee32bd9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c90ed393cfa040908fa88811eafc91a4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3ac738075c624bd695563c9206d5af43', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3f2a3912d3b14a5a80a2b66bf4b60249', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2043d5e942894002ae6dc36300a83ad6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('336023bbe9ad432c9b69f57bd1cb2c37', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2e22fc38e6d34002b242e858a21767ee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2799f85cba9b4c92a0e44f4929091d5d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('92b7a90e7b9040be855d7485526c7633', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aa1f6d1fd0ec4e41b28e4eb27157439c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2045dc7049904f9d95ed7115a8e2780a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32fe7c923d704dd7bdf9e1b2b3f8aed4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('94c0c2ac72ce4d45a50a8b4e037d9fa0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', '2019-03-01 23:29:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('faf47f6b142f401fadd3847b1aca9f70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3bc558b307a84552a7a6a27dfdb0e07d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0623f7bacfa5456689cd298f27a90532', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f2b6b4adc58641eca27a65f210f22c15', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', '2019-03-01 23:29:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('acc476f2a2204296a5f1dae3fb62c16f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a7c6153db26348509009391447f9c7d6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f54b1885603a4568b2e1ed414fdff0be', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('caa41fe663824d2982efa86ee5701318', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', '2019-03-01 23:29:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4fa09c8e44844b6fa88930e2088e3dee', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cbed8b1047fe45c5972dd5c5c5a6550c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a21866d8789e4b898791b1efdf9efaf2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('49adc58fb32f471aadded144ff0e6a80', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2e22a808f81849708db3d0f0d507209c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', '2019-03-01 23:29:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7edb35e87391441c976d8e3e75c95af6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1853762ceadf468a94c209fc1eee26fe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3b0af5f777c3446292e389b5383fd5e2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', '2019-03-01 23:29:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('989d754f9f4a40de99cb6976a9c1289e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4300547188604d0f919311a2421f419b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6b1dbcedbe5e4e40bb32de59e1c7596e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', '2019-03-01 23:29:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('efbe1919878f4a10909acb615bdea399', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('408af4f39be74fd5af5ce4b97702ee1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9e1fd08da0b3476aabcf37671dfebaef', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', '2019-03-01 23:29:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('40606e922512463eab9e863719d4365f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('945cb8e7f1704542aef42a146a476128', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a849ba883d34e6cab4ee1f036b8dd61', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f29665aae51242d3bfa6279e0aad571a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0b44499dec1743429f1c475ed45fbf81', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('382544ed1aff43f788f958e157551fb0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d231eb135acc4e2b8dcecddf223f1a82', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', '2019-03-01 23:29:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d788b4b16f2845bcbc27a7da91632bd2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('26cb411ee3754d60a6f1dd5a7af73584', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b56cd487e917473db7a1324e7eddc2b1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', '2019-03-01 23:30:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('17fa9a02d3f24e47af503b2ca5096841', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:02+08', '2019-03-01 23:30:02+08', '2019-03-01 23:30:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd2f589fde5b4465b729204e460c188d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', '2019-03-01 23:30:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('24fcef147c5941b6a0c3845c63163cf0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('89b64a64d9064eccb9f263b68b0d0bfa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aaef4b9091ef481db9f42bf5662d8562', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', '2019-03-01 23:30:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f29f7d689b0144e29e11f41371847a39', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c16853765f4c485bad6abb5664708f7e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', '2019-03-01 23:30:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45f11ec4d74c4f7588c64775908b3fd0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f946fb4666864ae4b654c5c5e28fba81', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', '2019-03-01 23:30:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('30600f36b2484951a51605db652e402a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', '2019-03-01 23:30:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fb1d1ce9cee54f2ca13356a13da49d1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('532bf5c8bcef45779db3152d1387e5bc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8f24021d9f014504a2ef484723023f95', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', '2019-03-01 23:30:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a2e06b3d05b4325890ccdf968243671', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bcc0332af8a0477a938a5ad4ce76d039', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fb510f3fc08f43e49276be53543636ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f4b80bcc93184abfba9af9bbc55bba9f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('04dacec51e4944d59e73babeeeea6674', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9323e135483948b88e14d731778cdcb9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e963b842238246d2b2ab541cd6b5d6c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('58afbd4632594703ba57945d2b5d4389', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('53004ffa2b124c0c9c8cd22680a916db', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3faa5185fa9d4356816a4fd31d42afa2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', '2019-03-01 23:30:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('71696fbfacd243eaa143f07fc14066df', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0b4bf909759a4ceea8d5cef70864af18', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('efd046bf429b40dd82638bcf3fc63162', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d047dbdce424dbf83897c7fe2dc5730', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5f9def183fea423da3c1d01307e9db62', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb3cabf81d154c55a2ca10cc4c67464e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('baec0c1be6ae48029f9b938bdf26a9eb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('664a8b9ca4ad4f8fb467c8291bec143d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b243ccbc7be24fe78186c7ca81961416', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6a9651b0775d405d8886155b7d0ee794', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ece9ef138dfb4521aa1fec2fa30f51a3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b8a44e6bb45468dbf9ac334c1215d10', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('987fa52e153747a5bf76fe8bc622518e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45741d3f69094ce59112b5eb458a0114', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1e76a7d38da74360b84ec5d905cc5795', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0289ea228ec3403e818b3aef3e4aeb97', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('26b0efdc07e54000aced8601a08633e5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3c04625e420b40aaa8288e58f557ecb1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45a64cb17c4746e1884c78a984836ce8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('612b7123ff7e4daf8683387ca36d2d1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cbb5d392092a46d7b18e998033a8de32', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc0bba064f3b4db5b27074f058e7af60', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('91ba7c85665847519c4a15497b3c5b4f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b2f216585204715b0273145795e192c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9764df42b1db4bb490144d69f652b64f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1142fcd2cbbb4ef0acaecad286ead631', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('654439afa4984fdc9d524ec6bf3298b6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a1b626723dab4ba6849c2252aca1c9ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d847a7b3634842bd91b53d79e905d483', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d5b40960a5e4a468f92f7e608a414af', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4dbdd362487c48ae8b84c9b37cf35be0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('030c00dc26e348b1af25da08b004e1d1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ac564bbd58d3461d9fcf0907c6bdf222', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4dfb7b6995934e22b5cbc31372774ca4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:24+08', '2019-03-01 23:30:24+08', '2019-03-01 23:30:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e6aa77b8432244e79de1faedad041a96', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('49a5b31c48384a258a2e2cd7215444fb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3e8eb806e23c43c19390f24a6a9d9753', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e024b050a2824d0cb0af418c0dd25ba8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1533b4261dfa439ba20f7f842a39f15c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:29+08', '2019-03-01 23:30:29+08', '2019-03-01 23:30:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('74f5fbae9db7464ea9cd1bb35679fc7d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:31+08', '2019-03-01 23:30:31+08', '2019-03-01 23:30:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1e52977cd2d04badb1a5a21aef7d10f0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e483bc072c9e417fa19939d2783671e5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('97d7fbff1f1d49569601065368abeec6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f12987891d574b53b9f176b5c79db75b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f435cd8646984d3dabbdf89ff060d2c1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ae657c0e9cf476ea08f7d845ccf86f2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e423643688b148a1be4d84dc68808de8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60df51bfc9d94049b986508e28a5b0ff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c65a630c2294c8688caaa1bf1c30436', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('17e57a4977a94bddbd6e9865494cb119', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0462e864b02a492993bec2a421f79a2b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9232a9ed72674240b35b62dfc17c9612', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:42+08', '2019-03-01 23:30:42+08', '2019-03-01 23:30:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('755fd506530a4efb9249c798fa53fad6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:47+08', '2019-03-01 23:30:47+08', '2019-03-01 23:30:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d176d8ef64324a8d9e26429f3bbb148e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:47+08', '2019-03-01 23:30:47+08', '2019-03-01 23:30:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c39e9c58be9746d6b526078ed2c72a4c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:48+08', '2019-03-01 23:30:48+08', '2019-03-01 23:30:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('560ac7692b554b9196f28571cc7a8dbe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:50+08', '2019-03-01 23:30:51+08', '2019-03-01 23:30:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f8b247cbcc684ff3beca8b3632e16d97', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:51+08', '2019-03-01 23:30:51+08', '2019-03-01 23:30:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c92365564bd34a2bb65844fdc0426abf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:56+08', '2019-03-01 23:30:56+08', '2019-03-01 23:30:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd203a8705764399a32b55bb6b70e684', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f74b8a1502ea46448827045501bcf90d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('018f0a5238324d6990ebd581257b6f05', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b29733f257c4bfcb08f29c7cf95cbba', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cac7a590c00f4be39b1ffcce40c16975', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32272f3958de4a819df818234075f66b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f94853e20d094287b4e687368d1e3879', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('29e972b3e8b34b7eb32957c1ff598fc1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('899fa3e2a7aa48c0bd3bbaab513c218e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d148e005c1c543d0a34ee000a938b624', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96e23ad088af49dc98086c9aff6b6fbb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('71e92bc87b97445aa652e6ea273b4a8e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c1c0dc9c055148f4a6eb9bbd2fa1b565', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96c3fb66fb394e5b88b71250aa72a2a1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ba3ae5109b954de88c1fdffa53155412', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('24a22b6d30874a1f879adfab9faeed60', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d5f3961513f348b5b6afa4bc1f2a6024', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('143b65beeada4422b6ebd799d919545d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('edac855a2ed342939dad4352a5664815', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e4bb57223b7b4d21ab501fb49ac15934', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ecee51a28fb74a06b7f65d9fa96980ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('68088db2e35e482d8f03788a22f55f3d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1059f6c74db94a8695efe8f445115295', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d34fea01cf654311bbe8863eae4e0527', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a3b156e60e1442619cc44be841f9dc6d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', '2019-03-01 23:30:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('697f807bd7b34aa6807cf5201fcd424b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('034d7659c45b459d897a4d31cf413ab0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd93999d93394c0cbf2e724b6b35b296', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', '2019-03-01 23:30:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('73b03a575753403487d68b8397a6fa62', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a98f965feeb84c7bb63c7e0604d5b9a1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e195cb35092a4de08b439eabf92dde47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4cfb90640d55403a892f287f0128f120', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1afe8506f2e946e999907048e5155209', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c3efd8d7532541dc934c602ddf5a7966', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('58789a3f361f48c4b003be57cbd447de', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', '2019-03-01 23:30:28+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c42bf7c6f99b4bd79fa870249e310d90', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:29+08', '2019-03-01 23:30:29+08', '2019-03-01 23:30:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ab2c3311b124127925c8f960f97684a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b11e9536934a4783a09d3ffd3aaef7e3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e9470ea5d72d4e2495b5de2327f44301', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('748b207608644cbfa60432154345dbed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('667e77a465044f3fa37b7a7caeffecd7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2ffd2fa274d84237be5a60b114b20e5d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2854b6c2624f4f71b7a10240ce6ae84b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fac581ffa7cd4c968a3ac24bea9be650', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d9676eeddd934cba83b72b8032588f5e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('732dcf883717447d90e402115ceb4991', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f76c1085f19343aa9b8c7ce77dde69cd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('82506681868e4298a4ff4d28680abae2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('41d727f45d044fe5ac59f464df25de9f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e53184fce1e438a90cf7ea1ffa669c8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7b28cacadc604a70acc322f1c57e92ec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fe1ef8babf4d4aefa3998f2cfb43a8ea', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('865b990e399d4af39890ec05fdf50059', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('251d1268e0244b9dadfa0f6166e7839a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cbcc970368e84d8f8e9639261d05c04a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c800647954a043a4961f91de72bcca69', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:44+08', '2019-03-01 23:30:45+08', '2019-03-01 23:30:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d889c1c72de54a299c0a8690d1bb603f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('479f0e6d61fe497a8323e847f0080578', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60d784888e154cfbbc7e3c3c5f79bf1e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('df8ffce02d294b32aec8af767caa1d6a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('34fc561631794111ac9cda8edce15ab7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('38cb2e93a749439c90f7960848bbf2f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', '2019-03-01 23:30:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('09d210e69c2a4bb298fe910dce0278d6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dfd977a4cb8b49efa26d1b799a23de74', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5b54bae92ef9485b9ca77b167e46f267', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('af77c23e7ab54f8ab3bba9b97aea6ef0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('46737425bc2745d686d32878f55d504e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ffa4d90b368746f49bb1a6dc40e5407b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4ab4905e62f64667a6fc258d8bbfd91c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7fcb01c3c9744ed59a1a8d7b4358ca23', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b1f464d1b5c426aa5e93cfdad236363', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('77e5f07a283140e189a96ad8ce2f78ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d5e2f5559288496fab08d442808e0b26', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3e3de0535a72443fb7d19a8dac731196', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', '2019-03-01 23:30:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f764b6cf9ebc4247849c45e5f81425bf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('40066c2293544d46930d5ddef2173066', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('13f9a196aa034eb28560dfe32b2b2b93', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('df9788ac6c5e4df6a738502fd6a289d7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4578adea160b48a99821e1566e62bf88', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b811731793ca4fcebaadf8bb5d411a14', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1d59c71d383c40b5aca73353d3a161ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('87f61314f4834e92af41610ce891838c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6d4649952bca410abb64499211f08a50', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c27c3595913b437c94ca8429b12f71ce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fb06cbf707f14bc2899d47617f3cc297', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7774287402e7424eb16363cc77092d00', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('da2beb95d210488b86953467859da57d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0fd3c2673414462e9d3cc96d80262380', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('272741e6627b43c7b28d991f364fab96', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7f6608fdc7ce49a5b9869c6f27df5920', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('983d1ee8dfb2426d920e7fcfae2a9cce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('066f0ee1ea0b4a1b926e36b41ff65d64', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fa2904f679034145901bc5e6395a1d63', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5d69648ab99a4a149bf75372edb77d1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0658b90b6bb24262ab5306215ca76bc9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3096af31e6ac49e192eb36617231a3a2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('588bf28a344e4ee3ab9208f5dde5d84a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d7a7afa201644bf7b20cb4307c4ca884', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('411e523fffe347b4ad8b968d123f973c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', '2019-03-01 23:30:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a9868fb2527c4aadbd4aadd91a18388f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('770ea02d92f54f33aa23cdec63bca2c7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', '2019-03-01 23:30:19+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b375676bcb314efe81280053b95ac5c3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('22751cd046f14176a32e62dfc02675e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('47ccbaf45c9d4e12ba9598a592df9032', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7d944142a56c4f8692740eb42fe544f0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:24+08', '2019-03-01 23:30:24+08', '2019-03-01 23:30:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c0ceb7b555542ffbd6cb4fa34876ef7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:24+08', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0142b7fc3ef749e29c01d864fe028d18', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e5904cd793ce4b3c8aedb6c9610f258d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4651c36c600b45f8995752f1b8a6f1ce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f78b176ed4d24701bc26e111ff1737e6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86cc8855d0aa414f8b8f81b84a75abc7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b5c8ee97d5c340d2be9788fa4d276d9a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:30+08', '2019-03-01 23:30:30+08', '2019-03-01 23:30:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7fc0f49c4b024439a850278fe91c4e6b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:31+08', '2019-03-01 23:30:31+08', '2019-03-01 23:30:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5f5f0b463f8040d297c433be516227f2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d0be3a28bf54491eb3c2658c1de6aed8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d41d766f5074955a589809ab732843d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0471c0d380a490c82e2eac3a4f0d097', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', '2019-03-01 23:30:12+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('42335bd874214da58bd22af18a230d4a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', '2019-03-01 23:30:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a7ddabfd6f2a422b869e55cdf7755bed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dab9d9d339634608a4ae214c9a0cbcf3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('addc47c8e107438fb58677c759d07d2d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1e451d58e09541f6a2b292721d6652b0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5ae118134b74442822d73af9a7333ab', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('caa2b059601f4a9db62bfaf54baec8da', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', '2019-03-01 23:30:14+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ae55ea03961848f197354a0f9db0ce86', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5f3ea6e2561f4bc394effde2fd1f7f47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e00e7081c9a2480e92cc54e3d5d03bfc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ececadfc5fb54be5ba3973008183297c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc57cd1a0c564aeaa7307f05c43f3146', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cefa45ec8430449ea1777a2234a6e344', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', '2019-03-01 23:30:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ad36b790f8b84d8bbb83ef477a516bc6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('40cc0be628c74b12b6c48757960b6b25', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e38e05161ab944958fd97969c667478c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', '2019-03-01 23:30:16+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('76232eb8df0d49c29f705a785d3805c9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', '2019-03-01 23:30:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b6e94e3997794fd885b638b5b596c2a7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86817e06ed1f42148c153b61716e1cc9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', '2019-03-01 23:30:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('07666da1960846418cdb773b33ad44e7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6aa72689062040bfa35bfc19e669680c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('384b766a54fd47ffa36562e922104dca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', '2019-03-01 23:30:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ed20e7f4c3784275b24c8cccf066e45a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:24+08', '2019-03-01 23:30:24+08', '2019-03-01 23:30:24+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('19578b5e7bae44e89f8bb9679e568295', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f506572be242420591201c34766b4784', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', '2019-03-01 23:30:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a952aefdf9224647a2f4d75bf5bd02b0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('356cbda9eb5e4aadb713c4d0650c71b9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', '2019-03-01 23:30:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86a9b13ffe754662a8891fbe21c7d81f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('86771fc140e8407db8398c0536557b5f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a0e81d9a09f446d2b59b0c3899d0a9d4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bde75c0f7ae74e448a7cab571cd62862', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', '2019-03-01 23:30:27+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d31a368a0c25485593ee6eefeae5fb72', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:29+08', '2019-03-01 23:30:29+08', '2019-03-01 23:30:29+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c605bb7437a347a08790f56b5771f79e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:30+08', '2019-03-01 23:30:30+08', '2019-03-01 23:30:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('41eb2e763a57454ea5256c7e7a072b1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:30+08', '2019-03-01 23:30:31+08', '2019-03-01 23:30:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('82f923d0967e498f919fe17d357880ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('11068c2743954c118d298e6b0cc2d5be', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0c870e9b5b9c4fb9b09de551f88b0417', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', '2019-03-01 23:30:32+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c8d377bdb3224dbf8c688f9495dcb846', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('282dadf7d8374b0c82fad51c6f4fc254', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('27b26f6834a847c39b2285694ef64b9b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('49bbfff41c0e4baf81e2eaa0c42014e7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', '2019-03-01 23:30:33+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0265fc6203fe459fb710a87cb0f3f5dc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', '2019-03-01 23:30:34+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d0a8a06cd36146e28331b41657649e6c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('681d597d61684e38a987ad8fc2294cdd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5346839a97e4450b8e8266ced72ad92b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a8053e51b784fd3bafee468a03b9986', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d8dbc5318bb8478c96bf219b9221f555', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('676c875321f9465e875469a51444436e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b2d1e38b80ce473d8ea9526f75235532', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('afb1dfc6bb5e4bdf9aed7e88c62b01ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6bde0f1a9db642cea680596dfbdbf880', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3bce6bf6704446f0a82282ab44eac9bf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7649a2df6eb6430b89b6cdea25f9ec39', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4fbcb3d174e542b99d17be7387fcb94e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb29d044f84341148aedc725ff882626', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('63fa903b002a4943abafac9b79190e07', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', '2019-03-01 23:30:35+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('438a3eabb8904613ba6bda26b4b062e2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('84170591a2694c8e9511990214779cb5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', '2019-03-01 23:30:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cf6d91ea80d74a9a871d8c68d5c12c83', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a50593a9fe0240f0b44b87caadd426d5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('65989ddb0fa14281a5b8f8850b212a70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('55122b1861034e2b8074b4bb81488b04', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f8b6008e630e498686a379b41f5577f4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:44+08', '2019-03-01 23:30:45+08', '2019-03-01 23:30:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f18a625ae08941a9a8b6d551dd0b4576', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0bece96976cf4d979ba64de387f4b9d8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5c74cc08f637408792cd0fedaca4ef1c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:47+08', '2019-03-01 23:30:47+08', '2019-03-01 23:30:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a3a370f4b1014cd0b64201c870df9171', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9bbc2f62e3294755a16724427189a096', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('571961920e4e49eab618fc68df5aec5f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', '2019-03-01 23:30:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('61a28bb5eb444b59a1a615c0ad570cdc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e087ea11a256423ba20c6e98017de532', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8e9d58429d6e436f83635d578a859e6e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('094ad38a53dd4de48382e83b5c02b50a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('780cfc852b394463b9f1e08eab5b74e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b027852bb4dd4be09d15a3785b580e7c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('287e244268284ec19264ebe10a889c49', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bbe4afc36b9d48caaf16a0ef94f0b90c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('33e7cf793ee849deb655413f88b9287d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ffa0c08c5ab244fe82995bc1f8bb77fc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:41+08', '2019-03-01 23:30:41+08', '2019-03-01 23:30:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4894ea98ab764ae79a8e4dac6922eff1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:42+08', '2019-03-01 23:30:42+08', '2019-03-01 23:30:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b34a838714334655849c9fa6a692061e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:42+08', '2019-03-01 23:30:42+08', '2019-03-01 23:30:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4ac46cd5677b404a90a02783c3536d20', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:45+08', '2019-03-01 23:30:45+08', '2019-03-01 23:30:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd4a1395db234184b9582a712e39f590', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:50+08', '2019-03-01 23:30:50+08', '2019-03-01 23:30:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5a581141f3b444878df446334e82d9fd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:52+08', '2019-03-01 23:30:52+08', '2019-03-01 23:30:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7154f1f09e2241c2818e226dd85899bf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3423a852b3b04265be158083a6572a8c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', '2019-03-01 23:30:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c0f89e8dc6824bef91e859036df3a0a9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', '2019-03-01 23:30:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e36884a354614ae4b668f6ddf46ceda4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1616c6a4d9e946138d1f0b8880363294', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', '2019-03-01 23:30:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c6324ae7a7394cc29f032e7ffe94f117', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8d37763ca10f4bfe969a3897ec7fd3de', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:47+08', '2019-03-01 23:30:48+08', '2019-03-01 23:30:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('03603a8da2254d989ffb27d4c332b8ad', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:49+08', '2019-03-01 23:30:49+08', '2019-03-01 23:30:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6fac26d506d1472e89a3a423837f0c83', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:52+08', '2019-03-01 23:30:52+08', '2019-03-01 23:30:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0d3210e6308a47dda1ee11d957b4a582', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:52+08', '2019-03-01 23:30:52+08', '2019-03-01 23:30:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fa4c7a09b6144568b6931f52ee2f74a5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('83d6cd2b9fde4dde987b00bdb88e7cec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', '2019-03-01 23:30:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e0b9c1ec0d2b4ac8ba238466b04374d4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:44+08', '2019-03-01 23:30:45+08', '2019-03-01 23:30:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1196340340a0449794e503d9d6faf59c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d5b764cc9fee4575b23b000a576acc1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', '2019-03-01 23:30:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d84635a513034b96bb6085dcf6f1c530', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:48+08', '2019-03-01 23:30:48+08', '2019-03-01 23:30:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0d77d2cea9db48af8c5c567987bdcf76', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:49+08', '2019-03-01 23:30:49+08', '2019-03-01 23:30:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c98860b26eea4a2d95d2aed19a18aa19', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:53+08', '2019-03-01 23:30:53+08', '2019-03-01 23:30:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('69dff000b34e4fcf8b4bd51f576379cf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:30:55+08', '2019-03-01 23:30:55+08', '2019-03-01 23:30:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f780cca480004abf82476a586850c368', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:38+08', '2019-03-01 23:33:38+08', '2019-03-01 23:33:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee75252e24854e388462cd8e16ae989e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:37+08', '2019-03-01 23:33:38+08', '2019-03-01 23:33:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0db9e13157984218bf1b91df832f6666', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:39+08', '2019-03-01 23:33:39+08', '2019-03-01 23:33:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('36b9eb2dab2548cd8a09a83dc7ca65dc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:39+08', '2019-03-01 23:33:39+08', '2019-03-01 23:33:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aa808349f16c47e3ad447e66b9216344', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:42+08', '2019-03-01 23:33:42+08', '2019-03-01 23:33:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cacc0123a567430c94d4642c7bdea0b5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:43+08', '2019-03-01 23:33:43+08', '2019-03-01 23:33:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f5d558b1a74d46d58ef569393c7940ce', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:44+08', '2019-03-01 23:33:44+08', '2019-03-01 23:33:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4589c9941e0343eead9a3b59c2a28a47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:45+08', '2019-03-01 23:33:45+08', '2019-03-01 23:33:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6dcce63f4d8d46c891ba66cf6c51a113', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:45+08', '2019-03-01 23:33:45+08', '2019-03-01 23:33:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bcadbf967ffc497f837349b8150dd07b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:45+08', '2019-03-01 23:33:45+08', '2019-03-01 23:33:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a000aa6bc05541c9a4079d262f421e23', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9a5767daeb464171981a3f7571f05f6f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2a9409dfaa7447b48a325e2c0ef24a8e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fab6ad32837744138a7f076087692d14', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', '2019-03-01 23:33:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d09fc1083f7d47ceabfe25f4e3c4d554', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:47+08', '2019-03-01 23:33:47+08', '2019-03-01 23:33:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2bc3fc61da0d45f281fde28d4b7b1efb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:47+08', '2019-03-01 23:33:47+08', '2019-03-01 23:33:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0eabfd9cf03f4ba78c64a85015d8669c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:48+08', '2019-03-01 23:33:48+08', '2019-03-01 23:33:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b7c54e9928e48dbaca234cab4851f9c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:48+08', '2019-03-01 23:33:48+08', '2019-03-01 23:33:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f345b5c06d554f91ac2ac11bedb240d1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:51+08', '2019-03-01 23:33:51+08', '2019-03-01 23:33:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3f6e650cead94300ba1933c771e99bec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:51+08', '2019-03-01 23:33:51+08', '2019-03-01 23:33:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dfeac877bd4d4e0e8a3de8befbde0118', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f1b9116a05374a2da3ae6caa092052a7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2b4ba110fca44d56ba8a4152a6d31ae4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('abaa98d321264e7a98ba436f1bc381df', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1d3320a253944b27a3146e701a8468af', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a7e454372f5a4262b48de5fe26dde06a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ce294c53967b4b0c8763b6cc3b5519fb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('74ebe8bd90c14737966f53e78e4a76f0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', '2019-03-01 23:33:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3372b0a6efa8467fbb791b5054104ffb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e18a535e64e54434a13210c023e335cf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1c5727af0a904624abb759a32b4fe5df', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('de98d71b72214e63bb093e8648da6baf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bc29e36b1fdc4636923d432c2252b620', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dafc47f1deda47c782fa9da69ee36f4f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b4f622340c7846cb845b9d5c54422cde', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60d11fafd3644e79a304139ae9889fc6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('199fc746c6a644588bb3cb369e609353', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e5f4da5a050e498abdb1a07a62906446', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7586ad52cfa04ed7a6a35f07c16d67f6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3b46e6104c114d70b2f075291947668b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', '2019-03-01 23:33:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2878578c1a784b858efb568cc175489d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3e60a6c4de6a480a9e53701b6645b9a6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e55d2f2312144b2fa1c72239d3cc43d3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f058e0b2286c4a7eb7c2c2df04f4a4bd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2b9785e4d292450b9fefff86d5f295d7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1688243461494019a42e7c050ed4f30f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cb1902f373574237bf5953454dc92ef9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c302a7b1806b401b987e461839b9a452', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('706a8c14799240cd8023980f900bcdb2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d8930ba17abb4842b718e9a1e7726b81', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eaf5a28fe481437f813a8ba44d6edb52', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ae8fcd09866a46e98e8897774e9adb39', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('be04119af9354410bb3076e033eaac87', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('77abe84d29b7483ca863cbb0ef7c747f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0203ef27f70648eeb721e3e17ca4d106', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dc7d9f8fe4f5447f86b85bb79f1cde64', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dd40e2cc4dd54f1fb5a61b4654b91ee7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9a3f2643e3cf40b290717db98d2e74ed', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ab6e4d1d14be4d3cbcc6c198a233966a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fc871f1558614565aa46ff7dc0948492', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1afae0f310a44b41ae22dbebc5e1a8d5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('57f849b89b044cc3b0ecf601aaff5933', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('67cd08af264543e3bb79cc2c9c7c415d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5f72a0cb9cfc47a693b36a1420932b9a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('701631735f004a0ea9c44833b7dac2de', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('61529c41666447b68e5b40616abc3658', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('df1305a170de4c248d57054514eb6bdf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1a3925fa579d4519a0ebaf86e5519404', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('769dcdd073914b3f993e577776df5244', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5b2151ad32b74708bfad16d8aa96918d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('01c6eb661494407d9d9dbf27d5e6ba0a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f2e1d112fc8e4a798396fb214ea6df14', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('08bcb8de44d04726adcf849f87d41c69', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e6ab12a253648d486b80c8cdf3eee70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('311737644e3d492aa0768572ed7ef74e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('263dd83668e643689359cb03887d41bc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e3f009defd5641689ba3fdd7ecdbe187', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f16603fffb9e424b985a9d1a1ea25d5f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6668a2a0afe84577aca3e6f22bdd7dac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('162873a683ce4e5eb032a86ea30f7c8a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('862527c338f4437b87ca0270484bf401', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e5fa3712f3d74162b867da3628d9d939', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f5066b25f4fb4ea0b0003196787ca75c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a420558dbedd41d0a638596c5323946a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('550ff49591ba402fba364b21d9cf97c9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('02a1fd97e92e424c9720e374fb82cd5f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c440ef4627224078aaf574ebc6b1a900', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0b0ef62cfa4240d3ae51d9b2a79c5305', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f503a2ab62034f15be0f50ea33822ec8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('14f6dbd0071942af9bc58a2e3dce60fb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dcbe6bfd87c244bbb800cf88f512b225', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b2421b89df5745b6ba88d93c0b263069', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('05d6a7723b674814a6fa9fd34cf79925', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f990efc3f0484de3919e7bb64a8551ec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d2cf754ad8c149eda15a0977c7eb41b0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5d4506830ae84100b536ffa556478848', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('24e22bfe518549b1bfb059967e76dda6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cc6e0427580f4a518ce6b89852f6bc12', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2d8b59a9234749db8de70c29fc93fc6b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ef3307eda2724e5ebd207a8a05dcb93d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b68defe74de04fd2b842e967d4c30df8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9720acc478c049b49a899634dd8e0898', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6611fb08c524456f89740224ec263adf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a8876a647673482aa314c5ed2f24b889', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bff43d298555448facac779a5408237c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e30eece346e7480cb8ce96ffd3b47451', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6aeab15605f34d0fa2367415fe9aab7c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dc16807c61a0458e8e7bdde952d76f57', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0bfea99246324b51812e41cd7ade653c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4e861a9f6a6046afbd99418b6c854d84', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6abb3f9937a74b9a87ff94d7b1191802', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('22860d9b52bc45cd9276ccd1ce69aab1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7f31142606a043788650ea09e506caa5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5775d12eace24ada9c00090e2b23013a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bc886424f72b44829a4275f88d076401', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d204b2d480f745999c22ee831754cad1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3d8b9064424a4d69973b873e3baab1d2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45d4cb0cd5ad4a91b154beff2fa17549', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('06cde52ca40345b0888577b2bbf973e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9e95c43a50044038829d344db5db89de', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('96f007b339b04e80973cec63ddd9ac40', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5a3c4bdc5de447ea389715c4660302f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('93ec61f8f746485786040b94b3bd4b57', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9ca3dfaab648437c9597357b9e4e22e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a97f7eeb90d141fb8ac7ab85b183cff2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a7d46d1a1bb941bbb37f5890f10e90ae', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2c84e2f7683a4efe9269079fe283e3cd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('74ab899d1c53422fa4a735b452415241', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bad1a1170793476e9bca408bf6e02aa3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3165fe881d7946de9a9c8f4c7df976f5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5fd989091358429d8b2d4b1543632a9e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e60ffa953074754a484b075eabdd561', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0309c33e97fe43598c0aa749e1dadca2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', '2019-03-01 23:33:54+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8335c55dad7542fab2164f345b264d27', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('88c0b066e55b4e77b4a208cd055f5339', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b24a666946824421829046946e4f55f8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ac69e90e29ab456ea8a061ecafb9f9ef', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6cde6afc5fe348c89ee3a778b7985420', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b03eb3ef0b454bccb3b08aa3d401ff62', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d22a45d951f942ef8c46955b8b2173b0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a5f5f90b07cc4f2caf5407d623766725', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('69357cf840a649b39a1de69a97483cd9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d215cdb3f9dc4692a718db472410a399', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('466e89337ea941bea43b6bbd9fe2ff29', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5c6eb757a97943ae8ad4c82151d70f2f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6c38d64bf76049dc89da550c571d0660', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c28de6c737ea44f7a96627ac590dc972', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e58ba3b49f084d30a1ad44b628ebf883', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ebc8b72ece3446549883ac77bf5362c1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9421b6c7d1c94fd39f4e5c62ecc06f9a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2ff3e327c77646e0934aa83c9cb64d7c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('89d5a71ce87e4218b91075500aa45b21', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('77d0b885b7c64358966bafa9bbf95483', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('79cbd592db07477c8db0366fad26429c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a80e65e4bac64713a2a17253be4a3dec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1cd7e834223644bc9207648bdf5d4b6c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bccb63e463e24a4eaa5206af30b9d045', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('139c33516b734f248b5594aafdd3ac28', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c8c3de4f91fe4edeb4df00aa98c399b2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7f6e22cd7bfd4d5c85cecc3bf23a02b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b08f09c41b954d648b644a558e58189c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c0cc14b07e684a5783de4a79f36ced8f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d061e74ea44f4ae38ae91763d938f9d8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d1490036f5c04278a560766952c26d70', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('22109e17673a43e8b47cf4a34f5a1309', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45a1476b9f2a4b1b857b246a965758f8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b6b19412517f4d14a8c9f9f4c0288391', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5f310d745c184cc5bdce7d159d994718', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4a861aa50c0747cf8725d5f8dd8bf1d9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('32ad98c029c449828d7d8cddfa96f42d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('882e99308e3d48e4a4e0aff8964f691d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', '2019-03-01 23:33:55+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a133dd9659f6493cb6499f8c27ccfa17', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4356000688f44110b9d03526dc079136', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('334ef780cbe246309a426dca8c2a7d02', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('528c91adc3004cf1bbb639429b9f0737', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fa50a7d6dc814dafbaa12896017855e1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c5155f682fa4c638d698c2de9693617', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', '2019-03-01 23:33:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('03cb84d714414cc9b2387d9c1fbe9613', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('79afb11479d140ef81aff224528f4fff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f73cd2c86e054fed94a162877746f8e4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d890579458884c58b23b6450bcda1fbf', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', '2019-03-01 23:33:57+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f88f76e713894825996bf724d9d5786e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('46732af72ea74e409b47ade1e16f722f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', '2019-03-01 23:33:58+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3ae93fb64213410faae6325e59e17531', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a150c2edc97b46b6914b8612b1c733f0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6d91128239d34212b79c0a62d7dd5afa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('afb712452be34b3ba807303f3d99e545', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6ac29aefa5e14cc29b3795416834335a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('82438e2a0a064841aa8fdc72c4ff82b9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('26bba0899de946ea91d8f339d65d332e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('03ea0c75b08a43559b4bf8d5833cc475', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', '2019-03-01 23:33:59+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('76f9eda02f604a8d81a9b1060d9912de', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7480faf3abfb4c97b585ecc809ec424c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d84aff6b77fb48ecae0929eebddc31aa', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('952fe1c71822488f9a28fbf8f00ff7d2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9c503604b58648bf848cf44dee3f99ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f669f3a3c0764e0983581f7278d4b6ba', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('41e7354211f94e1391d58d23f07fc21b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c5b076a6b13947b99492a5e48e9a9489', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', '2019-03-01 23:34:00+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('67ed5608275645e782eeb52a3f36e0e6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b1e4bd0c90b3410baaeb82c90469a743', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d087e3b97c9540ed98cb3a069ad1c26d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('05c06916c8b347768f3e2019a65e4678', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('29de1d00d66841b5ad9d5d9f827b2a1b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9738d6e1d2ce4948b647080007a8654e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c9d1c3660a8e41e1a553d5a371a72d3d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', '2019-03-01 23:34:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('72a0b62653234ffd9ebb937df382ca8b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c71e95243306488f98a5f2389ce1a801', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('378feaa9145b45aab8b64acf41f58e75', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3d5e9e65bd4c4886a9e9b8ee44aaeb90', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', '2019-03-01 23:34:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('127e47380e6546d699498a071edec2c3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a4363c5ca53543078964b69abbaa5620', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('15c4e0bf2afa48d2aaf404a8c1e81e91', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aa3275ab07914e20be45f5ccebfa7e6f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('04f47c68252847ada4ca8c3be24d1582', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('806ba40c41f940359392f82ab8ff3eb1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('45a6fc23ea6447c5820873f762fccec9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('46828d8126d94e6e88e227ce1f5c789f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', '2019-03-01 23:34:03+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b1ca44d3178e4876bec1e89aad22ddbe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ee1506ebe077414bbc514bd443e6c13f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6e380b956f42466484efdd2c791a5238', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6c8ce9a564194f768e5ffee039ed7714', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5cb1e29ae1ae44f6aae3ac2019cf28ac', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c4539820206340298f51ac3f5aa32629', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6931b4fae1be42d3830b6e9c9ca6ea9e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f8ad2017063b4c7aad3864b9065a4270', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fed2c079688648b8b6e284276f11a06a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0fc11f67cda14305820a4535254492e3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('584b56c58890405d9414f847f5df161b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1a4b5657d0ef4312a67139924e9dc18a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', '2019-03-01 23:34:05+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7dee8f884424420595399089b5dece0a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6ed2bbc0bb2346b28fa68d01b1db4a08', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('65d53b51a5d1475cbbda12b0704a2731', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c8eef3a1821846f8ba0a34767e367e0f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c7fe6e95874c431eaf2776c1fc69b3f0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d54474bc87c74ddfb7995eb1acd4dd3b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2ca97e2296b946de9753b0e0879dd4be', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('59b4bb74d3034f9aac11784aebfe4100', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8b9f4f8fbd1e4abdb4f162c26397f468', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('98ae81fdb4a1415cadce7e870b81e520', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', '2019-03-01 23:34:04+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8a2f1aa6d70f4ebfbb6fd72e5891200e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6ca8d34a60ee4b02ba0b0464f9e100e7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', '2019-03-01 23:34:07+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4c480b8967e44748b79730c9e835c428', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('30f8cf2befee4447b022959c3b7b8a37', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('54c2f29f36b841a49eab894797a953e5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b1cbcabe27934e988ce0bf8a3ec47902', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9c0470b9e9eb4cab926c01d7981dc779', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', '2019-03-01 23:34:08+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f954f2354ae64ea4b0207d863581462e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', '2019-03-01 23:34:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b17993298ea747e7a380d448ed9862ef', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('99e9930264944eefa18a29f18c522871', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fc19b8139d174674b5ce3063c9018230', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('7e4dca0f226a4ac9a82c9a4eb8df4f5e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e5f32c766c204801ac71eef08f1a945a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5b4ef7311d2e4a149025cceefb68d91c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('51e87b8f983b4bb293ea8529a817a615', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('22378c046b864c5b813bdda5b9cf971d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9109b6b51bcd406ba8ff6821e0b0741c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eb482ce9afad4d59bcc9e265e39ee7da', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8435796884bf43a5b2506664dc507f10', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('66796e0057bc4a9b821480a4c674a814', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4e475c992acc49959f7c2bcdff09c4f3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4aa10eefd9f44b4e9df28fc20a04da5c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', '2019-03-01 23:34:09+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9168cc3fa6b44c98898c0801f27d2eeb', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6693797b731749318316e04360a54ed3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('09a15c8c4a914c3784eb86eca9162339', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('79cf52a3108c49789cf042e53da8a678', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('24ef6be072284e62acf2d92cf41f1ea6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4bba02ce34b748b4a2d899ce18ab4aa1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5729c4750020489ba158612ddc9fff60', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('38a697c462454cb6b64554ede4bdbebc', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('71947415c2384a38b0df17cd3e9a4985', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b7b9106902204e53a8a472a42260612b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', '2019-03-01 23:34:10+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c356bb587f5b47298bce9f13e6a9713d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3da78cbdff3e4589a181951c0592bb65', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6ea4c6ee8728451891a2e2afb29b943f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('15420bbb91c34d108e2b57ecd2a60eca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('70d64282316f46dc8ebb6815d8e8718a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0ddd5f944493441383ab207639de489d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1f6dc379de6b4841811276d1d292f471', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', '2019-03-01 23:34:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('082398fbbb734522a3b6992f95776667', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bcbc8fb82116410b93cc6ca2b3b969b6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f7b9b93d36cd407fbb882ca5ebbd2495', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f6dd8321e156446b8f1f9090e54385e0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', '2019-03-01 23:34:13+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cddf4930d4644653bce6a4e9c7abea41', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:17+08', '2019-03-01 23:34:17+08', '2019-03-01 23:34:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a2835c11fad047ac8fcc4cf6d6bac5e3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:17+08', '2019-03-01 23:34:17+08', '2019-03-01 23:34:17+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6b41c7aa343c45729311d7f4871cbf46', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:18+08', '2019-03-01 23:34:18+08', '2019-03-01 23:34:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1214884bafa04e21a00e119077c4500a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:18+08', '2019-03-01 23:34:18+08', '2019-03-01 23:34:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f41033cc350e40f1b7ce9f873a46c78d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:21+08', '2019-03-01 23:34:21+08', '2019-03-01 23:34:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ae1f1198bddd45a7979e508ab94b7e0b', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:21+08', '2019-03-01 23:34:21+08', '2019-03-01 23:34:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0e0c9bc0b1c24ebdb27d8b80ee32ebda', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:22+08', '2019-03-01 23:34:22+08', '2019-03-01 23:34:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f14ab8a952ff422a8309b22511307eec', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:22+08', '2019-03-01 23:34:22+08', '2019-03-01 23:34:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a0553ed76a4c45fdbb367ad537c30106', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:25+08', '2019-03-01 23:34:25+08', '2019-03-01 23:34:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('142a142f4f1b43728f35b5d50d0c4807', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:25+08', '2019-03-01 23:34:25+08', '2019-03-01 23:34:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('74adb2c2298d4576b6c889766b3f49bd', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:26+08', '2019-03-01 23:34:26+08', '2019-03-01 23:34:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a66a450cead8452da0ca5b28ea63323a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:34:26+08', '2019-03-01 23:34:26+08', '2019-03-01 23:34:26+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('a313f4758fac4bfdbb546c262546009c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:18+08', '2019-03-01 23:37:18+08', '2019-03-01 23:37:18+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('17fb086a90d8436aa377009ff450a2e7', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:20+08', '2019-03-01 23:37:20+08', '2019-03-01 23:37:20+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d2563f9bb4204467b512a1e704c1c2c5', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:20+08', '2019-03-01 23:37:21+08', '2019-03-01 23:37:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('965877870bbb40d2a092f60578b5a34d', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:21+08', '2019-03-01 23:37:21+08', '2019-03-01 23:37:21+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3819a26e746f47f98a6358144070f367', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:22+08', '2019-03-01 23:37:22+08', '2019-03-01 23:37:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b680d0f766b44c45b72bde6f7c54ea2c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:23+08', '2019-03-01 23:37:23+08', '2019-03-01 23:37:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0bfd0b6f614a42449c7a6a88c2c6efd2', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:38+08', '2019-03-01 23:37:38+08', '2019-03-01 23:37:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8acedb07e91f481e84de3c4ed05eadef', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:38+08', '2019-03-01 23:37:38+08', '2019-03-01 23:37:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('dc89eb4adc41402c81ec7972485729d4', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:39+08', '2019-03-01 23:37:39+08', '2019-03-01 23:37:39+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('bc9d1128f52d43889bcab98bc0f5406e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:41+08', '2019-03-01 23:37:41+08', '2019-03-01 23:37:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('1bcc85e9cfef4d4692d6df98889fd335', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:42+08', '2019-03-01 23:37:42+08', '2019-03-01 23:37:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('200abf7932734083bb3768e28be58088', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:47+08', '2019-03-01 23:37:47+08', '2019-03-01 23:37:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9dd8470decc54b6996fc5b586fbdffa6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:47+08', '2019-03-01 23:37:47+08', '2019-03-01 23:37:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('8c869a72055045019651f013b0eccd3c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:47+08', '2019-03-01 23:37:47+08', '2019-03-01 23:37:47+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('517d87ffceec4d86bbb107ec4acebec0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:48+08', '2019-03-01 23:37:49+08', '2019-03-01 23:37:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e21d88a51fc445e790fad42c5e4eef7c', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:50+08', '2019-03-01 23:37:50+08', '2019-03-01 23:37:50+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fa3d193feeb54a509b778d787cdb0d1a', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:50+08', '2019-03-01 23:37:51+08', '2019-03-01 23:37:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('73969f00ea88403ba0b4bd7d9f425c47', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:52+08', '2019-03-01 23:37:52+08', '2019-03-01 23:37:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4b33860584544727b9bafc7f953c0a5e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:42+08', '2019-03-01 23:37:42+08', '2019-03-01 23:37:42+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('e7f345b1d33248e59c455be0b84da837', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:43+08', '2019-03-01 23:37:43+08', '2019-03-01 23:37:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ed12aa51600d4062b327c25c5b3085b3', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:53+08', '2019-03-01 23:37:53+08', '2019-03-01 23:37:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2042e76911fa4b7b8a8058f2981dbfe1', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:25+08', '2019-03-01 23:47:25+08', '2019-03-01 23:47:25+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('adca9184fc9548b192d7cb58de7fde85', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:30+08', '2019-03-01 23:47:30+08', '2019-03-01 23:47:30+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9f5879bbdde142b69d2cdac547e36ca8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:36+08', '2019-03-01 23:47:36+08', '2019-03-01 23:47:36+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('81e7505c006143e5aa37c81b599a4721', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:41+08', '2019-03-01 23:47:41+08', '2019-03-01 23:47:41+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('f031b56b439d4f9bb66177fe531336da', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:46+08', '2019-03-01 23:47:46+08', '2019-03-01 23:47:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('d0cef42ef0d547c1aefca8d5daaf0ba1', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:51+08', '2019-03-01 23:47:51+08', '2019-03-01 23:47:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6435782879e643329246c6efdba2c1af', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:47:56+08', '2019-03-01 23:47:56+08', '2019-03-01 23:47:56+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6959e11dd43347d4a7559ced81035a32', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:48:06+08', '2019-03-01 23:48:06+08', '2019-03-01 23:48:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b8b338a1207b4019965049e3df70f51b', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:48:23+08', '2019-03-01 23:48:23+08', '2019-03-01 23:48:23+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9647ad222dcd470fab6a03a629f1ca6e', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:48:38+08', '2019-03-01 23:48:38+08', '2019-03-01 23:48:38+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('6a4b4c46c39c4ce3a55a02513362a233', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:49:06+08', '2019-03-01 23:49:06+08', '2019-03-01 23:49:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c095f0dafcde43cd824c9a9e681440c0', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:56:15+08', '2019-03-01 23:56:15+08', '2019-03-01 23:56:15+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('3e88fccd5d054a1f87e4b4053ce88d99', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:43+08', '2019-03-01 23:37:43+08', '2019-03-01 23:37:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('fd350ebc5a9d4e3fa2fb305d734998ca', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:43+08', '2019-03-01 23:37:43+08', '2019-03-01 23:37:43+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ca51f8cae1d54bedbb77f6e2b106ab9f', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:44+08', '2019-03-01 23:37:44+08', '2019-03-01 23:37:44+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('0c33f5c502854ee79afd80d391416dff', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:46+08', '2019-03-01 23:37:46+08', '2019-03-01 23:37:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('40cc46e152684880aab7dff9c4d763a8', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:48+08', '2019-03-01 23:37:48+08', '2019-03-01 23:37:48+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('2186893f24504012abac499291d0ef62', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:53+08', '2019-03-01 23:37:53+08', '2019-03-01 23:37:53+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('9a6a5ee92a314009887b99af4143d385', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:44+08', '2019-03-01 23:37:45+08', '2019-03-01 23:37:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('49a7bf552999440e85076429a960e390', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:45+08', '2019-03-01 23:37:45+08', '2019-03-01 23:37:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('613ee7b0e8fa445d8949eb2d45470b53', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:45+08', '2019-03-01 23:37:45+08', '2019-03-01 23:37:45+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('b41955ae2a5e4c1ba47feedceb6e4c83', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:49+08', '2019-03-01 23:37:49+08', '2019-03-01 23:37:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cd95fd2508d14698ad2d006298169cfe', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:46+08', '2019-03-01 23:37:46+08', '2019-03-01 23:37:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c3ac90a7d36241d9beb7bed005956658', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:46+08', '2019-03-01 23:37:46+08', '2019-03-01 23:37:46+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('4ba26cfbe94d42629bf6ca88c5a40ad6', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:52+08', '2019-03-01 23:37:52+08', '2019-03-01 23:37:52+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('edcbabe1338d40d88059e4884bf146a9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:49+08', '2019-03-01 23:37:49+08', '2019-03-01 23:37:49+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ba74ee72842440668ed7e486665eebf9', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-01 23:37:51+08', '2019-03-01 23:37:51+08', '2019-03-01 23:37:51+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('cbc1eadaa475477eab7fcd9567418567', '0b77c93c1e48430bbd7208e63381f83a', NULL, '0:0:0:0:0:0:0:1', '2019-03-05 23:02:31+08', '2019-03-05 23:02:31+08', '2019-03-05 23:02:31+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ac1428f8e3f649e3a71463b08f836699', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:24:01+08', '2019-03-05 23:24:01+08', '2019-03-05 23:24:01+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('eaa4336c79fe46d8bccf45d3fcc710a9', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:24:40+08', '2019-03-05 23:24:40+08', '2019-03-05 23:24:40+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('09bfbedcda254611998db6ed0cd3586e', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:28:22+08', '2019-03-05 23:28:22+08', '2019-03-05 23:28:22+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('60646406f2a94a7eb9ef02d276df6085', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:31:02+08', '2019-03-05 23:31:02+08', '2019-03-05 23:31:02+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('ed1f5872ad614fb5baea56cc427447ef', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:31:06+08', '2019-03-05 23:31:06+08', '2019-03-05 23:31:06+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('aea70ab2b4584b749c4b27fc6924e86a', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:31:11+08', '2019-03-05 23:31:11+08', '2019-03-05 23:31:11+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('5ccd8dc19cb74647ad59158870b59bb2', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-05 23:31:37+08', '2019-03-05 23:31:37+08', '2019-03-05 23:31:37+08', NULL);
INSERT INTO "public"."biz_article_look" VALUES ('c932556ee968468a8b53b856b2fdcd0d', '0b77c93c1e48430bbd7208e63381f83a', '1', '0:0:0:0:0:0:0:1', '2019-03-10 19:59:04+08', '2019-03-10 19:59:04+08', '2019-03-10 19:59:04+08', '5');

-- ----------------------------
-- Table structure for biz_article_love
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_article_love";
CREATE TABLE "public"."biz_article_love" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_article_love_id_seq'::regclass),
  "article_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(64) COLLATE "pg_catalog"."default",
  "user_ip" varchar(50) COLLATE "pg_catalog"."default",
  "love_time" timestamptz(0),
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."biz_article_love"."article_id" IS '文章ID';
COMMENT ON COLUMN "public"."biz_article_love"."user_id" IS '已登录用户ID';

-- ----------------------------
-- Table structure for biz_article_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_article_tags";
CREATE TABLE "public"."biz_article_tags" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_article_tags_id_seq'::regclass),
  "tag_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "article_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."biz_article_tags"."tag_id" IS '标签表主键';
COMMENT ON COLUMN "public"."biz_article_tags"."article_id" IS '文章ID';

-- ----------------------------
-- Records of biz_article_tags
-- ----------------------------
INSERT INTO "public"."biz_article_tags" VALUES ('4', 'ae5694519fe64354bbd7de00b191fc2a', '05f0a0f3f4a14f7793fd1da8f0c9cd7e', '2019-02-10 13:48:27+08', '2019-02-10 13:48:27+08');
INSERT INTO "public"."biz_article_tags" VALUES ('c12390aa66a34cbb8766530df0b0cd30', 'ae5694519fe64354bbd7de00b191fc2a', '0b77c93c1e48430bbd7208e63381f83a', '2019-02-16 22:23:20+08', '2019-02-16 22:23:20+08');

-- ----------------------------
-- Table structure for biz_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_comment";
CREATE TABLE "public"."biz_comment" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_comment_id_seq'::regclass),
  "sid" varchar(32) COLLATE "pg_catalog"."default",
  "user_id" varchar(32) COLLATE "pg_catalog"."default",
  "pid" varchar(32) COLLATE "pg_catalog"."default",
  "qq" varchar(13) COLLATE "pg_catalog"."default",
  "nickname" varchar(13) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "status" varchar(64) COLLATE "pg_catalog"."default",
  "ip" varchar(64) COLLATE "pg_catalog"."default",
  "lng" varchar(50) COLLATE "pg_catalog"."default",
  "lat" varchar(50) COLLATE "pg_catalog"."default",
  "address" varchar(100) COLLATE "pg_catalog"."default",
  "os" varchar(64) COLLATE "pg_catalog"."default",
  "os_short_name" varchar(10) COLLATE "pg_catalog"."default",
  "browser" varchar(64) COLLATE "pg_catalog"."default",
  "browser_short_name" varchar(10) COLLATE "pg_catalog"."default",
  "content" varchar(2000) COLLATE "pg_catalog"."default",
  "remark" varchar(100) COLLATE "pg_catalog"."default",
  "support" int4 DEFAULT 0,
  "oppose" int4 DEFAULT 0,
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."biz_comment"."sid" IS '被评论的文章或者页面的ID';
COMMENT ON COLUMN "public"."biz_comment"."user_id" IS '评论人的ID';
COMMENT ON COLUMN "public"."biz_comment"."pid" IS '父级评论的id';
COMMENT ON COLUMN "public"."biz_comment"."support" IS '支持（赞）';
COMMENT ON COLUMN "public"."biz_comment"."oppose" IS '反对（踩）';

-- ----------------------------
-- Table structure for biz_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_tags";
CREATE TABLE "public"."biz_tags" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_tags_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;

-- ----------------------------
-- Records of biz_tags
-- ----------------------------
INSERT INTO "public"."biz_tags" VALUES ('be2cb86bf87346ae84556de524136b98', '我的', '你好', '2019-03-04 22:18:26+08', '2019-03-04 22:18:26+08');
INSERT INTO "public"."biz_tags" VALUES ('240e40cc407e439eb0452326b5d379ca', '你好久', '你好久', '2019-03-04 22:18:35+08', '2019-03-04 22:18:35+08');
INSERT INTO "public"."biz_tags" VALUES ('ae5694519fe64354bbd7de00b191fc2a', 'Java23', 'java编程实践4', '2019-02-10 13:29:09+08', '2019-03-04 22:22:08+08');
INSERT INTO "public"."biz_tags" VALUES ('561a44df69a840ecb6b3e4ec159ebfcd', '3w', '3', '2019-03-04 21:12:49+08', '2019-03-21 22:38:05+08');

-- ----------------------------
-- Table structure for biz_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."biz_type";
CREATE TABLE "public"."biz_type" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('biz_type_id_seq'::regclass),
  "pid" varchar(64) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "description" varchar(200) COLLATE "pg_catalog"."default",
  "sort" int4,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "available" bool
)
;
COMMENT ON COLUMN "public"."biz_type"."sort" IS '排序';

-- ----------------------------
-- Records of biz_type
-- ----------------------------
INSERT INTO "public"."biz_type" VALUES ('b4b6d877c52d4cd8b568c5d5f95b42c4', '', '测试', '测试相关', 1, '', '2019-02-10 13:35:11+08', '2019-02-10 13:35:11+08', 't');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."dict";
CREATE TABLE "public"."dict" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_type" varchar(32) COLLATE "pg_catalog"."default",
  "dict_key" varchar(32) COLLATE "pg_catalog"."default",
  "dict_value" varchar(128) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."dict"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."dict"."update_time" IS '更新时间';

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO "public"."dict" VALUES ('ee594c18be9f441b9669db46861e4d34', 'sys_stat', 'article_count', '2', '2019-02-05 00:00:00+08', '2019-03-24 23:00:00+08');
INSERT INTO "public"."dict" VALUES ('4f0e2047ef014aea8b34e8d1a5d240ae', 'sys_stat', 'tag_count', '4', '2019-02-05 00:00:00+08', '2019-03-24 23:00:00+08');
INSERT INTO "public"."dict" VALUES ('4ce39a5ac4174136b0c9ffc36d71d090', 'sys_stat', 'comment_count', '0', '2019-02-05 00:00:00+08', '2019-03-24 23:00:00+08');
INSERT INTO "public"."dict" VALUES ('479ce84dc0114816abaa790f25fb2794', 'sys_stat', 'type_count', '1', '2019-02-05 00:00:00+08', '2019-03-24 23:00:00+08');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS "public"."image";
CREATE TABLE "public"."image" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "url" varchar(128) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(6),
  "update_time" timestamptz(6)
)
;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO "public"."image" VALUES ('02c56760fb5f486aa83f0c5887d1c158', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/article/20190211123259002.jpg', '2019-02-11 12:32:59.616+08', '2019-02-11 12:32:59.616+08');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS "public"."resource";
CREATE TABLE "public"."resource" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_resources_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(50) COLLATE "pg_catalog"."default",
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "permission" varchar(100) COLLATE "pg_catalog"."default",
  "parent_id" varchar(64) COLLATE "pg_catalog"."default" DEFAULT 0,
  "sort" int4,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO "public"."resource" VALUES ('6f44d7eef72742f6b1561d4ffdb249c5', '上传文件到MD文档', 'button', '/admin/api/upload2TencentCosForMd', 'api:upload2TencentCosForMd', '58f10b91b41548a3a292106fe55641f4', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('1aeaebdbf3f54c179c9100002ccdab48', '上传文件', 'button', '/admin/api/upload2TencentCos', 'api:upload2TencentCos', '58f10b91b41548a3a292106fe55641f4', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('7e7b577bc6fd4bfe8f91563be2eab2ea', '查询素材库', 'button', '/admin/api/material', 'api:material', '58f10b91b41548a3a292106fe55641f4', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('7715f8e752174efe9024f18046ab4ffb', '查询图片', 'button', '/admin/api/queryImage', 'api:queryImage', '58f10b91b41548a3a292106fe55641f4', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('940969cdb9cc4aaf9ebaff3f64c78332', '文章历史记录查询', 'button', '/admin/bizArticleLook/list', 'bizArticleLook:list', '481c3955ffee4583ae558e1f1553460f', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('4f39ed7d7a254c358e7632cdd08f1373', '查看所有模块', 'button', '/admin/common/allModules', 'common:allModules', '18565b789b0b4612b0116d12b6f6ce1c', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('602b83975b9d4ea990370ae50ef89d2d', '新增公告', 'button', '/admin/notice/add', 'notice:add', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('046e86e84d60493f9393c493bec6ba59', '查看单个公告', 'button', '/admin/notice/get/{id}', 'notice:get', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('de80d7501fa7486bae1c49a8c21740ea', '修改公告', 'button', '/admin/notice/update', 'notice:update', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('44c7856f07904d3f86eb6b8fbc17558c', '单个删除公告', 'button', '/admin/notice/delete', 'notice:delete', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('b4c0ff0db9424f8f8e60befe97b3e31b', '查询公告', 'button', '/admin/notice/query', 'notice:query', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('349e23ed1bf1480b8f5065e331b920b6', '发布公告', 'button', '/admin/notice/publish/{id}', 'notice:publish', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('5b9c1792dc374f878730e718ec4a4da6', '撤回公告', 'button', '/admin/notice/reCall/{id}', 'notice:reCall', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('df6462c7942047f0a0d9f51de48fbf76', '批量删除公告', 'button', '/admin/notice/batchDelete', 'notice:batchDelete', '366ff3c64df649acb9ef0c784e4e020d', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('b7e49754a78044959fd149acfd360cf3', '新增资源', 'button', '/admin/resource/add', 'resource:add', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('a645057a5fe94be1a645c9535884109c', '查看单个资源', 'button', '/admin/resource/get/{id}', 'resource:get', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('92d2ce8a66324c52a07fe5d35e08eb18', '修改资源', 'button', '/admin/resource/update', 'resource:update', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('24d77a8e52664d79a456fab8d11ca42d', '单个删除资源', 'button', '/admin/resource/delete', 'resource:delete', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('478baebc65734d9b815fa139d0f3ac51', '查询资源', 'button', '/admin/resource/query', 'resource:query', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('bf379f982f6e4625906cd6a4b392f617', '修改资源', 'button', '/admin/resource/queryResourceTree', 'resource:queryResourceTree', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('32c12a42886a44fd8d8bb39e5e13dd0c', '批量删除资源', 'button', '/admin/resource/batchDelete', 'resource:batchDelete', 'b91cee970a0045b3a8742adf6dc55971', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('414968e6a1eb4156b6d59798c113c588', '删除文章', 'button', '/admin/article/remove', 'article:remove', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('1e332d53010649f48760024ffbe0ee10', '查看文章', 'button', '/admin/article/get/{id}', 'article:get', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('54fb2828ab314e39bdf31d1b4eff606d', '修改文章', 'button', '/admin/article/update/{type}', 'article:update', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('33cc9716a9ba45899d0b0fddb2a59cc5', '查询文章', 'button', '/admin/article/list', 'article:list', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('e8a05d700a2b484287fbeeab1a2f7c4e', '路由到发布文章页面', 'button', '/admin/article/publish', 'article:publish', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('2657d7eedd5c416e98d94f2ec8bb6818', '路由到修改文章页面', 'button', '/admin/article/update/{id}', 'article:update', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('717509808c6a4896899219bd119a63b3', '新增文章', 'button', '/admin/article/save', 'article:save', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('f7ff0856eb6842798679e811aea2624e', '路由到发布MD文档文章页面', 'button', '/admin/article/publishMd', 'article:publishMd', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('437fb85ea4b641c08d0e90940ee45c7d', '推送到百度', 'button', '/admin/article/pushToBaidu/{type}', 'article:pushToBaidu', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('b8ae01393e314bc19e1155c177d6c3a9', '发布文章', 'button', '/admin/article/batchPublish', 'article:batchPublish', '1bda8d48b3a3479cbd0dca46cdbec821', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('b0c73500514e47a78afe0c363c6d75fe', '删除批量', 'button', '/admin/comment/remove', 'comment:remove', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('fedf0ee4dac042bb82e67cd830a14d31', '查看评论', 'button', '/admin/comment/get/{id}', 'comment:get', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('790a3b89ec864a5dbbc7f37f3f97170c', '查询评论', 'button', '/admin/comment/list', 'comment:list', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('93e2d4220d4546369f7051038b0eb08b', '修改评论', 'button', '/admin/comment/audit', 'comment:audit', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('fc6983b1560c4f15bbbd64f2ad824dd8', '回复评论', 'button', '/admin/comment/reply', 'comment:reply', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('211672546ee34d909a7e70695615295f', '编辑评论', 'button', '/admin/comment/edit', 'comment:edit', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('093737c1cdd2419a864b39283418becf', '查看未处理的评论', 'button', '/admin/comment/listVerifying', 'comment:listVerifying', 'd3e83087f01546be83d84961fd231c52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('1bda8d48b3a3479cbd0dca46cdbec821', '文章管理', 'menu', '/admin/article', 'article', '3520849d3c464f91998c97184cce325c', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:55:03+08');
INSERT INTO "public"."resource" VALUES ('366ff3c64df649acb9ef0c784e4e020d', '公告管理', 'menu', '/admin/notice', 'notice', '0becba68f81743aa9ed118d8aaee37f7', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:55:41+08');
INSERT INTO "public"."resource" VALUES ('58f10b91b41548a3a292106fe55641f4', 'API接口', 'menu', '/admin/api', 'api', 'f0e8606857004ce6b3abef0368bb927e', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:56:21+08');
INSERT INTO "public"."resource" VALUES ('d3e83087f01546be83d84961fd231c52', '评论管理', 'menu', '/admin/comment', 'comment', '3520849d3c464f91998c97184cce325c', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:56:42+08');
INSERT INTO "public"."resource" VALUES ('bf2972477625468aae12190c7f045e52', '系统配置', 'menu', '/admin/config', 'config', '0becba68f81743aa9ed118d8aaee37f7', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:58:02+08');
INSERT INTO "public"."resource" VALUES ('8a473a515f284314a4fd6d00a163a384', '查看系统配置', 'button', '/admin/config/get', 'config:get', 'bf2972477625468aae12190c7f045e52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('d846202a3da045b589f422c9aa49ca71', '修改系统配置', 'button', '/admin/config/edit', 'config:edit', 'bf2972477625468aae12190c7f045e52', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('9df173e2c1ed4d1295a13ab5eb0e8b05', '新增友情链接', 'button', '/admin/link/add', 'link:add', '2b7746d70d454ec0a4a6965a08c8c389', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('25f0baf93ecd4f52936abda0c4a9c40a', '删除友情链接', 'button', '/admin/link/remove', 'link:remove', '2b7746d70d454ec0a4a6965a08c8c389', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('f46262a11a2d46d3a5dae109d0a6a0db', '查看单个友情链接', 'button', '/admin/link/get/{id}', 'link:get', '2b7746d70d454ec0a4a6965a08c8c389', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('375d540dfb964a09986df0862df7c615', '查看友情链接', 'button', '/admin/link/list', 'link:list', '2b7746d70d454ec0a4a6965a08c8c389', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('91c1f1e6c445465cbb2c8713028a0d6c', '编辑友情链接', 'button', '/admin/link/edit', 'link:edit', '2b7746d70d454ec0a4a6965a08c8c389', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('a36d266c902c4f458bc249be1278fb2d', '新增模板', 'button', '/admin/template/add', 'template:add', '1a91d6e8fd8f482e9187ecf532e8a887', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('e3a7a81526e1468ab3e180ef368ab24b', '删除模板', 'button', '/admin/template/remove', 'template:remove', '1a91d6e8fd8f482e9187ecf532e8a887', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('83a1ea9528a54752ae5c1b08a4c15923', '查看单个模板', 'button', '/admin/template/get/{id}', 'template:get', '1a91d6e8fd8f482e9187ecf532e8a887', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('606f69f2eaa1457b9b2379d661e9d357', '查询模板', 'button', '/admin/template/list', 'template:list', '1a91d6e8fd8f482e9187ecf532e8a887', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('0cc6a3bda30740c18ac4d8bc123af430', '编辑模板', 'button', '/admin/template/edit', 'template:edit', '1a91d6e8fd8f482e9187ecf532e8a887', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('2ae32ec8201f4d17b209b18af9f711fa', '新增类别', 'button', '/admin/type/add', 'type:add', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('baa83fc381cd4f0ea5ce46d5692d2ec4', '删除类别', 'button', '/admin/type/remove', 'type:remove', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('0e55bea6104141d6a9dfdb97bdc83bd3', '查看单个类别', 'button', '/admin/type/get/{id}', 'type:get', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('cffc9b715cc74a68a6450606b6fb1c3c', '查询类别', 'button', '/admin/type/list', 'type:list', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('a0640caae76d46389e84b73ac34acb7d', '查看所有类别', 'button', '/admin/type/listAll', 'type:listAll', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('4053a613bf2e4ffda36c9411d2b9d8a2', '编辑类别', 'button', '/admin/type/edit', 'type:edit', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('d3c3add42163467da9035d881f7d2807', '查看父类别', 'button', '/admin/type/listParent', 'type:listParent', '29bdc7aaaf4e4e0a81051661236dcf41', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('c337b324e68c49e8a7579c4c9bd84b8f', '新增角色', 'button', '/admin/role/add', 'role:add', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('426ba1b010f848b5b5245d0b3d49ace4', '批量删除角色', 'button', '/admin/role/batchDelete', 'role:batchDelete', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('d5691fb0ddcb480d96d152aa45a0d561', '查看单个角色', 'button', '/admin/role/get/{id}', 'role:get', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('482c780958d242eab6ceb74436532cc7', '删除单个角色', 'button', '/admin/role/delete', 'role:delete', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('d185b96c749040b8ad79de61ffdcf492', '查看所有角色', 'button', '/admin/role/query', 'role:query', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('a5c97ca92e594934a157c400bf4ea80b', '分配角色资源', 'button', '/admin/role/allotResource', 'role:allotResource', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('dbe0ca6408494b3cacf303f8864c00ec', '更新角色', 'button', '/admin/role/update', 'role:update', '9605129342eb41419c9292b1b5165560', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('8cd5bb12b3c14562b1b453f88e9d3a8d', '新增标签', 'button', '/admin/tag/add', 'tag:add', 'c591677afc244baeaada8d7376913734', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('b645f90eccdc46c99fa62e06079e634a', '查看单个标签', 'button', '/admin/tag/get/{id}', 'tag:get', 'c591677afc244baeaada8d7376913734', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('4277cdedcd3841bfbb708a20c6d91577', '删除单个标签', 'button', '/admin/tag/delete', 'tag:delete', 'c591677afc244baeaada8d7376913734', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('8e85b61a8ec8478babcedb2cc1a53cd0', '查询标签列表', 'button', '/admin/tag/query', 'tag:query', 'c591677afc244baeaada8d7376913734', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('db5c8ff9174e4459afc1a37115b0d1c9', '更新标签', 'button', '/admin/tag/update', 'tag:update', 'c591677afc244baeaada8d7376913734', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('1aafb56bae944b05a0945d087a656bf6', '批量删除标签', 'button', '/admin/tag/batchDelete', 'tag:batchDelete', 'c591677afc244baeaada8d7376913734', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('bfc938adc7cc45468892a088f314773e', '新增用户', 'button', '/admin/user/add', 'user:add', 'f546aaf6c075454b806658b4d88f39d3', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('c778323bfdcb43d0b437a2fb3f5a1646', '查看单个用户信息', 'button', '/admin/user/get/{id}', 'user:get', 'f546aaf6c075454b806658b4d88f39d3', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('c6a048411e6840f4b6c98f67484dd415', '修改用户', 'button', '/admin/user/update', 'user:update', 'f546aaf6c075454b806658b4d88f39d3', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('774c25a030894cc98c1a75539e703367', '单个删除用户', 'button', '/admin/user/delete', 'user:delete', 'f546aaf6c075454b806658b4d88f39d3', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('7ce48c588c7947f8bc502ae0863ed38c', '查询用户列表.', 'button', '/admin/user/query', 'user:query', 'f546aaf6c075454b806658b4d88f39d3', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('72eb6c80d80b467394710a5515bb95f3', '批量删除用户', 'button', '/admin/user/batchDelete', 'user:batchDelete', 'f546aaf6c075454b806658b4d88f39d3', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:47:06+08');
INSERT INTO "public"."resource" VALUES ('b91cee970a0045b3a8742adf6dc55971', '资源管理', 'menu', '/admin/resource', 'resource', '039a10b90d934c0789bc202271ae3433', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:53:35+08');
INSERT INTO "public"."resource" VALUES ('2b7746d70d454ec0a4a6965a08c8c389', '友情链接管理', 'menu', '/admin/link', 'link', '0becba68f81743aa9ed118d8aaee37f7', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:56:54+08');
INSERT INTO "public"."resource" VALUES ('29bdc7aaaf4e4e0a81051661236dcf41', '类型管理', 'menu', '/admin/type', 'type', '3520849d3c464f91998c97184cce325c', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:57:08+08');
INSERT INTO "public"."resource" VALUES ('9605129342eb41419c9292b1b5165560', '角色管理', 'menu', '/admin/role', 'role', '039a10b90d934c0789bc202271ae3433', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:57:32+08');
INSERT INTO "public"."resource" VALUES ('c591677afc244baeaada8d7376913734', '标签管理', 'menu', '/admin/tag', 'tag', '3520849d3c464f91998c97184cce325c', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:57:45+08');
INSERT INTO "public"."resource" VALUES ('3520849d3c464f91998c97184cce325c', '文章管理', 'menu', NULL, NULL, '0', 1, NULL, '2019-03-24 22:51:02+08', '2019-03-24 22:58:46+08');
INSERT INTO "public"."resource" VALUES ('0becba68f81743aa9ed118d8aaee37f7', '网站管理', 'menu', NULL, NULL, '0', 2, NULL, '2019-03-24 22:52:35+08', '2019-03-24 22:58:57+08');
INSERT INTO "public"."resource" VALUES ('039a10b90d934c0789bc202271ae3433', '权限管理', 'menu', NULL, NULL, '0', 3, NULL, '2019-03-24 22:52:27+08', '2019-03-24 22:59:05+08');
INSERT INTO "public"."resource" VALUES ('2893d4adf41c4ca4b6bd7e991fad6652', '网站数据', 'menu', NULL, NULL, '0', 4, NULL, '2019-03-24 22:52:45+08', '2019-03-24 22:59:09+08');
INSERT INTO "public"."resource" VALUES ('481c3955ffee4583ae558e1f1553460f', '文章查看记录', 'menu', '/admin/bizArticleLook', 'bizArticleLook', '2893d4adf41c4ca4b6bd7e991fad6652', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:55:33+08');
INSERT INTO "public"."resource" VALUES ('1a91d6e8fd8f482e9187ecf532e8a887', '模板管理', 'menu', '/admin/template', 'template', '0becba68f81743aa9ed118d8aaee37f7', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:57:17+08');
INSERT INTO "public"."resource" VALUES ('18565b789b0b4612b0116d12b6f6ce1c', '公共模块', 'menu', '/admin/common', 'common', 'f0e8606857004ce6b3abef0368bb927e', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:58:15+08');
INSERT INTO "public"."resource" VALUES ('f0e8606857004ce6b3abef0368bb927e', '待分类', 'menu', NULL, NULL, '0', 5, NULL, '2019-03-24 22:55:23+08', '2019-03-24 22:59:13+08');
INSERT INTO "public"."resource" VALUES ('f546aaf6c075454b806658b4d88f39d3', '用户管理', 'menu', '/admin/user', 'user', '039a10b90d934c0789bc202271ae3433', NULL, NULL, '2019-03-24 22:47:06+08', '2019-03-24 22:56:10+08');

-- ----------------------------
-- Table structure for resource_copy1
-- ----------------------------
DROP TABLE IF EXISTS "public"."resource_copy1";
CREATE TABLE "public"."resource_copy1" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_resources_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(50) COLLATE "pg_catalog"."default",
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "permission" varchar(100) COLLATE "pg_catalog"."default",
  "parent_id" varchar(64) COLLATE "pg_catalog"."default" DEFAULT 0,
  "sort" int4,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "available" bool,
  "module" varchar(64) COLLATE "pg_catalog"."default",
  "operation" varchar(64) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of resource_copy1
-- ----------------------------
INSERT INTO "public"."resource_copy1" VALUES ('7761500b31c34188b43651975881ad11', '标签管理', 'menu', '/admin/tag', 'tag', '20', NULL, NULL, '2019-03-21 22:33:58+08', '2019-03-21 22:33:58+08', 't', 'tag', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('76d22c9557d54351a751339e0e29196a', '新增标签', 'button', '/admin/tag/add', 'tag:add', '7761500b31c34188b43651975881ad11', NULL, NULL, '2019-03-21 22:34:44+08', '2019-03-21 22:34:44+08', 't', 'tag', 'add');
INSERT INTO "public"."resource_copy1" VALUES ('3c2604108c954f49a60fee127bbaf44b', '批量删除标签', 'button', '/admin/tag/batchDelete', 'tag:batchDelete', '7761500b31c34188b43651975881ad11', NULL, NULL, '2019-03-21 22:35:09+08', '2019-03-21 22:35:09+08', 't', 'tag', 'batchDelete');
INSERT INTO "public"."resource_copy1" VALUES ('29fbcddeebb64354bfff500a85927864', '修改标签', 'button', '/admin/tag/update', 'tag:update', '7761500b31c34188b43651975881ad11', NULL, NULL, '2019-03-21 22:35:24+08', '2019-03-21 22:35:24+08', 't', 'tag', 'update');
INSERT INTO "public"."resource_copy1" VALUES ('e04108abd5fa48c0a6e3405badca92b7', '查询标签', 'button', '/admin/tag/query', 'tag:query', '7761500b31c34188b43651975881ad11', NULL, NULL, '2019-03-21 22:35:36+08', '2019-03-21 22:35:36+08', 't', 'tag', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('6e8ab65c6c734e56a73e9192598280cd', '删除标签', 'button', '/admin/tag/delete', 'tag:delete', '7761500b31c34188b43651975881ad11', NULL, NULL, '2019-03-21 22:35:53+08', '2019-03-21 22:35:53+08', 't', 'tag', 'delete');
INSERT INTO "public"."resource_copy1" VALUES ('7b3e762842f549c68b7b183043be494e', '新增用户', 'button', '/admin/user/add', 'user:add', '71e303af504c4fb5b06e526995576104', NULL, NULL, '2019-03-18 23:04:13+08', '2019-03-18 23:04:13+08', 't', 'user', 'add');
INSERT INTO "public"."resource_copy1" VALUES ('26e039b95db84c2fa675527d70fecce3', '修改用户', 'button', '/admin/user/update', 'user:update', '71e303af504c4fb5b06e526995576104', NULL, NULL, '2019-03-18 23:14:37+08', '2019-03-18 23:14:37+08', 't', 'user', 'update');
INSERT INTO "public"."resource_copy1" VALUES ('b363c885086f47d99d770f85b499ad2c', '批量删除用户', 'button', '/admin/user/batchDelete', 'user:batchDelete', '71e303af504c4fb5b06e526995576104', NULL, NULL, '2019-03-18 23:16:04+08', '2019-03-18 23:16:04+08', 't', 'user', 'batchDelete');
INSERT INTO "public"."resource_copy1" VALUES ('2754a7b0c2d14d0b87d05ff110029b98', '查询用户', 'button', '/admin/user/query', 'user:query', '71e303af504c4fb5b06e526995576104', NULL, NULL, '2019-03-18 23:16:48+08', '2019-03-18 23:16:48+08', 't', 'user', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('1584db12eb914223a7f7ac0fba74f336', '删除角色', 'button', '/admin/role/delete', 'role:delete', '4277f3a6d4a84d6cb60c22d8df056b1b', NULL, NULL, '2019-03-19 23:04:23+08', '2019-03-19 23:04:23+08', 't', 'role', 'delete');
INSERT INTO "public"."resource_copy1" VALUES ('29a0964463b54e6598939bc62ca8d9c4', '修改角色', 'button', '/admin/role/update', 'role:update', '4277f3a6d4a84d6cb60c22d8df056b1b', NULL, NULL, '2019-03-19 23:04:39+08', '2019-03-19 23:04:39+08', 't', 'role', 'update');
INSERT INTO "public"."resource_copy1" VALUES ('b879750354c44addb1e8337411670b90', '批量删除角色', 'button', '/admin/role/batchDelete', 'role:batchDelete', '4277f3a6d4a84d6cb60c22d8df056b1b', NULL, NULL, '2019-03-19 23:04:52+08', '2019-03-19 23:04:52+08', 't', 'role', 'batchDelete');
INSERT INTO "public"."resource_copy1" VALUES ('9c2b763dadd44071ba23745b9f766a92', '新增角色', 'button', '/admin/role/add', 'role:add', '4277f3a6d4a84d6cb60c22d8df056b1b', NULL, NULL, '2019-03-19 23:05:08+08', '2019-03-19 23:05:08+08', 't', 'role', 'add');
INSERT INTO "public"."resource_copy1" VALUES ('3155017caf1c45c5b450336d96d89849', '公告管理', 'menu', '/admin/notice', 'notice', '40', NULL, NULL, '2019-03-20 22:55:57+08', '2019-03-20 23:00:59+08', 't', 'notice', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('666', '网站数据', 'menu', '', '', '0', 3, 'fa fa-cogs', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('e2cd74790440466b985b5f91b7163c88', '查看浏览记录', 'menu', '/admin/article/bizArticleLook', 'bizArticleLook', '666', NULL, NULL, '2019-03-10 19:23:03+08', '2019-03-10 19:35:02+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('594fc97aeb764d11ac6e2da0fd5719ae', '页面管理', 'menu', '/admin/page', 'page', '40', NULL, NULL, '2019-03-21 22:45:46+08', '2019-03-21 22:45:46+08', 't', 'page', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('8', '权限管理', 'menu', '', '', '0', 3, 'fa fa-cogs', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('20', '文章管理', 'menu', '', '', '0', 1, 'fa fa-list', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('21', '文章列表', 'menu', '/admin/articles', 'articles', '20', 1, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('22', '发表文章', 'button', NULL, 'article:publish', '21', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('23', '批量删除文章', 'button', NULL, 'article:batchDelete', '21', 3, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('24', '批量推送文章', 'button', NULL, 'article:batchPush', '21', 4, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('25', '推送文章', 'button', NULL, 'article:push', '21', 5, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('26', '置顶文章', 'button', NULL, 'article:top', '21', 6, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('27', '推荐文章', 'button', NULL, 'article:recommend', '21', 7, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('28', '编辑文章', 'button', NULL, 'article:edit,article:get', '21', 8, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('29', '删除文章', 'button', NULL, 'article:delete', '21', 9, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('30', '分类列表', 'menu', '/admin/article/types', 'types', '20', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('31', '添加分类', 'button', NULL, 'type:add', '30', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('32', '批量删除分类', 'button', NULL, 'type:batchDelete', '30', 3, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('33', '编辑分类', 'button', NULL, 'type:edit,type:get', '30', 4, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('34', '删除分类', 'button', NULL, 'type:delete', '30', 5, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('40', '网站管理', 'menu', '', '', '0', 2, 'fa fa-globe', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('41', '友情链接', 'menu', '/admin/links', 'links', '40', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('42', '添加友情链接', 'button', NULL, 'link:add', '41', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('43', '批量删除友情链接', 'button', NULL, 'link:batchDelete', '41', 3, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('44', '编辑友情链接', 'button', NULL, 'link:edit,link:get', '41', 4, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('45', '删除友情链接', 'button', NULL, 'link:delete', '41', 5, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('46', '评论管理', 'menu', '/admin/comments', 'comments', '40', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('47', '批量删除评论', 'button', NULL, 'comment:batchDelete', '46', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('48', '回复评论', 'button', NULL, 'comment:reply', '46', 3, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('49', '审核评论', 'button', NULL, 'comment:audit', '46', 4, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('50', '删除评论', 'button', NULL, 'comment:delete', '46', 5, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('51', '模板管理', 'menu', '/admin/templates', 'templates', '40', 3, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('52', '添加模板', 'button', NULL, 'template:add', '51', 2, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('53', '批量删除模板', 'button', NULL, 'template:batchDelete', '51', 3, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('54', '编辑模板', 'button', NULL, 'template:edit,template:get', '51', 4, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('55', '删除模板', 'button', NULL, 'template:delete', '51', 5, NULL, '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', NULL, NULL);
INSERT INTO "public"."resource_copy1" VALUES ('553426a278134d9e93e2977786228283', '删除用户', 'button', '/admin/user/delete', 'user:delete', '71e303af504c4fb5b06e526995576104', NULL, NULL, '2019-03-18 23:12:39+08', '2019-03-18 23:12:39+08', 't', 'user', 'delete');
INSERT INTO "public"."resource_copy1" VALUES ('57149072adc24cf19a1bea7b7e6e5fbf', '查询角色', 'button', '/admin/role/query', 'role:query', '4277f3a6d4a84d6cb60c22d8df056b1b', NULL, NULL, '2019-03-19 23:15:44+08', '2019-03-19 23:15:44+08', 't', 'role', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('308fc321d13d41f1818368fab2528ea4', '发布公告', 'button', '/admin/notice/publish', 'notice:publish', '3155017caf1c45c5b450336d96d89849', NULL, NULL, '2019-03-20 23:02:07+08', '2019-03-20 23:02:07+08', 't', 'notice', 'publish');
INSERT INTO "public"."resource_copy1" VALUES ('d2a81247f3d84da7bc7e9269850f9120', '撤回公告', 'button', '/admin/notice/reCall', 'notice:reCall', '3155017caf1c45c5b450336d96d89849', NULL, NULL, '2019-03-20 23:02:24+08', '2019-03-20 23:02:24+08', 't', 'notice', 'reCall');
INSERT INTO "public"."resource_copy1" VALUES ('567e30eb001346a0985184ef4050270f', '删除公告', 'button', '/admin/notice/delete', 'notice:delete', '3155017caf1c45c5b450336d96d89849', NULL, NULL, '2019-03-20 23:02:43+08', '2019-03-20 23:02:43+08', 't', 'notice', 'delete');
INSERT INTO "public"."resource_copy1" VALUES ('1f8f039707d64ddea1f7d664abf0134a', '批量删除公告', 'button', '/admin/notice/batchDelete', 'notice:batchDelete', '3155017caf1c45c5b450336d96d89849', NULL, NULL, '2019-03-20 23:02:56+08', '2019-03-20 23:02:56+08', 't', 'notice', 'batchDelete');
INSERT INTO "public"."resource_copy1" VALUES ('51856e38e5374d27baa6867a5fe1347b', '修改公告', 'button', '/admin/notice/update', 'notice:update', '3155017caf1c45c5b450336d96d89849', NULL, NULL, '2019-03-20 23:03:13+08', '2019-03-20 23:03:13+08', 't', 'notice', 'update');
INSERT INTO "public"."resource_copy1" VALUES ('f0b1c972a76b4ef6a7c3314567c3cfc4', '新增公告', 'button', '/admin/notice/add', 'notice:add', '3155017caf1c45c5b450336d96d89849', NULL, NULL, '2019-03-20 23:03:26+08', '2019-03-20 23:03:26+08', 't', 'notice', 'add');
INSERT INTO "public"."resource_copy1" VALUES ('4277f3a6d4a84d6cb60c22d8df056b1b', '角色管理', 'menu', '/admin/role', 'role', '8', 2, NULL, '2019-03-19 23:01:53+08', '2019-03-20 23:18:53+08', 't', 'role', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('71e303af504c4fb5b06e526995576104', '用户管理', 'menu', '/admin/user', 'user', '8', 1, NULL, '2019-03-18 22:42:47+08', '2019-03-20 23:19:21+08', 't', 'user', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('69c3949f4c374627b62ddb449dd426ec', '资源管理', 'menu', '/admin/resource', 'resource', '8', NULL, NULL, '2019-03-20 23:36:47+08', '2019-03-20 23:36:47+08', 't', 'resource', 'query');
INSERT INTO "public"."resource_copy1" VALUES ('9864e99b67f34a27bd539cd83766215c', '分配资源角色', 'button', '/admin/role/allotResource', 'role:allotResource', '4277f3a6d4a84d6cb60c22d8df056b1b', NULL, NULL, '2019-03-20 23:39:05+08', '2019-03-20 23:39:05+08', 't', 'role', 'allotResource');
INSERT INTO "public"."resource_copy1" VALUES ('1abfe53afdf049619721841498123f59', '批量删除资源', 'button', '/admin/resource/batchDelete', 'resource:batchDelete', '69c3949f4c374627b62ddb449dd426ec', NULL, NULL, '2019-03-20 23:38:19+08', '2019-03-20 23:47:19+08', 't', 'resource', 'batchDelete');
INSERT INTO "public"."resource_copy1" VALUES ('8640553f1e0f41cbb5b3a20c51d6a8e4', '修改资源', 'button', '/admin/resource/update', 'resource:update', '69c3949f4c374627b62ddb449dd426ec', NULL, NULL, '2019-03-20 23:38:08+08', '2019-03-20 23:47:25+08', 't', 'resource', 'update');
INSERT INTO "public"."resource_copy1" VALUES ('fd3afea3b98944c49474f9ceb4b0d9c0', '新增资源', 'button', '/admin/resource/add', 'resource:add', '69c3949f4c374627b62ddb449dd426ec', NULL, NULL, '2019-03-20 23:37:50+08', '2019-03-20 23:47:30+08', 't', 'resource', 'add');
INSERT INTO "public"."resource_copy1" VALUES ('c73f103636ee44d891a77c99547001f4', '删除资源', 'button', '/admin/resource/delete', 'resource:delete', '69c3949f4c374627b62ddb449dd426ec', NULL, NULL, '2019-03-20 23:37:32+08', '2019-03-20 23:47:35+08', 't', 'resource', 'delete');

-- ----------------------------
-- Table structure for search_count
-- ----------------------------
DROP TABLE IF EXISTS "public"."search_count";
CREATE TABLE "public"."search_count" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('search_count_id_seq'::regclass),
  "key_word" varchar(128) COLLATE "pg_catalog"."default",
  "count" int8,
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."search_count"."count" IS '搜索次数';

-- ----------------------------
-- Table structure for search_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."search_history";
CREATE TABLE "public"."search_history" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('search_history_id_seq'::regclass),
  "key_word" varchar(128) COLLATE "pg_catalog"."default",
  "user_id" varchar(64) COLLATE "pg_catalog"."default",
  "user_ip" varchar(50) COLLATE "pg_catalog"."default",
  "search_time" timestamptz(0),
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."search_history"."user_id" IS '已登录用户ID';

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_config_id_seq'::regclass),
  "home_desc" varchar(255) COLLATE "pg_catalog"."default",
  "home_keywords" varchar(255) COLLATE "pg_catalog"."default",
  "domain" varchar(255) COLLATE "pg_catalog"."default",
  "cms_url" varchar(255) COLLATE "pg_catalog"."default",
  "site_url" varchar(255) COLLATE "pg_catalog"."default",
  "site_name" varchar(255) COLLATE "pg_catalog"."default",
  "site_desc" varchar(255) COLLATE "pg_catalog"."default",
  "site_favicon" varchar(255) COLLATE "pg_catalog"."default",
  "static_web_site" varchar(255) COLLATE "pg_catalog"."default",
  "author_name" varchar(100) COLLATE "pg_catalog"."default",
  "author_email" varchar(100) COLLATE "pg_catalog"."default",
  "wx_code" varchar(255) COLLATE "pg_catalog"."default",
  "qq" varchar(255) COLLATE "pg_catalog"."default",
  "weibo" varchar(255) COLLATE "pg_catalog"."default",
  "github" varchar(255) COLLATE "pg_catalog"."default",
  "maintenance_data" date,
  "comment" varchar(16) COLLATE "pg_catalog"."default" DEFAULT 1,
  "qiuniu_base_path" varchar(255) COLLATE "pg_catalog"."default",
  "qiniu_access_key" varchar(100) COLLATE "pg_catalog"."default",
  "qiniu_secret_key" varchar(100) COLLATE "pg_catalog"."default",
  "qiniu_bucket_name" varchar(100) COLLATE "pg_catalog"."default",
  "baidu_push_token" varchar(100) COLLATE "pg_catalog"."default",
  "wx_praise_code" varchar(200) COLLATE "pg_catalog"."default",
  "zfb_praise_code" varchar(200) COLLATE "pg_catalog"."default",
  "baidu_api_ak" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "maintenance" bool
)
;
COMMENT ON COLUMN "public"."sys_config"."comment" IS '是否开启评论';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO "public"."sys_config" VALUES ('1', 'SITE4J，专注于Java技术分享。', 'SITE4J,Java技术资源站。', 'localhost', 'http://peterchenhdu.club:8089', 'https://localhost', 'SITE4J', '分享、传播Java技术', 'https://localhost/img/favicon.svg', 'https://localhost', '风一样的码农', '1052067939@qq.com', '#', '1052067939', '#', '#', '2018-11-11', '1', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/', 'AKIDNhxqcNgc7qX6YsvFE5oO3oSzVr36hnPq', 'XwE81syyqY6Xn5JPfpocR8dx65uZQ8i7', 'peterchenhdu-1257309286', 'BIhFDCipf0ZqwgGp', 'qrcode/wx_code.png', 'qrcode/zfb_code.png', '5f6c6a8fa13beda75a56933cb9be8c58', '2018-09-02 00:00:00+08', '2018-09-08 00:00:00+08', NULL);

-- ----------------------------
-- Table structure for sys_link
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_link";
CREATE TABLE "public"."sys_link" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_link_id_seq'::regclass),
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "description" varchar(300) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "qq" varchar(13) COLLATE "pg_catalog"."default",
  "favicon" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(100) COLLATE "pg_catalog"."default",
  "source" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "status" bool,
  "home_page_display" bool
)
;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
INSERT INTO "public"."sys_link" VALUES ('a7d3ac74bdd7408aa0de7e118c4dec88', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'ADMIN', '2019-03-21 22:20:29+08', '2019-03-21 22:20:29+08', 't', 't');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_notice_id_seq'::regclass),
  "user_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(64) COLLATE "pg_catalog"."default",
  "title" varchar(200) COLLATE "pg_catalog"."default",
  "content" varchar(2000) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;
COMMENT ON COLUMN "public"."sys_notice"."user_id" IS '被通知的用户ID';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO "public"."sys_notice" VALUES ('b40fb97d5f234d8d8690a1c7f556969a', '1', 'RELEASE', '这是一个测试2', '这是一个测试这是一个测试这是一个测试', '2019-03-20 23:06:28+08', '2019-03-20 23:09:28+08');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_role_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "available" bool
)
;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES ('1', 'role:root', '超级管理员', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't');
INSERT INTO "public"."sys_role" VALUES ('2', 'role:admin', '管理员', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't');
INSERT INTO "public"."sys_role" VALUES ('3', 'role:comment', '评论审核管理员', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't');
INSERT INTO "public"."sys_role" VALUES ('4', 'role:user', '文章编写发布者', '2018-10-28 00:00:00+08', '2019-02-11 11:45:05+08', 't');
INSERT INTO "public"."sys_role" VALUES ('b5eaf07fa3a84d4c9c5889bb31316cac', '测试角色', '测试角色', '2019-03-15 23:14:50+08', '2019-03-15 23:17:06+08', 't');
INSERT INTO "public"."sys_role" VALUES ('003ab960d9be46c3a952b48d0273e860', 'AA', 'AA', '2019-03-15 23:29:21+08', '2019-03-15 23:29:21+08', 't');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_resources";
CREATE TABLE "public"."sys_role_resources" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_role_resources_id_seq'::regclass),
  "role_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "resources_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO "public"."sys_role_resources" VALUES ('1', '1', '1', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('2', '1', '2', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('3', '1', '3', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('4', '1', '4', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('5', '1', '5', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('6', '1', '6', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('7', '1', '7', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('8', '1', '8', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('9', '1', '9', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('10', '1', '10', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('11', '1', '11', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('12', '1', '12', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('13', '1', '13', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('14', '1', '14', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('15', '1', '15', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('16', '1', '16', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('17', '1', '17', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('18', '1', '18', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('19', '1', '19', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('20', '1', '20', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('21', '1', '21', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('22', '1', '22', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('23', '1', '23', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('24', '1', '24', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('25', '1', '25', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('26', '1', '26', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('27', '1', '27', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('28', '1', '28', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('29', '1', '29', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('30', '1', '30', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('31', '1', '31', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('32', '1', '32', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('33', '1', '33', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('34', '1', '34', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('35', '1', '35', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('36', '1', '36', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('37', '1', '37', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('38', '1', '38', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('39', '1', '39', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('40', '1', '40', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('41', '1', '41', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('42', '1', '42', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('43', '1', '43', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('44', '1', '44', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('45', '1', '45', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('46', '1', '46', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('47', '1', '47', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('48', '1', '48', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('49', '1', '49', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('50', '1', '50', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('51', '1', '51', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('52', '1', '52', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('53', '1', '57', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('54', '1', '53', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('55', '1', '58', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('56', '1', '54', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('57', '1', '59', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('58', '1', '55', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('59', '1', '60', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('60', '1', '56', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('61', '1', '61', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('62', '1', '62', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('63', '1', '63', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('64', '1', '64', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('65', '1', '65', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('66', '1', '66', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('67', '1', '67', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('68', '1', '68', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('93', '3', '40', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('94', '3', '46', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('95', '3', '48', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('96', '3', '49', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_role_resources" VALUES ('04c47618c25c4a09bb5e035768b23981', '2', '20', '2019-03-15 00:11:12+08', '2019-03-15 00:11:12+08');
INSERT INTO "public"."sys_role_resources" VALUES ('e7c6f0d84ff54982b195c08376104598', '2', '21', '2019-03-15 00:11:12+08', '2019-03-15 00:11:12+08');
INSERT INTO "public"."sys_role_resources" VALUES ('d9b3fcefe5cb4bd4989f194caa2a096b', '2', '23', '2019-03-15 00:11:12+08', '2019-03-15 00:11:12+08');
INSERT INTO "public"."sys_role_resources" VALUES ('53191541a5b5405089f7879f9e7a064d', '2', '25', '2019-03-15 00:11:12+08', '2019-03-15 00:11:12+08');
INSERT INTO "public"."sys_role_resources" VALUES ('14ee2d1427f843d4a8be806c240434ac', '2', '26', '2019-03-15 00:11:12+08', '2019-03-15 00:11:12+08');
INSERT INTO "public"."sys_role_resources" VALUES ('9d1d61d1dac244ba93a79400c6ad7c8e', '2', '27', '2019-03-15 00:11:12+08', '2019-03-15 00:11:12+08');
INSERT INTO "public"."sys_role_resources" VALUES ('eeb55aab270a4d109df9aaa2a0b6704b', '4', '20', '2019-03-15 23:12:09+08', '2019-03-15 23:12:09+08');
INSERT INTO "public"."sys_role_resources" VALUES ('a931b4c1838b404787d0cb4809ddc5a1', '4', '21', '2019-03-15 23:12:09+08', '2019-03-15 23:12:09+08');
INSERT INTO "public"."sys_role_resources" VALUES ('8f88c161dc86499c8033b7b17edea130', '4', '22', '2019-03-15 23:12:09+08', '2019-03-15 23:12:09+08');
INSERT INTO "public"."sys_role_resources" VALUES ('dd43fc09313241678dc57bdf0a36a2f6', '4', '23', '2019-03-15 23:12:09+08', '2019-03-15 23:12:09+08');
INSERT INTO "public"."sys_role_resources" VALUES ('937492389ce9438792f574e545af1e12', 'b5eaf07fa3a84d4c9c5889bb31316cac', '20', '2019-03-15 23:19:31+08', '2019-03-15 23:19:31+08');
INSERT INTO "public"."sys_role_resources" VALUES ('6fd214a1e62c43f4917bc565f102cb8a', 'b5eaf07fa3a84d4c9c5889bb31316cac', '21', '2019-03-15 23:19:31+08', '2019-03-15 23:19:31+08');
INSERT INTO "public"."sys_role_resources" VALUES ('2c814ea3ee5c485baccae67806847e29', 'b5eaf07fa3a84d4c9c5889bb31316cac', '22', '2019-03-15 23:19:31+08', '2019-03-15 23:19:31+08');
INSERT INTO "public"."sys_role_resources" VALUES ('245bdee6897f485cb2cd32dde8f5afac', 'b5eaf07fa3a84d4c9c5889bb31316cac', '30', '2019-03-15 23:19:31+08', '2019-03-15 23:19:31+08');
INSERT INTO "public"."sys_role_resources" VALUES ('52ed0062300e4d8c8943149994e6b0f6', 'b5eaf07fa3a84d4c9c5889bb31316cac', '31', '2019-03-15 23:19:31+08', '2019-03-15 23:19:31+08');

-- ----------------------------
-- Table structure for sys_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_template";
CREATE TABLE "public"."sys_template" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_template_id_seq'::regclass),
  "ref_key" varchar(100) COLLATE "pg_catalog"."default",
  "ref_value" text COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;

-- ----------------------------
-- Records of sys_template
-- ----------------------------
INSERT INTO "public"."sys_template" VALUES ('1', 'TM_SITEMAP_XML', '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
	<url>
		<loc>${config.siteUrl}</loc>
		<priority>1.0</priority>
		<lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
		<changefreq>daily</changefreq>
	</url>
	<url>
		<loc>${config.siteUrl}/guestbook</loc>
		<priority>0.6</priority>
		<lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
		<changefreq>daily</changefreq>
	</url>
	<url>
		<loc>${config.siteUrl}/updateLog</loc>
		<priority>0.6</priority>
		<lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
		<changefreq>daily</changefreq>
	</url>
	<url>
		<loc>${config.siteUrl}/recommended</loc>
		<priority>0.6</priority>
		<lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
		<changefreq>daily</changefreq>
	</url>
	<#list articleList as item>
		<url>
			<loc>${config.siteUrl}/article/${item.id}</loc>
			<priority>0.6</priority>
			<lastmod>${item.updateTime?string("yyyy-MM-dd")}</lastmod>
			<changefreq>daily</changefreq>
		</url>
	</#list>
	<#list articleTypeList as item>
	   <url>
			<loc>${config.siteUrl}/type/${item.id}</loc>
			<priority>0.6</priority>
			<lastmod>${item.updateTime?string("yyyy-MM-dd")}</lastmod>
			<changefreq>daily</changefreq>
		</url>
	</#list>
	
	<#list articleTagsList as item>
	   <url>
			<loc>${config.siteUrl}/tag/${item.id}</loc>
			<priority>0.6</priority>
			<lastmod>${item.updateTime?string("yyyy-MM-dd")}</lastmod>
			<changefreq>daily</changefreq>
		</url>
	</#list>
</urlset>', '2018-09-02 00:00:00+08', '2018-09-18 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('2', 'TM_SITEMAP_TXT', '${config.siteUrl}
${config.siteUrl}/guestbook
${config.siteUrl}/updateLog
${config.siteUrl}/recommended
<#list articleList as item>
${config.siteUrl}/article/${item.id}
</#list>
<#list articleTypeList as item>
${config.siteUrl}/type/${item.id}
</#list>
<#list articleTagsList as item>
${config.siteUrl}/tag/${item.id}
</#list>', '2018-09-02 00:00:00+08', '2018-09-18 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('3', 'TM_SITEMAP_HTML', '<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${config.siteName} 网站地图</title>
    <meta name="author" content="SiteMapX.com"/>
    <meta name="robots" content="index,follow"/>
    <style type="text/css">
        body {
            color: #000000;
            background: #ffffff;
            margin: 20px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
        }

        #myTable {
            list-style: none;
            margin: 10px 0px 10px 0px;
            padding: 0px;
            width: 100%;
            min-width: 804px;
        }

        #myTable li {
            list-style-type: none;
            width: 100%;
            min-width: 404px;
            height: 20px;
            line-height: 20px;
        }

        .pull-left{
            float: left!important;
        }
        .pull-right{
            float: right!important;
        }

        #myTable li .T1-h {
            font-weight: bold;
            min-width: 300px;
        }

        #myTable li .T2-h {
            width: 200px;
            font-weight: bold;
        }

        #myTable li .T3-h {
            width: 200px;
            font-weight: bold;
        }

        #myTable li .T4-h {
            width: 100px;
            font-weight: bold;
        }

        #myTable li .T1 {
            min-width: 300px;
        }

        #myTable li .T2 {
            width: 200px;
        }

        #myTable li .T3 {
            width: 200px;
        }

        #myTable li .T4 {
            width: 100px;
        }

        #footer {
            padding: 2px;
            margin: 0px;
            font-size: 8pt;
            color: gray;
            min-width: 900px;
        }

        #footer a {
            color: gray;
        }

        .myClear {
            clear: both;
        }

        #nav, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 95%; margin: auto; margin-top: 10px;}

    </style>
</head>
<body>
<h2 style="text-align: center; margin-top: 20px">${config.siteName?if_exists} 网站地图 </h2>
<div id="nav"><a href="${config.siteUrl?if_exists}"><strong>${config.siteName?if_exists}</strong></a> &raquo; <a href="${config.siteUrl?if_exists}/sitemap.html">站点地图</a></div>
<div id="content">
    <h3>最新文章</h3>
    <ul id="myTable">
        <li>
            <div class="T1-h pull-left">URL</div>
            <div class="T2-h pull-right">Last Change</div>
            <div class="T3-h pull-right">Change Frequency</div>
            <div class="T4-h pull-right">Priority</div>
        </li>
        <div class="myClear"></div>
        <li>
            <div class="T1 pull-left"><a href="${config.siteUrl}" title="${config.siteName}">${config.siteName} | 专注Java技术分享</a></div>
            <div class="T2 pull-right">${.now?string("yyyy-MM-dd")}</div>
            <div class="T3 pull-right">daily</div>
            <div class="T4 pull-right">1</div>
        </li>
        <div class="myClear"></div>
        <li>
            <div class="T1 pull-left"><a href="${config.siteUrl}/guestbook" title="${config.siteName}">留言板 | ${config.siteName}</a></div>
            <div class="T2 pull-right">${.now?string("yyyy-MM-dd")}</div>
            <div class="T3 pull-right">daily</div>
            <div class="T4 pull-right">0.6</div>
        </li>
        <div class="myClear"></div>
        <li>
            <div class="T1 pull-left"><a href="${config.siteUrl}/updateLog" title="${config.siteName}">网站更新记录 | ${config.siteName}</a></div>
            <div class="T2 pull-right">${.now?string("yyyy-MM-dd")}</div>
            <div class="T3 pull-right">daily</div>
            <div class="T4 pull-right">0.6</div>
        </li>
		<div class="myClear"></div>
        <li>
            <div class="T1 pull-left"><a href="${config.siteUrl}/recommended" title="${config.siteName}">站长推荐 | ${config.siteName}</a></div>
            <div class="T2 pull-right">${.now?string("yyyy-MM-dd")}</div>
            <div class="T3 pull-right">daily</div>
            <div class="T4 pull-right">0.6</div>
        </li>
        <div class="myClear"></div>
        <#list articleList as item>
            <li>
                <div class="T1 pull-left"><a href="${config.siteUrl}/article/${item.id}" title="${item.title}">${item.title} | ${config.siteName}</a></div>
                <div class="T2 pull-right">${item.updateTime?string("yyyy-MM-dd")}</div>
                <div class="T3 pull-right">daily</div>
                <div class="T4 pull-right">0.6</div>
            </li>
            <div class="myClear"></div>
        </#list>
    </ul>
</div>
<div id="content">
    <h3>分类目录</h3>
    <ul id="myTable">
        <#list articleTypeList as item>
            <li>
                <div class="T1 pull-left"><a href="${config.siteUrl}/type/${item.id}" title="${item.name}">${item.name} | ${config.siteName}</a></div>
                <div class="T2 pull-right">${item.updateTime?string("yyyy-MM-dd")}</div>
                <div class="T3 pull-right">daily</div>
                <div class="T4 pull-right">0.6</div>
            </li>
            <div class="myClear"></div>
        </#list>
    </ul>
</div>
<div id="content">
    <h3>标签目录</h3>
    <ul id="myTable">
        <#list articleTagsList as item>
            <li>
                <div class="T1 pull-left"><a href="${config.siteUrl}/tag/${item.id}" title="${item.name}">${item.name} | ${config.siteName}</a></div>
                <div class="T2 pull-right">${item.updateTime?string("yyyy-MM-dd")}</div>
                <div class="T3 pull-right">daily</div>
                <div class="T4 pull-right">0.6</div>
            </li>
            <div class="myClear"></div>
        </#list>
    </ul>
</div>
<div id="footer">
    该文件由<a href="${config.siteUrl}" title="${config.siteName}">${config.siteName}</a>网站自动生成。
</div>
</body>
</html>', '2018-09-02 00:00:00+08', '2018-09-18 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('4', 'TM_ROBOTS', 'Crawl-delay: 5
Sitemap: https://peterchenhdu.club/sitemap.txt
Sitemap: https://peterchenhdu.club/sitemap.xml
Sitemap: https://peterchenhdu.club/sitemap.html
', '2018-09-02 00:00:00+08', '2018-09-04 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('5', 'TM_LINKS', '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>友情链接操作通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,''Helvetica Neue'',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            友情链接操作通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>站长<a href="${link.url?if_exists}" target="_blank">${link.name?if_exists}</a>，您好!</p>
        <p>您于 ${link.createTime?string(''yyyy-MM-dd HH:mm:ss'')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>
        <p>
        <ul>
            <li>${link.name?if_exists}</li>
            <li>${link.url?if_exists}</li>
            <li>${link.description?if_exists}</li>
            <li>${link.email?if_exists}</li>
            <li>${link.qq?if_exists}</li>
            <li><img src="${link.favicon?if_exists}" width="100" alt="LOGO"></li>
        </ul>
        </p>
        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>
        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>
        <ul>
            <li>私自取消本站友情链接</li>
            <li>更换域名且未通知本站</li>
            <li>网站内容长期不更新</li>
            <li>友链上使用诸如nofollow之类的属性</li>
        </ul>
        <p>感谢您对 <a style="text-decoration:none;" href="${config.siteUrl?if_exists}" target="_blank">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style="text-decoration:none;" href="${config.siteUrl}/guestbook" target="_blank">留言</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('6', 'TM_COMMENT_AUDIT', '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评论审核结果通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,''Helvetica Neue'',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            评论审核结果通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>${comment.nickname?if_exists}，您好!</p>
        <p>
            您于 ${comment.createTime?string(''yyyy-MM-dd HH:mm:ss'')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class="il">评论</span>：
        </p>
        <div style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.content}</div>
        <#if comment.status == ''APPROVED''>
        <p>已通过管理员审核并显示。</p>
        <p>
            您可以点击 <a style="text-decoration:none;" href="${config.siteUrl}${comment.sourceUrl}" target="_blank">链接</a>查看回复的完整內容。
        </p>
        <#elseif comment.status == ''REJECT''>
        <p>审核失败！失败原因：</p>
        <p style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.remark}</p>
        <#elseif comment.status == ''DELETED''>
        <p>已被管理员删除！删除原因：</p>
        <p style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.remark}</p>
        <#else>
        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>
        </#if>
        <p>感谢您对 <a style="text-decoration:none;" href="${config.siteUrl}" target="_blank">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style="text-decoration:none;" href="${config.siteUrl}/guestbook" target="_blank">留言</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('7', 'TM_COMMENT_REPLY', '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评论回复通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,''Helvetica Neue'',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            评论回复通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>${comment.nickname}，您好!</p>
        <p>
            您于 ${comment.createTime?string(''yyyy-MM-dd HH:mm:ss'')} 在文章《${config.siteUrl}${comment.sourceUrl}》 上发表的<span class="il">评论</span>：
        </p>
        <div style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333">${comment.content}</div>
        <p>
            有了 <strong>新的回复</strong>！您可以点击 <a style="text-decoration:none;" href="${config.siteUrl}${comment.sourceUrl}" target="_blank">链接</a>查看回复的完整內容。
        </p>
        <p>感谢您对 <a style="text-decoration:none;" href="${config.siteUrl}" target="_blank">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style="text-decoration:none;" href="${config.siteUrl}/guestbook" target="_blank">留言</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('8', 'TM_LINKS_TO_ADMIN', '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>友情链接操作通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,''Helvetica Neue'',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            友情链接操作通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>有新的友情链接加入，信息如下</p>
        <p>
        <ul>
            <li>${link.name?if_exists}</li>
            <li>${link.url?if_exists}</li>
            <li>${link.description?if_exists}</li>
            <#if link.favicon?exists><li><img src="${link.favicon?if_exists}" width="100" alt="LOGO"></li></#if>
        </ul>
        </p>
        <p><a style="text-decoration:none;" href="http://admin.zhyd.me" target="_blank">去后台继续审核</a>。</p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');
INSERT INTO "public"."sys_template" VALUES ('9', 'TM_NEW_COMMENT', '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新评论通知</title>
</head>
<body>
<div style="border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,''Helvetica Neue'',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%">
    <div style="width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0">
        <p style="font-size:15px;word-break:break-all;padding:20px 32px;margin:0">
            新评论通知
        </p>
    </div>
    <div style="margin:0px auto;width:90%">
        <p>
            评论内容：
        </p>
        <div style="background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>
        <p>
            <a style="text-decoration:none;" href="${config.siteUrl}${comment.sourceUrl}" target="_blank">查看完整评论</a>
        </p>
        <p>（注：此邮件由系统自动发出，请勿回复。）</p>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_user_id_seq'::regclass),
  "username" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "nickname" varchar(30) COLLATE "pg_catalog"."default",
  "mobile" varchar(30) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "last_login_ip" varchar(30) COLLATE "pg_catalog"."default",
  "last_login_time" timestamptz(0),
  "login_count" int4 DEFAULT 0,
  "remark" varchar(100) COLLATE "pg_catalog"."default",
  "status" int4,
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "role_id" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_user"."login_count" IS '登录次数';
COMMENT ON COLUMN "public"."sys_user"."status" IS '用户状态';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('2', 'admin', 'ZFhLG9pRCV7p/nQuqnqmawxJAgxlQFZvxpGshHsg37c=', '后羿', '18257113785', '1052067939@qq.com', NULL, '0:0:0:0:0:0:0:1', '2019-02-01 00:00:00+08', 5, 'SS', 1, '2018-09-02 00:00:00+08', '2019-02-01 00:00:00+08', '2');
INSERT INTO "public"."sys_user" VALUES ('3', 'comment-admin', 'mW8nbvEeP0akZEQZS5u/ZKji/0iEzAPyUK2R0d6VKQY=', '小鱼人', '15156767890', '1052067939@qq.com', NULL, '0:0:0:0:0:0:0:1', '2018-05-22 00:00:00+08', 1, 'AA', 1, '2018-09-02 00:00:00+08', '2018-09-16 00:00:00+08', '3');
INSERT INTO "public"."sys_user" VALUES ('1', 'root', 'jZQTLZxjzbMwZftZQzNcCA==', '超级管理员', '18257113785', '1052067939@qq.com', 'https://static.zhyd.me/static/img/favicon.ico', '0:0:0:0:0:0:0:1', '2019-03-24 22:42:13+08', 367, 'root123456', 1, '2018-09-02 00:00:00+08', '2019-03-24 22:42:13+08', '1');
INSERT INTO "public"."sys_user" VALUES ('6375f5d2eb1c468ea43d3ab2620deda2', 'AAAAA', '3ETSUly4A1G5jwO0rXGCTw==', 'AA', 'A', 'A', NULL, NULL, NULL, 0, 'A', 1, '2019-03-20 21:54:43+08', '2019-03-20 21:54:43+08', '3');
INSERT INTO "public"."sys_user" VALUES ('44d7ccf4404c4e3eb38bf1cd9a8ac6b4', 'BB', 'tizpCMZKi35/JU7eFxU5Bg==', 'BB', 'BB', 'BB', NULL, NULL, NULL, 0, 'BB', 1, '2019-03-20 21:58:43+08', '2019-03-20 21:58:43+08', '2');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."biz_article_id_seq"
OWNED BY "public"."biz_article"."id";
SELECT setval('"public"."biz_article_id_seq"', 2, false);
ALTER SEQUENCE "public"."biz_article_look_id_seq"
OWNED BY "public"."biz_article_look"."id";
SELECT setval('"public"."biz_article_look_id_seq"', 2, false);
ALTER SEQUENCE "public"."biz_article_love_id_seq"
OWNED BY "public"."biz_article_love"."id";
SELECT setval('"public"."biz_article_love_id_seq"', 2, false);
ALTER SEQUENCE "public"."biz_article_tags_id_seq"
OWNED BY "public"."biz_article_tags"."id";
SELECT setval('"public"."biz_article_tags_id_seq"', 7, true);
ALTER SEQUENCE "public"."biz_comment_id_seq"
OWNED BY "public"."biz_comment"."id";
SELECT setval('"public"."biz_comment_id_seq"', 2, false);
ALTER SEQUENCE "public"."biz_tags_id_seq"
OWNED BY "public"."biz_tags"."id";
SELECT setval('"public"."biz_tags_id_seq"', 2, false);
ALTER SEQUENCE "public"."biz_type_id_seq"
OWNED BY "public"."biz_type"."id";
SELECT setval('"public"."biz_type_id_seq"', 2, false);
ALTER SEQUENCE "public"."search_count_id_seq"
OWNED BY "public"."search_count"."id";
SELECT setval('"public"."search_count_id_seq"', 2, false);
ALTER SEQUENCE "public"."search_history_id_seq"
OWNED BY "public"."search_history"."id";
SELECT setval('"public"."search_history_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_config_id_seq"
OWNED BY "public"."sys_config"."id";
SELECT setval('"public"."sys_config_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_link_id_seq"
OWNED BY "public"."sys_link"."id";
SELECT setval('"public"."sys_link_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_notice_id_seq"
OWNED BY "public"."sys_notice"."id";
SELECT setval('"public"."sys_notice_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_resources_id_seq"
OWNED BY "public"."resource"."id";
SELECT setval('"public"."sys_resources_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_role_id_seq"
OWNED BY "public"."sys_role"."id";
SELECT setval('"public"."sys_role_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_role_resources_id_seq"
OWNED BY "public"."sys_role_resources"."id";
SELECT setval('"public"."sys_role_resources_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_template_id_seq"
OWNED BY "public"."sys_template"."id";
SELECT setval('"public"."sys_template_id_seq"', 2, false);
ALTER SEQUENCE "public"."sys_user_id_seq"
OWNED BY "public"."sys_user"."id";
SELECT setval('"public"."sys_user_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table biz_article
-- ----------------------------
ALTER TABLE "public"."biz_article" ADD CONSTRAINT "pk_biz_article" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table biz_article_look
-- ----------------------------
ALTER TABLE "public"."biz_article_look" ADD CONSTRAINT "pk_biz_article_look" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table biz_article_love
-- ----------------------------
ALTER TABLE "public"."biz_article_love" ADD CONSTRAINT "pk_biz_article_love" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table biz_article_tags
-- ----------------------------
ALTER TABLE "public"."biz_article_tags" ADD CONSTRAINT "pk_biz_article_tags" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table biz_comment
-- ----------------------------
ALTER TABLE "public"."biz_comment" ADD CONSTRAINT "pk_biz_comment" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table biz_tags
-- ----------------------------
ALTER TABLE "public"."biz_tags" ADD CONSTRAINT "pk_biz_tags" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table biz_type
-- ----------------------------
ALTER TABLE "public"."biz_type" ADD CONSTRAINT "pk_biz_type" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dict
-- ----------------------------
ALTER TABLE "public"."dict" ADD CONSTRAINT "pk_dict" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table resource
-- ----------------------------
ALTER TABLE "public"."resource" ADD CONSTRAINT "pk_sys_resources" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table resource_copy1
-- ----------------------------
ALTER TABLE "public"."resource_copy1" ADD CONSTRAINT "resource_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table search_count
-- ----------------------------
ALTER TABLE "public"."search_count" ADD CONSTRAINT "pk_search_count" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table search_history
-- ----------------------------
ALTER TABLE "public"."search_history" ADD CONSTRAINT "pk_search_history" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "pk_sys_config" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_link
-- ----------------------------
ALTER TABLE "public"."sys_link" ADD CONSTRAINT "pk_sys_link" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "pk_sys_notice" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "pk_sys_role" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_resources
-- ----------------------------
ALTER TABLE "public"."sys_role_resources" ADD CONSTRAINT "pk_sys_role_resources" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_template
-- ----------------------------
ALTER TABLE "public"."sys_template" ADD CONSTRAINT "pk_sys_template" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "pk_sys_user" PRIMARY KEY ("id");
