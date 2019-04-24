/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.front;

import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleQueryDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysLinkService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import com.github.peterchenhdu.site4j.enums.ArticleStatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 页面跳转类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Controller
public class RenderController {
    /**
     * sidebar部分的推荐、近期和随机tab页中显示的文章数
     */
    private static final int SIDEBAR_ARTICLE_SIZE = 4;
    private static final String INDEX_URL = "index";

    @Autowired
    private BizArticleService bizArticleService;
    @Autowired
    private SysLinkService sysLinkService;


    /**
     * 加载首页的数据
     *
     * @param vo
     * @param model
     * @return
     */
    private void loadIndexPage(ArticleQueryDto vo, Model model) {
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        PageInfoDto<ArticleDto> pageInfo = bizArticleService.query(vo);
        model.addAttribute("page", pageInfo);

        model.addAttribute("model", vo);
    }

    /**
     * 首页
     *
     * @param vo
     * @param model
     * @return
     */
    @RequestMapping("/")
    public ModelAndView home(ArticleQueryDto vo, Model model) {
        model.addAttribute("url", INDEX_URL);
//        loadIndexPage(vo, model);
        model.addAttribute("defaultIndex", true);
        return ResultUtils.view(INDEX_URL);
    }

    /**
     * 首页（分页）
     *
     * @param pageNumber
     * @param vo
     * @param model
     * @return
     */
    @RequestMapping("/index/{pageNumber}")
    public ModelAndView type(@PathVariable("pageNumber") Integer pageNumber, ArticleQueryDto vo, Model model) {
        vo.setPageNumber(pageNumber);
        model.addAttribute("url", INDEX_URL);
        loadIndexPage(vo, model);

        return ResultUtils.view(INDEX_URL);
    }

    /**
     * 分类列表
     *
     * @param typeId
     * @param model
     * @return
     */
    @GetMapping("/type/{typeId}")
    public ModelAndView type(@PathVariable("typeId") String typeId, Model model) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setTypeIdList(Arrays.asList(typeId.split(",")));
        model.addAttribute("url", "type/" + typeId);
        loadIndexPage(vo, model);

        return ResultUtils.view(INDEX_URL);
    }

    /**
     * 分类列表（分页）
     *
     * @param typeId
     * @param pageNumber
     * @param model
     * @return
     */
    @GetMapping("/type/{typeId}/{pageNumber}")
    public ModelAndView type(@PathVariable("typeId") String typeId, @PathVariable("pageNumber") Integer pageNumber, Model model) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setTypeIdList(Arrays.asList(typeId.split(",")));
        vo.setPageNumber(pageNumber);
        model.addAttribute("url", "type/" + typeId);
        loadIndexPage(vo, model);

        return ResultUtils.view(INDEX_URL);
    }

    /**
     * 标签列表
     *
     * @param tagId
     * @param model
     * @return
     */
    @GetMapping("/tag/{tagId}")
    public ModelAndView tag(@PathVariable("tagId") String tagId, Model model) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setTagId(tagId);
        model.addAttribute("url", "tag/" + tagId);
        loadIndexPage(vo, model);

        return ResultUtils.view(INDEX_URL);
    }

    /**
     * 标签列表（分页）
     *
     * @param tagId
     * @param pageNumber
     * @param model
     * @return
     */
    @GetMapping("/tag/{tagId}/{pageNumber}")
    public ModelAndView tag(@PathVariable("tagId") String tagId, @PathVariable("pageNumber") Integer pageNumber, Model model) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setTagId(tagId);
        vo.setPageNumber(pageNumber);
        model.addAttribute("url", "tag/" + tagId);
        loadIndexPage(vo, model);

        return ResultUtils.view(INDEX_URL);
    }

    /**
     * 文章详情
     *
     * @param model
     * @param articleId
     * @return
     */
    @GetMapping("/article/{articleId}")
    public ModelAndView article(Model model, @PathVariable("articleId") String articleId) {
        ArticleDto article = bizArticleService.queryById(articleId);
        if (article == null || ArticleStatusEnum.UNPUBLISHED.getCode() == article.getStatusEnum().getCode()) {
            return ResultUtils.redirect("/error/404");
        }
        model.addAttribute("article", article);
        // 上一篇下一篇
        model.addAttribute("other", bizArticleService.getPrevAndNextArticles(article.getCreateTime()));
        // 相关文章
        model.addAttribute("relatedList", bizArticleService.listRelatedArticle(SIDEBAR_ARTICLE_SIZE, article));
        model.addAttribute("articleDetail", true);
        return ResultUtils.view("article");
    }



    /**
     * 留言板
     *
     * @return
     */
    @GetMapping("/guestbook")
    public ModelAndView guestbook() {
        return ResultUtils.view("guestbook");
    }

    /**
     * 归档目录
     *
     * @param model
     * @return
     */
    @GetMapping("/archives")
    public ModelAndView archives(Model model) {
        Map<String, List> map = bizArticleService.listArchives();
        model.addAttribute("archives", map);
        return ResultUtils.view("archives");
    }

    /**
     * 站长推荐
     *
     * @param model
     * @return
     */
    @GetMapping("/recommended")
    public ModelAndView recommended(Model model) {
        model.addAttribute("list", bizArticleService.listRecommended(100));
        return ResultUtils.view("recommended");
    }





}
