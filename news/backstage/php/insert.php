<?php
//增加，插入
header("Content-Type: application/json;charset=utf-8");
require("main.php");
    $type=$_POST["type"];
    $title= $_POST["title"];
    $img=$_POST["img"];
    $content= $_POST["content"]; 
    $time= $_POST["time"]; 
  //判断信息是否填写完全
  if (!isset($type) || empty($type)||!isset($title) || empty($title)||!isset($img) || empty($img)
    || !isset($content) || empty($content)
    || !isset($time) || empty($time)) {
    echo '{"success":false,"msg":"参数错误，新闻填写不全"}';
      return;
  }else{
      $db->insert("`news`","`newstype`,`newstitle`, `newsimg`, `newscontent`, `addtime`","'".$type."','".$title."','".$img."','".$content."','".$time."'");
      echo '{"success":true,"msg":"新闻:'. $title .',新闻插入成功！"}';
  }
$db->dbClose();


?>