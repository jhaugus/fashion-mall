package com.augus.fasion.ware.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 商品库存
 * 
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:50:18
 */
@Data
@TableName("wms_ware_sku")
public class WareSkuEntity implements Serializable {
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
	 * 仓库id
	 */
	private Long wareId;
	/**
	 * 库存数
	 */
	private Integer stock;
	/**
	 * sku_name
	 */
	private String skuName;
	/**
	 * 锁定库存
	 */
	private Integer stockLocked;

}
