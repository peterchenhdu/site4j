/*
 * Copyright (c) 2011-2025 PiChen
 */
(function ($) {
    $.extend({
        notification: {
            isSupported: function () {
                return 'Notification' in window;
            },
            isPermissionGranted: function () {
                return Notification.permission === 'granted';
            },
            requestPermission: function () {
                //验证浏览器是否支持Notification，如果不支持打印提示信息并返回
                if (!this.isSupported()) {
                    // console.log('当前浏览器不支持Notification API');
                    return;
                }
                //该方法将会询问用户是否允许显示通知,不能由页面调用(onload)，必须由用户主动事件触发(onclick等)
                //当用户同意之后，再次调用该方法则无效，即该方法仅对Notification.Permission不为'granted'的时候起作用
                Notification.requestPermission(function (status) {
                    //status是授权状态，如果用户允许显示桌面通知，则status为'granted'
                    // console.log('status: ' + status);
                    //permission只读属性:
                    //  default 用户没有接收或拒绝授权 不能显示通知
                    //  granted 用户接受授权 允许显示通知
                    //  denied  用户拒绝授权 不允许显示通知
                    var permission = Notification.permission;
                    // console.log('permission: ' + permission);
                });
            },
            show: function (options) {
                // this.requestPermission();
                if (!this.isSupported()) {
                    // console.log('当前浏览器不支持Notification API');
                    return;
                }
                if (!this.isPermissionGranted()) {
                    // console.log('当前页面未被授权使用Notification通知');
                    return;
                }
                var op = $.extend({
                    title: "您有一条新消息",
                    icon: appConfig.staticPath + '/img/notification.png',
                    delay: 5000,
                    notification: null
                }, options);
                var n = new Notification(op.title, {
                    icon: op.icon,
                    noscreen: true,
                    body: decodeURIComponent(op.notification)
                });
                //  用户点击之后当天不再显示
                var hide = localStorage.getItem("hide");
                if (!hide || parseInt(hide) < LocalDateTime.now().getDate()) {
                    n.onshow = function () {
                        setTimeout(function () {
                            n.close();
                        }, op.delay);
                    };
                }


                n.onclick = function () {
                    // 打开视图?
                    n.close();
                    //  用户点击之后当天不再显示
                    localStorage.setItem("hide", LocalDateTime.now().getDate());
                };

                n.onerror = function () {
                    // console.log('产生错误');
                };

                n.onclose = function () {
                    // console.log('关闭通知窗口');
                };
            }
        }
    });
})(jQuery);
// (function ($) {
//     $.extend({
//         websocket: {
//             _this: null,
//             _initialized: false,
//             init: function (options) {
//                 if (!this.isSupported()) {
//                     // console.error('Not support websocket');
//                     return;
//                 }
//                 var op = $.extend({
//                     callback: function () {
//                     },
//                     host: null,
//                     reconnect: false
//                 }, options);
//                 if (!op.host) {
//                     // console.error("初始化WebSocket失败，无效的请求地址");
//                     return;
//                 }
//                 try {
//                     this._this = new WebSocket(op.host);
//                 } catch (error) {
//                     return;
//                 }
//                 this._initialized = true;
//                 //连接发生错误的回调方法
//                 this._this.onerror = function () {
//                     // console.log("与服务器连接失败...");
//                 };
//
//                 //连接成功建立的回调方法
//                 this._this.onopen = function (event) {
//                     // console.log("与服务器连接成功...");
//                 };
//
//                 //接收到消息的回调方法
//                 this._this.onmessage = function (event) {
//                     // dwz.notification.show({notification: event.data});
//                     op.callback(event.data);
//                     // console.log("接收到服务器端推送的消息：" + event.data);
//                 };
//
//                 //连接关闭的回调方法
//                 this._this.onclose = function () {
//                     $.websocket._initialized = false;
//                     // console.log("已关闭当前链接");
//                     if (op.reconnect) {
//                         // 自动重连
//                         setTimeout(function () {
//                             $.websocket.open(op);
//                         }, 5000);
//                     }
//                 }
//             },
//             open: function (options) {
//                 var op = $.extend({
//                     callback: function () {
//                     },
//                     host: null,
//                     reconnect: false
//                 }, options);
//
//                 if (this._initialized) {
//                     this.close();
//                 }
//                 this.init(options);
//                 //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
//                 window.onbeforeunload = function () {
//                     // console.log("窗口关闭了");
//                     $.websocket.close();
//                 }
//             },
//             isSupported: function () {
//                 return 'WebSocket' in window;
//             },
//             send: function (message) {
//                 if (!this._this) {
//                     return;
//                 }
//                 this._this.send(message);
//             },
//             close: function () {
//                 if (!this._this) {
//                     return;
//                 }
//                 this._this.close();
//             }
//         }
//     });
// })(jQuery);
(function ($) {
    // 覆盖jquery-confirm中的函数
    $.jqAlert = $.alert;
    $.jqConfirm = $.confirm;

    $.extend({
        alert: {
            info: function (content, delayTime, callback) {
                delayTime = delayTime ? "confirm|" + delayTime : "confirm|1000";
                $.jqAlert({
                    title: '友情提示',
                    content: content,
                    confirmButton: '关闭',
                    autoClose: delayTime,
                    confirm: callback
                });
            },
            error: function (content, delayTime, callback) {
                delayTime = delayTime ? "confirm|" + delayTime : "confirm|1000";
                $.jqAlert({
                    title: '警告',
                    content: content,
                    confirmButton: '关闭',
                    autoClose: delayTime,
                    confirm: callback
                });
            },
            confirm: function (content, confirmCallback, cancelCallback, delayTime) {
                delayTime = delayTime ? "cancel|" + delayTime : "cancel|1000";
                $.jqConfirm({
                    confirmButtonClass: 'btn-success',
                    cancelButtonClass: 'btn-default',
                    title: '友情提示',
                    content: content,
                    autoClose: delayTime,
                    confirmButton: '确定',
                    cancelButton: '关闭',
                    confirm: confirmCallback,
                    cancel: cancelCallback
                });
            },
            ajaxSuccessConfirm: function (json, callback) {
                if (json.status == 200) {
                    if (json.message) {
                        $.alert.confirm(json.message, callback);
                    }
                } else {
                    if (json.message) {
                        $.alert.error(json.message);
                    }
                }
            },
            ajaxSuccess: function (json) {
                if (json.status == 200) {
                    if (json.message) {
                        $.alert.info(json.message);
                    }
                } else {
                    if (json.message) {
                        $.alert.error(json.message);
                    }
                }
            },
            ajaxError: function () {
                $.alert.error("网络超时！");
            }
        }
    });
    $.extend({
        tool: {
            isEmpty: function (value) {
                return value == null || this.trim(value) == "";
            },
            isInteger: function () {
                return (new RegExp(/^\d+$/).test(this));
            },
            isNumber: function (value, element) {
                return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this));
            },
            trim: function (value) {
                if (value == null) {
                    return "";
                }
                return value.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
            },
            html2Txt: function (value) {
                value = this.trim(value);
                value = value.replace(/(\n)/g, "");
                value = value.replace(/(\t)/g, "");
                value = value.replace(/(\r)/g, "");
                value = value.replace(/<\/?[^>]*>/g, "");
                value = value.replace(/\s*/g, "");
                return value;
            },
            currentPath: function () {
                // 域
                var domain = document.domain;
                // 当前页
                var nowurl = document.URL;
                // 来源页
                var fromurl = document.referrer;

                return window.location.pathname;
            },
            getMeta: function (name) {
                var meta = document.getElementsByTagName('meta');
                var share_desc = '';
                for (var i in meta) {
                    if (typeof meta[i].name != "undefined" && meta[i].name.toLowerCase() == name.toLowerCase()) {
                        share_desc = meta[i].content;
                        break;
                    }
                }
                return share_desc;
            },
            random: function (min, max) {
                return Math.floor((Math.random() * max) + min);
            },
            parseFormSerialize: function (serialize) {
                var result = {};
                if (!serialize) {
                    return null;
                }
                var datas = serialize.split("&");
                for (var i = 0, len = datas.length; i < len; i++) {
                    var singleInfo = datas[i].split("=");
                    result[singleInfo[0]] = decodeURIComponent(singleInfo[1]);
                }
                return result;
            }
        }
    });
    /**
     * 扩展String方法
     */
    $.extend(String.prototype, {
        trim: function () {
            return this.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
        },
        startsWith: function (pattern) {
            return this.indexOf(pattern) === 0;
        },
        endsWith: function (pattern) {
            var d = this.length - pattern.length;
            return d >= 0 && this.lastIndexOf(pattern) === d;
        },
        replaceSuffix: function (index) {
            return this.replace(/\[[0-9]+\]/, '[' + index + ']').replace('#index#', index);
        },
        getRequestURI: function () {
            var indexOf = this.indexOf("?");
            return (indexOf == -1) ? this : this.substr(0, indexOf);
        },
        getParams: function (encode) {
            var params = {},
                indexOf = this.indexOf("?");
            if (indexOf != -1) {
                var str = this.substr(indexOf + 1),
                    strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    var item = strs[i].split("=");
                    var val = encode ? item[1].encodeParam() : item[1];
                    params[item[0]] = item.length > 1 ? val : '';
                }
            }
            return params;
        },
        encodeParam: function () {
            return encodeURIComponent(this);
        },
        replaceAll: function (os, ns) {
            return this.replace(new RegExp(os, "gm"), ns);
        },
        skipChar: function (ch) {
            if (!this || this.length === 0) {
                return '';
            }
            if (this.charAt(0) === ch) {
                return this.substring(1).skipChar(ch);
            }
            return this;
        },
        isPositiveInteger: function () {
            return (new RegExp(/^[1-9]\d*$/).test(this));
        },
        isInteger: function () {
            return (new RegExp(/^\d+$/).test(this));
        },
        isNumber: function (value, element) {
            return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this));
        },
        isValidPwd: function () {
            return (new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this));
        },
        isValidMail: function () {
            return (new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(this.trim()));
        },
        isSpaces: function () {
            for (var i = 0; i < this.length; i += 1) {
                var ch = this.charAt(i);
                if (ch != ' ' && ch != "\n" && ch != "\t" && ch != "\r") {
                    return false;
                }
            }
            return true;
        },
        isMobile: function () {
            return (new RegExp(/(^[0-9]{11,11}$)/).test(this));
        },
        isUrl: function () {
            return (new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/).test(this));
        },
        isExternalUrl: function () {
            return this.isUrl() && this.indexOf("://" + document.domain) == -1;
        },
        parseCurrency: function (num) {
            var numberValue = parseFloat(this);
            return parseFloat(numberValue.toFixed(num || 2));
        }
    });
    $.extend(Date.prototype, {
        format: function (format) {
            /*
             * eg:format="YYYY-MM-dd hh:mm:ss";
             */
            var o = {
                "M+": this.getMonth() + 1, // month
                "d+": this.getDate(), // day
                "h+": this.getHours(), // hour
                "m+": this.getMinutes(), // minute
                "s+": this.getSeconds(), // second
                "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
                "S": this.getMilliseconds()
                // millisecond
            };

            if (/(y+)/.test(format)) {
                format = format.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
            }

            for (var k in o) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                        : ("00" + o[k]).substr(("" + o[k]).length));
                }
            }
            return format;
        }
    });

    /* 星星点赞 */
    $.extend({
        rating: {
            _rating: ".rating",
            init: function (count) {
                count = (count || 5) + 1;
                $(this._rating).each(function () {
                    var $this = $(this);
                    var starCount = parseInt($this.attr("data-star") || 0);
                    var star = '', active = '';
                    for (var i = 1; i < count; i++) {
                        if (starCount > 0 && i <= starCount) {
                            active = 'active';
                        }
                        star += '<i class="fa fa-star-o ' + active + '"></i> ';
                        active = '';
                    }
                    $this.html(star);

                    if ($this.hasClass("ignore")) {
                        return;
                    }

                    /* 绑定星星的鼠标滑过事件 */
                    var $i = $this.find("i");
                    $i.each(function () {
                        $(this).mouseover(function () {
                            $i.each(function () {
                                $(this).removeClass("active");
                            });
                            $(this).addClass("active");
                            var brotherNode = $(this).prevAll();
                            brotherNode.each(function () {
                                $(this).addClass("active");
                            });
                        });
                    });

                    /* 绑定星星的点击事件 */
                    $this.on('click', 'i', function () {
                        var brotherNode = $(this).prevAll();
                        var selectedCount = brotherNode.length + 1;
                    });
                });
            }
        }
    });

    /* 鼠标点击向上冒泡弹出提示动画 */
    // $.extend({
    //     bubble: {
    //         _tip: ['法制', '爱国', '敬业', '诚信', '友善', '富强', '民主', '文明', '和谐', '自由', '平等', '公正'],
    //         init: function () {
    //             var bubbleIndex = 0;
    //             $('body').click(function (e) {
    //                 bubbleIndex = bubbleIndex >= $.bubble._tip.length ? 0 : bubbleIndex;
    //                 if (!e.originalEvent) {
    //                     return;
    //                 }
    //                 var x = e.originalEvent.x || e.originalEvent.layerX || 0;
    //                 var y = e.originalEvent.y || e.originalEvent.layerY || 0;
    //                 var html = '<span style="position: fixed;z-index:9999;left: ' + x + 'px;top: ' + y + 'px;"></span>';
    //                 var $box = $(html).appendTo($(this));
    //                 $box.effectBubble({
    //                     y: -100,
    //                     className: 'thumb-bubble',
    //                     fontSize: 0.5,
    //                     content: '<i class="fa fa-smile-o"></i>' + $.bubble._tip[bubbleIndex]
    //                 });
    //                 setTimeout(function () {
    //                     $box.remove();
    //                 }, 1002);
    //                 bubbleIndex++;
    //             });
    //         },
    //         unbind: function (duration) {
    //             $("body").unbind('click');
    //             if (duration && !isNaN(duration = parseInt(duration))) {
    //                 setTimeout(function () {
    //                     $.bubble.init();
    //                 }, duration);
    //             }
    //         }
    //     }
    // });
    /* 鼠标点击弹出提示动画 */

    $.fn.extend({
        // 翻牌效果
        flipCard: function (options) {
            var op = $.extend({}, options);
            return this.each(function () {
                var $box = $(this);
                $box.removeClass('animation-rotate-up').removeClass('animation-rotate-up-back');
                $box.addClass("animation-rotate-up");
                setTimeout(function () {
                    $box.addClass("animation-rotate-up-back");
                }, 500);
            });
        },

        // 文字向上冒泡
        effectBubble: function (options) {
            var op = $.extend({
                content: '+1',
                y: -100,
                duration: 1000,
                effectType: 'ease',
                className: '',
                fontSize: 2
            }, options);

            return this.each(function () {
                var $box = $(this), flyId = 'effect-fly-' + (LocalDateTime.now().getTime());

                var tpl = '<span id="#flyId#" class="effect-bubble-fly #class#" style="opacity: 1;top:#top#px;left:#left#px;font-size: #fontSize#rem;">#content#</span>';
                var html = tpl.replaceAll('#left#', 12).replaceAll('#top#', -8)
                    .replaceAll('#flyId#', flyId).replaceAll('#content#', op.content)
                    .replaceAll('#class#', op.className).replaceAll('#fontSize#', op.fontSize);

                var $fly = $(html).appendTo($box);
                $fly.fadeIn(100, "swing", function () {
                    $fly.animate({top: op.y, opacity: 0}, 100, function () {
                        $fly.fadeOut(op.duration, function () {
                            $fly.remove();
                        });
                    });
                });
            });
        }
    });
})(jQuery);

