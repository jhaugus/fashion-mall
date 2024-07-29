CREATE DATABASE IF NOT EXISTS gulimall_sms;
USE gulimall_sms;


DROP TABLE IF EXISTS sms_coupon;

DROP TABLE IF EXISTS sms_coupon_history;

DROP TABLE IF EXISTS sms_coupon_spu_category_relation;

DROP TABLE IF EXISTS sms_coupon_spu_relation;

DROP TABLE IF EXISTS sms_home_adv;

DROP TABLE IF EXISTS sms_home_subject;

DROP TABLE IF EXISTS sms_home_subject_spu;

DROP TABLE IF EXISTS sms_member_price;

DROP TABLE IF EXISTS sms_seckill_promotion;

DROP TABLE IF EXISTS sms_seckill_session;

DROP TABLE IF EXISTS sms_seckill_sku_notice;

DROP TABLE IF EXISTS sms_seckill_sku_relation;

DROP TABLE IF EXISTS sms_sku_full_reduction;

DROP TABLE IF EXISTS sms_sku_ladder;

DROP TABLE IF EXISTS sms_spu_bounds;

/*==============================================================*/
/* Table: sms_coupon                                            */
/*==============================================================*/
CREATE TABLE sms_coupon
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   coupon_type          TINYINT(1) COMMENT '优惠?砝嘈蚚0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券]',
   coupon_img           VARCHAR(2000) COMMENT '优惠券图片',
   coupon_name          VARCHAR(100) COMMENT '优惠卷名字',
   num                  INT COMMENT '数量',
   amount               DECIMAL(18,4) COMMENT '金额',
   per_limit            INT COMMENT '每人限领张数',
   min_point            DECIMAL(18,4) COMMENT '使用门槛',
   start_time           DATETIME COMMENT '开始时间',
   end_time             DATETIME COMMENT '结束时间',
   use_type             TINYINT(1) COMMENT '使用类型[0->全场通用；1->指定分类；2->指定商品]',
   note                 VARCHAR(200) COMMENT '备注',
   publish_count        INT(11) COMMENT '发行数量',
   use_count            INT(11) COMMENT '已使用数量',
   receive_count        INT(11) COMMENT '领取数量',
   enable_start_time    DATETIME COMMENT '可以领取的开始日期',
   enable_end_time      DATETIME COMMENT '可以领取的结束日期',
   CODE                 VARCHAR(64) COMMENT '优惠码',
   member_level         TINYINT(1) COMMENT '可以领取的会员等级[0->不限等级，其他-对应等级]',
   publish              TINYINT(1) COMMENT '发布状态[0-未发布，1-已发布]',
   PRIMARY KEY (id)
);

ALTER TABLE sms_coupon COMMENT '优惠券信息';

/*==============================================================*/
/* Table: sms_coupon_history                                    */
/*==============================================================*/
CREATE TABLE sms_coupon_history
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   coupon_id            BIGINT COMMENT '优惠券id',
   member_id            BIGINT COMMENT '会员id',
   member_nick_name     VARCHAR(64) COMMENT '会员名字',
   get_type             TINYINT(1) COMMENT '获取方式[0->后台赠送；1->主动领取]',
   create_time          DATETIME COMMENT '创建时间',
   use_type             TINYINT(1) COMMENT '使用状态[0->未使用；1->已使用；2->已过期]',
   use_time             DATETIME COMMENT '使用时间',
   order_id             BIGINT COMMENT '订单id',
   order_sn             BIGINT COMMENT '订单号',
   PRIMARY KEY (id)
);

ALTER TABLE sms_coupon_history COMMENT '优惠券领取历史记录';

/*==============================================================*/
/* Table: sms_coupon_spu_category_relation                      */
/*==============================================================*/
CREATE TABLE sms_coupon_spu_category_relation
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   coupon_id            BIGINT COMMENT '优惠券id',
   category_id          BIGINT COMMENT '产品分类id',
   category_name        VARCHAR(64) COMMENT '产品分类名称',
   PRIMARY KEY (id)
);

