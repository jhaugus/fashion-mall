package com.augus.fasion.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.product.entity.SkuInfoEntity;

import java.util.Map;

/**
 * sku信息
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-07-29 23:23:06
 */
public interface SkuInfoService extends IService<SkuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