/* 返回顶部插件 */
(function ($) {
    $.fn.toTop = function (opt) {
        //variables
        var elem = this;
        var win = $(window);
        var doc = $('html, body');
        var options = opt;
        //如果没有配置自定义的参数，则使用默认
        if (!options) {
            options = $.extend({
                autohide: true,
                offset: 100,
                speed: 500,
                right: 15,
                bottom: 50
            }, opt);
        }
        elem.css({
            'position': 'fixed',
            'right': options.right,
            'bottom': options.bottom,
            'cursor': 'pointer'
        });
        if (options.autohide) {
            elem.css('display', 'none');
        }
        elem.click(function () {
            doc.animate({scrollTop: 0}, options.speed);
        });
        win.scroll(function () {
            var scrolling = win.scrollTop();
            if (options.autohide) {
                if (scrolling > options.offset) {
                    elem.fadeIn(options.speed);
                }
                else elem.fadeOut(options.speed);
            }
        });
    };
})(jQuery);
/* 返回顶部插件 end */

/* 文字滚动 start */
(function ($) {
    $.fn.textSlider = function (settings) {
        settings = jQuery.extend({
            speed: "normal",
            line: 2,
            timer: 3000
        }, settings);
        return this.each(function () {
            $.fn.textSlider.scllor($(this), settings);
        });
    };
    $.fn.textSlider.scllor = function ($this, settings) {
        var ul = $("ul:eq(0)", $this);
        var timerID;
        var li = ul.children();
        var liHight = $(li[0]).height();
        var upHeight = 0 - settings.line * liHight;//滚动的高度；
        var scrollUp = function () {
            ul.animate({marginTop: upHeight}, settings.speed, function () {
                for (i = 0; i < settings.line; i++) {
                    ul.find("li:first", $this).appendTo(ul);
                }
                ul.css({marginTop: 0});
            });
        };
        var autoPlay = function () {
            timerID = window.setInterval(scrollUp, settings.timer);
        };
        var autoStop = function () {
            window.clearInterval(timerID);
        };
        //事件绑定
        ul.hover(autoStop, autoPlay).mouseout();
    };
})(jQuery);
/* 文字滚动 end */


