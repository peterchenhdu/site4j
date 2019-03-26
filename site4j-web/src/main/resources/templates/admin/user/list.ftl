<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">用户管理</li>
        </ol>
        <div class="x_panel">
            <div class="x_content">
                <div class="<#--table-responsive-->">
                    <div class="btn-group hidden-xs" id="toolbar">
                    <@shiro.hasPermission name="user:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="新增用户">
                            <i class="fa fa-plus"></i> 新增用户
                        </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="user:batchDelete">
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

<!--/弹框-->
<!--添加用户弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>
                    <input type="hidden" name="id">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">用户名: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="username" id="username"
                                   required="required" placeholder="请输入用户名"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">密码: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="password" class="form-control col-md-7 col-xs-12" id="password" name="password"
                                   required="required" placeholder="请输入密码 6位以上"/>
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="roleId">用户角色: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="roleId" id="roleId" required="required" class="form-control col-md-7
                            col-xs-12">
                                <option value="">请选择</option>
                            <@zhydTag method="roles">
                                <#if roles?? && roles?size gt 0>
                                    <#list roles as item>
                                        <option value="${item.id}">${item.description}</option>
                                    </#list>
                                <#else>
                                </#if>
                            </@zhydTag>
                            </select>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nickname">昵称:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="nickname" id="nickname"
                                   placeholder="请输入昵称"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">手机:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="tel" class="form-control col-md-7 col-xs-12" name="mobile" id="mobile"
                                   data-validate-length-range="6,20" placeholder="请输入手机号"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">邮箱:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="email" class="form-control col-md-7 col-xs-12" name="email" id="email"
                                   placeholder="请输入邮箱"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="remark">备注:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" name="remark" id="remark"
                                   placeholder="请输入备注"/>
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
<!--/添加用户弹框-->
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
        var currentUserId = '${user.id}';
        var trUserId = row.id;
        var operateBtn = [];
        if (row.username !== 'root') {
            operateBtn.push('<@shiro.hasPermission name="user:update"><a class="btn btn-xs btn-primary btn-update" data-id="' + trUserId + '"><i class="fa fa-edit"></i>编辑</a></@shiro.hasPermission>');
            if (currentUserId !== trUserId) {
                operateBtn.push('<@shiro.hasPermission name="user:delete"><a class="btn btn-xs btn-danger btn-remove" data-id="' + trUserId + '"><i class="fa fa-trash-o"></i>删除</a></@shiro.hasPermission>');
            }
        }

        return operateBtn.join('');
    }

    $(function () {
        var options = {
            url: "/admin/user/query",
            getInfoUrl: "/admin/user/get/{id}",
            updateUrl: "/admin/user/update",
            deleteUrl: "/admin/user/delete",
            batchDeleteUrl: "/admin/user/batchDelete",
            createUrl: "/admin/user/add",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'username',
                    title: '用户名',
                    editable: false
                }, {
                    field: 'nickname',
                    title: '昵称',
                    editable: true
                }, {
                    field: 'roleName',
                    title: '用户角色',
                    editable: false
                }, {
                    field: 'email',
                    title: '邮箱',
                    editable: true
                }, {
                    field: 'status',
                    title: '状态',
                    editable: false
                }, {
                    field: 'lastLoginTime',
                    title: '最后登录时间',
                    editable: false,
                    formatter: function (code) {
                        if(code === null ) {
                            return "-";
                        } else {
                            return new Date(code).format("yyyy-MM-dd hh:mm:ss")
                        }
                    }
                }, {
                    field: 'loginCount',
                    title: '登录次数',
                    editable: false
                }, {
                    field: 'operate',
                    title: '操作',
                    formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ],
            modalName: "用户"
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);

    });
</script>
</@footer>