ALTER TABLE sms_coupon_spu_category_relation COMMENT '优惠券分类关联';

/*==============================================================*/
/* Table: sms_coupon_spu_relation                               */
/*==============================================================*/
CREATE TABLE sms_coupon_spu_relation
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   coupon_id            BIGINT COMMENT '优惠券id',
   spu_id               BIGINT COMMENT 'spu_id',
   spu_name             VARCHAR(255) COMMENT 'spu_name',
   PRIMARY KEY (id)
);

ALTER TABLE sms_coupon_spu_relation COMMENT '优惠券与产品关联';

/*==============================================================*/
/* Table: sms_home_adv                                          */
/*==============================================================*/
CREATE TABLE sms_home_adv
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   NAME                 VARCHAR(100) COMMENT '名字',
   pic                  VARCHAR(500) COMMENT '图片地址',
   start_time           DATETIME COMMENT '开始时间',
   end_time             DATETIME COMMENT '结束时间',
   STATUS               TINYINT(1) COMMENT '状态',
   click_count          INT COMMENT '点击数',
   url                  VARCHAR(500) COMMENT '广告详情连接地址',
   note                 VARCHAR(500) COMMENT '备注',
   sort                 INT COMMENT '排序',
   publisher_id         BIGINT COMMENT '发布者',
   auth_id              BIGINT COMMENT '审核者',
   PRIMARY KEY (id)
);

ALTER TABLE sms_home_adv COMMENT '首页轮播广告';

/*==============================================================*/
/* Table: sms_home_subject                                      */
/*==============================================================*/
CREATE TABLE sms_home_subject
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   NAME                 VARCHAR(200) COMMENT '专题名字',
   title                VARCHAR(255) COMMENT '专题标题',
   sub_title            VARCHAR(255) COMMENT '专题副标题',
   STATUS               TINYINT(1) COMMENT '显示状态',
   url                  VARCHAR(500) COMMENT '详情连接',
   sort                 INT COMMENT '排序',
   img                  VARCHAR(500) COMMENT '专题图片地址',
   PRIMARY KEY (id)
);

ALTER TABLE sms_home_subject COMMENT '首页专题表';

【jd首页下面很多专题，每个专题链?有碌囊趁妫故咀ㄌ馍唐沸畔ⅰ?;

/*==============================================================*/
/* Table: sms_home_subject_spu                                  */
/*==============================================================*/
CREATE TABLE sms_home_subject_spu
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   NAME                 VARCHAR(200) COMMENT '专题名字',
   subject_id           BIGINT COMMENT '专题id',
   spu_id               BIGINT COMMENT 'spu_id',
   sort                 INT COMMENT '排序',
   PRIMARY KEY (id)
);

ALTER TABLE sms_home_subject_spu COMMENT '专题商品';

/*==============================================================*/
/* Table: sms_member_price                                      */
/*==============================================================*/
CREATE TABLE sms_member_price
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   sku_id               BIGINT COMMENT 'sku_id',
   member_level_id      BIGINT COMMENT '会员等级id',
   member_level_name    VARCHAR(100) COMMENT '会员等级名',
   member_price         DECIMAL(18,4) COMMENT '会员对应价格',
   add_other            TINYINT(1) COMMENT '可否叠加其他优惠[0-不可叠加优惠，1-可叠加]',
   PRIMARY KEY (id)
);

ALTER TABLE sms_member_price COMMENT '商品会员价格';

/*==============================================================*/
/* Table: sms_seckill_promotion                                 */
/*==============================================================*/
CREATE TABLE sms_seckill_promotion
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   title                VARCHAR(255) COMMENT '活动标题',
   start_time           DATETIME COMMENT '开始日期',
   end_time             DATETIME COMMENT '结束日期',
   STATUS               TINYINT COMMENT '上下线状态',
   create_time          DATETIME COMMENT '创建时间',
   user_id              BIGINT COMMENT '创建人',
   PRIMARY KEY (id)
);

