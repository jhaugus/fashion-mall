CREATE DATABASE IF NOT EXISTS gulimall_ums ;
USE gulimall_ums;

DROP TABLE IF EXISTS ums_growth_change_history;

DROP TABLE IF EXISTS ums_integration_change_history;

DROP TABLE IF EXISTS ums_member;

DROP TABLE IF EXISTS ums_member_collect_spu;

DROP TABLE IF EXISTS ums_member_collect_subject;

DROP TABLE IF EXISTS ums_member_level;

DROP TABLE IF EXISTS ums_member_login_log;

DROP TABLE IF EXISTS ums_member_receive_address;

DROP TABLE IF EXISTS ums_member_statistics_info;

/*==============================================================*/
/* Table: ums_growth_change_history                             */
/*==============================================================*/
CREATE TABLE ums_growth_change_history
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT 'member_id',
   create_time          DATETIME COMMENT 'create_time',
   change_count         INT COMMENT '改变的值（正负计数）',
   note                 VARCHAR(0) COMMENT '备注',
   source_type          TINYINT COMMENT '积分来源[0-购物，1-管理员修改]',
   PRIMARY KEY (id)
);

ALTER TABLE ums_growth_change_history COMMENT '成长值变化历史记录';

/*==============================================================*/
/* Table: ums_integration_change_history                        */
/*==============================================================*/
CREATE TABLE ums_integration_change_history
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT 'member_id',
   create_time          DATETIME COMMENT 'create_time',
   change_count         INT COMMENT '变化的值',
   note                 VARCHAR(255) COMMENT '备注',
   source_tyoe          TINYINT COMMENT '来源[0->购物；1->管理员修改;2->活动]',
   PRIMARY KEY (id)
);

ALTER TABLE ums_integration_change_history COMMENT '积分变化历史记录';

/*==============================================================*/
/* Table: ums_member                                            */
/*==============================================================*/
CREATE TABLE ums_member
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   level_id             BIGINT COMMENT '会员等级id',
   username             CHAR(64) COMMENT '用户名',
   PASSWORD             VARCHAR(64) COMMENT '密码',
   nickname             VARCHAR(64) COMMENT '昵称',
   mobile               VARCHAR(20) COMMENT '手机号码',
   email                VARCHAR(64) COMMENT '邮箱',
   header               VARCHAR(500) COMMENT '头像',
   gender               TINYINT COMMENT '性别',
   birth                DATE COMMENT '生日',
   city                 VARCHAR(500) COMMENT '所在城市',
   job                  VARCHAR(255) COMMENT '职业',
   SIGN                 VARCHAR(255) COMMENT '个性签名',
   source_type          TINYINT COMMENT '用户来源',
   integration          INT COMMENT '积分',
   growth               INT COMMENT '成长值',
   STATUS               TINYINT COMMENT '启用状态',
   create_time          DATETIME COMMENT '注册时间',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member COMMENT '会员';

/*==============================================================*/
/* Table: ums_member_collect_spu                                */
/*==============================================================*/
CREATE TABLE ums_member_collect_spu
(
   id                   BIGINT NOT NULL COMMENT 'id',
   member_id            BIGINT COMMENT '会员id',
   spu_id               BIGINT COMMENT 'spu_id',
   spu_name             VARCHAR(500) COMMENT 'spu_name',
   spu_img              VARCHAR(500) COMMENT 'spu_img',
   create_time          DATETIME COMMENT 'create_time',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member_collect_spu COMMENT '会员收藏的商品';

/*==============================================================*/
/* Table: ums_member_collect_subject                            */
/*==============================================================*/
CREATE TABLE ums_member_collect_subject
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   subject_id           BIGINT COMMENT 'subject_id',
   subject_name         VARCHAR(255) COMMENT 'subject_name',
   subject_img          VARCHAR(500) COMMENT 'subject_img',
   subject_urll         VARCHAR(500) COMMENT '活动url',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member_collect_subject COMMENT '会员收藏的专题活动';

/*==============================================================*/
/* Table: ums_member_level                                      */
/*==============================================================*/
CREATE TABLE ums_member_level
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   NAME                 VARCHAR(100) COMMENT '等级名称',
   growth_point         INT COMMENT '等级需要的成长值',
   default_status       TINYINT COMMENT '是否为默认等级[0->不是；1->是]',
   free_freight_point   DECIMAL(18,4) COMMENT '免运费标准',
   comment_growth_point INT COMMENT '每次评价获取的成长值',
   priviledge_free_freight TINYINT COMMENT '是否有免邮特权',
   priviledge_member_price TINYINT COMMENT '是否有会员价格特权',
   priviledge_birthday  TINYINT COMMENT '是否有生日特权',
   note                 VARCHAR(255) COMMENT '备注',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member_level COMMENT '会员等级';

/*==============================================================*/
/* Table: ums_member_login_log                                  */
/*==============================================================*/
CREATE TABLE ums_member_login_log
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT 'member_id',
   create_time          DATETIME COMMENT '创建时间',
   ip                   VARCHAR(64) COMMENT 'ip',
   city                 VARCHAR(64) COMMENT 'city',
   login_type           TINYINT(1) COMMENT '登录类型[1-web，2-app]',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member_login_log COMMENT '会员登录记录';

/*==============================================================*/
/* Table: ums_member_receive_address                            */
/*==============================================================*/
CREATE TABLE ums_member_receive_address
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT 'member_id',
   NAME                 VARCHAR(255) COMMENT '收货人姓名',
   phone                VARCHAR(64) COMMENT '电话',
   post_code            VARCHAR(64) COMMENT '邮政编码',
   province             VARCHAR(100) COMMENT '省份/直辖市',
   city                 VARCHAR(100) COMMENT '城市',
   region               VARCHAR(100) COMMENT '区',
   detail_address       VARCHAR(255) COMMENT '详细地址(街道)',
   areacode             VARCHAR(15) COMMENT '省市区代码',
   default_status       TINYINT(1) COMMENT '是否默认',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member_receive_address COMMENT '会员收货地址';

/*==============================================================*/
/* Table: ums_member_statistics_info                            */
/*==============================================================*/
CREATE TABLE ums_member_statistics_info
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT '会员id',
   consume_amount       DECIMAL(18,4) COMMENT '累计消费金额',
   coupon_amount        DECIMAL(18,4) COMMENT '累计优惠金额',
   order_count          INT COMMENT '订单数量',
   coupon_count         INT COMMENT '优惠券数量',
   comment_count        INT COMMENT '评价数',
   return_order_count   INT COMMENT '退货数量',
   login_count          INT COMMENT '登录次数',
   attend_count         INT COMMENT '关注数量',
   fans_count           INT COMMENT '粉丝数量',
   collect_product_count INT COMMENT '收藏的商品数量',
   collect_subject_count INT COMMENT '收藏的专题活动数量',
   collect_comment_count INT COMMENT '收藏的评论数量',
   invite_friend_count  INT COMMENT '邀请的朋友数量',
   PRIMARY KEY (id)
);

ALTER TABLE ums_member_statistics_info COMMENT '会员统计信';
