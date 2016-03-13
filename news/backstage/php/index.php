<?php
//返回数据库所有内容
header("Content-Type: application/json;charset=utf-8");
require("main.php");
$select=$db->select("*","`news`","WHERE 1");
$i=0;
echo '{"success":true';
while($array=$db->myArray($select))
  {
    $type=$array["newstype"];
    $title=$array["newstitle"];
    $img=$array["newsimg"];
    $content=$array["newscontent"];
    $time=$array["addtime"];
    $return=',"'.$i++.'":{"type":"'.$type.'","title":"'.$title.'","img":"'.$img.'","content":"'.$content.'","time":"'.$time.'"}';
    echo $return;
  }
  echo '}';
  $db->dbClose();
?>