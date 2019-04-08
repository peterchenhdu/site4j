<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/">首页</a></li>
                <li class="active">文章查看记录管理</li>
            </ol>
            <div class="x_panel">
                <div class="x_content">
                    <div class="<#--table-responsive-->">

                        <div class="panel panel-default">
                            <div class="panel-heading">查询条件</div>
                            <div class="panel-body">
                                <form id="formSearch" class="form-horizontal"
                                      onkeydown="if(event.keyCode===13) return false;">
                                    <div class="form-group" style="margin-top:15px">
                                        <label class="control-label col-sm-1" for="txt_search_statu">开始时间</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="search-lookTimeFrom"
                                                   id="search-lookTimeFrom"
                                                   placeholder="请选择开始时间...">
                                        </div>
                                        <label class="control-label col-sm-1" for="txt_search_statu">结束时间</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="search-lookTimeTo"
                                                   id="search-lookTimeTo"
                                                   placeholder="请选择结束时间...">
                                        </div>
                                        <div class="col-sm-4" style="text-align:left;">
                                            <button type="button" style="margin-left:50px" id="btn_query"
                                                    class="btn btn-primary">查询
                                            </button>

                                            <button type="reset" style="margin-left:20px" id="btn_reset"
                                                    class="btn btn-primary">重置
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>


                        <table id="table-list">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<@footer>
<script>
    $(function () {
        var options = {
            modalName: "文章查看记录",
            url: "/admin/bizArticleLook/query",
            columns: [
                {
                    field: 'articleName',
                    title: '文章标题'
                }, {
                    field: 'userId',
                    title: '用户ID'
                }, {
                    field: 'userIp',
                    title: '用户IP'
                }, {
                    field: 'lookTime',
                    title: '浏览时间'
                }
            ],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.lookTimeFrom = $("#search-lookTimeFrom").val();
                params.lookTimeTo = $("#search-lookTimeTo").val();
                return params;
            }
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);

        $('#search-lookTimeFrom').datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss'
        });
        $('#search-lookTimeTo').datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss'
        });
    });
</script>
</@footer>