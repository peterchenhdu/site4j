<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/">首页</a></li>
                <li class="active">文章分类管理</li>
            </ol>
            <div class="x_panel">
                <div class="x_content">
                    <div class="<#--table-responsive-->">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">父级: </label>
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
            removeUrl: "/admin/type/remove",
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
                    field: 'parent.name',
                    title: '父级分类',
                    width: '100px',
                    editable: false
                }, {
                    field: 'description',
                    title: '描述',
                    width: '550px',
                    editable: false
                }, {
                    field: 'sort',
                    title: '排序',
                    width: '50px',
                    editable: false
                }, {
                    field: 'available',
                    title: '可用',
                    width: '50px',
                    editable: false
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
            ]
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);
    });
</script>
</@footer>