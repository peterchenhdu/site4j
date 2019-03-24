/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt;


import club.peterchenhdu.biz.dto.ArticleLookDto;
import club.peterchenhdu.biz.entity.BizArticleLook;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.biz.web.vo.BizArticleLookConditionVo;
import com.baomidou.mybatisplus.service.IService;

/**
 * 文章浏览记录
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizArticleLookService extends IService<BizArticleLook> {

    ArticleLookDto insert(ArticleLookDto entity);

    PageInfo<BizArticleLook> findPageBreakByCondition(BizArticleLookConditionVo vo);
}
