(function ($) {
    $.extend({
        tableUtil: {
            _option: {},
            init: function (options) {
                $.tableUtil._option = options;
                $('#table-list').bootstrapTable('destroy').bootstrapTable({
                    url: options.url,
                    method: 'post',                      //请求方式（*）
                    toolbar: '#toolbar',                //工具按钮用哪个容器
                    striped: true,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    contentType: "application/x-www-form-urlencoded", // 发送到服务器的数据编码类型, application/x-www-form-urlencoded为了实现post方式提交
                    sortable: false,                     //是否启用排序
                    sortOrder: "asc",                   //排序方式
                    sortStable: true,                   // 设置为 true 将获得稳定的排序
                    queryParamsType: '',
                    pagination: true,                   //是否显示分页（*）
                    sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                    pageNumber: 1,                       //初始化加载第一页，默认第一页
                    pageSize: 10,                       //每页的记录行数（*）
                    pageList: [20, 40, 50, 100, 150],        //可供选择的每页的行数（*）
                    // search: true,                       //是否启用搜索框 根据sidePagination选择从前后台搜索
                    // strictSearch: true,                 //设置为 true启用 全匹配搜索，否则为模糊搜索
                    // searchOnEnterKey: true,            // 设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
                    minimumCountColumns: 1,             //最少允许的列数
                    showColumns: true,                  //是否显示 内容列下拉框
                    showRefresh: true,                  //是否显示刷新按钮
                    showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
                    onExpandRow: options.onExpandRow,
                    rowStyle: options.rowStyle || function (row, index) {
                        return {};
                    },
                    queryParams: options.queryParams,
                    columns: options.columns
                });
            },

            refresh: function () {
                $("#table-list").bootstrapTable('refresh', {url: $.tableUtil._option.url});
            }
        },
        buttonUtil: {
            init: function (options) {

                if(options.getTreeUrl !==null) {
                    $.ajax({
                        async: false,
                        type: "POST",
                        data: {rid: ""},
                        url: options.getTreeUrl,
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
                                        console.log(treeNode.id + "," + treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                                        $("#treeDemo").prev().val(treeNode.id);

                                    }
                                }
                            };
                            $.fn.zTree.init($("#treeDemo"), setting, data);
                        }
                    });
                }



                $("#btn_query").bind("click",function(){
                    $("#table-list").bootstrapTable('refresh');
                });

                /* 添加 */
                $("#btn_add").click(function () {
                    resetForm();
                    $("#addOrUpdateModal").modal('show');
                    $("#addOrUpdateModal").find(".modal-dialog .modal-content .modal-header h4.modal-title").html("添加" + options.modalName);

                    if ($("#password") && $("#password")[0]) {
                        $("#password").attr("required", "required");
                    }
                    if ($("#username") && $("#username")[0]) {
                        $("#username").removeAttr("readonly");
                    }
                    bindSaveInfoEvent(options.createUrl);
                });

                /* 修改 */
                $('#table-list').on('click', '.btn-update', function () {
                    var $this = $(this);
                    var userId = $this.attr("data-id");
                    $.ajax({
                        type: "post",
                        url: options.getInfoUrl.replace("{id}", userId),
                        success: function (json) {
                            var info = json.data;
                            // console.log(info);
                            resetForm(info, options);
                            $("#addOrUpdateModal").modal('show');
                            $("#addOrUpdateModal").find(".modal-dialog .modal-content .modal-header h4.modal-title").html("修改" + options.modalName);
                            if ($("#password") && $("#password")[0]) {
                                $("#password").removeAttr("required");
                            }
                            if ($("#username") && $("#username")[0]) {
                                $("#username").attr("readonly", "readonly");
                            }

                            bindSaveInfoEvent(options.updateUrl);

                        },
                        error: $.alert.ajaxError
                    });
                });

                /* 删除 */
                function batchDelete(ids) {
                    $.alert.confirm("确定删除该" + options.modalName + "信息？", function () {
                        $.ajax({
                            type: "post",
                            url: options.batchDeleteUrl,
                            traditional: true,
                            data: {'ids': ids},
                            success: function (json) {
                                $.alert.ajaxSuccess(json);
                                $.tableUtil.refresh();
                            },
                            error: $.alert.ajaxError
                        });
                    }, function () {

                    }, 5000);
                }

                /* 批量删除用户 */
                $("#btn_delete_ids").click(function () {
                    var selectedId = getSelectedId();
                    if (!selectedId || selectedId === '[]' || selectedId.length === 0) {
                        $.alert.error("请至少选择一条记录");
                        return;
                    }
                    batchDelete(selectedId);
                });

                /* 删除 */
                $('#table-list').on('click', '.btn-remove', function () {
                    var $this = $(this);
                    var userId = $this.attr("data-id");
                    $.alert.confirm("确定删除该" + options.modalName + "信息？", function () {
                        $.ajax({
                            type: "post",
                            url: options.deleteUrl,
                            traditional: true,
                            data: {'id': userId},
                            success: function (json) {
                                $.alert.ajaxSuccess(json);
                                $.tableUtil.refresh();
                            },
                            error: $.alert.ajaxError
                        });
                    }, function () {

                    }, 5000);

                });
            }
        }
    });
})(jQuery);

