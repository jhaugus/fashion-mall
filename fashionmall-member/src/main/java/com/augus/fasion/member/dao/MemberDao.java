package com.augus.fasion.member.dao;

import com.augus.fasion.member.entity.MemberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员
 * 
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-04 22:37:57
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {
	
}
