package com.augus.fasion.member.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.augus.common.utils.PageUtils;
import com.augus.fasion.member.entity.MemberEntity;

import java.util.Map;

/**
 * 会员
 *
 * @author augus
 * @email 724971721@qq.com
 * @date 2024-08-04 22:37:57
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

