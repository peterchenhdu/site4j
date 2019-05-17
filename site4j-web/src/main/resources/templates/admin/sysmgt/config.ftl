<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">

        <div class="x_panel">

            <div class="x_title">
                <h2>系统配置 </h2>
                <div class="clearfix"></div>
            </div>

            <div class="x_content">
                <div class="col-md-12 col-sm-12 col-xs-12 profile_left">
                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#tab_basic" id="basic-tab" role="tab" data-toggle="tab" aria-expanded="true">基本信息</a>
                            </li>
                            <li role="presentation">
                                <a href="#tab_seo" id="seo-tab" role="tab" data-toggle="tab" aria-expanded="true">SEO设置</a>
                            </li>

                            <li role="presentation">
                                <a href="#tab_qiniu" id="qiniu-tab" role="tab" data-toggle="tab" aria-expanded="true">腾讯云配置</a>
                            </li>
                            <li role="presentation" class="">
                                <a href="#tab_contact" role="tab" id="contact-tab" data-toggle="tab" aria-expanded="false">联系方式</a>
                            </li>
                            <li role="presentation" class="">
                                <a href="#tab_setting" role="tab" id="setting-tab" data-toggle="tab" aria-expanded="false">其他配置</a>
                            </li>
                        </ul>

                        <div id="myTabContent" class="tab-content">

                            <div role="tabpanel" class="tab-pane fade active in" id="tab_basic"
                                 aria-labelledby="basic-tab">
                                <form class="form-horizontal form-label-left" novalidate>
                                    <input type="hidden" name="id">
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="domain">根域名<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="domain" id="domain" required="required" placeholder="请输入网站主域名"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="siteName">站点名<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="siteName" id="siteName" required="required" placeholder="请输入站点名"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="siteUrl">站点地址<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="siteUrl" id="siteUrl" required="required" placeholder="请输入站点地址"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="siteDesc">站点详情<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="siteDesc" id="siteDesc" required="required" placeholder="请输入站点详情"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="siteFavicon">站点LOGO<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="siteFavicon" id="siteFavicon" required="required" placeholder="请输入站点LOGO"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="staticWebSite">资源文件域名<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="staticWebSite" id="staticWebSite" required="required" placeholder="请输入资源文件域名"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="staticWebSite">CMS后管系统地址<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="cmsUrl" id="cmsUrl" required="required" placeholder="请输入CMS后管系统地址"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment"></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <button type="button" class="btn btn-primary saveBtn"><i class="fa fa-save">保存</i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="tab_seo" aria-labelledby="seo-tab">
                                <form class="form-horizontal form-label-left" novalidate>
                                    <input type="hidden" name="id">
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="homeDesc">Description<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-7 col-xs-12">
                                            <textarea class="form-control col-md-7 col-xs-12" id="homeDesc" name="homeDesc" required="required" placeholder="请输入首页描述" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="homeKeywords">Keywords<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-7 col-xs-12">
                                            <textarea class="form-control col-md-7 col-xs-12" id="homeKeywords" name="homeKeywords" required="required" placeholder="请输入首页关键字(半角逗号分隔)" rows="5"></textarea>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment"></label>
                                        <div class="col-md-6 col-sm-7 col-xs-12">
                                            <button type="button" class="btn btn-primary saveBtn"><i class="fa fa-save">保存</i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="tab_qiniu" aria-labelledby="qiniu-tab">
                                <form class="form-horizontal form-label-left" novalidate>
                                    <input type="hidden" name="id">
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tencentCosAccessKey">accessKey<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="tencentCosAccessKey" id="tencentCosAccessKey" required="required" placeholder="请输入accessKey"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tencentCosSecretKey">secretKey<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="tencentCosSecretKey" id="tencentCosSecretKey" required="required" placeholder="请输入secretKey"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tencentCosRegionName">regionName<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="tencentCosRegionName" id="tencentCosRegionName" required="required" placeholder="请输入region name"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tencentCosBasePath">腾讯云路径<span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="tencentCosBasePath" id="tencentCosBasePath" required="required" placeholder="请输入腾讯路径"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment"></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <button type="button" class="btn btn-primary saveBtn"><i class="fa fa-save">保存</i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="tab_contact" aria-labelledby="contact-tab">
                                <form class="form-horizontal form-label-left" novalidate>
                                    <input type="hidden" name="id">
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="authorName">站长名称</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="authorName" id="authorName" placeholder="请输入站长名称"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="authorEmail">站长邮箱</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="authorEmail" id="authorEmail" placeholder="请输入站长邮箱"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="wxCode">微信二维码</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="wxCode" id="wxCode" placeholder="请输入微信二维码"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="qq">QQ</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="qq" id="qq" placeholder="请输入QQ"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="weibo">微博</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="weibo" id="weibo" placeholder="请输入微博"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="github">GitHub</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" class="form-control col-md-7 col-xs-12" name="github" id="github" placeholder="请输入GitHub"/>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment"></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <button type="button" class="btn btn-primary saveBtn"><i class="fa fa-save">保存</i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="tab_setting" aria-labelledby="setting-tab">
                                <form class="form-horizontal form-label-left" novalidate>
                                    <input type="hidden" name="id">
                                    <div class="clear"></div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment">开启评论</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <ul class="list-unstyled list-inline">
                                                <li><label><input type="radio" class="square" checked name="comment" value="true"></label>开启</li>
                                                <li><label><input type="radio" class="square" name="comment" value="false"></label> 关闭</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="maintenance">维护通知</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <ul class="list-unstyled list-inline">
                                                <li><label><input type="radio" class="square" checked name="maintenance" value="true"></label> 显示</li>
                                                <li><label><input type="radio" class="square" name="maintenance" value="false"></label> 关闭</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="defaultArticleEditType">默认文章类型</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <ul class="list-unstyled list-inline">
                                                <li><label><input type="radio" class="square" checked name="defaultArticleEditType" value="Markdown"></label> Markdown</li>
                                                <li><label><input type="radio" class="square" name="defaultArticleEditType" value="WangEditor"></label> wangEditor</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="maintenanceData">维护日期</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class='input-group date site4JDateTimePicker'>
                                                <input type='text' class="form-control" required="required" readonly="readonly" id="maintenanceData" name="maintenanceData" placeholder="请输入维护日期"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment"></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <button type="button" class="btn btn-primary saveBtn"><i class="fa fa-save">保存</i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<@footer>
<script type="text/javascript">
    $(function () {
        //查询系统配置并填充方法
        function getConfig() {
            $.ajax({
                url: '/admin/config/get',
                type: 'POST',
                success: function (json) {
                    var data = json.data;
                    $("#myTabContent").find("input, select, textarea").each(function () {
                        clearText($(this), this.type, data);
                    });
                }
            });
        }

        //页面加载时获取系统配置信息并填充
        getConfig();

        //点击tab时重新获取最新系统配置
        $("#myTab").find("li a").click(function () {
            getConfig();
        });

        //点击保存按钮保存系统配置
        $(".saveBtn").click(function () {
            var $this = $(this);
            var $form = $this.parents("form");
            if (validator.checkAll($form)) {
                $form.ajaxSubmit({
                    type: "POST",
                    url: '/admin/config/update',
                    success: function (json) {
                        $.alert.ajaxSuccess(json);
                    },
                    error: $.alert.ajaxError
                });
            }
        });

    });
</script>
</@footer>