package com.augus.fasion.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.ware.entity.WareSkuEntity;

import java.util.Map;

/**
 * 商品库存
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-05 00:50:18
 */
public interface WareSkuService extends IService<WareSkuEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