var _form = {
    valid: function (form) {
        var valid = true;
        $(form).find("small").each(function () {
            if ($(this).attr("data-bv-result") == "INVALID") {
                valid = false;
            }
        });
        return valid;
    }
};

$.extend({
    comment: {
        detailKey: 'comment-detail',
        sid: 0,
        _commentDetailModal: '',
        _detailForm: '',
        _detailFormBtn: '',
        _closeBtn: '',
        _commentPid: '',
        _commentPlace: '',
        _commentPost: '',
        _cancelReply: '',
        _commentReply: '',
        _simplemde: null,
        initDom: function () {
            $.comment._commentDetailModal = $('#comment-detail-modal');
            $.comment._detailForm = $('#detail-form');
            $.comment._detailFormBtn = $('#detail-form-btn');
            $.comment._closeBtn = $('#comment-detail-modal .close');
            $.comment._commentPid = $('#comment-pid');
            $.comment._commentPlace = $('#comment-place');
            $.comment._commentPost = $('#comment-post');
            $.comment._cancelReply = $('#cancel-reply');
            $.comment._commentReply = $('.comment-reply');
        },
        init: function (options) {
            var $box = $('#comment-box');
            if (!$box || !$box[0]) {
                return;
            }
            var op = $.extend({}, options);
            var commentBox = '<div id="comment-place">'
                + '<div class="comment-post" id="comment-post" style="position: relative">'
                + '<h4 class="bottom-line"><i class="fa fa-commenting-o fa-fw icon"></i><strong>评论</strong></h4>'
                + '<form class="form-horizontal" role="form" id="comment-form">'
                + '<div class="cancel-reply" id="cancel-reply" style="display: none;"><a href="javascript:void(0);" onclick="$.comment.cancelReply(this)" rel="external nofollow"><i class="fa fa-share"></i>取消回复</a></div>'
                + '<input type="hidden" name="pid" id="comment-pid" value="0" size="22" tabindex="1">'
                + '<textarea id="comment_content" class="form-control col-md-7 col-xs-12 valid" style="display: none"></textarea>'
                + '<textarea name="content" style="display: none"></textarea>'

                + '<a id="comment-form-btn" type="button" data-loading-text="正在提交评论..." class="btn btn-default btn-block">提交评论</a>'
                + '</form></div></div>';
            $box.html(commentBox);
            // 初始化并缓存常用的dom元素
            $.comment.initDom();
            // 创建编辑框
            this._simplemde = $.comment.createEdit(op);
            $.comment.loadCommentList($box);
            $.comment.initValidatorPlugin();
        },
        createEdit: function (options) {
            console.log(options.menu);
            var simplemde = new SimpleMDE({
                element: document.getElementById("comment_content"),
                toolbar: ["bold", "italic", "|", "code", "quote", "|", "preview", "|", "guide"],
                autoDownloadFontAwesome: false,
                // autofocus: true,
                placeholder: "说点什么吧",
                renderingConfig: {
                    codeSyntaxHighlighting: true
                },
                tabSize: 4
            });
            simplemde.codemirror.on("change", function () {
                $("textarea[name=content]").val(simplemde.markdown(simplemde.value()));
            });

            return simplemde;
        },
        loadCommentList: function (box, pageNumber) {
            var sid = box.attr("data-id");
            if (!sid) {
                throw "未指定sid！";
            }
            this.sid = sid;
            $.ajax({
                type: "post",
                url: "/api/comments",
                data: {sid: sid, pageNumber: pageNumber || 1},
                success: function (json) {
                    $.alert.ajaxSuccess(json);
                    // 加载 评论列表 start
                    var commentList = json.data.commentList;
                    var commentListBox = '';
                    if (!commentList) {
                        commentListBox = '<div class="commentList">'
                            + '<h4 class="bottom-line"><i class="fa fa-comments-o fa-fw icon"></i><strong><em>0</em> 条评论</strong></h4>'
                            + '<ul class="comment">';
                        commentListBox += '<li><div class="list-comment-empty-w fade-in">'
                            + '<div class="empty-prompt-w">'
                            + '<span class="prompt-null-w">还没有评论，快来抢沙发吧！</span>'
                            + '</div>'
                            + '</div></li>';
                        // 加载 评论列表 end
                        commentListBox += '</ul></div>';
                        $(commentListBox).appendTo(box);
                    } else {
                        // 首次加载-刷新页面后第一次加载，此时没有点击加载更多进行分页
                        if (!pageNumber) {
                            commentListBox = '<div class="commentList">'
                                + '<h4 class="bottom-line"><i class="fa fa-comments-o fa-fw icon"></i><strong><em>' + json.data.total + '</em> 条评论</strong></h4>'
                                + '<ul class="comment">';
                        }
                        for (var i = 0, len = commentList.length; i < len; i++) {
                            var comment = commentList[i];
                            var userUrl = comment.url || "javascript:void(0)";
                            var parent = comment.parent;
                            var adminIcon = '';
                            if (comment.admin) {
                                adminIcon = '<img src="/img/author.png" alt="" class="author-icon" title="管理员">';
                            }
                            var parentQuote = parent ? '<a href="#comment-' + parent.id + '" class="comment-quote">@' + parent.nickname + '</a><div style="background-color: #f5f5f5;padding: 5px;margin: 5px;border-radius: 4px;"><i class="fa fa-quote-left"></i><p></p><div style="padding-left: 10px;">' + filterXSS(parent.content) + '</div></div>' : '';
                            commentListBox += '<li>' +
                                '    <div class="comment-body fade-in" id="comment-' + comment.id + '">' +
                                '        <div class="cheader">' +
                                '           <div class="user-img">' + adminIcon + '<img class="userImage" src="' + filterXSS(comment.avatar) + '" onerror="this.src=\'' + appConfig.staticPath + '/img/user.png\'"></div>' +
                                '           <div class="user-info">' +
                                '              <div class="nickname">' +
                                '                 <a target="_blank" href="' + userUrl + '" rel="external nofollow"><strong>' + comment.nickname + '</strong></a>' +
                                '                <i class="icons os-' + comment.osShortName + '" title="' + comment.os + '"></i>' +
                                '                <i class="icons browser-' + comment.browserShortName + '" title="' + comment.browser + '"></i>' +
                                '              </div>            ' +
                                '             <div class="timer">' +
                                '                  <i class="fa fa-clock-o fa-fw"></i>' + comment.createTimeString +
                                '                  <i class="fa fa-map-marker fa-fw"></i>' + comment.address +
                                '              </div>' +
                                '          </div>' +
                                '        </div>' +
                                '        <div class="content">' + parentQuote + '<div>' + filterXSS(comment.content) + '</div></div>' +
                                '        <div class="sign">' +
                                '            <a href="javascript:void(0);" class="comment-up" onclick="$.comment.praise(' + comment.id + ', this)"><i class="fa fa-thumbs-o-up"></i>赞(<span class="count">' + comment.support + '</span>)<i class="sepa"></i></a>' +
                                '            <a href="javascript:void(0);" class="comment-down" onclick="$.comment.step(' + comment.id + ', this)"><i class="fa fa-thumbs-o-down"></i>踩(<span class="count">' + comment.oppose + '</span>)<i class="sepa"></i></a>' +
                                '            <a href="javascript:void(0);" class="comment-reply" onclick="$.comment.reply(' + comment.id + ', this)"><i class="fa fa-reply"></i>回复</a>' +
                                '            <a href="javascript:void(0);" class="comment-flag hide" onclick="$.comment.report(' + comment.id + ', this)"><i class="fa fa-flag"></i>举报</a>' +
                                '        </div>' +
                                '    </div>' +
                                '</li>';
                        }
                        // 如果存在下一页，则显示加载按钮
                        if (json.data.hasNextPage) {
                            commentListBox += '<li><div class="list-comment-empty-w fade-in">'
                                + '<div class="empty-prompt-w">'
                                + '<span class="prompt-null-w pointer load-more">加载更多 <i class="fa fa-angle-double-down"></i></span>'
                                + '</div>'
                                + '</div></li>';
                        }
                        // 加载 评论列表 end

                        if (!pageNumber) {
                            // 首次加载-刷新页面后第一次加载，此时没有点击加载更多进行分页
                            commentListBox += '</ul></div>';
                            $(commentListBox).appendTo(box);
                        } else {
                            // 点击加载更多时，列表追加到ul中
                            $(commentListBox).appendTo($(".comment"));
                        }

                        // 加载更多按钮
                        $(".load-more").click(function () {
                            $(this).parents('li').hide();
                            $.comment.loadCommentList(box, json.data.nextPage)
                        });
                    }
                },
                error: $.alert.ajaxError
            });
        },
        initValidatorPlugin: function () {
            $.comment._detailForm.bootstrapValidator({
                message: "输入值无效",
                feedbackIcons: {
                    valid: "fa fa-check",
                    invalid: "fa fa-remove",
                    validating: "fa fa-refresh"
                },
                fields: {
                    nickname: {
                        validators: {
                            notEmpty: {
                                message: "昵称必填"
                            }
                        }
                    },
                    url: {
                        validators: {
                            uri: {
                                message: "URL地址不正确"
                            }
                        }
                    },
                    email: {
                        validators: {
                            emailAddress: {
                                message: "邮箱地址不正确"
                            }
                        }
                    }
                }
            });
        },
        submit: function (target) {
            var $this = $(target);
            $this.button('loading');
            var detail = localStorage.getItem(this.detailKey);
            var data = $("#comment-form").serialize();
            if (!detail) {
            } else {
                var detailInfoJson = $.tool.parseFormSerialize(detail);
                $.comment._detailForm.find("input").each(function () {
                    var $this = $(this);
                    var inputName = $this.attr("name");
                    if (detailInfoJson[inputName]) {
                        $this.val(detailInfoJson[inputName]);
                    }
                });
                var $img = $.comment._detailForm.find('img');
                $img.attr('src', detailInfoJson.avatar);
                $img.removeClass('hide');

            }
            this._commentDetailModal.modal('show');
            this._closeBtn.unbind('click');
            this._closeBtn.click(function () {
                setTimeout(function () {
                    $this.html("<i class='fa fa-close'></i>取消操作...");
                    setTimeout(function () {
                        $this.button('reset');
                    }, 1000);
                }, 500);
            });
            // 模态框抖动
            this._commentDetailModal.find('.modal-content').addClass("shake");
            $.comment._detailForm.find("input[name=qq]").unbind('change');
            $.comment._detailForm.find("input[name=qq]").change(function () {
                var $this = $(this);
                var qq = $this.val();
                var $nextImg = $this.next('img');
                if (qq) {
                    $.ajax({
                        type: "post",
                        url: "/api/qq/" + qq,
                        success: function (json) {
                            $.alert.ajaxSuccess(json);
                            var data = json.data;
                            $.comment._detailForm.find("input").each(function () {
                                var $this = $(this);
                                var inputName = $this.attr("name");
                                if (data[inputName]) {
                                    $this.val(data[inputName]);
                                }
                            });
                            $nextImg.attr('src', data.avatar);
                            $nextImg.removeClass('hide');
                        },
                        error: $.alert.ajaxError
                    });
                } else {
                    $nextImg.addClass('hide');
                }

            });

            // 提交评论
            this._detailFormBtn.unbind('click');
            this._detailFormBtn.click(function () {
                $.comment._detailForm.bootstrapValidator("validate");
                if (_form.valid($.comment._detailForm)) {
                    data = data + "&" + $.comment._detailForm.serialize();
                    localStorage.setItem($.comment.detailKey, $.comment._detailForm.serialize());
                    submitForm(data);
                }
            });

            function submitForm(data) {
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "/api/comment",
                    data: data + '&sid=' + $.comment.sid,
                    success: function (json) {
                        $.alert.ajaxSuccess(json);
                        $.comment._commentDetailModal.modal('hide');

                        setTimeout(function () {
                            $this.html("<i class='fa fa-check'></i>" + json.message);
                            setTimeout(function () {
                                $this.button('reset');
                                window.location.reload();
                            }, 3000);
                        }, 1000);
                    },
                    error: function (data) {
                        // console.log(data);
                        $.alert.ajaxError();
                        $this.button('reset');
                    }
                });
            }
        },
        reply: function (pid, target) {
            // console.log(pid);
            this._commentPid.val(pid);
            this._cancelReply.show();
            // this._commentReply.show();
            $(target).hide();
            $(target).parents('.comment-body').append($("#comment-form"));
        },
        cancelReply: function (target) {
            this._commentPid.val("");
            this._cancelReply.hide();
            $(target).parents(".comment-body").find('.comment-reply').show();
            this._commentPost.append($("#comment-form"));
        },
        /* 赞 */
        praise: function (pid, target) {
            $.bubble.unbind();
            $.ajax({
                type: "post",
                url: "/api/doSupport/" + pid,
                success: function (json) {
                    $.alert.ajaxSuccess(json);
                    if (json.status == 200) {
                        $(target).effectBubble({
                            y: -80,
                            className: 'thumb-bubble',
                            fontSize: 1,
                            content: '<i class="fa fa-smile-o"></i>+1'
                        });
                        var oldCount = $(target).find('span.count').text();
                        $(target).find('span.count').text(parseInt(oldCount) + 1);
                    }
                    $.bubble.init();
                },
                error: function () {
                    $.alert.ajaxError();
                    $.bubble.init();
                }
            });
        },
        /* 踩 */
        step: function (pid, target) {
            $.bubble.unbind();
            $.ajax({
                type: "post",
                url: "/api/doOppose/" + pid,
                success: function (json) {
                    $.alert.ajaxSuccess(json);
                    if (json.status == 200) {
                        $(target).effectBubble({
                            y: -80,
                            className: 'thumb-bubble',
                            fontSize: 1,
                            content: '<i class="fa fa-meh-o"></i>+1'
                        });
                        var oldCount = $(target).find('span.count').text();
                        $(target).find('span.count').text(parseInt(oldCount) + 1);
                    }
                    $.bubble.init();
                },
                error: function () {
                    $.alert.ajaxError();
                    $.bubble.init();
                }
            });
        },
        /* 举报 */
        report: function (pid, target) {
        }
    }
});

