package com.augus.fasion.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * sku销售属性值
 * 
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-07-29 23:23:06
 */
@Data
@TableName("pms_sku_sale_attr_value")
public class SkuSaleAttrValueEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * sku_id
	 */
	private Long skuId;
	/**
	 * attr_id
	 */
	private Long attrId;
	/**
	 * 销售属性名
	 */
	private String attrName;
	/**
	 * 销售属性值
	 */
	private String attrValue;
	/**
	 * 顺序
	 */
	private Integer attrSort;

}
