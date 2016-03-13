-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2015 ?12 ?29 ?16:13
-- 服务器版本: 5.6.11
-- PHP 版本: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `my_news`
--
CREATE DATABASE IF NOT EXISTS `my_news` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `my_news`;

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `newstitle` varchar(100) DEFAULT NULL,
  `newsimg` varchar(200) DEFAULT NULL,
  `newscontent` text,
  `addtime` date DEFAULT NULL,
  `newstype` varchar(100) DEFAULT NULL,
  `newsid` int(100) DEFAULT NULL COMMENT '自动增长',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231 ;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`newstitle`, `newsimg`, `newscontent`, `addtime`, `newstype`, `newsid`, `id`) VALUES
('推荐标题1', 'http://c.hiphotos.baidu.com/news/crop%3D0%2C1%2C541%2C324%3Bw%3D638/sign=5c4201245443fbf2d163fc638d4ee6b1/32fa828ba61ea8d367015028900a304e251f58fe.jpg', '新闻内容', '2015-12-01', '推荐', NULL, 214),
('百家标题1', 'http://a.hiphotos.baidu.com/news/crop%3D0%2C56%2C550%2C330%3Bw%3D638/sign=80385438ac18972bb7755a8adbfd57bc/a71ea8d3fd1f4134c7246d52221f95cad1c85e8e.jpg', '新闻内容', '2015-12-02', '百家', NULL, 215),
('本家标题1', 'http://c.hiphotos.baidu.com/news/w%3D638/sign=07158c0f74f082022d92923c73fbfb8a/f9198618367adab4e0b3736f8cd4b31c8701e4bf.jpg', '新闻内容', '2015-12-02', '本地', NULL, 216),
('图片标题2', 'http://c.hiphotos.baidu.com/news/w%3D638/sign=f9692a154c36acaf59e095ff44d88d03/b58f8c5494eef01f08af71e9e7fe9925bc317d66.jpg', '新闻内容', '2015-12-02', '图片', NULL, 217),
('娱乐标题1', 'http://c.hiphotos.baidu.com/news/crop%3D0%2C1%2C541%2C324%3Bw%3D638/sign=5c4201245443fbf2d163fc638d4ee6b1/32fa828ba61ea8d367015028900a304e251f58fe.jpg', '新闻内容', '2015-12-02', '娱乐', NULL, 218),
('社会标题1', 'http://c.hiphotos.baidu.com/news/w%3D638/sign=f9692a154c36acaf59e095ff44d88d03/b58f8c5494eef01f08af71e9e7fe9925bc317d66.jpg', '新闻内容', '2015-12-02', '社会', NULL, 219),
('军事标题1', 'http://a.hiphotos.baidu.com/news/w%3D638/sign=2e8c8925b1003af34dbadf630d2ac619/a2cc7cd98d1001e9215e7d23bf0e7bec54e797bf.jpg', '新闻内容', '2015-12-02', '军事', NULL, 220),
('科技标题1', 'http://h.hiphotos.baidu.com/news/crop%3D0%2C1%2C579%2C347%3Bw%3D638/sign=f354d1161ed8bc3ed2475c8abfbb8a2f/aa64034f78f0f7363016282d0d55b319ebc41335.jpg', '新闻内容', '2015-12-02', '科技', NULL, 221),
('互联网标题1', 'http://b.hiphotos.baidu.com/news/w%3D638/sign=deeb73bbde33c895a67e9b78e9127397/728da9773912b31b619ec9058118367adab4e128.jpg', '新闻内容', '2015-12-02', '互联网', NULL, 222),
('体育标题1', 'http://g.hiphotos.baidu.com/news/crop%3D0%2C30%2C481%2C288%3Bw%3D638/sign=6f25ec04902bd407568889bd46b9b262/a71ea8d3fd1f4134f10b7752221f95cad1c85ed9.jpg', '新闻内容', '2015-12-02', '体育', NULL, 223),
('国外标题1', 'http://h.hiphotos.baidu.com/news/crop%3D0%2C1%2C579%2C347%3Bw%3D638/sign=f354d1161ed8bc3ed2475c8abfbb8a2f/aa64034f78f0f7363016282d0d55b319ebc41335.jpg', '新闻内容', '2015-12-02', '国外', NULL, 224),
('推荐标题2', 'http://h.hiphotos.baidu.com/news/crop%3D0%2C1%2C579%2C347%3Bw%3D638/sign=f354d1161ed8bc3ed2475c8abfbb8a2f/aa64034f78f0f7363016282d0d55b319ebc41335.jpg', '新闻内容', '2015-12-02', '推荐', NULL, 225),
('百家标题2', 'http://h.hiphotos.baidu.com/news/crop%3D0%2C1%2C579%2C347%3Bw%3D638/sign=f354d1161ed8bc3ed2475c8abfbb8a2f/aa64034f78f0f7363016282d0d55b319ebc41335.jpg', '新闻内容', '2015-12-02', '百家', NULL, 226),
('社会标题2', 'http://h.hiphotos.baidu.com/news/crop%3D0%2C1%2C579%2C347%3Bw%3D638/sign=f354d1161ed8bc3ed2475c8abfbb8a2f/aa64034f78f0f7363016282d0d55b319ebc41335.jpg', '新闻内容', '2015-12-02', '社会', NULL, 227),
('国外标题2', 'http://h.hiphotos.baidu.com/news/crop%3D0%2C1%2C579%2C347%3Bw%3D638/sign=f354d1161ed8bc3ed2475c8abfbb8a2f/aa64034f78f0f7363016282d0d55b319ebc41335.jpg', '新闻内容', '2015-12-02', '国外', NULL, 228),
('体育标题2', 'http://d.hiphotos.baidu.com/news/crop%3D0%2C47%2C999%2C600%3Bw%3D638/sign=0318ee058118367ab9c6259d1343a7e0/9345d688d43f8794178b6b02d51b0ef41bd53aa1.jpg', '新闻内容', '2015-12-02', '体育', NULL, 229),
('互联网标题2', 'http://e.hiphotos.baidu.com/news/w%3D638/sign=9b18b39780d6277fe912313b10381f63/279759ee3d6d55fbaee2510a6a224f4a20a4ddf1.jpg', '新闻内容', '2015-12-02', '互联网', NULL, 230);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