$(function () {
    $.comment.init({customMenu: true});

    $("#comment-form-btn").click(function () {
        $.comment.submit($(this));
    });
});



function initNavbar() {
    $(".navbar .navbar-nav li").each(function () {
        var $this = $(this);
        if ($this.hasClass("dropdown")) {
            $this.on("mouseover", function () {
                $this.addClass("open").find("a:first-child").attr("aria-expanded", "true");
            }).on("mouseout", function () {
                $this.removeClass("open").find("a:first-child").attr("aria-expanded", "false");
            });
        }
        $this.find("a").each(function () {
            var $this = $(this);
            var $parent = $this.parent();
            $parent.removeClass("active");
            if ($this.attr("href") === $.tool.currentPath()) {
                $parent.toggleClass("active");
            }
        });
    });
}

function initArticeMenu() {
    $(function () {
        if ($('.blog-info-body') && $('.blog-info-body')[0]) {
            // console.log("生成文章目录");
            var padding = [0, 10, 20, 30, 40];
            var liDom, aDom, spanDom;
            var dNum = 0;
            $('.blog-info-body').find('h2,h3').each(function (index, item) {
                var $this = $(this);
                $this.before($('<span id="menu_' + index + '" class="menu-point"></span>'));
                $this.addClass("menu-title");
                var tagText = $this.text();
                var tagName = $this[0].tagName.toLowerCase();
                var tagIndex = parseInt(tagName.charAt(1)) - 1;
                spanDom = '<i class="fa fa-angle-right"></i>';
                aDom = '<a href="#menu_' + index + '" style="display:inline-block;">' + tagText + '</a>';
                liDom = '<li style="padding-left:' + padding[tagIndex] + 'px;line-height: 2;">' + spanDom + aDom + '</li>';
                $("#article-menu ul").append(liDom);
                dNum++;
            });
            if (dNum > 0) {
                $("#article-menu").show();
                $('.article-module').removeClass('hide');
                var sc = $(document);//得到document文档对象。
                var am = $(".article-module");// 文章目录对象
                var win = $(window); //得到窗口对象
                // win.scroll(function () {
                //     bindMenuScroll();
                // });
                // bindMenuScroll();

                function bindMenuScroll() {
                    if ($.tool.currentPath().indexOf('/article/') !== -1) {
                        if (sc.scrollTop() >= 200) {
                            if (!am.hasClass("fixed")) {
                                var top = win.width() > 768 ? '85px' : '55px';
                                am.addClass('fixed').css({
                                    width: '21.7%',
                                    right: 0,
                                    border: '1px solid rgba(0, 0, 0, 0.1)'
                                }).animate({top: top}, 100);
                                $('.close-article-menu').removeClass('hide');
                            }
                        } else {
                            am.removeClass('fixed').removeAttr('style');
                            $('.close-article-menu').addClass('hide');
                        }
                    }
                }

                $('.close-article-menu').click(function () {
                    am.addClass('hide');
                });
            }

        }
    });
}

