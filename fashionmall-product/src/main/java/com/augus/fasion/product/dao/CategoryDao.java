package com.augus.fasion.product.dao;

import com.augus.fasion.product.entity.CategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品三级分类
 * 
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-07-29 23:23:06
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {
	
}
