/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt.impl;

import club.peterchenhdu.biz.dto.ArticleLookDto;
import club.peterchenhdu.biz.entity.BizArticleLook;
import club.peterchenhdu.biz.mapper.BizArticleLookMapper;
import club.peterchenhdu.biz.service.articlemgt.BizArticleLookService;
import club.peterchenhdu.common.util.EntityUtils;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.PageUtils;
import club.peterchenhdu.biz.web.vo.BizArticleLookConditionVo;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 文章浏览记录
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class BizArticleLookServiceImpl extends ServiceImpl<BizArticleLookMapper, BizArticleLook> implements BizArticleLookService {

    @Override
    @Transactional
    public ArticleLookDto insert(ArticleLookDto articleLookDto) {
        EntityUtils.preInsert(articleLookDto.getBizArticleLook());
        this.baseMapper.insert(articleLookDto.getBizArticleLook());
        return articleLookDto;
    }


    @Override
    public PageInfo<BizArticleLook> findPageBreakByCondition(BizArticleLookConditionVo vo) {
        Wrapper<BizArticleLook> wrapper = new EntityWrapper<>();
        wrapper.orderBy("create_time", false);

        Page<BizArticleLook> page = PageUtils.getPage(vo);
        List<BizArticleLook> list = this.baseMapper.selectPage(page, wrapper);
        return PageUtils.getPageInfo(page, list);
    }

}
