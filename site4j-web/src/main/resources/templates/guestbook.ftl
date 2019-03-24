<#include "include/macros.ftl">
<@header title="留言板 | ${config.siteName}"
keywords="${config.siteName},留言板,原创博客留言,个人原创网站,个人技术博客"
description="我的留言板,欢迎给我的个人原创博客留言 - ${config.siteName}"
canonical="/guestbook">

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

    /*ul {*/
        /*list-style: none;*/
        /*margin-left: 0;*/
        /*padding-left: 0;*/
    /*}*/
</style>
</@header>

<div class="container custome-container">
    <nav class="breadcrumb">
        <a class="crumbs"  href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i
                class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>留言板
    </nav>
    <div class="row">
    <#--<@blogHeader title="留言板"></@blogHeader>-->
        <div class="col-sm-12 blog-main">
            <div class="blog-body expansion">
                <div class="alert alert-default alert-dismissible" role="alert" style="padding: 0px;">
                    <ul>
                        <li><i class="fa fa-lightbulb-o fa-fw"></i>
                            随便留言，文明和谐的留言才能显示...</li>
                        <li><i class="fa fa-lightbulb-o fa-fw"></i>
                            如果您对本站有什么建议，欢迎留言反馈，以便做的更好...</li>
                    </ul>
                </div>
            </div>
        </div>
    <#if config.comment>
        <div class="col-sm-12 blog-main">
            <div class="blog-body expansion">
                <div id="comment-box" data-id="-1"></div>
            </div>
        </div>
    <#else>
        <div class="blog-body clear overflow-initial expansion gray">
            <i class="fa fa-close fa-fw"></i>评论功能已被站长关闭
        </div>
    </#if>
    </div>
</div>

<@footer>

</@footer>
