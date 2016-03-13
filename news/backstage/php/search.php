<?php
//查询
header("Content-Type: application/json;charset=utf-8");
require("main.php");
$select=$db->select("*","`news`","WHERE `newstitle`='".$_POST["title"]."'");
$array=$db->myArray($select);
    if (($_POST["title"]==$array["newstitle"])&&($_POST["title"]!=null)) {
        $type=$array["newstype"];
        $title=$array["newstitle"];
        $img=$array["newsimg"];
        $content=$array["newscontent"];
        $time=$array["addtime"];
        echo '{"success":true,"type":"'.$type.'","title":"'.$title.'","img":"'.$img.'","content":"'.$content.'","time":"'.$time.'"}';
    }else{
        echo '{"success":false,"msg":"没有这条新闻"}';
    }
$db->dbClose();
?>