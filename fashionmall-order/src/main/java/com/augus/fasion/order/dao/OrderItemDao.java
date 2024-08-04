package com.augus.fasion.order.dao;

import com.augus.fasion.order.entity.OrderItemEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单项信息
 * 
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:39:18
 */
@Mapper
public interface OrderItemDao extends BaseMapper<OrderItemEntity> {
	
}