ALTER TABLE sms_seckill_promotion COMMENT '秒杀活动';

/*==============================================================*/
/* Table: sms_seckill_session                                   */
/*==============================================================*/
CREATE TABLE sms_seckill_session
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   NAME                 VARCHAR(200) COMMENT '场次名称',
   start_time           DATETIME COMMENT '每日开始时间',
   end_time             DATETIME COMMENT '每日结束时间',
   STATUS               TINYINT(1) COMMENT '启用状态',
   create_time          DATETIME COMMENT '创建时间',
   PRIMARY KEY (id)
);

ALTER TABLE sms_seckill_session COMMENT '秒杀活动场次';

/*==============================================================*/
/* Table: sms_seckill_sku_notice                                */
/*==============================================================*/
CREATE TABLE sms_seckill_sku_notice
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT 'member_id',
   sku_id               BIGINT COMMENT 'sku_id',
   session_id           BIGINT COMMENT '活动场次id',
   subcribe_time        DATETIME COMMENT '订阅时间',
   send_time            DATETIME COMMENT '发送时间',
   notice_type          TINYINT(1) COMMENT '通知方式[0-短信，1-邮件]',
   PRIMARY KEY (id)
);

ALTER TABLE sms_seckill_sku_notice COMMENT '秒杀商品通知订阅';

/*==============================================================*/
/* Table: sms_seckill_sku_relation                              */
/*==============================================================*/
CREATE TABLE sms_seckill_sku_relation
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   promotion_id         BIGINT COMMENT '活动id',
   promotion_session_id BIGINT COMMENT '活动场次id',
   sku_id               BIGINT COMMENT '商品id',
   seckill_price        DECIMAL COMMENT '秒杀价格',
   seckill_count        DECIMAL COMMENT '秒杀总量',
   seckill_limit        DECIMAL COMMENT '每人限购数量',
   seckill_sort         INT COMMENT '排序',
   PRIMARY KEY (id)
);

ALTER TABLE sms_seckill_sku_relation COMMENT '秒杀活动商品关联';

/*==============================================================*/
/* Table: sms_sku_full_reduction                                */
/*==============================================================*/
CREATE TABLE sms_sku_full_reduction
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   sku_id               BIGINT COMMENT 'spu_id',
   full_price           DECIMAL(18,4) COMMENT '满多少',
   reduce_price         DECIMAL(18,4) COMMENT '减多少',
   add_other            TINYINT(1) COMMENT '是否参与其他优惠',
   PRIMARY KEY (id)
);

ALTER TABLE sms_sku_full_reduction COMMENT '商品满减信息';

/*==============================================================*/
/* Table: sms_sku_ladder                                        */
/*==============================================================*/
CREATE TABLE sms_sku_ladder
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   sku_id               BIGINT COMMENT 'spu_id',
   full_count           INT COMMENT '满几件',
   discount             DECIMAL(4,2) COMMENT '打几折',
   price                DECIMAL(18,4) COMMENT '折后价',
   add_other            TINYINT(1) COMMENT '是否叠加其他优惠[0-不可叠加，1-可叠加]',
   PRIMARY KEY (id)
);

ALTER TABLE sms_sku_ladder COMMENT '商品阶梯价格';

/*==============================================================*/
/* Table: sms_spu_bounds                                        */
/*==============================================================*/
CREATE TABLE sms_spu_bounds
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   spu_id               BIGINT,
   grow_bounds          DECIMAL(18,4) COMMENT '成长积分',
   buy_bounds           DECIMAL(18,4) COMMENT '购物积分',
   WORK                 TINYINT(1) COMMENT '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]',
   PRIMARY KEY (id)
);

ALTER TABLE sms_spu_bounds COMMENT '商品spu积分设置';
