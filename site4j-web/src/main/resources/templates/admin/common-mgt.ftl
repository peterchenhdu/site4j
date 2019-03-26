<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/">首页</a></li>
                <li class="active">${module.name}管理</li>
            </ol>
            <div class="x_panel">
                <div class="x_content">
                    <div class="<#--table-responsive-->">
                        <div class="btn-group hidden-xs" id="toolbar">
                        <@shiro.hasPermission name="${module.key}:add">
                            <button id="btn_add" type="button" class="btn btn-default" title="新增${module.name}">
                                <i class="fa fa-plus"></i> 新增${module.name}
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="${module.key}:batchDelete">
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


<!--添加或修改弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">添加${module.name}</h4>
            </div>
            <div class="modal-body">
                <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>
                <#list module.fields as item>
                    <#if item.primaryKey=true><input type="hidden" name="${item.key}">
                    <#else>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">${item.name}: <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" class="form-control col-md-7 col-xs-12" name="${item.key}" id="${item.key}"
                                       <#if item.required=true>required="required"</#if> placeholder="请输入${item.name}"/>
                            </div>
                        </div>
                    </#if>
                </#list>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i></button>
                <button class="btn btn-success addOrUpdateBtn"><i class="fa fa-save"> 保存</i></button>
            </div>
        </div>
    </div>
</div>


<@footer>
<script>
    $(function () {
        var options = {
            modalName: "${module.name}",
            url: "/admin/${module.key}/query",
            getInfoUrl: "/admin/${module.key}/get/{id}",
            updateUrl: "/admin/${module.key}/update",
            deleteUrl: "/admin/${module.key}/delete",
            batchDeleteUrl: "/admin/${module.key}/batchDelete",
            createUrl: "/admin/${module.key}/add",
            columns: [
                {
                    checkbox: true
                },
                <#list module.fields as item>
                {
                    field: '${item.key}',
                    title: '${item.name}',
                    width: '${item.width}'
                    <#if item.linked = true>,
                    formatter: function (code, row, index) {
                        return '<a href="' + appConfig.wwwPath + '/${module.key}/' + row.id + '" target="_blank">' + row.name + '</a>';
                    }
                    </#if>
                },
                </#list>
                {
                    field: 'operate',
                    title: '操作',
                    width: '150px',
                    formatter: function (code, row, index) {
                        console.log(index);
                        var trId = row.id;
                        var operateBtn = [];
                        <#if module.supportEditOperation = true>
                            operateBtn.push('<@shiro.hasPermission name="${module.key}:update"><a class="btn btn-xs btn-primary btn-update" data-id="' + trId + '"><i class="fa fa-edit"></i>编辑</a></@shiro.hasPermission>');
                        </#if>
                        <#if module.supportDelOperation = true>
                            operateBtn.push('<@shiro.hasPermission name="${module.key}:delete"><a class="btn btn-xs btn-danger btn-remove" data-id="' + trId + '"><i class="fa fa-trash-o"></i>删除</a></@shiro.hasPermission>');
                        </#if>
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