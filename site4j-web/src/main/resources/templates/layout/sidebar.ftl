<div class="col-sm-3 blog-sidebar">



    <div class="sidebar-module">
        <h5 class="sidebar-title"><strong><i class="fa fa-tags icon"></i>文章标签</strong></h5>
        <ul class="list-unstyled list-inline">
        <@site4jTag method="tagsList" pageSize="10">
            <#if tagsList?exists && (tagsList?size > 0)>
                <#list tagsList as item>
                    <li class="tag-li">
                        <a class="btn btn-default btn-xs" href="${config.siteUrl}/tag/${item.id}"
                            data-toggle="tooltip" data-placement="bottom">
                        ${item.name?if_exists}
                        </a>
                    </li>
                </#list>
            </#if>
        </@site4jTag>
        </ul>
    </div>

    <div class="sidebar-module">
        <h5 class="sidebar-title"><strong><i class="fa fa-search icon"></i>搜索一下</strong></h5>
        <div class="modal-body" style="padding: 0px">
            <form action="/" method="get" class="form-horizontal searchForm" id="searchForm">
                <input type="hidden" name="pageNumber" value="1">
                <div class="input-group bottom-line">
                    <input type="text" class="form-control br-none" name="keywords" value="${model.keywords}"
                           required="required" placeholder="输入搜索内容">
                    <span class="input-group-btn">
                        <button class="btn btn-default br-none nav-search-btn pointer" type="submit"><i
                                class="fa fa-search"></i> 搜索</button>
                    </span>
                </div>
                <div class="clear"></div>

                <ul class="list-unstyled list-inline search-hot">
                    <li><strong style="position: relative;top: 2px;color: #999999;">热门搜索：</strong></li>
                    <@searchLabel method="hotSearch" pageSize="10">
                        <#if hotSearch?? && hotSearch?size gt 0>
                            <#list hotSearch as item>
                                <li>
                                    <a class="pointer" rel="external nofollow">
                                        <span class="label label-warning">${item.keyWord}</span>
                                    </a>
                                </li>
                            </#list>
                        </#if>
                    </@searchLabel>
                </ul>

                <ul class="list-unstyled list-inline search-hot">
                    <li><strong style="position: relative;top: 2px;color: #999999;">最新搜索：</strong></li>
                    <@searchLabel method="recentSearch" pageSize="10">
                        <#if recentSearch?? && recentSearch?size gt 0>
                            <#list recentSearch as item>
                                <li>
                                    <a class="pointer" rel="external nofollow">
                                        <span class="label label-info">${item.keyWord}</span>
                                    </a>
                                </li>
                            </#list>
                        </#if>
                    </@searchLabel>
                </ul>

            </form>
        </div>
    </div>

    <div class="sidebar-module">
        <h5 class="sidebar-title"><strong><i class="fa fa-list"></i>近期文章</strong></h5>
        <div class="tab-content" >
        <ol class="list-unstyled">
        <@articleTag method="recentArticles" pageSize="10">
            <#if recentArticles?exists && (recentArticles?size > 0)>
                <#list recentArticles as item>
                    <li>
                        <span class="li-icon li-icon-${item_index + 1}">${item_index + 1}</span>
                        <a href="${config.siteUrl}/article/${item.id}"
                           data-toggle="tooltip" data-placement="bottom">
                        ${item.title}
                        </a>
                    </li>
                </#list>
            </#if>
        </@articleTag>
        </ol>
        </div>
    </div>

    <div class="sidebar-module">
        <h5 class="sidebar-title"><strong><i class="fa fa-thumbs-o-up"></i>站长推荐</strong></h5>
        <div class="tab-content" >
            <ol class="list-unstyled">
            <@articleTag method="recommendedList" pageSize="10">
                <#if recommendedList?exists && (recommendedList?size > 0)>
                    <#list recommendedList as item>
                        <li>
                            <span class="li-icon li-icon-${item_index + 1}">${item_index + 1}</span>
                            <a href="${config.siteUrl}/article/${item.id}"
                               data-toggle="tooltip" data-placement="bottom">
                            ${item.title}
                            </a>
                        </li>
                    </#list>
                </#if>
            </@articleTag>
            </ol>
        </div>
    </div>

    <div class="sidebar-module">
        <h5 class="sidebar-title"><strong><i class="fa fa-hand-peace-o"></i>热门文章</strong></h5>
        <div class="tab-content" >
            <ol class="list-unstyled">
            <@articleTag method="hotList" pageSize="10">
                <#if hotList?exists && (hotList?size > 0)>
                    <#list hotList as item>
                        <li>
                            <span class="li-icon li-icon-${item_index + 1}">${item_index + 1}</span>
                            <a href="${config.siteUrl}/article/${item.id}"
                               data-toggle="tooltip" data-placement="bottom">
                            ${item.title}
                            </a>
                        </li>
                    </#list>
                </#if>
            </@articleTag>
            </ol>
        </div>
    </div>

<@site4jTag method="recentComments" pageSize="10">
    <#if recentComments?? && recentComments?size gt 0>
        <div class="sidebar-module">
            <h5 class="sidebar-title"><strong><i class="fa fa-comments icon"></i>近期评论</strong></h5>
            <ul class="list-unstyled list-inline comments">
                <#list recentComments as item>
                    <li>
                        <a href="${item.sourceUrl}#comment-${item.id}"
                           rel="external nofollow" data-toggle="tooltip" data-placement="bottom">
                            <img alt="${item.nickname?if_exists}" src="${item.avatar?if_exists}"
                                 class="avatar auto-shake" height="64" width="64"
                                 onerror="this.src='${config.staticWebSite}/img/user.png'"/>
                            <span class="comment-author">${item.nickname?if_exists}</span> ${item.briefContent?if_exists}
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </#if>
</@site4jTag>

    <div class="clear"></div>

</div>