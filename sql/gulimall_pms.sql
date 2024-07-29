CREATE DATABASE IF NOT EXISTS gulimall_pms;
USE gulimall_pms;

DROP TABLE IF EXISTS pms_attr;

DROP TABLE IF EXISTS pms_attr_attrgroup_relation;

DROP TABLE IF EXISTS pms_attr_group;

DROP TABLE IF EXISTS pms_brand;

DROP TABLE IF EXISTS pms_category;

DROP TABLE IF EXISTS pms_category_brand_relation;

DROP TABLE IF EXISTS pms_comment_replay;

DROP TABLE IF EXISTS pms_product_attr_value;

DROP TABLE IF EXISTS pms_sku_images;

DROP TABLE IF EXISTS pms_sku_info;

DROP TABLE IF EXISTS pms_sku_sale_attr_value;

DROP TABLE IF EXISTS pms_spu_comment;

DROP TABLE IF EXISTS pms_spu_images;

DROP TABLE IF EXISTS pms_spu_info;

DROP TABLE IF EXISTS pms_spu_info_desc;

/*==============================================================*/
/* Table: pms_attr                                              */
/*==============================================================*/
CREATE TABLE pms_attr
(
   attr_id              BIGINT NOT NULL AUTO_INCREMENT COMMENT '属性id',
   attr_name            CHAR(30) COMMENT '属性名',
   search_type          TINYINT COMMENT '是否需要检索[0-不需要，1-需要]',
   icon                 VARCHAR(255) COMMENT '属性图标',
   value_select         CHAR(255) COMMENT '可选值列表[用逗号分隔]',
   attr_type            TINYINT COMMENT '属性类型[0-销售属性，1-基本属性，2-既是销售属性又是基本属性]',
   ENABLE               BIGINT COMMENT '启用状态[0 - 禁用，1 - 启用]',
   catelog_id           BIGINT COMMENT '所属分类',
   show_desc            TINYINT COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
   PRIMARY KEY (attr_id)
);

ALTER TABLE pms_attr COMMENT '商品属性';

/*==============================================================*/
/* Table: pms_attr_attrgroup_relation                           */
/*==============================================================*/
CREATE TABLE pms_attr_attrgroup_relation
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   attr_id              BIGINT COMMENT '属性id',
   attr_group_id        BIGINT COMMENT '属性分组id',
   attr_sort            INT COMMENT '属性组内排序',
   PRIMARY KEY (id)
);

ALTER TABLE pms_attr_attrgroup_relation COMMENT '属性&属性分组关联';

/*==============================================================*/
/* Table: pms_attr_group                                        */
/*==============================================================*/
CREATE TABLE pms_attr_group
(
   attr_group_id        BIGINT NOT NULL AUTO_INCREMENT COMMENT '分组id',
   attr_group_name      CHAR(20) COMMENT '组名',
   sort                 INT COMMENT '排序',
   descript             VARCHAR(255) COMMENT '描述',
   icon                 VARCHAR(255) COMMENT '组图标',
   catelog_id           BIGINT COMMENT '所属分类id',
   PRIMARY KEY (attr_group_id)
);

ALTER TABLE pms_attr_group COMMENT '属性分组';

/*==============================================================*/
/* Table: pms_brand                                             */
/*==============================================================*/
CREATE TABLE pms_brand
(
   brand_id             BIGINT NOT NULL AUTO_INCREMENT COMMENT '品牌id',
   NAME                 CHAR(50) COMMENT '品牌名',
   logo                 VARCHAR(2000) COMMENT '品牌logo地址',
   descript             LONGTEXT COMMENT '介绍',
   show_status          TINYINT COMMENT '显示状态[0-不显示；1-显示]',
   first_letter         CHAR(1) COMMENT '检索首字母',
   sort                 INT COMMENT '排序',
   PRIMARY KEY (brand_id)
);

ALTER TABLE pms_brand COMMENT '品牌';

/*==============================================================*/
/* Table: pms_category                                          */
/*==============================================================*/
CREATE TABLE pms_category
(
   cat_id               BIGINT NOT NULL AUTO_INCREMENT COMMENT '分类id',
   NAME                 CHAR(50) COMMENT '分类名称',
   parent_cid           BIGINT COMMENT '父分类id',
   cat_level            INT COMMENT '层级',
   show_status          TINYINT COMMENT '是否显示[0-不显示，1显示]',
   sort                 INT COMMENT '排序',
   icon                 CHAR(255) COMMENT '图标地址',
   product_unit         CHAR(50) COMMENT '计量单位',
   product_count        INT COMMENT '商品数量',
   PRIMARY KEY (cat_id)
);

ALTER TABLE pms_category COMMENT '商品三级分类';

/*==============================================================*/
/* Table: pms_category_brand_relation                           */
/*==============================================================*/
CREATE TABLE pms_category_brand_relation
(
   id                   BIGINT NOT NULL AUTO_INCREMENT,
   brand_id             BIGINT COMMENT '品牌id',
   catelog_id           BIGINT COMMENT '分类id',
   brand_name           VARCHAR(255),
   catelog_name         VARCHAR(255),
   PRIMARY KEY (id)
);

ALTER TABLE pms_category_brand_relation COMMENT '品牌分类关联';

/*==============================================================*/
/* Table: pms_comment_replay                                    */
/*==============================================================*/
CREATE TABLE pms_comment_replay
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   comment_id           BIGINT COMMENT '评论id',
   reply_id             BIGINT COMMENT '回复id',
   PRIMARY KEY (id)
);