function initScrollMenu() {
    var topmenu = $("#topmenu"); //得到导航对象
    var mainmenu = $("#mainmenu"); //得到导航对象
    var win = $(window); //得到窗口对象
    var sc = $(document);//得到document文档对象。
    var am = $(".article-module");// 文章目录对象
    bindScroll();
    win.scroll(function () {
        bindScroll();
    });

    function bindScroll() {
        if (sc.scrollTop() >= 100) {
            if (!mainmenu.hasClass("transparent")) {
                topmenu.animate({opacity: '0'}, 0);
                mainmenu.addClass('transparent');
                if (win.width() > 768) {
                    mainmenu.animate({top: '0', 'z-index': 1000}, 1);
                }
            }
        } else {
            topmenu.animate({opacity: '1'}, 0);
            mainmenu.removeClass('transparent');
            if (win.width() > 768) {
                mainmenu.animate({top: '30', 'z-index': 998}, 1);
            }
        }
    }
}

var PaymentUtils = window.payment || {
    config: [{
        url: appConfig.qiuniuBasePath + appConfig.zfbPraiseCode,
        desc: '支付宝转账'
    }, {url: appConfig.qiuniuBasePath + appConfig.wxPraiseCode, desc: '微信转账'}],
    show: function () {
        $("#reward").modal('show');
        this.change(0);
        $("#reward input").on('ifChecked', function (event) {
            var index = $(this).data("index");
            PaymentUtils.change(index);
        });
    },
    hide: function () {
        $("#reward").modal('hide');
    },
    change: function (index) {
        var config = this.config[index];
        $("#qrcode-container").empty();
        $('<img  src="' + config.url + '" style="width: 250px;height: auto;" alt="' + config.desc + '">').appendTo($("#qrcode-container"));
    }

};

