<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/admin">首页</a></li>
            <li class="active">角色管理</li>
        </ol>
        <div class="x_panel">
            <div class="x_content">
                <div class="<#--table-responsive-->">

                    <div class="panel panel-default">
                        <div class="panel-heading">查询条件</div>
                        <div class="panel-body">
                            <form id="formSearch" class="form-horizontal" onkeydown="if(event.keyCode===13) return false;">
                                <div class="form-group" style="margin-top:15px">

                                    <label class="control-label col-sm-1" for="search-type">角色类型</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="search-type" id="search-type">
                                            <option value="">请选择</option>
                                            <#list roleTypeList as item>
                                            <option value="${item.key}">${item.description}</option>
                                            </#list>
                                        </select>
                                    </div>

                                    <label class="control-label col-sm-1" for="search-name">角色名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="search-name" id="search-name"
                                               placeholder="请输入角色名称...">
                                    </div>

                                    <label class="control-label col-sm-1" for="search-description">角色描述</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="search-description" id="search-description"
                                               placeholder="请输入角色描述...">
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
                    <@shiro.hasPermission name="role:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="新增角色">
                            <i class="fa fa-plus"></i> 新增角色
                        </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="role:batchDelete">
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
<!--弹框-->
<div class="modal fade bs-example-modal-sm" id="selectRole" tabindex="-1" role="dialog"
     aria-labelledby="selectRoleLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="selectRoleLabel">分配资源权限</h4>
            </div>
            <div class="modal-body">
                <form id="boxRoleForm">
                    <input type="hidden" id="roleId">
                    <div class="zTreeDemoBackground left">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="saveResourcesBtn" class="btn btn-success"><i class="fa fa-save">保存</i></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i>
                </button>
            </div>
        </div>
    </div>
</div>
<!--/弹框-->
<!--添加角色弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">添加角色</h4>
            </div>
            <div class="modal-body">
                <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>
                    <input type="hidden" name="id">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">角色名称: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="name" id="name"
                                   required="required" placeholder="请输入角色名称"/>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">角色类型: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="type" id="type" required="required" class="form-control col-md-7 col-xs-12" >
                                <option value="">请选择</option>
                                <#list roleTypeList as item>
                                    <option value="${item.key}">${item.description}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">角色描述: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="description"
                                   id="description" required="required" placeholder="请输入角色描述"/>
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
<!--/添加角色弹框-->
<@footer>
<script>
    $(function () {
        var options = {
            url: "/admin/role/query",
            getInfoUrl: "/admin/role/get/{id}",
            updateUrl: "/admin/role/update",
            deleteUrl: "/admin/role/delete",
            batchDeleteUrl: "/admin/role/batchDelete",
            createUrl: "/admin/role/add",
            saveRolesUrl: "/admin/role/allotResource",
            columns: [{
                checkbox: true
            }, {
                field: 'name',
                title: '角色名',
                editable: false
            }, {
                field: 'type',
                title: '角色类型',
                editable: false,
                formatter: function (value) {
                    if (value === "normal_admin") {
                        return "系统管理员";
                    } else if(value==="super_admin"){
                        return "超级管理员";
                    } else if(value==="normal_user"){
                        return "普通用户";
                    } else {
                        return "未知用户";
                    }

                }
            }, {
                field: 'description',
                title: '角色描述',
                editable: false
            },  {
                field: 'operate',
                title: '操作',
                formatter: function operateFormatter(code, row, index) {
                    console.log('code:' + code + 'row:' + row + 'index:' + index);
                    var trId = row.id;
                    var operateBtn = [];
                    if (row.type !== 'super_admin') {
                        operateBtn.push('<@shiro.hasPermission name="role:edit"><a class="btn btn-xs btn-primary btn-update" data-id="' + trId + '"><i class="fa fa-edit"></i>编辑</a></@shiro.hasPermission>');
                        operateBtn.push('<@shiro.hasPermission name="role:delete"><a class="btn btn-xs btn-danger btn-remove" data-id="' + trId + '"><i class="fa fa-trash-o"></i>删除</a></@shiro.hasPermission>');
                        operateBtn.push('<@shiro.hasPermission name="role:allotResource"><a class="btn btn-xs btn-info btn-allot" data-id="' + trId + '"><i class="fa fa-circle-thin"></i>分配资源</a></@shiro.hasPermission>');
                    }
                    return operateBtn.join('');
                }
            }],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.type = $("#search-type").val();
                params.name = $("#search-name").val();
                params.description = $("#search-description").val();
                return params;
        },
            modalName: "角色"
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);



        $("#saveResourcesBtn").click(function(){
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = treeObj.getCheckedNodes(true);
            var ids = [];
            for (var i = 0; i < nodes.length; i++) {
                //获取选中节点的值
                ids.push(nodes[i].id);
            }

            $.post(options.saveRolesUrl, {
                "roleId": $("#roleId").val(),
                "resourcesId": ids.join(",")
            }, function (obj) {
                $.alert.ajaxSuccess(obj);
                $("#selectRole").modal('hide');
            }, 'json');
        });

        /* 分配资源权限 */
        $('#table-list').on('click', '.btn-allot', function () {
            console.log("分配资源权限");
            var $this = $(this);
            var rolesId = $this.attr("data-id");
            $("#roleId").val(rolesId);
            $.ajax({
                async: false,
                type: "POST",
                data: {rid: rolesId},
                url: '/admin/resource/queryResourceTree',
                dataType: 'json',
                success: function (json) {
                    var data = json.data;
                    console.log(data);
                    var setting = {
                        check: {
                            enable: true,
                            chkboxType: {"Y": "ps", "N": "ps"},
                            chkStyle: "checkbox"
                        },
                        data: {
                            simpleData: {
                                enable: true
                            }
                        },
                        callback: {
                            onCheck: function (event, treeId, treeNode) {
                                console.log(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);

                            }
                        }
                    };
                    var tree = $.fn.zTree.init($("#treeDemo"), setting, data);
                    //tree.expandAll(true);//全部展开
                    var nodes = tree.getCheckedNodes(true);

                    for(var i=0;i<nodes.length;i++) {
                        if(nodes[i].getParentNode() && !nodes[i].getParentNode().open){
                            tree.expandNode(nodes[i].getParentNode(),true,false);
                        }
                    }


                    $('#selectRole').modal('show');
                }
            });
        });
    });
</script>
</@footer>