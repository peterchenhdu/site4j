<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/admin">首页</a></li>
            <li class="active">网站通知管理</li>
        </ol>
        <div class="x_panel">
            <div class="x_content">
                <div class="<#--table-responsive-->">

                    <div class="panel panel-default">
                        <div class="panel-heading">查询条件</div>
                        <div class="panel-body">
                            <form id="formSearch" class="form-horizontal" onkeydown="if(event.keyCode===13) return false;">
                                <div class="form-group" style="margin-top:15px">
                                    <label class="control-label col-sm-1" for="search-status">发布状态</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" name="search-status" id="search-status">
                                            <option value="">请选择</option>
                                            <option value="RELEASE">已发布</option>
                                            <option value="NOT_RELEASE">未发布</option>
                                        </select>
                                    </div>
                                    <label class="control-label col-sm-1" for="search-title">公告标题</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="search-title" id="search-title"
                                               placeholder="请输入公告标题...">
                                    </div>

                                    <label class="control-label col-sm-1" for="search-content">公告内容</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="search-content" id="search-content"
                                               placeholder="请输入公告内容...">
                                    </div>
                                    <div class="col-sm-3" >
                                        <button type="button"  id="btn_query" class="btn btn-primary">查询
                                        </button>
                                        <button type="reset"  id="btn_reset" class="btn btn-primary">重置
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="btn-group hidden-xs" id="toolbar">
                    <@shiro.hasPermission name="notice:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="添加公告">
                            <i class="fa fa-plus"></i> 添加公告
                        </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="notice:batchDelete">
                        <button id="btn_delete_ids" type="button" class="btn btn-default" title="删除选中">
                            <i class="fa fa-trash-o"></i> 批量删除
                        </button>
                    </@shiro.hasPermission>
                    </div>
                    <table id="table-list">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">发布通知</h4>
            </div>
            <div class="modal-body">
                <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>
                    <input type="hidden" name="id">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">标题: <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="title" id="title"
                                   required="required" placeholder="请输入标题"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="content">内容: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea class="form-control col-md-7 col-xs-12" id="content" name="content"
                                      required="required"></textarea>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">状态: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <ul class="list-unstyled list-inline">
                                <li>
                                    <div class="radio">
                                        <label> <input type="radio" class="square" name="status" required="required"
                                                       value="RELEASE"> 已发布 </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="radio">
                                        <label> <input type="radio" class="square" name="status" required="required"
                                                       value="NOT_RELEASE"> 未发布 </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i>
                </button>
                <button type="button" class="btn btn-success addOrUpdateBtn"><i class="fa fa-save"> 保存</i></button>
            </div>
        </div>
    </div>
</div>
<!--/添加弹框-->
<@footer>
<script>
    $(function () {
        var options = {
            modalName: "网站通知",
            url: "/admin/notice/query",
            getInfoUrl: "/admin/notice/get/{id}",
            updateUrl: "/admin/notice/update",
            deleteUrl: "/admin/notice/delete",
            batchDeleteUrl: "/admin/notice/batchDelete",
            createUrl: "/admin/notice/add",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'title',
                    title: '标题',
                    width: '150px',
                    editable: false
                }, {
                    field: 'content',
                    title: '内容',
                    width: '300px',
                    editable: false
                }, {
                    field: 'status',
                    title: '状态',
                    editable: false,
                    width: '60px',
                    formatter: function (code, row, index) {
                        console.log('code:' + code + 'row:' + row + 'index:' + index);
                        return (code && code === 'RELEASE') ? "<strong class='green'>已发布</strong>" : "<strong class='red'>未发布</strong>";
                    }
                }, {
                    field: 'operate',
                    title: '操作',
                    width: '200px',
                    formatter: function (code, row, index) {
                        console.log('code:' + code + 'row:' + row + 'index:' + index);
                        var operateBtn = [];
                        var status = row.status;
                        if (status && status === 'NOT_RELEASE') {
                            operateBtn.push('<@permissionShowBtn permission="notice:publish" id="' + row.id +'" />');
                        } else {
                            operateBtn.push('<@permissionHideBtn permission="notice:publish" id="' + row.id +'" />');
                        }
                        operateBtn.push('<@permissionUpdateBtn permission="resource:update" id="' + row.id +'" />');
                        operateBtn.push('<@permissionDelBtn permission="resource:delete" id="' + row.id +'" />');
                        return operateBtn.join('');
                    }
                }
            ],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.title = $("#search-title").val();
                params.status = $("#search-status").val();
                params.content = $("#search-content").val();
                return params;
            }
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);

        var $tableList = $('#table-list');
        // 发布
        $tableList.on('click', '.btn-show', function () {
            var $this = $(this);
            var id = $this.data("id");
            $.alert.confirm("确定发布该条通知？发布后将对用户可见！", function () {
                $.ajax({
                    type: "post",
                    url: "/admin/notice/publish/" + id,
                    success: function (json) {
                        $.alert.ajaxSuccess(json);
                        $.tableUtil.refresh();
                    },
                    error: $.alert.ajaxError
                });
            }, function () {

            }, 5000);
        });
        // 撤回
        $tableList.on('click', '.btn-hide', function () {
            var $this = $(this);
            var id = $this.data("id");
            $.alert.confirm("确定撤回该条通知？撤回后将对用户不可见！", function () {
                $.ajax({
                    type: "post",
                    url: "/admin/notice/reCall/" + id,
                    success: function (json) {
                        $.alert.ajaxSuccess(json);
                        $.tableUtil.refresh();
                    },
                    error: $.alert.ajaxError
                });
            }, function () {

            }, 5000);
        });
    });
</script>
</@footer>