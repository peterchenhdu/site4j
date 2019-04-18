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

 Date: 18/04/2019 23:47:41
*/


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
INSERT INTO "public"."resource" VALUES ('0403', '用户管理', 'menu', '/admin/user', 'user', '04', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040301', '新增用户', 'button', '/admin/user/add', 'user:add', '0403', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040305', '查询用户列表.', 'button', '/admin/user/query', 'user:query', '0403', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('02', '网站管理', 'menu', '', '', '', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('04', '权限管理', 'menu', '', '', '', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('01', '文章管理', 'menu', '', '', '', 1, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040202', '分配角色资源', 'button', '/admin/role/allotResource', 'role:allotResource', '0402', 8, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010105', '路由到发布MD文档文章页面', 'button', '/admin/article/publishMd', 'article:publishMd', '0101', 6, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0104', '类型管理', 'menu', '/admin/type', 'type', '01', 5, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010403', '删除单个标签', 'button', '/admin/type/delete', 'type:delete', '0104', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('010109', '修改文章', 'button', '/admin/article/update/{type}', 'article:update', '0101', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040303', '单个删除用户', 'button', '/admin/user/delete', 'user:delete', '0403', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0102', '评论管理', 'menu', '/admin/comment', 'comment', '01', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040306', '修改用户', 'button', '/admin/user/update', 'user:update', '0403', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('0203', '公告管理', 'menu', '/admin/notice', 'notice', '02', 11, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('03', '网站数据', 'menu', '', '', '', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020304', '查看单个公告', 'button', '/admin/notice/get/{id}', 'notice:get', '0203', 2, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('020307', '撤回公告', 'button', '/admin/notice/reCall/{id}', 'notice:reCall', '0203', 9, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040103', '单个删除资源', 'button', '/admin/resource/delete', 'resource:delete', '0401', 4, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040106', '查询资源树', 'button', '/admin/resource/queryResourceTree', 'resource:queryResourceTree', '0401', 12, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040107', '查询同一级别的资源列表', 'button', '/admin/resource/querySameLevelResource', 'resource:querySameLevelResource', '0401', 11, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');
INSERT INTO "public"."resource" VALUES ('040108', '修改资源', 'button', '/admin/resource/update', 'resource:update', '0401', 3, NULL, '2019-04-18 21:18:11+08', '2019-04-18 21:18:11+08');

-- ----------------------------
-- Primary Key structure for table resource
-- ----------------------------
ALTER TABLE "public"."resource" ADD CONSTRAINT "pk_sys_resources" PRIMARY KEY ("id");
