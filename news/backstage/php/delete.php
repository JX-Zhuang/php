<?php
//删除
header("Content-Type: application/json;charset=utf-8");
require("main.php");
$type=$_POST["type"];
$title= $_POST["title"];
$img=$_POST["img"];
$content= $_POST["content"];
$time= $_POST["time"];
$db->delete("`news`","WHERE `newstype`='".$type."' AND`newstitle`='".$title."'AND`newsimg`='".$img."'AND`newscontent`='".$content."'AND`addtime`='".$time."'");
echo '{"success":true,"msg":"新闻:'. $title .',删除成功！"}';
$db->dbClose();
?>
