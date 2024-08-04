package com.augus.fasion.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.order.entity.OrderEntity;

import java.util.Map;

/**
 * 订单
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:39:18
 */
public interface OrderService extends IService<OrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

