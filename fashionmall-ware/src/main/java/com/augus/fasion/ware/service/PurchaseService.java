package com.augus.fasion.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.ware.entity.PurchaseEntity;

import java.util.Map;

/**
 * 采购信息
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:50:18
 */
public interface PurchaseService extends IService<PurchaseEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

