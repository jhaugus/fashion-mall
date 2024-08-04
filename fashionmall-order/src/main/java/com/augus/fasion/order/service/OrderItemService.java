package com.augus.fasion.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.order.entity.OrderItemEntity;

import java.util.Map;

/**
 * 订单项信息
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:39:18
 */
public interface OrderItemService extends IService<OrderItemEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

