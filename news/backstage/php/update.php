<?php
//修改
header("Content-Type:application/json;charset=utf-8");
require("main.php");
$oldTitle=$_POST["oldTitle"];
$type=$_POST["type"];
$title=$_POST["title"];
$img=$_POST["img"];
$content=$_POST["content"];
$time=$_POST["time"];
$db->update("`news`","`newstype`='".$type."',`newstitle`='".$title."',`newsimg`='".$img."',`newscontent`='".$content."',`addtime`='".$time."'","WHERE `newstitle`='".$oldTitle."'");
echo'{"success":true,"msg":"新闻:'.$title.',修改成功！"}';
$db->dbClose();
?>