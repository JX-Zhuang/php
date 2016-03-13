<?php
header("Content-Type:application/json;charset=utf-8");
$db=new Mysql("localhost","root","","my_news");
//数据库，及方法
class Mysql{
	private $host,//服务器地址
			$root,//用户名
			$password,//密码
			$database;
	function __construct($host,$root,$password,$database){
		$this->host=$host;
		$this->root=$root;
		$this->password=$password;
		$this->database=$database;
		$this->connect();
	}
	//连接数据库
	function connect(){
		$this->conn=mysql_connect($this->host,$this->root,$this->password) or die("错误:".mysql_error());
		mysql_select_db($this->database,$this->conn);
		mysql_query("SET NAMES 'utf8'");
	}
	//关闭数据库
	function dbClose(){
		mysql_close($this->conn);
	}		
	//执行mysql_query
	function query($sql){
    	return mysql_query($sql);
    }
    //mysql_fetch_array()
    function myArray($result){
    	return mysql_fetch_array($result);
    }
	//查找
	function select($condition1,$tableName,$condition2){
		//$this->query("SELECT $condition FROM  $tableName WHERE 1 ");
		return mysql_query("SELECT $condition1 FROM  $tableName  $condition2 ");
	}
}
?>