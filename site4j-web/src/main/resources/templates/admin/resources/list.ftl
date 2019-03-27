<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">

        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">资源管理</li>
        </ol>

        <div class="x_panel">
            <div class="x_content">
                <div class="<#--table-responsive-->">

                    <div class="panel panel-default">
                        <div class="panel-heading">查询条件</div>
                        <div class="panel-body">
                            <form id="formSearch" class="form-horizontal">
                                <div class="form-group" style="margin-top:15px">
                                    <label class="control-label col-sm-1" for="search-type">资源类别</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="search-type" id="search-type">
                                            <option value="">请选择</option>
                                            <option value="menu">菜单</option>
                                            <option value="button">按钮</option>
                                        </select>
                                    </div>
                                    <label class="control-label col-sm-1" for="txt_search_statu">资源名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="search-name" id="search-name"
                                               placeholder="请输入资源名称...">
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
                    <@shiro.hasPermission name="resource:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="新增资源">
                            <i class="fa fa-plus"></i>
                        </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="resource:batchDelete">
                        <button id="btn_delete_ids" type="button" class="btn btn-default" title="删除选中">
                            <i class="fa fa-trash-o"></i>
                        </button>
                    </@shiro.hasPermission>
                    </div>

                    <table id="table-list"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<!--添加资源弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">添加资源链接</h4>
            </div>

            <div class="modal-body">
                <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>

                    <input type="hidden" name="id">

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">资源名称: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="name" id="name"
                                   required="required" placeholder="请输入资源名称"/>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">资源类型: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="type" id="type" required="required" class="form-control col-md-7 col-xs-12">
                                <option value="">请选择</option>
                                <option value="menu">菜单</option>
                                <option value="button">按钮</option>
                            </select>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">父级资源: </label>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <input type="hidden" id="parentId" name="parentId">
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sort">资源排序: </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="sort" id="sort"
                                   placeholder="请输入资源排序"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="icon">资源图标: </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="icon" id="icon"
                                   placeholder="请输入资源图标"/>
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
<!--/添加资源弹框-->

<@footer>
<script>
    $(function () {
        var options = {
            url: "/admin/resource/query",
            getInfoUrl: "/admin/resource/get/{id}",
            updateUrl: "/admin/resource/update",
            deleteUrl: "/admin/resource/delete",
            batchDeleteUrl: "/admin/resource/batchDelete",
            createUrl: "/admin/resource/add",
            getTreeUrl: '/admin/resource/resourcesWithSelected',
            columns: [{
                checkbox: true
            }, {
                field: 'name',
                title: '资源名',
                editable: true
            }, {
                field: 'type',
                title: '资源类型',
                editable: true,
                formatter: function (code) {
                    return code === 'menu' ? '菜单' : '按钮';
                }
            }, {
                field: 'parentName',
                title: '父级资源',
                editable: false,
                formatter: function (value) {
                    if (value === "" || value === null) {
                        return "根节点";
                    } else {
                        return value;
                    }

                }
            }, {
                field: 'url',
                title: '资源地址',
                editable: true
            }, {
                field: 'permission',
                title: '资源权限',
                editable: true
            }, {
                field: 'icon',
                title: '资源图标',
                editable: true,
                formatter: function (value) {
                    if (value === "" || value === null) {
                        return "-";
                    } else {
                        return "<i class='" + value + "'></i>";
                    }

                }
            }, {
                field: 'sort',
                title: '排序',
                editable: true
            }, {
                field: 'operate',
                title: '操作',
                formatter: function (code, row, index) {
                    console.log('code:' + code + 'row:' + row + 'index:' + index);
                    var operateBtn = [];
                    operateBtn.push('<@permissionUpdateBtn permission="resource:update" id="' + row.id +'" />');
                    operateBtn.push('<@permissionDelBtn permission="resource:delete" id="' + row.id +'" />');
                    return operateBtn.join('');
                }
            }],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.type = $("#search-type").val();
                params.name = $("#search-name").val();
                return params;
            },
            modalName: "资源"
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);
    });
</script>
</@footer>