// /**
//  * websocket消息解析器
//  *
//  * @type {{online: wesocketMsgResolver.online}}
//  */
// var wesocketMsgResolver = {
//     online: function (value) {
//         value && $(".online").html(value);
//     },
//     notification: function (value) {
//         value && $.notification.show({
//             notification: value
//         });
//     }
// };
$(function () {



    initNavbar();
    initArticeMenu();
    // initScrollMenu();

    console.group("关于本站");
    console.log("分享、学习、进步");

    $('.to-top').toTop({
        autohide: true,//返回顶部按钮是否自动隐藏。可以设置true或false。默认为true
        offset: 100,//页面滚动到距离顶部多少距离时隐藏返回顶部按钮。默认值为420
        speed: 500,//滚动和渐隐的持续时间，默认值为500
        right: 25,//返回顶部按钮距离屏幕右边的距离，默认值为15
        bottom: 50//返回顶部按钮距离屏幕顶部的距离，默认值为30
    });

    $("[data-toggle='tooltip']").tooltip();
    $('[data-toggle="popover"]').popover();

    // // 图片预览
    // $(".showImage").fancybox();


    // Loading弹窗
    // $(document).ajaxStart(function () {
    //     $("#loading").show();
    // }).ajaxStop(function () {
    //     $("#loading").hide();
    // });

    if ($("#scrolldiv")) {
        $("#scrolldiv").textSlider({line: 1, speed: 300, timer: 5000});
    }

    if ($.rating) {
        $.rating.init(5);
    }

    if ($.bubble) {
        $.bubble.init();
    }

    getCurrentDate();
    setInterval(function () {
        getCurrentDate();
    }, 1000);

    function getCurrentDate() {
        var now = new Date();
        var weekArr = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
        $("#currentTime").html(now.format('yyyy年MM月dd日 hh时mm分ss秒') + " " + weekArr[now.getDay()]);
    }

    // if ($.websocket) {
    //     var sitePath = appConfig.cmsPath;
    //     var scheme = ["http://", "https://"];
    //     var host;
    //     $.each(scheme, function (i, v) {
    //         if (sitePath.indexOf(v) !== -1) {
    //             host = sitePath.replaceAll(v, "");
    //             return false;
    //         }
    //     });
    //     // 默认取8085端口的程序
    //     host = host || document.domain + ":8085";
    //     if (host) {
    //         // 申请显示通知的权限
    //         $.notification.requestPermission();
    //         $.websocket.open({
    //             host: "ws://" + host + "/websocket",
    //             reconnect: true,
    //             callback: function (result) {
    //                 console.log(result);
    //                 var resultJson = JSON.parse(result);
    //                 wesocketMsgResolver[resultJson["fun"]](resultJson["msg"]);
    //             }
    //         });
    //     } else {
    //         console.warn("网站host获取失败，将不启动webscoket。");
    //     }
    // }

    /**
     * 显示取链的表格
     */
    $(".showContent").click(function () {
        $(this).toggleClass('fa-plus-square fa-minus-square');
        // $(".disable-content").toggleClass('fade-in hide');
        $(".disable-content").slideToggle(400);
    });

    if (/iphone|ipod|ipad|ipad|mobile/i.test(navigator.userAgent.toLowerCase())) {
        $('.share-sd').click(function () {
            $('#share').animate({
                    opacity: 'toggle',
                    top: '-80px'
                },
                500).animate({
                    top: '-60px'
                },
                'fast');
            return false;
        });
    } else {
        $(".share-sd").mouseover(function () {
            $(this).children("#share").show();
        });
        $(".share-sd").mouseout(function () {
            $(this).children("#share").hide();
        });
    }

    $("#social .like").click(function () {
        var $this = $(this);
        var $a = $(this).find("a");
        var $count = $a.find("i.count");
        var id = $a.data("id");
        $.bubble.unbind();
        $.ajax({
            type: "post",
            url: "/api/doPraise/" + id,
            success: function (json) {
                $.alert.ajaxSuccess(json);
                if (json.status === 200) {
                    $this.effectBubble({
                        y: -80,
                        className: 'thumb-bubble',
                        fontSize: 1,
                        content: '<i class="fa fa-smile-o"></i>+1'
                    });
                    $count.text(parseInt($count.text()) + 1);
                }
                $.bubble.init();
            },
            error: function () {
                $.alert.ajaxError();
                $.bubble.init();
            }
        });
    });

    $("img.lazy-img").lazyload({
        placeholder: appConfig.staticPath + "/img/default.png",
        effect: "fadeIn",
        threshold: 100
    });
    $(window).bind("load", function () {
        var timeout = setTimeout(function () {
            $("img.lazy-img").trigger("sporty");
        }, 3000);
    });

    /* 热门搜索标签点击事件 */
    $(".search-hot li").click(function () {
        var $this = $(this);
        var text = $this.find("a span").text();
        $this.parents(".searchForm").find("input[name=keywords]").val(text);
        $this.parents(".searchForm").find(".nav-search-btn").click();
    });

    /* 分页按钮点击事件 */
    $(".page-btn li a").click(function () {
        var $this = $(this);
        var $parents = $this.parents(".page-btn");
        var search = $parents.data("search");
        var url = $parents.data("url");
        var pageNum = $this.data("page") || 1;
        if (!pageNum) {
            return;
        }
        var action = url + "/" + pageNum;

        if (search) {
            $("#searchForm").find("input[name=pageNumber]").val(pageNum);
            $(".nav-search-btn").click();
        } else {
            window.location.href = action;
        }
    });

    /* 首页通知 */
    if ($('#notice-box') && $('#notice-box')[0]) {
        $.ajax({
            type: "post",
            url: "/api/listNotice",
            success: function (json) {
                if (json.status == 200 && json.data && json.data.length > 0) {
                    var tpl = '{{#data}}<li class="scrolltext-title">'
                        + '{{&content}}'
                        + '</li>{{/data}}';
                    var html = Mustache.render(tpl, json);
                    $("#notice-box").html(html);
                }
            },
            error: function () {
                $.alert.ajaxError();
            }
        });
    }

    $('#myCarousel').mouseover(function () {
        $(".carousel-control").removeClass("hide");
    }).mouseout(function () {
        $(".carousel-control").addClass("hide");
    }).carousel({
        interval: 5000
    });
});
