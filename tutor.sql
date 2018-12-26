-- --------------------------------------------------------
-- 主机:                           www.zhuoran.fun
-- 服务器版本:                        5.5.60-MariaDB - MariaDB Server
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 tutor 的数据库结构
CREATE DATABASE IF NOT EXISTS `tutor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tutor`;

-- 导出  表 tutor.comment 结构
CREATE TABLE IF NOT EXISTS `comment` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `co_peo_id` char(50) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='评论表';

-- 正在导出表  tutor.comment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 导出  表 tutor.community 结构
CREATE TABLE IF NOT EXISTS `community` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `poster_id` int(11) NOT NULL,
  `img_src1` char(150) CHARACTER SET utf8 DEFAULT NULL,
  `content` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `dianzan` int(11) DEFAULT '0',
  PRIMARY KEY (`co_id`),
  KEY `FK_community_students` (`poster_id`),
  CONSTRAINT `FK_community_students` FOREIGN KEY (`poster_id`) REFERENCES `students` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.community 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` (`co_id`, `poster_id`, `img_src1`, `content`, `dianzan`) VALUES
	(1, 10, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1544753388703.jpeg', 'oh ma ga', 0),
	(2, 10, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1544753388703.jpeg', '临近期末', 0),
	(3, 10, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545032380733.jpeg', '最美的风景', 0),
	(4, 10, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545033433803.jpeg', '说走就走的旅行', 0),
	(5, 10, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545092374309.jpeg', '校园很美', 0),
	(6, 11, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545092540709.jpeg', '精致', 0),
	(7, 12, NULL, '有时候，你不得不在心如死灰一般之后，从灰烬中涅槃，相信自己，并成为一个全新的自己 ​​​​', 0),
	(9, 18, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545197600078.jpeg', '测试666', 0),
	(10, 19, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545197903671.jpeg', '篮球爱好者', 0),
	(13, 11, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545092816952.jpeg', '小松鼠', 0),
	(14, 18, 'https://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545092429390.jpeg', '世贤老铁', 0),
	(15, 17, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545037742594.jpeg', '喜欢', 0),
	(16, 10, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545033208657.jpeg', '人生需要奋斗！', 0),
	(17, 12, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545030433042.jpeg', NULL, 0),
	(18, 19, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545210951640.jpeg', 'test', 0),
	(19, 18, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545293389694.jpeg', '今日测试', 0),
	(23, 19, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545704262340.jpeg', '心累的不行。', 0);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;

-- 导出  表 tutor.learnFile 结构
CREATE TABLE IF NOT EXISTS `learnFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `file_src` text CHARACTER SET utf8,
  `upload_time` char(50) COLLATE utf8_bin DEFAULT '2018-12-23',
  `upload_peo` char(50) COLLATE utf8_bin DEFAULT '管理员',
  `up_num` int(11) DEFAULT '99',
  `fileVerify` int(11) DEFAULT '0',
  `srore` int(11) DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.learnFile 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `learnFile` DISABLE KEYS */;
