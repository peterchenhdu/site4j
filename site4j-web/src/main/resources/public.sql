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

 Date: 21/04/2019 22:47:06
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
INSERT INTO "public"."biz_article" VALUES ('37ec531904c94122b7a80e94a002416b', '1', '1', '1', '1', NULL, NULL, '<p>1</p>', NULL, 'c15166be700c4175a90c31e09eadad75', '2', '2', '2019-04-21 09:17:21+08', '2019-04-21 09:17:21+08', 't', 'f', NULL, NULL, 'f', 1);
INSERT INTO "public"."biz_article" VALUES ('0b77c93c1e48430bbd7208e63381f83a', '5', '3', '3', '1', '', NULL, '<p>1</p>
', '1', 'b4b6d877c52d4cd8b568c5d5f95b42c4', '3', '4', '2019-02-10 13:49:39+08', '2019-02-16 22:23:20+08', 't', 't', NULL, NULL, 't', 1);
INSERT INTO "public"."biz_article" VALUES ('311f17f8caab4f6fa0bc52a10371b376', '5554', '55', '55', '1', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/cover/20190421083229248.jpg', NULL, '<p><img src="https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/article/20190421084821936.png" alt="file"></p>
', '![file](https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/article/20190421084821936.png)', 'c15166be700c4175a90c31e09eadad75', '        TypeQueryDto vo = new TypeQueryDto();
        vo.setPageNumber(1);
        vo.setPageSize(100);', '        TypeQueryDto vo = new TypeQueryDto();
        vo.setPageNumber(1);
        vo.setPageSize(100);', '2019-04-20 23:42:30+08', '2019-04-21 09:08:27+08', 't', 't', NULL, NULL, 't', 1);

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
INSERT INTO "public"."biz_article_tags" VALUES ('631c419968ea4d3198fe5967f3087270', '240e40cc407e439eb0452326b5d379ca', '311f17f8caab4f6fa0bc52a10371b376', '2019-04-21 09:08:27+08', '2019-04-21 09:08:27+08');
INSERT INTO "public"."biz_article_tags" VALUES ('1210e99d639e423c8801ba7d17dda495', 'be2cb86bf87346ae84556de524136b98', '37ec531904c94122b7a80e94a002416b', '2019-04-21 09:17:21+08', '2019-04-21 09:17:21+08');

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
-- Records of biz_comment
-- ----------------------------
INSERT INTO "public"."biz_comment" VALUES ('a2d3440fa64c403f9507797f32d38418', '311f17f8caab4f6fa0bc52a10371b376', NULL, '0', NULL, '匿名', NULL, NULL, NULL, 'APPROVED', '0:0:0:0:0:0:0:1', NULL, NULL, '未知', 'Windows 10', NULL, 'Chrome 58 58.0.3029.81', NULL, '<p>aaa</p>', NULL, 0, 0, '2019-04-21 09:10:32+08', '2019-04-21 09:10:32+08');

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
INSERT INTO "public"."biz_tags" VALUES ('240e40cc407e439eb0452326b5d379ca', '你好久', '你好久', '2019-03-04 22:18:35+08', '2019-03-04 22:18:35+08');
INSERT INTO "public"."biz_tags" VALUES ('be2cb86bf87346ae84556de524136b98', '我的2', '你好2', '2019-03-04 22:18:26+08', '2019-04-17 22:34:26+08');

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
INSERT INTO "public"."biz_type" VALUES ('b4b6d877c52d4cd8b568c5d5f95b42c4', '', '测试', '测试相关', 1, '', '2019-02-10 13:35:11+08', '2019-04-17 22:07:58+08', 'f');
INSERT INTO "public"."biz_type" VALUES ('c15166be700c4175a90c31e09eadad75', 'b4b6d877c52d4cd8b568c5d5f95b42c4', 'Java', 'Java', NULL, NULL, '2019-04-17 21:57:42+08', '2019-04-17 22:05:35+08', 't');

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
INSERT INTO "public"."dict" VALUES ('ee594c18be9f441b9669db46861e4d34', 'sys_stat', 'article_count', '4', '2019-02-05 00:00:00+08', '2019-04-21 22:00:00+08');
INSERT INTO "public"."dict" VALUES ('4f0e2047ef014aea8b34e8d1a5d240ae', 'sys_stat', 'tag_count', '2', '2019-02-05 00:00:00+08', '2019-04-21 22:00:00+08');
INSERT INTO "public"."dict" VALUES ('4ce39a5ac4174136b0c9ffc36d71d090', 'sys_stat', 'comment_count', '1', '2019-02-05 00:00:00+08', '2019-04-21 22:00:00+08');
INSERT INTO "public"."dict" VALUES ('479ce84dc0114816abaa790f25fb2794', 'sys_stat', 'type_count', '1', '2019-02-05 00:00:00+08', '2019-04-21 22:00:00+08');

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
INSERT INTO "public"."image" VALUES ('7e00d81e9e8a4a42bc84a90725df5e14', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/cover/20190421083229248.jpg', '2019-04-21 08:32:29.985+08', '2019-04-21 08:32:29.985+08');
INSERT INTO "public"."image" VALUES ('7b104caf6f944736805cbf9fa125c135', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/article/20190421084652376.png', '2019-04-21 08:47:33.446+08', '2019-04-21 08:47:33.446+08');
INSERT INTO "public"."image" VALUES ('47c79718e545495dbb9c1df4ab6caaa4', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/site4j/article/20190421084821936.png', '2019-04-21 08:48:23.302+08', '2019-04-21 08:48:23.302+08');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS "public"."resource";
CREATE TABLE "public"."resource" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('sys_resources_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "url" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "permission" varchar(100) COLLATE "pg_catalog"."default",
  "parent_id" varchar(64) COLLATE "pg_catalog"."default",
  "sort" int4,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0)
)
;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO "public"."resource" VALUES ('0101', '文章管理', 'menu', '/admin/article', 'article', '01', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010101', '发布文章', 'button', '/admin/article/batchPublish', 'article:batchPublish', '0101', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010104', '路由到发布文章页面', 'button', '/admin/article/publish', 'article:publish', '0101', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0301', '文章查看记录', 'menu', '/admin/bizArticleLook', 'bizArticleLook', '03', 9, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0402', '角色管理', 'menu', '/admin/role', 'role', '04', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040201', '新增角色', 'button', '/admin/role/add', 'role:add', '0402', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040204', '删除单个角色', 'button', '/admin/role/delete', 'role:delete', '0402', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040207', '更新角色', 'button', '/admin/role/update', 'role:update', '0402', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0103', '标签管理', 'menu', '/admin/tag', 'tag', '01', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010301', '新增标签', 'button', '/admin/tag/add', 'tag:add', '0103', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010401', '新增类别', 'button', '/admin/type/add', 'type:add', '0104', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010404', '编辑类别', 'button', '/admin/type/edit', 'type:edit', '0104', 9, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010202', '编辑评论', 'button', '/admin/comment/edit', 'comment:edit', '0102', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010204', '查询评论', 'button', '/admin/comment/list', 'comment:list', '0102', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010206', '删除批量', 'button', '/admin/comment/remove', 'comment:remove', '0102', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010207', '回复评论', 'button', '/admin/comment/reply', 'comment:reply', '0102', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0202', '友情链接管理', 'menu', '/admin/link', 'link', '02', 10, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020201', '新增友情链接', 'button', '/admin/link/add', 'link:add', '0202', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040101', '新增资源', 'button', '/admin/resource/add', 'resource:add', '0401', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040104', '查看单个资源', 'button', '/admin/resource/get/{id}', 'resource:get', '0401', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010406', '查询类别', 'button', '/admin/type/list', 'type:list', '0104', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040302', '批量删除用户', 'button', '/admin/user/batchDelete', 'user:batchDelete', '0403', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040304', '查看单个用户信息', 'button', '/admin/user/get/{id}', 'user:get', '0403', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010102', '查看文章', 'button', '/admin/article/get/{id}', 'article:get', '0101', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040203', '批量删除角色', 'button', '/admin/role/batchDelete', 'role:batchDelete', '0402', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010103', '查询文章', 'button', '/admin/article/list', 'article:list', '0101', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010106', '删除文章', 'button', '/admin/article/remove', 'article:remove', '0101', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040205', '查看单个角色', 'button', '/admin/role/get/{id}', 'role:get', '0402', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010107', '新增文章', 'button', '/admin/article/save', 'article:save', '0101', 10, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010108', '路由到修改文章页面', 'button', '/admin/article/update/{id}', 'article:update', '0101', 9, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040206', '查看所有角色', 'button', '/admin/role/query', 'role:query', '0402', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('030101', '文章历史记录查询', 'button', '/admin/bizArticleLook/query', 'bizArticleLook:query', '0301', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010201', '修改评论', 'button', '/admin/comment/audit', 'comment:audit', '0102', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010302', '批量删除标签', 'button', '/admin/tag/batchDelete', 'tag:batchDelete', '0103', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010203', '查看评论', 'button', '/admin/comment/get/{id}', 'comment:get', '0102', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010303', '删除单个标签', 'button', '/admin/tag/delete', 'tag:delete', '0103', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010205', '查看未处理的评论', 'button', '/admin/comment/listVerifying', 'comment:listVerifying', '0102', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010304', '查看单个标签', 'button', '/admin/tag/get/{id}', 'tag:get', '0103', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010305', '查询标签列表', 'button', '/admin/tag/query', 'tag:query', '0103', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0201', '系统配置', 'menu', '/admin/config', 'config', '02', 12, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010306', '更新标签', 'button', '/admin/tag/update', 'tag:update', '0103', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020101', '查看系统配置', 'button', '/admin/config/get', 'config:get', '0201', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020102', '修改系统配置', 'button', '/admin/config/update', 'config:update', '0201', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020202', '编辑友情链接', 'button', '/admin/link/edit', 'link:edit', '0202', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020203', '查看单个友情链接', 'button', '/admin/link/get/{id}', 'link:get', '0202', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020204', '查看友情链接', 'button', '/admin/link/list', 'link:list', '0202', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020205', '删除友情链接', 'button', '/admin/link/remove', 'link:remove', '0202', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020301', '新增公告', 'button', '/admin/notice/add', 'notice:add', '0203', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010402', '批量删除类别', 'button', '/admin/type/batchDelete', 'type:batchDelete', '0104', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010405', '查看单个类别', 'button', '/admin/type/get/{id}', 'type:get', '0104', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020302', '批量删除公告', 'button', '/admin/notice/batchDelete', 'notice:batchDelete', '0203', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020303', '单个删除公告', 'button', '/admin/notice/delete', 'notice:delete', '0203', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020305', '发布公告', 'button', '/admin/notice/publish/{id}', 'notice:publish', '0203', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010407', '查看所有类别', 'button', '/admin/type/listAll', 'type:listAll', '0104', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010408', '查看父类别', 'button', '/admin/type/listParent', 'type:listParent', '0104', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020306', '查询公告', 'button', '/admin/notice/query', 'notice:query', '0203', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020308', '修改公告', 'button', '/admin/notice/update', 'notice:update', '0203', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0401', '资源管理', 'menu', '/admin/resource', 'resource', '04', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040102', '批量删除资源', 'button', '/admin/resource/batchDelete', 'resource:batchDelete', '0401', 7, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040105', '查询资源', 'button', '/admin/resource/query', 'resource:query', '0401', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040109', '修改资源排序', 'button', '/admin/resource/updateSort', 'resource:updateSort', '0401', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('04', '权限管理', 'menu', '', '', '', 4, 'fa fa-key', '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0403', '用户管理', 'menu', '/admin/user', 'user', '04', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040301', '新增用户', 'button', '/admin/user/add', 'user:add', '0403', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040305', '查询用户列表.', 'button', '/admin/user/query', 'user:query', '0403', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('01', '文章管理', 'menu', '', '', '', 1, 'fa fa-book', '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('02', '网站管理', 'menu', '', '', '', 2, 'fa fa-at', '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040202', '分配角色资源', 'button', '/admin/role/allotResource', 'role:allotResource', '0402', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010105', '路由到发布MD文档文章页面', 'button', '/admin/article/publishMd', 'article:publishMd', '0101', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0104', '类型管理', 'menu', '/admin/type', 'type', '01', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010403', '删除单个标签', 'button', '/admin/type/delete', 'type:delete', '0104', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010109', '修改文章', 'button', '/admin/article/update/{type}', 'article:update', '0101', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040303', '单个删除用户', 'button', '/admin/user/delete', 'user:delete', '0403', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040306', '修改用户', 'button', '/admin/user/update', 'user:update', '0403', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0203', '公告管理', 'menu', '/admin/notice', 'notice', '02', 11, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020304', '查看单个公告', 'button', '/admin/notice/get/{id}', 'notice:get', '0203', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020307', '撤回公告', 'button', '/admin/notice/reCall/{id}', 'notice:reCall', '0203', 9, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040103', '单个删除资源', 'button', '/admin/resource/delete', 'resource:delete', '0401', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040106', '查询资源树', 'button', '/admin/resource/queryResourceTree', 'resource:queryResourceTree', '0401', 12, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040107', '查询同一级别的资源列表', 'button', '/admin/resource/querySameLevelResource', 'resource:querySameLevelResource', '0401', 11, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040108', '修改资源', 'button', '/admin/resource/update', 'resource:update', '0401', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('03', '网站数据', 'menu', '', '', '', 3, 'fa fa-line-chart', '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0102', '评论管理', 'menu', '/admin/comment', 'comment', '01', 2, '', '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');

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
  "comment" bool,
  "tencent_cos_base_path" varchar(255) COLLATE "pg_catalog"."default",
  "tencent_cos_access_key" varchar(100) COLLATE "pg_catalog"."default",
  "tencent_cos_secret_key" varchar(100) COLLATE "pg_catalog"."default",
  "tencent_cos_region_name" varchar(100) COLLATE "pg_catalog"."default",
  "baidu_push_token" varchar(100) COLLATE "pg_catalog"."default",
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
INSERT INTO "public"."sys_config" VALUES ('1', 'SITE4J，2专注于Java技术分享。', 'SITE4J,Java技术资源站。', 'localhost', 'https://localhost', 'https://localhost', 'SITE4J', '分享、传播Java技术', 'https://localhost/img/favicon.svg', 'https://localhost', '风一样的码农', '1052067939@qq.com', '#', '1052067939', '#', '#', '2019-10-28', 't', 'https://peterchenhdu-1257309286.cos.ap-chengdu.myqcloud.com/', 'AKIDNhxqcNgc7qX6YsvFE5oO3oSzVr36hnPq', 'XwE81syyqY6Xn5JPfpocR8dx65uZQ8i7', 'peterchenhdu-1257309286', 'BIhFDCipf0ZqwgGp', '5f6c6a8fa13beda75a56933cb9be8c58', '2018-09-02 00:00:00+08', '2019-04-12 23:11:53+08', 'f');

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
INSERT INTO "public"."sys_link" VALUES ('a7d3ac74bdd7408aa0de7e118c4dec88', 'aa1', 'aa1', 'aa1', 'aa', 'aa', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1555240479&di=c3772489d667dd813711db35a05c6f69&src=http://pic49.huitu.com/res/20160113/881453_20160113222243059600_1.jpg', 'aa', 'ADMIN', '2019-03-21 22:20:29+08', '2019-04-15 23:04:10+08', 'f', 'f');

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
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(0),
  "update_time" timestamptz(0),
  "available" bool,
  "type" varchar(32) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES ('b5eaf07fa3a84d4c9c5889bb31316cac', '测试角色', '测试角色', '2019-03-15 23:14:50+08', '2019-03-15 23:17:06+08', 't', 'normal_admin');
INSERT INTO "public"."sys_role" VALUES ('6f42fdec02f64f358b28c3abf37d1751', '超级管理员', '超级管理员', '2018-09-02 00:00:00+08', '2018-09-02 00:00:00+08', 't', 'super_admin');
INSERT INTO "public"."sys_role" VALUES ('13f49f2fc19e487998eb481f2d84d841', '文章编写发布者', '文章编写发布者', '2018-10-28 00:00:00+08', '2019-04-19 22:56:29+08', 't', 'normal_admin');
INSERT INTO "public"."sys_role" VALUES ('c07127a167fe48678d30f6bba722926a', '评论审核管理员', '评论审核管理员', '2018-09-02 00:00:00+08', '2019-04-19 22:56:39+08', 't', 'normal_admin');
INSERT INTO "public"."sys_role" VALUES ('68771d8f00fa46988b59a1a9871b7e96', '普通管理员', '管理员', '2018-09-02 00:00:00+08', '2019-04-19 22:56:49+08', 't', 'normal_admin');
INSERT INTO "public"."sys_role" VALUES ('003ab960d9be46c3a952b48d0273e860', '游客', 'AA1', '2019-03-15 23:29:21+08', '2019-04-19 22:56:59+08', 't', 'normal_admin');
INSERT INTO "public"."sys_role" VALUES ('a92bb823748c4bbfabb8d72b2a6de1db', '普通用户', 'QQQ', '2019-04-19 22:57:14+08', '2019-04-19 22:57:43+08', 't', 'normal_user');

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
INSERT INTO "public"."sys_user" VALUES ('44d7ccf4404c4e3eb38bf1cd9a8ac6b4', 'BB', 'tizpCMZKi35/JU7eFxU5Bg==', 'BB', 'BB', 'BB', NULL, NULL, NULL, 0, 'BB', 1, '2019-03-20 21:58:43+08', '2019-03-20 21:58:43+08', 'b5eaf07fa3a84d4c9c5889bb31316cac');
INSERT INTO "public"."sys_user" VALUES ('6375f5d2eb1c468ea43d3ab2620deda2', 'AAAAA', '3ETSUly4A1G5jwO0rXGCTw==', 'AA', 'A', 'A', NULL, NULL, NULL, 0, 'A', 1, '2019-03-20 21:54:43+08', '2019-03-20 21:54:43+08', '68771d8f00fa46988b59a1a9871b7e96');
INSERT INTO "public"."sys_user" VALUES ('2', 'admin', 'ZFhLG9pRCV7p/nQuqnqmawxJAgxlQFZvxpGshHsg37c=', '后羿', '18257113785', '1052067939@qq.com', NULL, '0:0:0:0:0:0:0:1', '2019-02-01 00:00:00+08', 5, 'SS', 1, '2018-09-02 00:00:00+08', '2019-02-01 00:00:00+08', 'c07127a167fe48678d30f6bba722926a');
INSERT INTO "public"."sys_user" VALUES ('3', 'comment-admin', 'mW8nbvEeP0akZEQZS5u/ZKji/0iEzAPyUK2R0d6VKQY=', '小鱼人', '15156767890', '1052067939@qq.com', NULL, '0:0:0:0:0:0:0:1', '2018-05-22 00:00:00+08', 1, 'AA', 1, '2018-09-02 00:00:00+08', '2018-09-16 00:00:00+08', 'b5eaf07fa3a84d4c9c5889bb31316cac');
INSERT INTO "public"."sys_user" VALUES ('1', 'root', 'jZQTLZxjzbMwZftZQzNcCA==', '超级管理员', '18257113785', '1052067939@qq.com', 'https://static.zhyd.me/static/img/favicon.ico', '0:0:0:0:0:0:0:1', '2019-04-21 21:48:34+08', 414, 'root123456', 1, '2018-09-02 00:00:00+08', '2019-04-21 21:48:34+08', '6f42fdec02f64f358b28c3abf37d1751');

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
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "pk_sys_user" PRIMARY KEY ("id");
