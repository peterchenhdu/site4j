<#include "/admin/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/admin">首页</a></li>
                <li class="active">评论管理</li>
            </ol>
            <div class="x_panel">
                <div class="x_content">
                    <div class="<#--table-responsive-->">
                        <div class="btn-group hidden-xs" id="toolbar">
                        <@shiro.hasPermission name="comment:batchDelete">
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
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">回复评论</h4>
            </div>
            <div class="modal-body">
                <form id="replyForm" class="form-horizontal form-label-left" novalidate>
                    <input type="hidden" name="sid" id="sid">
                    <input type="hidden" name="pid" id="pid">
                    <div class="item form-group">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2" for="description">评论 </label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <textarea class="form-control col-md-12 col-xs-12" rows="10" cols="20" id="content"
                                      name="content" placeholder="请输入评论"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i>
                </button>
                <button type="button" class="btn btn-success replyBtn"><i class="fa fa-mail-reply"> 回复</i></button>
            </div>
        </div>
    </div>
</div>
<!--/添加弹框-->
<!--添加弹框-->
<div class="modal fade" id="auditModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addroleLabel">审核评论</h4>
            </div>
            <div class="modal-body">
                <form id="auditForm" class="form-horizontal form-label-left" novalidate>
                    <input type="hidden" name="id" id="audit_id">
                    <input type="hidden" name="sid" id="audit_sid">
                    <div class="item form-group">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2" for="description">状态 </label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <select name="status" id="status" class="form-control" required="required">
                                <option value="">请选择</option>
                                <option value="APPROVED">审核通过</option>
                                <option value="REJECT">审核失败</option>
                            </select>
                        </div>
                    </div>
                    <div class="item form-group hide" id="status-remark">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2" for="description">备注 </label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <textarea class="form-control col-md-7 col-xs-12" id="remark" name="remark"
                                      placeholder="请输入审核备注（审核失败/删除的原因）"></textarea>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2" for="description">回复该评论 </label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <textarea class="form-control col-md-7 col-xs-12" id="contentText" name="contentText"
                                      rows="10" cols="20" placeholder="请输入评论"></textarea>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2" for="description">发送邮件 </label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" class="square" name="sendEmail"> 勾选发送
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i>
                </button>
                <button type="button" class="btn btn-success auditBtn"><i class="fa fa-hand-o-up"> 提交审核</i></button>
            </div>
        </div>
    </div>
