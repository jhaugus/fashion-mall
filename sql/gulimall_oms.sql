CREATE DATABASE IF NOT EXISTS gulimall_oms;
USE gulimall_oms;



DROP TABLE IF EXISTS oms_order;

DROP TABLE IF EXISTS oms_order_item;

DROP TABLE IF EXISTS oms_order_operate_history;

DROP TABLE IF EXISTS oms_order_return_apply;

DROP TABLE IF EXISTS oms_order_return_reason;

DROP TABLE IF EXISTS oms_order_setting;

DROP TABLE IF EXISTS oms_payment_info;

DROP TABLE IF EXISTS oms_refund_info;

/*==============================================================*/
/* Table: oms_order                                             */
/*==============================================================*/
CREATE TABLE oms_order
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   member_id            BIGINT COMMENT 'member_id',
   order_sn             CHAR(32) COMMENT '订单号',
   coupon_id            BIGINT COMMENT '使用的优惠券',
   create_time          DATETIME COMMENT 'create_time',
   member_username      VARCHAR(200) COMMENT '用户名',
   total_amount         DECIMAL(18,4) COMMENT '订单总额',
   pay_amount           DECIMAL(18,4) COMMENT '应付总额',
   freight_amount       DECIMAL(18,4) COMMENT '运费金额',
   promotion_amount     DECIMAL(18,4) COMMENT '促销优化金额（促销价、满减、阶梯价）',
   integration_amount   DECIMAL(18,4) COMMENT '积分抵扣金额',
   coupon_amount        DECIMAL(18,4) COMMENT '优惠券抵扣金额',
   discount_amount      DECIMAL(18,4) COMMENT '后台调整订单使用的折扣金额',
   pay_type             TINYINT COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
   source_type          TINYINT COMMENT '订单来源[0->PC订单；1->app订单]',
   STATUS               TINYINT COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
   delivery_company     VARCHAR(64) COMMENT '物流公司(配送方式)',
   delivery_sn          VARCHAR(64) COMMENT '物流单号',
   auto_confirm_day     INT COMMENT '自动确认时间（天）',
   integration          INT COMMENT '可以获得的积分',
   growth               INT COMMENT '可以获得的成长值',
   bill_type            TINYINT COMMENT '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
   bill_header          VARCHAR(255) COMMENT '发票抬头',
   bill_content         VARCHAR(255) COMMENT '发票内容',
   bill_receiver_phone  VARCHAR(32) COMMENT '收票人电话',
   bill_receiver_email  VARCHAR(64) COMMENT '收票人邮箱',
   receiver_name        VARCHAR(100) COMMENT '收货人姓名',
   receiver_phone       VARCHAR(32) COMMENT '收货人电话',
   receiver_post_code   VARCHAR(32) COMMENT '收货人邮编',
   receiver_province    VARCHAR(32) COMMENT '省份/直辖市',
   receiver_city        VARCHAR(32) COMMENT '城市',
   receiver_region      VARCHAR(32) COMMENT '区',
   receiver_detail_address VARCHAR(200) COMMENT '详细地址',
   note                 VARCHAR(500) COMMENT '订单备注',
   confirm_status       TINYINT COMMENT '确认收货状态[0->未确认；1->已确认]',
   delete_status        TINYINT COMMENT '删除状态【0->未删除；1->已删除】',
   use_integration      INT COMMENT '下单时使用的积分',
   payment_time         DATETIME COMMENT '支付时间',
   delivery_time        DATETIME COMMENT '发货时间',
   receive_time         DATETIME COMMENT '确认收货时间',
   comment_time         DATETIME COMMENT '评价时间',
   modify_time          DATETIME COMMENT '修改时间',
   PRIMARY KEY (id)
);

ALTER TABLE oms_order COMMENT '订单';

/*==============================================================*/
/* Table: oms_order_item                                        */
/*==============================================================*/
CREATE TABLE oms_order_item
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   order_id             BIGINT COMMENT 'order_id',
   order_sn             CHAR(32) COMMENT 'order_sn',
   spu_id               BIGINT COMMENT 'spu_id',
   spu_name             VARCHAR(255) COMMENT 'spu_name',
   spu_pic              VARCHAR(500) COMMENT 'spu_pic',
   spu_brand            VARCHAR(200) COMMENT '品牌',
   category_id          BIGINT COMMENT '商品分类id',
   sku_id               BIGINT COMMENT '商品sku编号',
   sku_name             VARCHAR(255) COMMENT '商品sku名字',
   sku_pic              VARCHAR(500) COMMENT '商品sku图片',
   sku_price            DECIMAL(18,4) COMMENT '商品sku价格',
   sku_quantity         INT COMMENT '商品购买的数量',
   sku_attrs_vals       VARCHAR(500) COMMENT '商品销售属性组合（JSON）',
   promotion_amount     DECIMAL(18,4) COMMENT '商品促销分解金额',
   coupon_amount        DECIMAL(18,4) COMMENT '优惠券优惠分解金额',
   integration_amount   DECIMAL(18,4) COMMENT '积分优惠分解金额',
   real_amount          DECIMAL(18,4) COMMENT '该商品经过优惠后的分解金额',
   gift_integration     INT COMMENT '赠送积分',
   gift_growth          INT COMMENT '赠送成长值',
   PRIMARY KEY (id)
);

ALTER TABLE oms_order_item COMMENT '订单项信息';

