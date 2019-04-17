<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/">首页</a></li>
                <li class="active">文章标签管理</li>
            </ol>
            <div class="x_panel">
                <div class="x_content">
                    <div class="<#--table-responsive-->">

                        <div class="panel panel-default">
                            <div class="panel-heading">查询条件</div>
                            <div class="panel-body">
                                <form id="formSearch" class="form-horizontal" onkeydown="if(event.keyCode===13) return false;">
                                    <div class="form-group" style="margin-top:15px">
                                        <label class="control-label col-sm-1" for="search-name">标签名称</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="search-name" id="search-name"
                                                   placeholder="请输入标签名称...">
                                        </div>
                                        <label class="control-label col-sm-1" for="search-description">标签描述</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="search-description" id="search-description"
                                                   placeholder="请输入标签描述...">
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

                        <div class="btn-group hidden-xs" id="toolbar">
                        <@shiro.hasPermission name="tag:add">
                            <button id="btn_add" type="button" class="btn btn-default" title="新增分类">
                                <i class="fa fa-plus"></i> 新增分类
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="tag:batchDelete">
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
</div>
<!--添加弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">添加分类</h4>
            </div>
            <div class="modal-body">
                <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>
                    <input type="hidden" name="id">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">名称: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="name" id="name"
                                   required="required" placeholder="请输入分类名称"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">描述: </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" id="description"
                                   name="description" placeholder="请输入分类描述"/>
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
<@footer>
<script>
    $(function () {
        var options = {
            modalName: "标签",
            url: "/admin/tag/query",
            getInfoUrl: "/admin/tag/get/{id}",
            updateUrl: "/admin/tag/update",
            deleteUrl: "/admin/tag/delete",
            batchDeleteUrl: "/admin/tag/batchDelete",
            createUrl: "/admin/tag/add",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'name',
                    title: '名称',
                    width: '100px',
                    editable: false
                }, {
                    field: 'description',
                    title: '描述',
                    width: '350px',
                    editable: false
                }, {
                    field: 'operate',
                    title: '操作',
                    width: '150px',
                    formatter: function (code, row, index) {
                        console.log('code:' + code + 'row:' + row + 'index:' + index);
                        var operateBtn = [];
                        operateBtn.push('<@permissionUpdateBtn permission="tag:edit" id="' + row.id +'" />');
                        operateBtn.push('<@permissionDelBtn permission="tag:delete" id="' + row.id +'" />');
                        return operateBtn.join('');
                    }
                }
            ],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.description = $("#search-description").val();
                params.name = $("#search-name").val();
                return params;
            }
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);
    });
</script>
</@footer>