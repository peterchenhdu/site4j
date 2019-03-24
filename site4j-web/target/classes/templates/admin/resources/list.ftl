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
                    <div class="btn-group hidden-xs" id="toolbar">
                    <@shiro.hasPermission name="resource:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="新增资源">
                            <i class="fa fa-plus"></i> 新增资源
                        </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="resource:batchDelete">
                        <button id="btn_delete_ids" type="button" class="btn btn-default" title="删除选中">
                            <i class="fa fa-trash-o"></i> 批量删除
                        </button>
                    </@shiro.hasPermission>
                    </div>
                    <table id="tablelist">
                    </table>
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
    /**
     * 操作按钮
     * @param code
     * @param row
     * @param index
     * @returns {string}
     */
    function operateFormatter(code, row, index) {
        var trId = row.id;
        var operateBtn = [
            '<@shiro.hasPermission name="resource:update"><a class="btn btn-xs btn-primary btn-update" data-id="' +
            trId + '"><i class="fa fa-edit"></i>编辑</a></@shiro.hasPermission>',
            '<@shiro.hasPermission name="resource:delete"><a class="btn btn-xs btn-danger btn-remove" data-id="' + trId + '"><i class="fa fa-trash-o"></i>删除</a></@shiro.hasPermission>'
        ];
        return operateBtn.join('');
    }

    $(function () {
        var options = {
            url: "/admin/resource/query",
            getInfoUrl: "/admin/resource/get/{id}",
            updateUrl: "/admin/resource/update",
            deleteUrl: "/admin/resource/delete",
            batchDeleteUrl: "/admin/resource/batchDelete",
            createUrl: "/admin/resource/add",
            columns: [{
                checkbox: true
            }, {
                field: 'name',
                title: '资源名',
                editable: true
            },{
                field: 'type',
                title: '资源类型',
                editable: true,
                formatter: function (code) {
                    return code === 'menu' ? '菜单' : '按钮';
                }
            }, {
                field: 'parent.name',
                title: '父级资源',
                editable: false
            },   {
                field: 'url',
                title: '资源地址',
                editable: true
            }, {
                field: 'permission',
                title: '资源权限',
                editable: true
            },{
                field: 'icon',
                title: '资源图标',
                editable: true,
                formatter: function (value) {
                    if(value === "" || value ===null) {
                        return "-";
                    } else {
                        return "<i class='"+value+"'></i>"
                    }

                }
            }, {
                field: 'sort',
                title: '排序',
                editable: true
            },  {
                field: 'operate',
                title: '操作',
                formatter: operateFormatter //自定义方法，添加操作按钮
            }],
            modalName: "资源"
        }
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);

        $.ajax({
            async: false,
            type: "POST",
            data: {rid: ""},
            url: '/admin/resource/resourcesWithSelected',
            dataType: 'json',
            success: function (json) {
                var data = json.data;
                console.log(data);
                var setting = {
                    check: {
                        enable: true,
                        chkStyle: "radio",
                        radioType: "all"
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    callback: {
                        onCheck: function (event, treeId, treeNode) {
                            console.log(treeNode.id+","+treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                            $("#parentId").val(treeNode.id);

                        }
                    }
                };
                var tree = $.fn.zTree.init($("#treeDemo"), setting, data);
//                tree.expandAll(true);//全部展开

                $('#selectRole').modal('show');
            }
        });
    });
</script>
</@footer>