INSERT INTO `learnFile` (`id`, `file_name`, `file_src`, `upload_time`, `upload_peo`, `up_num`, `fileVerify`, `srore`) VALUES
	(22, '2018年广东省中考化学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E5%B9%BF%E4%B8%9C%E7%9C%81%E4%B8%AD%E8%80%83%E5%8C%96%E5%AD%A6%E8%AF%95%E5%8D%B7.doc1545534312640.doc', NULL, NULL, 99, 0, 5),
	(23, '2018年湖北省武汉市中考数学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E6%B9%96%E5%8C%97%E7%9C%81%E6%AD%A6%E6%B1%89%E5%B8%82%E4%B8%AD%E8%80%83%E6%95%B0%E5%AD%A6%E8%AF%95%E5%8D%B7.doc1545534316044.doc', NULL, NULL, 99, 0, 5),
	(24, '2018年山东省德州市中考物理试卷 (1).doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E5%B1%B1%E4%B8%9C%E7%9C%81%E5%BE%B7%E5%B7%9E%E5%B8%82%E4%B8%AD%E8%80%83%E7%89%A9%E7%90%86%E8%AF%95%E5%8D%B7%20(1).doc1545534319107.doc', NULL, NULL, 99, 0, 5),
	(25, '2018年中考英语试卷.docx', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E4%B8%AD%E8%80%83%E8%8B%B1%E8%AF%AD%E8%AF%95%E5%8D%B7.docx1545534322245.docx', NULL, NULL, 99, 0, 5),
	(27, '2016年高考真题——语文（全国Ⅰ卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2016%E5%B9%B4%E9%AB%98%E8%80%83%E7%9C%9F%E9%A2%98%E2%80%94%E2%80%94%E8%AF%AD%E6%96%87%EF%BC%88%E5%85%A8%E5%9B%BD%E2%85%A0%E5%8D%B7%EF%BC%89%20Word%E7%89%88%E5%90%AB%E7%AD%94%E6%A1%88(1).doc1545534428507.doc', NULL, NULL, 99, 1, 5),
	(28, '2018年全国统一高考化学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E5%85%A8%E5%9B%BD%E7%BB%9F%E4%B8%80%E9%AB%98%E8%80%83%E5%8C%96%E5%AD%A6%E8%AF%95%E5%8D%B7%EF%BC%88%E6%96%B0%E8%AF%BE%E6%A0%87%E2%85%A1%EF%BC%89.doc1545534431728.doc', NULL, NULL, 99, 1, 4),
	(29, '2018年全国统一高考数学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E5%85%A8%E5%9B%BD%E7%BB%9F%E4%B8%80%E9%AB%98%E8%80%83%E6%95%B0%E5%AD%A6%E8%AF%95%E5%8D%B7%EF%BC%88%E6%96%87%E7%A7%91%EF%BC%89%EF%BC%88%E6%96%B0%E8%AF%BE%E6%A0%87%E2%85%A0%EF%BC%89.doc1545534435480.doc', NULL, NULL, 99, 1, 4),
	(35, '2018年全国统一高考数学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/material/2018%E5%B9%B4%E5%85%A8%E5%9B%BD%E7%BB%9F%E4%B8%80%E9%AB%98%E8%80%83%E6%95%B0%E5%AD%A6%E8%AF%95%E5%8D%B7%EF%BC%88%E6%96%87%E7%A7%91%EF%BC%89%EF%BC%88%E6%96%B0%E8%AF%BE%E6%A0%87%E2%85%A0%EF%BC%89.doc1545534435480.doc', NULL, NULL, 99, 1, 4);
/*!40000 ALTER TABLE `learnFile` ENABLE KEYS */;

-- 导出  表 tutor.learnNews 结构
CREATE TABLE IF NOT EXISTS `learnNews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `src` char(150) CHARACTER SET utf8 DEFAULT NULL,
  `time` char(50) COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.learnNews 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `learnNews` DISABLE KEYS */;
INSERT INTO `learnNews` (`id`, `header`, `content`, `src`, `time`, `num`) VALUES
	(6, '帮助提高记忆力的一些方法', '    1、注意集中\r\n　　记忆时只要聚精会神，专心致志，排除杂念和外界干扰，大脑皮层就会留下深刻的记忆痕迹而不易遗忘。如果精神涣散，一心二用，就会大大降低记忆效率。\r\n　　2、兴趣浓厚\r\n　　如果对学习材料、知识对象索然无味，即使花再多时间，也难以记住。\r\n　　3、理解记忆\r\n　　理解是记忆的基础，只有理解的东西才能记得牢，记得久。仅靠死记硬背，则不容易记住。\r\n　　4、过度学习\r\n　　即对学习材料在记住的基础上，多记几遍，达到熟记、牢记的程度。过度学习的最佳程度是150%。\r\n　　5、及时复习\r\n　　遗忘的速度是先快后慢，对刚学过的知识趁热打铁、及时温习巩固是强化记忆痕迹、防止遗忘的有效手段。\r\n　　6、经常回忆\r\n　　学习时，不断进行尝试回忆，可使记忆错误得到纠正，遗漏得到弥补，使学习内容难点记得更牢。\r\n　　7、读、想、视、听相结合\r\n　　可以同时利用语言功能和视、听觉器官的功能来强化记忆，提高记忆效率，比单一默读效果好很多。\r\n　　8、运用多种记忆手段\r\n　　根据情况，灵活运用分类记忆、特点记忆、谐音记忆、争论记忆、联想记忆、趣味记忆、图表记忆、缩短记忆及编提纲、做笔记、卡片等记忆方法均能增强记忆力。\r\n　　9、掌握最佳记忆时间\r\n　　一般来说，上午8～10时、下午6～8时、入睡前一小时为最佳记忆时间。利用上述时间记忆难记的学习材料，效果较好。\r\n　　10、科学用脑\r\n　　在保证营养、积极休息、进行体育锻炼等保养大脑的基础上科学用脑，防止过度疲劳，保持积极乐观的情绪，能大大提高大脑的工作效率，这是提高记忆力的关键！\r\n\r\n', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/news/3ca220997ef71be159fa308f04fa995a.jpg', '2018-12-12', 99),
	(7, '帮助提高记忆力的一些方法', '    1、注意集中\r\n　　记忆时只要聚精会神，专心致志，排除杂念和外界干扰，大脑皮层就会留下深刻的记忆痕迹而不易遗忘。如果精神涣散，一心二用，就会大大降低记忆效率。\r\n　　2、兴趣浓厚\r\n　　如果对学习材料、知识对象索然无味，即使花再多时间，也难以记住。\r\n　　3、理解记忆\r\n　　理解是记忆的基础，只有理解的东西才能记得牢，记得久。仅靠死记硬背，则不容易记住。\r\n　　4、过度学习\r\n　　即对学习材料在记住的基础上，多记几遍，达到熟记、牢记的程度。过度学习的最佳程度是150%。\r\n　　5、及时复习\r\n　　遗忘的速度是先快后慢，对刚学过的知识趁热打铁、及时温习巩固是强化记忆痕迹、防止遗忘的有效手段。\r\n　　6、经常回忆\r\n　　学习时，不断进行尝试回忆，可使记忆错误得到纠正，遗漏得到弥补，使学习内容难点记得更牢。\r\n　　7、读、想、视、听相结合\r\n　　可以同时利用语言功能和视、听觉器官的功能来强化记忆，提高记忆效率，比单一默读效果好很多。\r\n　　8、运用多种记忆手段\r\n　　根据情况，灵活运用分类记忆、特点记忆、谐音记忆、争论记忆、联想记忆、趣味记忆、图表记忆、缩短记忆及编提纲、做笔记、卡片等记忆方法均能增强记忆力。\r\n　　9、掌握最佳记忆时间\r\n　　一般来说，上午8～10时、下午6～8时、入睡前一小时为最佳记忆时间。利用上述时间记忆难记的学习材料，效果较好。\r\n　　10、科学用脑\r\n　　在保证营养、积极休息、进行体育锻炼等保养大脑的基础上科学用脑，防止过度疲劳，保持积极乐观的情绪，能大大提高大脑的工作效率，这是提高记忆力的关键！\r\n\r\n', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/news/3ca220997ef71be159fa308f04fa995a.jpg', '2018-12-12', 99);
/*!40000 ALTER TABLE `learnNews` ENABLE KEYS */;

-- 导出  表 tutor.order2 结构
CREATE TABLE IF NOT EXISTS `order2` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `tea_id` int(11) NOT NULL,
  `class_time` char(50) CHARACTER SET utf8 NOT NULL,
  `order_time` char(50) CHARACTER SET utf8 NOT NULL,
  `order_address` char(50) CHARACTER SET utf8 NOT NULL,
  `order_course` char(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.order2 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `order2` DISABLE KEYS */;
INSERT INTO `order2` (`order_id`, `stu_id`, `tea_id`, `class_time`, `order_time`, `order_address`, `order_course`) VALUES
	(2, 15, 1000, '测试', '2018-11-19 12:29:2', '测试', '化学'),
	(3, 16, 1002, '测试', '2018-11-19 13:22:56', '测试', '数学'),
	(4, 19, 1007, '测试', '2018-11-19 13:34:7', '测试', '化学'),
	(5, 37, 1007, '12/19 下午2点', '2018-11-19 14:33:55', '河北师范大学公教楼', '化学'),
	(6, 17, 1002, '周六上午', '2018-11-19 14:38:42', '师范大学', '数学'),
	(7, 19, 1007, '下周六', '2018-11-19 14:40:8', '塔中', '化学'),
	(9, 19, 1007, '周日下午', '2018-11-19 17:13:22', '师大', '化学'),
	(10, 13, 1002, '1月1日 上午9点', '2018-11-25 14:3:4', '谈固瑞城', '数学'),
	(11, 19, 1002, '12/25 下午2点', '2018-11-25 15:12:20', '河北师大', '数学');
/*!40000 ALTER TABLE `order2` ENABLE KEYS */;

-- 导出  表 tutor.students 结构
CREATE TABLE IF NOT EXISTS `students` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '小学生',
  `stu_age` int(11) NOT NULL DEFAULT '10',
  `stu_sex` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '男',
  `stu_grade` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '四年级',
  `stu_phone` char(50) CHARACTER SET utf8 NOT NULL,
  `is_tea_ID` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `stu_password` char(50) CHARACTER SET utf8 NOT NULL,
  `head_src` char(100) CHARACTER SET utf8 NOT NULL DEFAULT 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg',
  PRIMARY KEY (`stu_id`),
  UNIQUE KEY `stu_phone` (`stu_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.students 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`stu_id`, `stu_name`, `stu_age`, `stu_sex`, `stu_grade`, `stu_phone`, `is_tea_ID`, `stu_password`, `head_src`) VALUES
	(10, '郭艳霞', 20, '女', '四年级', '18710225452', '1001', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(11, '李四', 20, '男', '四年级', '15613365436', '1004', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(12, '王青桔', 20, '女', '四年级', '17732106685', '1002', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545114126124.jpeg'),
	(13, '张三', 19, '男', '四年级', '15690302209', '1003', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1544940472223.jpeg'),
	(17, '小学生', 10, '男', '四年级', '17073406992', '1014', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(18, '卓然老师小', 10, '男', '四年级', '15690580872', '1007', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545226776148.jpeg'),
	(19, '学生张3', 10, '男', '四年级', '15227181379', NULL, '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545211138053.jpeg'),
	(20, '大学生', 20, '男', '四年级', '18648251121', '1013', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

-- 导出  表 tutor.teachers 结构
CREATE TABLE IF NOT EXISTS `teachers` (
  `tea_id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_name` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `tea_age` int(11) NOT NULL DEFAULT '0',
  `tea_sex` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `tea_email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `stu_grade` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `stu_courses` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tea_school` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tea_major` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tea_grade` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `userID` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `remark` char(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`tea_id`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.teachers 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`tea_id`, `tea_name`, `tea_age`, `tea_sex`, `tea_email`, `stu_grade`, `stu_courses`, `tea_school`, `tea_major`, `tea_grade`, `userID`, `remark`) VALUES
	(1001, '郭艳霞', 20, '女', '2537158536@qq.com', '小学', '数学', '河北师范', '软件', '大三', '130723199706223226', '耐心'),
	(1002, '王青桔老师', 20, '女', '2462006777@qq.com', '小学', '数学', '北大', '数学', '大一', '130123199711051521', '经验丰富'),
	(1003, '张三', 19, '男', '2537158536@qq.com', '初中', '英语', '经贸大学', '数学', '大二', '130723199702153226', '表达能力强'),
	(1004, '李四', 20, '男', '2537158536@qq.com', '初中', '物理', '保定师范', '物理', '大三', '130723199806223226', '经验丰富'),
	(1005, '王五', 18, '男', '2537158536@qq.com', '高中', '语文', '外国语大学', '外语', '大三', '130723199902133226', '耐心'),
	(1006, '老师', 20, '男', '2537158536@qq.com', '小学', '英语', '外国语大学', '英语', '大二', '130723199905233226', '耐心'),
	(1007, '卓然老师', 10, '男', '1286693585@qq.com', '高中', '化学', '河北师范大学', '软件', '大三', '130727199704012412', '人生讲师'),
	(1009, '郭老师', 20, '女', '2537158536@qq.com', '小学', '数学', '河北师范', '软件', '大三', '130723199706222226', '耐心'),
	(1010, '张三', 19, '男', '2537158536@qq.com', '初中', '英语', '经贸大学', '数学', '大二', '130723199772153226', '表达能力强'),
	(1013, '王某某', 24, '女', '2462006777@qq.com', '初中', '数学', '北京大学', '数学', '大一', '130123199410051521', '喜欢教学'),
	(1014, '吴所谓', 25, '男', '2462006777@qq.com', '高中', '物理', '河北医科大学', '物理', '大二', '130123199510091521', '喜欢教学，经验丰富');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

-- 导出  表 tutor.video 结构
CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_src` text CHARACTER SET utf8 NOT NULL,
  `course_name` char(50) CHARACTER SET utf8 NOT NULL,
  `course_time` char(50) COLLATE utf8_bin DEFAULT '2019',
  `course_author` char(50) CHARACTER SET utf8 DEFAULT 'admin',
  `course_img` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.video 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` (`id`, `course_src`, `course_name`, `course_time`, `course_author`, `course_img`) VALUES
	(10002, 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%AE%A1%E7%90%86%E6%97%B6%E9%97%B4.mp4', '管理时间', '2019-12-24', 'admin', 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%AE%A1%E7%90%86%E6%97%B6%E9%97%B4.mp4?x-oss-process=video/snapshot,t_8000,f_jpg,w_800,h_600,m_fast'),
	(10004, 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%89%9B%E9%A1%BF%E7%AC%AC%E4%B8%89%E5%AE%9A%E5%BE%8B.mp4', '牛顿第三定律', '2019', 'admin', 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%89%9B%E9%A1%BF%E7%AC%AC%E4%B8%89%E5%AE%9A%E5%BE%8B.mp4?x-oss-process=video/snapshot,t_8000,f_jpg,w_800,h_600,m_fast'),
	(10005, 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%89%9B%E9%A1%BF%E7%AC%AC%E4%B8%89%E5%AE%9A%E5%BE%8B.mp4', '牛顿第三定律', '2019', 'admin', 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%89%9B%E9%A1%BF%E7%AC%AC%E4%B8%89%E5%AE%9A%E5%BE%8B.mp4?x-oss-process=video/snapshot,t_8000,f_jpg,w_800,h_600,m_fast'),
	(10008, 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/video/5551545723085634.mp4', '555', '2018-11-25 15:31:12', '555', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/video/5551545723085634.mp4?x-oss-process=video/snapshot,t_8000,f_jpg,w_800,h_600,m_fast');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
