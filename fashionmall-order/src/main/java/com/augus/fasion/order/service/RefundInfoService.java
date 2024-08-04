package com.augus.fasion.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.order.entity.RefundInfoEntity;

import java.util.Map;

/**
 * 退款信息
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:39:17
 */
public interface RefundInfoService extends IService<RefundInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