function bindSaveInfoEvent(url) {
    $(".addOrUpdateBtn").unbind('click');
    $(".addOrUpdateBtn").click(function () {
        if (validator.checkAll($("#addOrUpdateForm"))) {
            $.ajax({
                type: "post",
                url: url,
                data: $("#addOrUpdateForm").serialize(),
                success: function (json) {
                    $.alert.ajaxSuccess(json);
                    $("#addOrUpdateModal").modal('hide');
                    $.tableUtil.refresh();
                },
                error: $.alert.ajaxError
            });
        }
    })
}

function resetForm(info, options) {
    $("#addOrUpdateModal form input,#addOrUpdateModal form select,#addOrUpdateModal form textarea").each(function () {
        var $this = $(this);
        clearText($this, this.type, info, options);
    });
}

function clearText($this, type, info, options) {
    var $div = $this.parents(".item");
    if ($div && $div.hasClass("bad")) {
        $div.removeClass("bad");
        $div.find("div.alert").remove();
    }
    if (info) {
        var thisName = $this.attr("name");
        var thisValue = info[thisName];
        if (type === 'radio') {
            $this.iCheck(((thisValue && 1 === $this.val()) || (!thisValue && 0 === $this.val())) ? 'check' : 'uncheck')
        } else if (type.startsWith('select')) {
            if (thisValue === 'true' || thisValue === true) {
                thisValue = 1;
            } else if (thisValue === 'false' || thisValue === false) {
                thisValue = 0;
            }
            $this.val(thisValue);
        } else if(type === "hidden" && $this.next().attr('class') === "ztree") {
            $.ajax({
                async: false,
                type: "POST",
                data: {rid: ""},
                url: options.getTreeUrl,
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
                                $this.val(treeNode.id);

                            }
                        }
                    };
                    var tree = $.fn.zTree.init($("#treeDemo"), setting, data);
                    if(thisValue===null) {
                        tree.checkAllNodes(false);
                    } else {
                        tree.checkNode(tree.getNodeByParam("id",thisValue));
                        tree.expandNode(tree.getNodeByParam("id",thisValue).getParentNode());
                    }

                }
            });
        } else {
            $this.val(thisValue);
        }
    } else {
        if (type === 'radio' || type === 'checkbox') {
            $this.iCheck('uncheck');
        } else {
            $this.val('');
        }
    }
}

/**
 * 获取选中的记录ID
 * @returns {Array}
 */
function getSelectedId() {
    var selectedJson = $("#table-list").bootstrapTable('getAllSelections');
    var ids = [];
    $.each(selectedJson, function (i) {
        ids.push(selectedJson[i].id);
    });
    return ids;
}

/**
 * 获取选中的记录
 * @returns {*|jQuery}
 */
function getSelectedObj() {
    return $("#table-list").bootstrapTable('getAllSelections');
}


function getBtnString(permissionName, row) {
    return '<@shiro.hasPermission name="'+permissionName+'"><a class="btn btn-xs btn-primary btn-update" data-id="' + row.id + '"><span class="glyphicon glyphicon-pencil"></span></a></@shiro.hasPermission>';
}