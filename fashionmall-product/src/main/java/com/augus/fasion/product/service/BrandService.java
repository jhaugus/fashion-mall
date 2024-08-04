package com.augus.fasion.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.product.entity.BrandEntity;

import java.util.Map;

/**
 * 品牌
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-07-29 23:23:06
 */
public interface BrandService extends IService<BrandEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