ALTER TABLE pms_comment_replay COMMENT '商品评价回复关系';

/*==============================================================*/
/* Table: pms_product_attr_value                                */
/*==============================================================*/
CREATE TABLE pms_product_attr_value
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   spu_id               BIGINT COMMENT '商品id',
   attr_id              BIGINT COMMENT '属性id',
   attr_name            VARCHAR(200) COMMENT '属性名',
   attr_value           VARCHAR(200) COMMENT '属性值',
   attr_sort            INT COMMENT '顺序',
   quick_show           TINYINT COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
   PRIMARY KEY (id)
);

ALTER TABLE pms_product_attr_value COMMENT 'spu属性值';

/*==============================================================*/
/* Table: pms_sku_images                                        */
/*==============================================================*/
CREATE TABLE pms_sku_images
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   sku_id               BIGINT COMMENT 'sku_id',
   img_url              VARCHAR(255) COMMENT '图片地址',
   img_sort             INT COMMENT '排序',
   default_img          INT COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
   PRIMARY KEY (id)
);

ALTER TABLE pms_sku_images COMMENT 'sku图片';

/*==============================================================*/
/* Table: pms_sku_info                                          */
/*==============================================================*/
CREATE TABLE pms_sku_info
(
   sku_id               BIGINT NOT NULL AUTO_INCREMENT COMMENT 'skuId',
   spu_id               BIGINT COMMENT 'spuId',
   sku_name             VARCHAR(255) COMMENT 'sku名称',
   sku_desc             VARCHAR(2000) COMMENT 'sku介绍描述',
   catalog_id           BIGINT COMMENT '所属分类id',
   brand_id             BIGINT COMMENT '品牌id',
   sku_default_img      VARCHAR(255) COMMENT '默认图片',
   sku_title            VARCHAR(255) COMMENT '标题',
   sku_subtitle         VARCHAR(2000) COMMENT '副标题',
   price                DECIMAL(18,4) COMMENT '价格',
   sale_count           BIGINT COMMENT '销量',
   PRIMARY KEY (sku_id)
);

ALTER TABLE pms_sku_info COMMENT 'sku信息';

/*==============================================================*/
/* Table: pms_sku_sale_attr_value                               */
/*==============================================================*/
CREATE TABLE pms_sku_sale_attr_value
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   sku_id               BIGINT COMMENT 'sku_id',
   attr_id              BIGINT COMMENT 'attr_id',
   attr_name            VARCHAR(200) COMMENT '销售属性名',
   attr_value           VARCHAR(200) COMMENT '销售属性值',
   attr_sort            INT COMMENT '顺序',
   PRIMARY KEY (id)
);

ALTER TABLE pms_sku_sale_attr_value COMMENT 'sku销售属性值';

/*==============================================================*/
/* Table: pms_spu_comment                                       */
/*==============================================================*/
CREATE TABLE pms_spu_comment
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   sku_id               BIGINT COMMENT 'sku_id',
   spu_id               BIGINT COMMENT 'spu_id',
   spu_name             VARCHAR(255) COMMENT '商品名字',
   member_nick_name     VARCHAR(255) COMMENT '会员昵称',
   star                 TINYINT(1) COMMENT '星级',
   member_ip            VARCHAR(64) COMMENT '会员ip',
   create_time          DATETIME COMMENT '创建时间',
   show_status          TINYINT(1) COMMENT '显示状态[0-不显示，1-显示]',
   spu_attributes       VARCHAR(255) COMMENT '购买时属性组合',
   likes_count          INT COMMENT '点赞数',
   reply_count          INT COMMENT '回复数',
   resources            varchar(1000) comment '评论图片/视频[json数据；[{TYPE:文件类型,url:资源路径}]]',
   content              text comment '内容',
   member_icon          varchar(255) comment '用户头像',
   comment_type         tinyint comment '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
   primary key (id)
);

alter table pms_spu_comment comment '商品评价';

/*==============================================================*/
/* Table: pms_spu_images                                        */
/*==============================================================*/
create table pms_spu_images
(
   id                   bigint not null auto_increment comment 'id',
   spu_id               bigint comment 'spu_id',
   img_name             varchar(200) comment '图片名',
   img_url              varchar(255) comment '图片地址',
   img_sort             int comment '顺序',
   default_img          tinyint comment '是否默认图',
   primary key (id)
);

alter table pms_spu_images comment 'spu图片';

/*==============================================================*/
/* Table: pms_spu_info                                          */
/*==============================================================*/
create table pms_spu_info
(
   id                   bigint not null auto_increment comment '商品id',
   spu_name             varchar(200) comment '商品名称',
   spu_description      varchar(1000) comment '商品描述',
   catalog_id           bigint comment '所属分类id',
   brand_id             bigint comment '品牌id',
   weight               decimal(18,4),
   publish_status       tinyint comment '上架状态[0 - 下架，1 - 上架]',
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

alter table pms_spu_info comment 'spu信息';

/*==============================================================*/
/* Table: pms_spu_info_desc                                     */
/*==============================================================*/
create table pms_spu_info_desc
(
   spu_id               bigint not null comment '商品id',
   decript              longtext comment '商品介绍',
   primary key (spu_id)
);

alter table pms_spu_info_desc comment 'spu信息介绍';
