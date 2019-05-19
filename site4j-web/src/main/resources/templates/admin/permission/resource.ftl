<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">

        <ol class="breadcrumb">
            <li><a href="/admin">首页</a></li>
            <li class="active">资源管理</li>
        </ol>

        <div class="x_panel">
            <div class="x_content">
                <div class="<#--table-responsive-->">

                    <div class="panel panel-default">
                        <div class="panel-heading">查询条件</div>
                        <div class="panel-body">
                            <form id="formSearch" class="form-horizontal" onkeydown="if(event.keyCode===13) return false;">
                                <div class="form-group" style="margin-top:15px">

                                    <label class="control-label col-sm-1" for="search-type">资源类别</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" name="search-type" id="search-type">
                                            <option value="">请选择</option>
                                            <option value="menu">菜单</option>
                                            <option value="button">按钮</option>
                                        </select>
                                    </div>

                                    <label class="control-label col-sm-1" for="search-parentId">父级资源</label>
                                    <div class="col-sm-2">
                                        <select class="form-control" name="search-parentId" id="search-parentId">
                                            <option value="-1">请选择</option>
                                            <option value="">Site4J系统</option>
                                            <#list searchResources as item>
                                                <option value="${item.id}">${item.name}</option>
                                            </#list>
                                        </select>
                                    </div>

                                    <label class="control-label col-sm-1" for="search-name">资源名称</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="search-name" id="search-name"
                                               placeholder="请输入资源名称...">
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


                    <table id="table-list"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-sm" style="z-index: 1041" id="setOrderModal" tabindex="-1" role="dialog"
     aria-labelledby="selectRoleLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <div class="alert alert-info">
                    提示：点击绿色箭头设置排序！！！
                </div>
            </div>
            <div class="modal-body">
                <form id="boxRoleForm">
                    <input type="hidden" id="resourceId">
                    <div id="sameLevelNodes" style="font-size: 16px;">
                        设置资源排序
                    </div>
                </form>
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
                                   required="required" placeholder="请输入资源名称" readonly/>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">资源类型: <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="type" id="type" required="required" class="form-control col-md-7 col-xs-12" disabled>
                                <option value="">请选择</option>
                                <option value="menu">菜单</option>
                                <option value="button">按钮</option>
                            </select>
                        </div>
                    </div>

                    <#--<div class="item form-group">-->
                        <#--<label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">父级资源: </label>-->
                        <#--<div class="col-md-6 col-sm-6 col-xs-6">-->
                            <#--<input type="hidden" id="parentId" name="parentId">-->
                            <#--<ul id="treeDemo" class="ztree"></ul>-->
                        <#--</div>-->
                    <#--</div>-->

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
            getTreeUrl: '/admin/resource/queryResourceTree',
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
                    if(row.type === 'menu') {
                        operateBtn.push('<@permissionSortBtn permission="resource:sort" id="' + row.id +'" />');
                    }

                    return operateBtn.join('');
                }
            }],
            queryParams: function (params) {
                params = $.extend({}, params);
                params.type = $("#search-type").val();
                params.name = $("#search-name").val();
                params.parentId = $("#search-parentId").val();
                return params;
            },
            modalName: "资源"
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);


        $('#table-list').on('click', '.btn-sort', function () {
            var $this = $(this);
            var resourcesId = $this.attr("data-id");
            console.log(resourcesId);
            // $("#resourcesId").val(resourcesId);

            $.ajax({
                async: false,
                type: "POST",
                data: {rid: resourcesId},
                url: '/admin/resource/querySameLevelResource',
                dataType: 'json',
                success: function (json) {
                    var data = json.data;

                    var $sameLevelNodes = $("#sameLevelNodes");
                    $sameLevelNodes.empty();
                    for (var i = 0; i < data.length; i++) {
                        var appendElement = '';
                        if (data[i].id === resourcesId ) {
                            appendElement +='<div class="green hljs-strong just-mark" id="sortElement" data-id="'+resourcesId+'"><span class="glyphicon glyphicon-upload green"></span><span class="glyphicon glyphicon glyphicon-download green"></span> - ';
                        } else {
                            appendElement +='<div class="just-mark"><span class="glyphicon glyphicon-ban-circle red "></span><span class="glyphicon glyphicon-ban-circle red"></span> - ';
                        }
                        appendElement += data[i].name + '</div>';
                        $sameLevelNodes.append(appendElement);
                    }

                    var $setOrderModal = $('#setOrderModal');
                    $setOrderModal.modal('show');
                    $setOrderModal.on('click', '.glyphicon-upload', function () {
                        var $this = $(this);
                        if(!$this.parent().prev().hasClass("just-mark")) {
                            console.log("到达顶端");
                            return;
                        }

                        $this.parent().after($this.parent().prev());

                        $.ajax({
                            async: false,
                            type: "POST",
                            data: {rId: $("#sortElement").attr("data-id"),isUp:true},
                            url: '/admin/resource/updateSort',
                            dataType: 'json',
                            success: function (json) {

                            }
                        });
                    });
                    $setOrderModal.on('click', '.glyphicon-download', function () {
                        var $this = $(this);
                        if(!$this.parent().next().hasClass("just-mark")) {
                            console.log("到达底端");
                            return;
                        }
                        $this.parent().before($this.parent().next());

                        $.ajax({
                            async: false,
                            type: "POST",
                            data: {rId: $("#sortElement").attr("data-id"),isUp:false},
                            url: '/admin/resource/updateSort',
                            dataType: 'json',
                            success: function (json) {

                            }
                        });

                    });
                }
            });
        });



    });
</script>
</@footer>