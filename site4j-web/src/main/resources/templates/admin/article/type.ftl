<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/admin">首页</a></li>
                <li class="active">文章分类管理</li>
            </ol>
            <div class="x_panel">
                <div class="x_content">
                    <div class="<#--table-responsive-->">

                        <div class="panel panel-default">
                            <div class="panel-heading">查询条件</div>
                            <div class="panel-body">
                                <form id="formSearch" class="form-horizontal" onkeydown="if(event.keyCode===13) return false;">
                                    <div class="form-group" >
                                        <label class="control-label col-sm-1" for="search-available">是否启用</label>
                                        <div class="col-sm-2">
                                            <select class="form-control" name="search-available" id="search-available">
                                                <option value="">请选择</option>
                                                <option value="true">启用</option>
                                                <option value="false">禁用</option>
                                            </select>
                                        </div>
                                        <label class="control-label col-sm-1" for="search-name">分类名称</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" name="search-name" id="search-name"
                                                   placeholder="请输入分类名称...">
                                        </div>

                                        <label class="control-label col-sm-1" for="search-pid">父级分类</label>
                                        <div class="col-sm-2">
                                            <select id="search-pid" name="search-pid" class="form-control col-md-5 col-xs-5" target="combox"
                                                    data-url="/admin/type/listParent" data-method="post"></select>
                                        </div>
                                        <div class="col-sm-3" >
                                            <button type="button"  id="btn_query"
                                                    class="btn btn-primary">查询
                                            </button>

                                            <button type="reset"  id="btn_reset"
                                                    class="btn btn-primary">重置
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="btn-group hidden-xs" id="toolbar">
                        <@shiro.hasPermission name="type:add">
                            <button id="btn_add" type="button" class="btn btn-default" title="新增分类">
                                <i class="fa fa-plus"></i> 新增分类
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="type:batchDelete">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pid">父级: </label>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <select id="pid" name="pid" class="form-control col-md-5 col-xs-5" target="combox"
                                    data-url="/admin/type/listParent" data-method="post"></select>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">描述: </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" id="description"
                                   name="description" placeholder="请输入分类描述"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sort">排序:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="sort" id="sort"
                                   placeholder="请输入排序"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="available">是否可用 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <ul class="list-unstyled list-inline">
                                <li>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" class="flat" checked name="available" value="true"> 可用
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" class="flat" name="available" value="false"> 禁用
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="icon">图标:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="icon" id="icon"
                                   placeholder="请输入图标，比如：fa fa-qq"/>
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
            modalName: "分类",
            url: "/admin/type/list",
            getInfoUrl: "/admin/type/get/{id}",
            updateUrl: "/admin/type/edit",
            deleteUrl: "/admin/type/delete",
            batchDeleteUrl: "/admin/type/batchDelete",
            createUrl: "/admin/type/add",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'name',
                    title: '名称',
                    width: '100px',
                    editable: false
                }, {
                    field: 'parentName',
                    title: '父级分类',
                    width: '100px',
                    editable: false
                }, {
                    field: 'description',
                    title: '描述',
                    width: '350px',
                    editable: false
                }, {
                    field: 'sort',
                    title: '排序',
                    width: '50px',
                    editable: false
                }, {
                    field: 'available',
                    title: '是否启用',
                    width: '50px',
                    formatter: function (code, row, index) {
                        console.log('code:' + code + 'row:' + row + 'index:' + index);
                        return (code && code === true) ? "<strong class='green'>启用</strong>" : "<strong class='red'>禁用</strong>";
                    }
                }, {
                    field: 'icon',
                    title: '图标',
                    width: '50px',
                    editable: false,
                    formatter: function (code, row, index) {
                        console.log('code:' + code + 'row:' + row + 'index:' + index);
                        return '<i class="' + row.icon + '"></i>';
                    }
                }, {
                    field: 'operate',
                    title: '操作',
                    width: '150px',
                    formatter: function (code, row, index) {
                        console.log('code:' + code + 'row:' + row + 'index:' + index);
                        var operateBtn = [];
                        operateBtn.push('<@permissionUpdateBtn permission="type:edit" id="' + row.id +'" />');
                        operateBtn.push('<@permissionDelBtn permission="type:delete" id="' + row.id +'" />');
                        return operateBtn.join('');
                    }
                }
            ],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.pid = $("#search-pid").val();
                params.name = $("#search-name").val();
                params.available = $("#search-available").val();
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