</div>
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
        var id = row.id;
        var sid = row.sid;
        var operateBtn = [
            '<@shiro.hasPermission name="comment:reply"><a class="btn btn-xs btn-primary btn-reply" data-id="' + id + '" data-sid="' + sid + '"><i class="fa fa-edit"></i>回复</a></@shiro.hasPermission>',
            '<@shiro.hasPermission name="comment:audit"><a class="btn btn-xs btn-warning btn-audit" data-id="' + id + '" data-sid="' + sid + '"><i class="fa fa-edit"></i>审核</a></@shiro.hasPermission>',
            '<@shiro.hasPermission name="comment:delete"><a class="btn btn-xs btn-danger btn-remove" data-id="' + id + '" data-sid="' + sid + '"><i class="fa fa-trash-o"></i>删除</a></@shiro.hasPermission>'
        ];
        return operateBtn.join('');
    }

    $(function () {
        var options = {
            modalName: "评论",
            url: "/admin/comment/list",
            getInfoUrl: "/admin/comment/get/{id}",
            updateUrl: "/admin/comment/edit",
            removeUrl: "/admin/comment/remove",
            createUrl: "/admin/comment/add",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'avatar',
                    title: '评论者',
                    editable: false,
                    width: '200px',
                    formatter: function (code, row) {
                        return filterXSS(row.nickname);
                    }
                }, {
                    field: 'ip',
                    title: '评论者IP',
                    editable: false,
                    width: '200px'
                }, {
                    field: 'browser',
                    title: '评论者浏览器',
                    editable: false,
                    width: '300px'
                }, {
                    field: 'status',
                    title: '状态',
                    width: '40px',
                    editable: false,
                    formatter: function (code, row) {
                        var html = '';
                        if (code === 'VERIFYING') {
                            html = '<span class="label label-danger">' + row.statusDesc + '</span>';
                        } else if (code === 'REJECT') {
                            html = '<span class="label label-warning">' + row.statusDesc + '</span>';
                        } else if (code === 'DELETED') {
                            html = '<span class="label label-danger">' + row.statusDesc + '</span>';
                        } else {
                            html = '<span class="label label-success">' + row.statusDesc + '</span>';
                        }
                        return html;
                    }
                }, {
                    field: 'articleTitle',
                    title: '评论文章',
                    editable: false,
                    width: '260px',
                    formatter: function (code, row) {
                        return '<a href="' + appConfig.wwwPath + row.sourceUrl + '" target="_blank">' + row.articleTitle + '</a>';
                    }
                },{
                    field: 'content',
                    title: '评论内容',
                    editable: false,
                    width: '260px',
                    formatter: function (code, row) {
                        var content = filterXSS(row.content);
                        var $parent = row.parent;
                        var parent = $parent ? '<div style="background-color: #f1f1f1;padding: 5px;margin: 5px;border-radius: 4px;"><div style="padding-left: 10px;"><i class="fa fa-quote-left fa-fw"></i><strong>原评：</strong>' + filterXSS($parent.content) + '</div></div>' : '';
                        return '<div class="col-md-12">' + content + parent + '</div>';
                    }
                }, {
                    field: 'createTime',
                    title: '评论时间',
                    editable: false,
                    width: '260px'
                }, {
                    field: 'support',
                    title: '赞/踩',
                    width: '40px',
                    editable: false,
                    formatter: function (code, row) {
                        return row.support + "/" + row.oppose;
                    }
                }, {
                    field: 'operate',
                    title: '操作',
                    width: '140px',
                    formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ],
            rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = "";
                if (row.status === 'REJECT' || row.status === 'DELETED') {
                    strclass = 'warning';
                } else if (row.status === 'VERIFYING') {
                    strclass = 'danger';
                }
                return {'classes': strclass}
            }
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);

        var $tableList = $('#table-list');
        /**
         * 回复
         */
        $tableList.on('click', '.btn-reply', function () {
            var $this = $(this);
            var $replyForm = $("#replyForm");
            $replyForm.find("input,select,textarea").each(function () {
                var $this = $(this);
                clearText($this, this.type);
            });
            var pid = $this.attr("data-id");
            var sid = $this.attr("data-sid");
            $("#sid").val(sid);
            $("#pid").val(pid);
            $("#replyModal").modal('show');
            var $replyBtn = $(".replyBtn");
            $replyBtn.unbind("click");
            $replyBtn.click(function () {
                if (validator.checkAll($replyForm)) {
                    $.ajax({
                        type: "post",
                        url: "/admin/comment/reply",
                        data: $replyForm.serialize(),
                        success: function (json) {
                            $.alert.ajaxSuccess(json);
                            $("#replyModal").modal('hide');
                            $.tableUtil.refresh();
                        },
                        error: $.alert.ajaxError
                    });
                }
            })
        });
        /**
         * audit
         */
        $tableList.on('click', '.btn-audit', function () {
            var $this = $(this);
            var userId = $this.attr("data-id");
            var $auditForm = $("#auditForm");
            $auditForm.find("input,select,textarea").each(function () {
                var $this = $(this);
                clearText($this, this.type);
            });
            $("#audit_id").val(userId);
            $("#audit_sid").val($this.attr("data-sid"));

            $("#auditModal").modal('show');
            var $auditBtn = $(".auditBtn");
            $auditBtn.unbind("click");
            $auditBtn.click(function () {
                if (validator.checkAll($auditForm)) {
                    $.ajax({
                        type: "post",
                        url: "/admin/comment/audit",
                        data: $("#auditForm").serialize(),
                        success: function (json) {
                            $.alert.ajaxSuccess(json);
                            $("#auditModal").modal('hide');
                            $.tableUtil.refresh();
                        },
                        error: $.alert.ajaxError
                    });
                }
            })
        });

        $("#status").change(function () {
            var thisVal = $(this).val();
            if (thisVal === "REJECT" || thisVal === "DELETED") {
                $("#status-remark").removeClass("hide");
            } else {
                $("#status-remark").addClass("hide");
                $("#remark").val("");
            }
        });
    });
</script>
</@footer>