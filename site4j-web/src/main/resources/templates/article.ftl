<#include "include/macros.ftl">
<@header title="${article.title} | ${config.siteName}"
keywords="${article.keywords?if_exists},${config.siteName}"
description="${article.description?if_exists}"
canonical="/article/${article.id}">

<style>
    .CodeMirror {
        padding: 0px;
    }

    .CodeMirror, .CodeMirror-scroll {
        min-height: 130px;
        max-height: 200px;
    }

    .CodeMirror .cm-spell-error:not(.cm-url):not(.cm-comment):not(.cm-tag):not(.cm-word) {
        background: none;
    }

    .editor-statusbar {
        display: none;
    }

    .editor-preview {
        overflow-y: initial !important;
    }

</style>
</@header>

<#if article.coverImage?exists>
<img src="${config.qiuniuBasePath}${article.coverImage?if_exists}"
     onerror="this.src='${config.staticWebSite}/img/default_article_cover.jpg'" style="display: none;" id="cover-img">
</#if>
<div class="container custome-container">

    <div class="row">
        <div class="blog-main">
            <div class="blog-body overflow-initial fade-in">
                <div class="article-flag">
                <#if article.original?string('true','false') == 'true'>
                    <span class="article-blockquote article-blockquote-green"></span>
                    <span class="article-original article-original-green">
                            <a href="${config.siteUrl}/article/${article.id}">原创</a>
                        </span>

                    <span class="blog-info-meta" style="margin-left: 80px">转载请注明出处 - @SITE4J</span>

                    <div class="blog-info-meta pull-right">
                        <ul class="list-unstyled list-inline">
                            <li><i class="fa fa-clock-o fa-fw"></i>发表于 ${article.createTime}</li>
                            <li><i class="fa fa-eye fa-fw"></i><a class="pointer"

                                                                  >浏览 (
                                <num>${article.lookCount!(0)}</num>
                                )</a></li>
                            <li><a href="#comment-box" ><i class="fa fa-comments-o fa-fw"></i>评论
                                (${article.commentCount!(0)})</a></li>
                        </ul>
                    </div>
                <#else>
                    <span class="article-blockquote article-blockquote-red"></span>
                    <span class="article-original article-original-red">
                            <a href="${config.siteUrl}/article/${article.id}">转载</a>
                        </span>


                        <span class="blog-info-meta" style="margin-left: 80px">原文作者： ${article.originalAuthor}</span>
                        <span class="blog-info-meta">原文链接： <a target="_blank" href="${article.originalLink}"
                        >${article.originalLink}</a></span>


                    <div class="blog-info-meta pull-right">
                        <ul class="list-unstyled list-inline">
                            <li><i class="fa fa-clock-o fa-fw"></i>转载于 ${article.createTime}</li>
                            <li><i class="fa fa-eye fa-fw"></i><a class="pointer"
                                                                  >浏览 (
                                <num>${article.lookCount!(0)}</num>
                                )</a></li>
                            <li><a href="#comment-box" ><i class="fa fa-comments-o fa-fw"></i>评论
                                (${article.commentCount!(0)})</a></li>
                        </ul>
                    </div>
                </#if>

                </div>


                <div class="blog-info overflow-initial">
                    <div class="bottom-line">
                        <h1 class="blog-info-title">
                            <i class="fa fa-newspaper-o"></i>
                            <strong>${article.title}</strong>
                        </h1>
                    </div>

                    <div id="site4j-body" class="blog-info-body ${article.markdown?string('markdown-body editor-preview-active-side', '')}">
                    ${article.content}
                    </div>
                    <div class="separateline"></div>


                </div>
            </div>
            <div class="blog-body article-tag" style="margin-left: 10px;">
                <div class="cat">
                    <ul class="list-unstyled">
                        <li>
                            <strong>支持一下：</strong>
                            <a href="javascript:;" data-id="${article.id}" ><i class="fa fa-thumbs-up"></i>赞 <i class="count"> ${article.loveCount!(0)}</i> </a>
                        </li>
                        <li>
                            <strong>所属分类：</strong>
                            <a href="${config.siteUrl}/type/${article.typeId}">${article.type.name}</a>
                        </li>
                        <li>
                            <strong>本文标签：</strong>
                            <#list article.tags as item>
                                <a href="${config.siteUrl}/tag/${item.id}" class="c-label" target="_blank">${item.name}</a>
                            </#list>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="separateline"></div>

            <div class="blog-body prev-next">
                <nav class="nav-single wow" data-wow-delay="0.3s">
                <#if other.prev>
                    <a href="${config.siteUrl}/article/${other.prev.id}" rel="prev">
                            <span class="meta-nav"><span class="post-nav"><i
                                    class="fa fa-angle-left"></i> 上一篇</span>
                                <br>${other.prev.title}
                            </span>
                    </a>
                <#else >
                    <a href="javascript:void(0)" rel="nofollow prev">
                            <span class="meta-nav" ><span class="post-nav"><i
                                    class="fa fa-angle-left"></i> 上一篇</span>
                                <br>已经到第一篇了
                            </span>
                    </a>
                </#if>
                <#if other.next>
                    <a href="${config.siteUrl}/article/${other.next.id}" rel="next">
                            <span class="meta-nav" ><span class="post-nav">下一篇 <i
                                    class="fa fa-angle-right"></i></span>
                                <br>${other.next.title}
                            </span>
                    </a>
                <#else >
                    <a href="${config.siteUrl}/article/1" rel="nofollow next">
                            <span class="meta-nav" ><span class="post-nav">下一篇 <i
                                    class="fa fa-angle-right"></i></span>
                                <br>已经到最后一篇了
                            </span>
                    </a>
                </#if>
                    <div class="clear"></div>
                </nav>
            </div>

            <div class="separateline"></div>
        <#-- 热门推荐 -->
            <div class="blog-body clear overflow-initial">
                <h4 ><i class="fa fa-fire icon"></i><strong>热门推荐</strong></h4>
                <ul class="list-unstyled">
                <@articleTag method="hotList" pageSize="4">
                    <#if hotList?exists && (hotList?size > 0)>
                        <#list hotList as item>
                            <li class="line-li">
                                <div class="line-container">
                                    <div class="line-left">
                                        <#if item.coverImage?exists>
                                            <img class="lazy-img"
                                                 data-original="${config.qiuniuBasePath}${item.coverImage}" width="50"
                                                 height="50" rel="external nofollow"/>
                                        <#else>
                                            <img class="lazy-img"
                                                 data-original="${config.staticWebSite}/img/favicon.svg" width="50"
                                                 height="50" rel="external nofollow"/>
                                        </#if>
                                    </div>
                                    <div class="line-right">
                                        <div class="text">
                                            <a href="${config.siteUrl}/article/${item.id}" >
                                            ${item.title}
                                            </a>
                                        </div>
                                        <div class="text">
                                        <#--<div style="display: inline-block">热门指数：</div>-->
                                        <#--<div class="rating ignore" data-star="5"></div>-->
                                            <span class="views"  ><i
                                                    class="fa fa-eye fa-fw"></i>浏览(${item.lookCount!(0)})</span>
                                            <span class="comment"  >
                                                <a href="${config.siteUrl}/article/${item.id}#comment-box"
                                                   rel="external nofollow">
                                                    <i class="fa fa-comments-o fa-fw"></i>评论(${item.commentCount!(0)})
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    </#if>
                </@articleTag>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="separateline"></div>
        <#-- 相关文章 -->
            <div class="blog-body clear overflow-initial">
                <h4 ><i class="fa fa-google-wallet icon"></i><strong>相关文章</strong></h4>
                <ul class="list-unstyled">
                <#list relatedList as item>
                    <li class="line-li">
                        <div class="line-container">
                            <div class="line-right">
                                <div class="text">
                                    <a href="${config.siteUrl}/article/${item.id}"
                                       >
                                    ${item.title}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </#list>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="separateline"></div>
        <#--评论-->
        <#if article.comment>
            <div class="blog-body clear overflow-initial expansion">
                <div id="comment-box" data-id="${article.id}"></div>
            </div>
        <#else>
            <div class="blog-body clear overflow-initial expansion gray">
                <i class="fa fa-close fa-fw"></i>该篇文章的评论功能已被站长关闭
            </div>
        </#if>
        </div>

    </div>
</div>
<@footer>

<script type="text/javascript">

    //生成目录索引列表

    function GenerateContentList()

    {

        var jquery_h3_list = $('#site4j-body h1');//如果你的章节标题不是h3,只需要将这里的h3换掉即可

        if(jquery_h3_list.length>0)

        {

            var content = '<a name="_labelTop"></a>';

            content += '<div id="navCategory">';

            content += '<h1>阅读目录</h1>';

            content += '<ul>';

            for(var i =0;i<jquery_h3_list.length;i++)

            {

                var go_to_top = '<div style="text-align: right;height:1px;"><a href="#_labelTop"></a><a name="_label' + i + '"></a></div>';

                $(jquery_h3_list[i]).before(go_to_top);

                var li_content = '<li><a href="#_label' + i + '">' + $(jquery_h3_list[i]).text() + '</a></li>';

                content += li_content;

            }

            content += '</ul>';

            content += '</div>';

            if($('#site4j-body').length != 0 )

            {

                $($('#site4j-body')[0]).prepend(content);

            }

        }

    }

    GenerateContentList();

</script>

</@footer>
