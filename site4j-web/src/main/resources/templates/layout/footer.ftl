
<!--评论弹框-->
<div class="modal fade bs-example-modal-sm" id="comment-detail-modal" tabindex="-1" role="dialog"
     aria-labelledby="comment-detail-modal-label">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="comment-detail-modal-label">评论信息框</h4>
                <small><i class="fa fa-lightbulb-o fa-fw"></i>可以通过QQ号实时获取昵称和头像</small>
            </div>
            <div class="modal-body">
                <form id="detail-form">
                    <input type="hidden" name="avatar">
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="qq" placeholder="选填" value="">
                        <img class="pull-left hide" alt="">
                        <span class="fa fa-qq pull-left" aria-hidden="true">QQ</span>
                    </div>
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="nickname" placeholder="必填" value="匿名">
                        <span class="fa fa-user pull-left" aria-hidden="true">昵称</span>
                    </div>
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="email" placeholder="选填">
                        <span class="fa fa-envelope pull-left" aria-hidden="true">邮箱</span>
                    </div>
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="url" placeholder="选填">
                        <span class="fa fa-globe pull-left" aria-hidden="true">网址</span>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-default btn-sm" id="detail-form-btn"><i
                                class="fa fa-smile-o"></i>提交评论
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="loading">
    <div class="filter"></div>
    <div class="loader">
        <div class="loading-1"></div>
        <div class="loading-2">Loading...</div>
    </div>
</div>

<div class="clear blog-footer">

    <div class="container">
        <div class="row">
            <div class="footer-about col-md-6 col-sm-12" id="about"><h4>关于 Site4J</h4>
                <p>本站为非商业化站点，全称为Site For Java，主要用于分享学习总结Java相关技术，记录的都是平时工作开发过程中遇到的问题以及相关知识分享。
                </p>
                <p>关于版权：本站含原创文章及转载文章，本站所有转载的文章，都会在文章开头注明原文出处，
                    若因此对原作者造成侵权，请原作者联系删除，谢谢~</p>
                <p>关于站长：<a target="_blank" href="https://www.cnblogs.com/chenpi/">风一样的码农</a></p>
                <p>反馈或建议请发送邮件至：cp_hdu@163.com</p>
            </div>

            <div class="footer-links col-md-3 col-sm-12"><h4>友情链接</h4>
                <ul class="list-unstyled list-inline">
                <@site4jTag method="linkList">
                    <#list linkList as item>
                        <li>
                            <a href="${item.url}" target="_blank">
                            ${item.name?if_exists}
                            </a>
                        </li>
                    </#list>
                </@site4jTag>

                </ul>
            </div>
            <div class="footer-techs col-md-3 col-sm-12"><h4>其他资源</h4>
                <ul class="list-unstyled list-inline">
                    <li>
                        <a href="guestbook" target="_blank">问题反馈</a>
                    </li>
                    <li><a href="${config.siteUrl}/recommended" target="_blank"> 站长推荐</a></li>
                    <li><a href="${config.siteUrl}/archives" target="_blank">归档统计</a></li>
                    <li><a href="${config.siteUrl}/sitemap.html" target="_blank">网站地图</a></li>
                    <li><a href="${config.siteUrl}/admin" target="_blank">后台管理</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="clear">
        <p>Copyright&copy;2018-${.now?string("yyyy")} ${config.siteName} · 浙ICP备18037983号-1 </p>
    </div>
</footer>

<a class="to-top" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-arrow-up"></a>
<script type="text/javascript" src="${config.staticWebSite}/js/jquery.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/xss.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/mustache.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/highlight.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/simplemde.min.js"></script>


<script type="text/javascript">
    var appConfig = {
        wwwPath: '${config.siteUrl}',
        cmsPath: '${config.cmsUrl}',
        staticPath: '${config.staticWebSite}',
        qiuniuBasePath: '${config.qiuniuBasePath}',
        wxPraiseCode: '${config.wxPraiseCode}',
        zfbPraiseCode: '${config.zfbPraiseCode}'
    }
</script>
<#--<script>-->
    <#--var _hmt = _hmt || [];-->
    <#--(function () {-->
        <#--var hm = document.createElement("script");-->
        <#--hm.src = "https://hm.baidu.com/hm.js?6d4347a2ff5bfd2a925c81996dcf44a3";-->
        <#--var s = document.getElementsByTagName("script")[0];-->
        <#--s.parentNode.insertBefore(hm, s);-->
    <#--})();-->
<#--</script>-->

<script type="text/javascript" src="${config.staticWebSite}/js/site4j.js"></script>