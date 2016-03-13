 //增加
 $(document).ready(function() {
     $("#insert-btn").click(function(e) {
        e.preventDefault();
        save();
    });
     function save() {
         $.ajax({
             type: "POST",
             url: "./php/insert.php",
             dateType: "json",
             data: {
                 title: $("#newstitle").val(),
                 img:$("#newsimg").val(),
                 content: $("#newscontent").val(),
                 time: $("#newstime").val(),
             },
             success: function(data) {
                if (data.success) {
                    alert("添加成功");
                }else{
                    alert(data.msg);
                }
             },
             error: function(jqXHR) {
                 alert("错误:" + jqXHR.status);
             }
         });
     }

 });
