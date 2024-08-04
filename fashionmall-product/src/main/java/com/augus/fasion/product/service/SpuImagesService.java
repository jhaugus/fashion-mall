package com.augus.fasion.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.product.entity.SpuImagesEntity;

import java.util.Map;

/**
 * spu图片
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-07-29 23:23:06
 */
public interface SpuImagesService extends IService<SpuImagesEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