/*==============================================================*/
/* Table: oms_order_operate_history                             */
/*==============================================================*/
CREATE TABLE oms_order_operate_history
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   order_id             BIGINT COMMENT '订单id',
   operate_man          VARCHAR(100) COMMENT '操作人[用户；系统；后台管理员]',
   create_time          DATETIME COMMENT '操作时间',
   order_status         TINYINT COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
   note                 VARCHAR(500) COMMENT '备注',
   PRIMARY KEY (id)
);

ALTER TABLE oms_order_operate_history COMMENT '订单操作历史记录';

/*==============================================================*/
/* Table: oms_order_return_apply                                */
/*==============================================================*/
CREATE TABLE oms_order_return_apply
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   order_id             BIGINT COMMENT 'order_id',
   sku_id               BIGINT COMMENT '退货商品id',
   order_sn             CHAR(32) COMMENT '订单编号',
   create_time          DATETIME COMMENT '申请时间',
   member_username      VARCHAR(64) COMMENT '会员用户名',
   return_amount        DECIMAL(18,4) COMMENT '退款金额',
   return_name          VARCHAR(100) COMMENT '退货人姓名',
   return_phone         VARCHAR(20) COMMENT '退货人电话',
   STATUS               TINYINT(1) COMMENT '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
   handle_time          DATETIME COMMENT '处理时间',
   sku_img              VARCHAR(500) COMMENT '商品图片',
   sku_name             VARCHAR(200) COMMENT '商品名称',
   sku_brand            VARCHAR(200) COMMENT '商品品牌',
   sku_attrs_vals       VARCHAR(500) COMMENT '商品销售属性(JSON)',
   sku_count            INT COMMENT '退货数量',
   sku_price            DECIMAL(18,4) COMMENT '商品单价',
   sku_real_price       DECIMAL(18,4) COMMENT '商品实际支付单价',
   reason               VARCHAR(200) COMMENT '原因',
   description述         VARCHAR(500) COMMENT '描述',
   desc_pics            VARCHAR(2000) COMMENT '凭证图片，以逗号隔开',
   handle_note          VARCHAR(500) COMMENT '处理备注',
   handle_man           VARCHAR(200) COMMENT '处理人员',
   receive_man          VARCHAR(100) COMMENT '收货人',
   receive_time         DATETIME COMMENT '收货时间',
   receive_note         VARCHAR(500) COMMENT '收货备注',
   receive_phone        VARCHAR(20) COMMENT '收货电话',
   company_address      VARCHAR(500) COMMENT '公司收货地址',
   PRIMARY KEY (id)
);

ALTER TABLE oms_order_return_apply COMMENT '订单退货申请';

/*==============================================================*/
/* Table: oms_order_return_reason                               */
/*==============================================================*/
CREATE TABLE oms_order_return_reason
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   NAME                 VARCHAR(200) COMMENT '退货原因名',
   sort                 INT COMMENT '排序',
   STATUS               TINYINT(1) COMMENT '启用状态',
   create_time          DATETIME COMMENT 'create_time',
   PRIMARY KEY (id)
);

ALTER TABLE oms_order_return_reason COMMENT '退货原因';

/*==============================================================*/
/* Table: oms_order_setting                                     */
/*==============================================================*/
CREATE TABLE oms_order_setting
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   flash_order_overtime INT COMMENT '秒杀订单超时关闭时间(分)',
   normal_order_overtime INT COMMENT '正常订单超时时间(分)',
   confirm_overtime     INT COMMENT '发货后自动确认收货时间（天）',
   finish_overtime      INT COMMENT '自动完成交易时间，不能申请退货（天）',
   comment_overtime     INT COMMENT '订单完成后自动好评时间（天）',
   member_level         TINYINT(2) COMMENT '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】',
   PRIMARY KEY (id)
);

ALTER TABLE oms_order_setting COMMENT '订单配置信息';

/*==============================================================*/
/* Table: oms_payment_info                                      */
/*==============================================================*/
CREATE TABLE oms_payment_info
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   order_sn             CHAR(32) COMMENT '订单号（对外业务号）',
   order_id             BIGINT COMMENT '订单id',
   alipay_trade_no      VARCHAR(50) COMMENT '支付宝交易流水号',
   total_amount         DECIMAL(18,4) COMMENT '支付总金额',
   SUBJECT              VARCHAR(200) COMMENT '交易内容',
   payment_status       VARCHAR(20) COMMENT '支付状态',
   create_time          DATETIME COMMENT '创建时间',
   confirm_time         DATETIME COMMENT '确认时间',
   callback_content     VARCHAR(4000) COMMENT '回调内容',
   callback_time        DATETIME COMMENT '回调时间',
   PRIMARY KEY (id)
);

ALTER TABLE oms_payment_info COMMENT '支付信息表';

/*==============================================================*/
/* Table: oms_refund_info                                       */
/*==============================================================*/
CREATE TABLE oms_refund_info
(
   id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
   order_return_id      BIGINT COMMENT '退款的订单',
   refund               DECIMAL(18,4) COMMENT '退款金额',
   refund_sn            VARCHAR(64) COMMENT '退款交易流水号',
   refund_status        TINYINT(1) COMMENT '退款状态',
   refund_channel       TINYINT COMMENT '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
   refund_content       VARCHAR(5000),
   PRIMARY KEY (id)
);

ALTER TABLE oms_refund_info COMMENT '退款信息';
