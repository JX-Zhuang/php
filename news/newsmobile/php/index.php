<?php
//返回数据库，与类别相同的所有内容
header("Content-Type: application/json;charset=utf-8");
require("main.php");
$select=$db->select("*","news","WHERE `newstype`='".$_POST["type"]."'");
    $i=0;
    echo '{"success":true';
    while($array=$db->myArray($select))
    {
        $title=$array["newstitle"];
        $img=$array["newsimg"];
        $content=$array["newscontent"];
        $time=$array["addtime"];
        $return=',"'.$i++.'":{"title":"'.$title.'","img":"'.$img.'","content":"'.$content.'","time":"'.$time.'"}';
        echo $return;
  }
    echo '}';
$db->dbClose();
?>