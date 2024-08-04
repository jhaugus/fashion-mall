package com.augus.fasion.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.ware.entity.PurchaseDetailEntity;

import java.util.Map;

/**
 * 
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:50:18
 */
public interface PurchaseDetailService extends IService<PurchaseDetailEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

