$(document).ready(function() {
    $(document).keydown(function(event) {
        if (event.keyCode == 13) {
            $('form').each(function() {
                event.preventDefault();
            });
        }
    });
    //新闻首页
    newsindex();

    function newsindex() {
        $("#news-contanier").empty();
        newsHead("#news-contanier");
        $.ajax({
            type: "GET",
            url: "./php/index.php",
            dataType: "json",
            success: function(data) {
                indexNews(data);
            },
            error: function(jqXHR) {
                alert("错误：" + jqXHR.status);
            }
        });
    }
    $("#newsindex-btn").click(function() {
        $("#news-contanier").empty();
        newsHead("#news-contanier");
        $.ajax(searchObj);
    });
    var searchObj = {
        type: "GET",
        url: "./php/index.php",
        dataType: "json",
        success: function(data) {
            indexNews(data);
        },
        error: function(jqXHR) {
            alert("错误：" + jqXHR.status);
        }
    };

    //增加新闻
    $("#insert-btn").click(function(e) {
        e.preventDefault();
        insert();
    });

    function insert() {
        $.ajax({
            type: "POST",
            url: "./php/insert.php",
            dateType: "json",
            data: {
                type: $("#newstype").val(),
                title: $("#newstitle").val(),
                img: $("#newsimg").val(),
                content: $("#newscontent").val(),
                time: $("#newstime").val()
            },
            success: function(data) {
                if (data.success) {
                    alert("添加成功");
                } else {
                    alert(data.msg);
                }
            },
            error: function(jqXHR) {
                alert("错误:" + jqXHR.status);
            }
        });
    }

    //查询新闻
    $("#search-news-btn").click(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "./php/search.php",
            dataType: "json",
            data: {
                title: $("#search-news").val()
            },
            success: function(data) {
                if (data.success) {
                    alert(data.msg);
                    $("#search-news-contanier").empty();
                    newsHead("#search-news-contanier");
                    searchNews(data); //输出新闻内容
                } else {
                    alert(data.msg);
                }
            },
            error: function(jqXHR) {
                alert("错误：" + jqXHR.status);
            }
        });
    });
    //首页新闻内容
    function indexNews(obj) {
        for (var index = 0; index < Object.keys(obj).length - 1; index++) {
            var addTr = $("<tr>").appendTo("#news-contanier");
            addNewsInner(addTr, "<input type='text' readonly>", obj[index].type);
            addNewsInner(addTr, "<input type='text' readonly>", obj[index].title);
            addNewsInner(addTr, "<input type='text' readonly>", obj[index].img);
            addNewsInner(addTr, "<textarea readonly>", obj[index].content);
            addNewsInner(addTr, "<input type='date' readonly>", obj[index].time);
            operate(addTr); //操作
        }
        deleteButton();
        update();
        save();
    }
    //新闻列表的头部
    function newsHead(obj) {
        var addTr = $("<tr>").appendTo(obj);
        addNewsHead(addTr, "新闻类型");
        addNewsHead(addTr, "新闻标题");
        addNewsHead(addTr, "新闻图片路径");
        addNewsHead(addTr, "新闻内容");
        addNewsHead(addTr, "新闻时间");
        addNewsHead(addTr, "操作");
    }
    //添加新闻头部
    function addNewsHead(addId, text) {
        var addTd = $("<td>").appendTo(addId);
        addTd.html(text);
    }
    //添加新闻
    function addNewsInner(addId, tag, text) {
        var addTd = $("<td>").appendTo(addId);
        var addTitle = $(tag).appendTo(addTd);
        addTitle.val(text);
    }

    //查询到的新闻内容
    function searchNews(obj) {
        var addTr = $("<tr>").appendTo("#search-news-contanier");
        addNewsInner(addTr, "<input type='text' readonly>", obj.type);
        addNewsInner(addTr, "<input type='text' readonly>", obj.title);
        addNewsInner(addTr, "<input type='text' readonly>", obj.img);
        addNewsInner(addTr, "<textarea readonly>", obj.content);
        addNewsInner(addTr, "<input type='date' readonly>", obj.time);
        operate(addTr); //操作
        deleteButton();
        update();
        save();
    }

    //添加操作按钮
    function operate(addId) {
        var addTd = $("<td>").appendTo(addId);
        var operateBtn = [];
        for (var i = 0; i < 3; i++) {
            operateBtn[i] = $("<button>").appendTo(addTd);
        }
        operateBtn[0].addClass("delBtn");
        operateBtn[0].html("删除");
        operateBtn[1].addClass("updateBtn");
        operateBtn[1].html("修改");
        operateBtn[2].addClass("saveBtn").css("display", "none");
        operateBtn[2].html("保存");
    }

    //删除按钮
    function deleteButton() {
        $(".delBtn").click(function(e) {
            e.preventDefault();
            var delTr = $(this).parent().parent();
            var delTd = $(delTr).children();
            $.ajax({
                type: "POST",
                url: "./php/delete.php",
                dataType: "json",
                data: {
                    type: $(delTd).children().eq(0).val(),
                    title: $(delTd).children().eq(1).val(),
                    img: $(delTd).children().eq(2).val(),
                    content: $(delTd).children().eq(3).val(),
                    time: $(delTd).children().eq(4).val()
                },
                success: function(data) {
                    if (data.success) {
                        alert(data.msg);
                    } else {
                        alert(data.msg);
                    }
                },
                error: function(jqXHR) {
                    alert("错误：" + jqXHR.status);
                },
            });
            $(delTr).remove();
        });

    }

    //修改按钮
    function update() {
        $(".updateBtn").click(function(e) {
            e.preventDefault();
            var updatelTr = $(this).parent().parent();
            updatelTd = $(updatelTr).children();
            updatelTd.last().children().last().css("display", "block");
            oldTitle = updatelTd.eq(1).children().val(); //需要修改的新闻标题
            $(updatelTd).removeAttr("readonly");
            updatelTd.children().removeAttr("readonly");
            $(updatelTd.eq(1).children()).focus();

        });
    }


    //保存按钮
    function save() {
        $(".saveBtn").click(function(e) {
            e.preventDefault();
            var updatelTr = $(this).parent().parent();
            var updatelTd = $(updatelTr).children();
            $.ajax({
                type: "POST",
                url: "./php/update.php", //提交地址
                dataType: "json",
                data: {
                    oldTitle: oldTitle,
                    type: updatelTd.eq(0).children().val(),
                    title: updatelTd.eq(1).children().val(),
                    img: updatelTd.eq(2).children().val(),
                    content: updatelTd.eq(3).children().val(),
                    time: updatelTd.eq(4).children().val()
                },
                success: function(data) {
                    if (data.success) {
                        $(".saveBtn").css("display", "none");
                        updatelTd.children().attr("readonly", "readonly");
                        alert(data.msg);

                    } else {
                        alert(data.msg);
                    }
                },
                error: function(jqXHR) {
                    alert("请输入需要修改的内容");
                }
            });
        });
    }
});
