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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
	(20, 18, 'http://tutor-community.oss-cn-beijing.aliyuncs.com/community/1545361944754.jpeg', '我是老师', 0);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;

-- 导出  表 tutor.learnFile 结构
CREATE TABLE IF NOT EXISTS `learnFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` char(50) CHARACTER SET utf8 NOT NULL,
  `file_src` text CHARACTER SET utf8 NOT NULL,
  `upload_time` char(50) COLLATE utf8_bin DEFAULT NULL,
  `upload_peo` char(50) COLLATE utf8_bin DEFAULT '管理员',
  `up_num` int(11) DEFAULT NULL,
  `fileVerify` int(11) NOT NULL,
  `srore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.learnFile 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `learnFile` DISABLE KEYS */;
INSERT INTO `learnFile` (`id`, `file_name`, `file_src`, `upload_time`, `upload_peo`, `up_num`, `fileVerify`, `srore`) VALUES
	(1, '2018年中考英语试卷.docx', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E4%B8%AD%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E4%B8%AD%E8%80%83%E8%8B%B1%E8%AF%AD%E8%AF%95%E5%8D%B7.docx', '2018-12-25', '管理员', 30, 0, 3),
	(2, '2018年山东省德州市中考物理试卷 (1).doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E4%B8%AD%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E5%B1%B1%E4%B8%9C%E7%9C%81%E5%BE%B7%E5%B7%9E%E5%B8%82%E4%B8%AD%E8%80%83%E7%89%A9%E7%90%86%E8%AF%95%E5%8D%B7%20%281%29.doc', '2018-12-25', '管理员', 30, 0, 4),
	(3, '2018年广东省中考化学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E4%B8%AD%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E5%B9%BF%E4%B8%9C%E7%9C%81%E4%B8%AD%E8%80%83%E5%8C%96%E5%AD%A6%E8%AF%95%E5%8D%B7.doc', '2018-12-25', '管理员', 30, 0, 5),
	(4, '2018年湖北省武汉市中考数学试卷.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E4%B8%AD%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E6%B9%96%E5%8C%97%E7%9C%81%E6%AD%A6%E6%B1%89%E5%B8%82%E4%B8%AD%E8%80%83%E6%95%B0%E5%AD%A6%E8%AF%95%E5%8D%B7.doc', '2018-12-25', '管理员', 30, 0, 5),
	(5, '2018年赤峰市毕业升学历史样题.docx', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E4%B8%AD%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E8%B5%A4%E5%B3%B0%E5%B8%82%E6%AF%95%E4%B8%9A%E5%8D%87%E5%AD%A6%E5%8E%86%E5%8F%B2%E6%A0%B7%E9%A2%98.docx', '2018-12-25', '管理员', 30, 0, 3),
	(6, '2016年高考真题——语文（全国Ⅰ卷', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E9%AB%98%E8%80%83%E4%B8%93%E5%8C%BA/2016%E5%B9%B4%E9%AB%98%E8%80%83%E7%9C%9F%E9%A2%98%E2%80%94%E2%80%94%E8%AF%AD%E6%96%87%EF%BC%88%E5%85%A8%E5%9B%BD%E2%85%A0%E5%8D%B7%EF%BC%89%20Word%E7%89%88%E5%90%AB%E7%AD%94%E6%A1%88%281%29.doc', '2018-12-25', '管理员', 30, 1, 4),
	(7, '2016高考理综试卷及解析.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E9%AB%98%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E5%85%A8%E5%9B%BD%E7%BB%9F%E4%B8%80%E9%AB%98%E8%80%83%E6%95%B0%E5%AD%A6%E8%AF%95%E5%8D%B7%EF%BC%88%E6%96%87%E7%A7%91%EF%BC%89%EF%BC%88%E6%96%B0%E8%AF%BE%E6%A0%87%E2%85%A0%EF%BC%89.doc', '2018-12-25', '管理员', 30, 1, 5),
	(8, '2018年全国统一高考化学试卷（新课标Ⅱ）.doc', 'http://tutor-learn.oss-cn-beijing.aliyuncs.com/%E8%B5%84%E6%96%99/%E9%AB%98%E8%80%83%E4%B8%93%E5%8C%BA/2018%E5%B9%B4%E5%85%A8%E5%9B%BD%E7%BB%9F%E4%B8%80%E9%AB%98%E8%80%83%E8%8B%B1%E8%AF%AD%E8%AF%95%E5%8D%B7%EF%BC%88%E6%96%B0%E8%AF%BE%E6%A0%87%E2%85%A0%EF%BC%89.doc', '2018-12-25', '管理员', 30, 1, 2);
/*!40000 ALTER TABLE `learnFile` ENABLE KEYS */;

-- 导出  表 tutor.learnNews 结构
CREATE TABLE IF NOT EXISTS `learnNews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8,
  `src` char(150) CHARACTER SET utf8 DEFAULT NULL,
  `time` char(50) COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.learnNews 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `learnNews` DISABLE KEYS */;
INSERT INTO `learnNews` (`id`, `header`, `content`, `src`, `time`, `num`) VALUES
	(1, '帮助提高记忆力的一些方法', '帮助提高记忆力的一些方法\r\n　　1、注意集中\r\n　　记忆时只要聚精会神，专心致志，排除杂念和外界干扰，大脑皮层就会留下深刻的记忆痕迹而不易遗忘。如果精神涣散，一心二用，就会大大降低记忆效率。\r\n　　2、兴趣浓厚\r\n　　如果对学习材料、知识对象索然无味，即使花再多时间，也难以记住。\r\n　　3、理解记忆\r\n　　理解是记忆的基础，只有理解的东西才能记得牢，记得久。仅靠死记硬背，则不容易记住。\r\n　　4、过度学习\r\n　　即对学习材料在记住的基础上，多记几遍，达到熟记、牢记的程度。过度学习的最佳程度是150%。\r\n　　5、及时复习\r\n　　遗忘的速度是先快后慢，对刚学过的知识趁热打铁、及时温习巩固是强化记忆痕迹、防止遗忘的有效手段。\r\n　　6、经常回忆\r\n　　学习时，不断进行尝试回忆，可使记忆错误得到纠正，遗漏得到弥补，使学习内容难点记得更牢。\r\n　　7、读、想、视、听相结合\r\n　　可以同时利用语言功能和视、听觉器官的功能来强化记忆，提高记忆效率，比单一默读效果好很多。\r\n　　8、运用多种记忆手段\r\n　　根据情况，灵活运用分类记忆、特点记忆、谐音记忆、争论记忆、联想记忆、趣味记忆、图表记忆、缩短记忆及编提纲、做笔记、卡片等记忆方法均能增强记忆力。\r\n　　9、掌握最佳记忆时间\r\n　　一般来说，上午8～10时、下午6～8时、入睡前一小时为最佳记忆时间。利用上述时间记忆难记的学习材料，效果较好。\r\n　　10、科学用脑\r\n　　在保证营养、积极休息、进行体育锻炼等保养大脑的基础上科学用脑，防止过度疲劳，保持积极乐观的情绪，能大大提高大脑的工作效率，这是提高记忆力的关键！\r\n\r\n', 'https://tutor-learn.oss-cn-beijing.aliyuncs.com/%E6%96%B0%E9%97%BB/3ca220997ef71be159fa308f04fa995a.jpg', '2018-12-12', 99),
	(2, '不同的孩子选择不同的学习方法', '不同的孩子选择不同的学习方法\r\n对于外向型性格的孩子，在学习方法中要注意：\r\n　　好学深思。外向型性格的孩子性格爽朗、倔强，考试不怯场，对事物能直截了当地提出自己的看法和想法，遇到问题敢于向别人请教，这些都是对学习十分有利的性格特点。不过，由于这类孩子自信自己“领会得快”，所以对待问题往往不求甚解，即便请教别人也不认真倾听对方的回答，往往别人话还没说完，他就觉得自己已经“明白”了，其实也未见得真正“明白”。所以，要要求这样的孩子养成好学深思的习惯，防止遇到问题“浅尝辄止”或“绕道走”的不良倾向。\r\n　　加强计划。外向型性格的孩子学习往往缺乏计划性，无论干什么，大多从兴趣和感情出发，所以即使制订了学习计划也难以切实执行。因此，这样的孩子应要求他自己制订一个详细的学习计划，并严格按照学习计划所规定的进度去做。\r\n　　有错必究。外向型性格的孩子一般不在乎分数的高低和评语的好坏，对试卷和作业中的错误也不想认真改正。应该帮助孩子养成有错必纠的习惯，把错误认真改正过来，才能避免“重蹈覆辙”。为此，有必要让孩子作错答笔记，即把答错的题和不会作的题都清楚地记在笔记本里并经常翻看。\r\n　　求得帮助。外向型性格的孩子独自一人温课时效率往往不高，因此，最好能找一些性格较内向的同学一起温习功课，以便取人性格之长，补己性格之短，从而有效地提高自己的学习效率。\r\n　　对于内向型性格的孩子，在学习中要注意：\r\n　　打消自卑。性格内向的同学往往比较自卑，有了自卑感就容易造成心神不安、焦虑烦燥，从而影响学习效率。要使孩子打消学习中的自卑感，教育孩子一要能正确评价自己，即不仅要能如实地看到自己的短处，也要能恰如其分地看到自己的长处，切不可因自己的某些不如人之处而看不到自己的如人之处和过人之处。二要正确地表现自己，多做一些力所能及和把握较大的事情，哪怕这些事情很小，也不要放弃争取成功的机会，可在自己所擅长的学科上狠下功夫，争取取得好成绩，以增强学习的信心。三是正确地补偿自己，承认自己在某些方面有缺陷，但不背思想包袱，以最大的决心和最顽强的毅力去克服这些缺陷。\r\n　　心胸豁达。性格内向的孩子心胸往往比较狭隘，当学习未达到预期目的，或者考试成绩不理想时易引起情绪波动，教育孩子不要过分看重考试分数，即使得了坏分数也不要悲观，以免因此而影响自己的学习热情和学习效率。\r\n　　独自学习。性格内向的孩子往往不愿参加集体学习，效率往往也不高，故温课时最好能找个安静场所，独自进行学习。但应提高孩子的自控力，防止独自坐在桌子前想入非非，而白白浪费了学习时间。\r\n\r\n', 'https://tutor-learn.oss-cn-beijing.aliyuncs.com/%E6%96%B0%E9%97%BB/d7617160371c353b1245da0fc7642c94.jpg', '2018-12-12', 99),
	(3, '超实用的小学生语文课文背诵方法', '超实用的小学生语文课文背诵方法\r\n记忆是我国传统的学习语文的一种好方法。记忆是小学语文教学的一项重要内容，可很多教师在这方面花的精力不够，很多时候只是给学生布置一些记忆作业，根本谈不上什么记忆指导。学生对要求记忆的内容自然是死记硬背，机械记忆。这样，造成的结果是学生很容易遗忘所背内容，甚至厌恶记忆。教师都是教学中的有心人，本着对学生负责的态度，在教学中进行了记忆指导，让学生在理解的基础上、在有方法可循的基础上背诵课文，效果自然不一样。教学实践证明：记忆能有效提高学生的理解能力和表达能力，是学生积累语言的重要途径。作为语文学习的重要方法之一——记忆，有很多诀窍，现结合自己的教学经验向大家谈谈常用的记忆方法。\r\n　　“熟读成诵”的方法\r\n　　“熟读成诵”不是单纯朗读，而是把阅读和品味两者有机地结合起来。在学生领会语言文字的基础上，教师采用生生赛读、师生赛读、自己喜欢的方式读等方式，一遍又一遍地读课文，一次又一次地带着情感和体验读课文，最后学生不看书背诵自然水到渠成。\r\n　　理解记忆法\r\n　　就是理解了文章的思想内容、时代背景及各部分之间的内在联系之后，再记忆，可以大大加快背诵的速度。\r\n　　朗读记忆法\r\n　　口里发音，耳朵听声，眼睛看字，大脑思维，多种感官同时运动，同时刺激大脑，在大脑皮层上形成多个兴奋点，建立起纵横交错的神经联系。宋朝教育家朱熹所说：“要读得字字响亮，不可误一字，不可少一字，不可多一字，不可倒一字……要多读数遍，自然上口，久远不忘。”，同时要注意声音节奏和语调的顿挫，使记忆有声有色，为背诵打下扎实的基础。有时朗读好了，自然就背下来了。\r\n　　循序渐进记忆法\r\n　　先背下第一段，然后背第二段，在背下第二段后，把一、二两段从头至尾背一遍;然后背第三段，第三段背下后，再把一、二、三段从头至尾背一遍;然后再背第四段，背下后再把一至四段从头至尾背一遍……，依次下去，直到全文背下为止。这种方法好似滚雪球，雪球越滚越大，背得越来越快，越来越熟练。到最后一段时，要多进行几遍强化背诵，这样全文或全诗可背得滚瓜烂熟(这种方法不仅是背诵课文的好方法，也是很好的学习法和复习法)。\r\n　　尝试回忆法\r\n　　在进行记忆的过程中，如果只是不停地朗读是很难记住材料的。因为这是一种较浅水平的信息处理，然而，如果朗读一个句子几遍之后，就试着回忆刚刚读过的句子，则更容易记住。对段落和篇章的记忆也应采用同样的方法。因为，对信息的加工水平越深，信息就能更长时间地保留在记忆中。曹日昌先生说：“试图记忆，一方面由于学习者的积极活动，可以提高更多的建立联系的机会，有利于记忆; 另一方面由于试图记忆时更清楚地了解材料的特点与难点，可以更好地分配复习，在难点上多进行诵读。”\r\n　　循环巩固法\r\n　　根据遗忘的规律，记得了的信息很快就开始遗忘，且开头时遗忘的速度特别快。因此需要及时地复习。若等到记忆中的信息大部分或者完全消失之后再复习，所花的时间就比及时复习所花的时间更多。正所谓 “及时一针顶九针”。不仅需要及时复习，还须经常巩固。原因是我们学过的东西，如果经常复习，就可以长期不会忘记。\r\n　　表演记忆法\r\n　　背诵课文时，学生常常会遇到一些特别难记的内容，教师可以引导学生先重点背诵较难的内容，并加上适当的动作，边记忆边表演，势必会增进对古诗文的理解，从而与作者的情感产生共鸣。这种方法正好适用于我们小学生。例如，在背诵《鹅》时，让学生装作大白鹅的样子，迈着沉重的步子上台。当背诵“曲项向天歌”时，就伸长脖子，摇头晃脑地张大嘴巴，好像真的在引颈高歌。再如背诵《望庐山瀑布》，当背到“生紫烟”、“挂前川”、“三千尺”、“落九天”这些词语时，除了加强背诵的语气外，还主动用形体动作表现出瀑布的美丽壮观和从高空落下的动态。适当的语气和体态，有效地帮助了自己记忆与理解。在这样边表演边背诵的形式下，小学生们记忆得很快。\r\n　　联想记忆法\r\n　　如背诵《猜一猜》(第一册第九课)时，先指导学生抓住“云儿”、“小树”、“禾苗”、“花儿”这些词。因为这些都是每一句开头的词，起着提示每一句的关键作用。然后，让学生一边想“云儿、小树、禾苗、花儿”遇到风会怎么样，一边背诵出来。又如，要想记住“狗——自行车”这对词，我们可以想象“狗骑着自行车在马路上逛来逛去”。\r\n　　线索记忆法\r\n　　每篇课文内容是按一定顺序写的，都有一定内在联系的线索。记忆时，可以先让学生理清课文的线索，然后按照这条线索进行记忆。如：当学生选择背诵《美丽的小兴安岭》(第五册第九课)的第二自然段时，可以先提出“这一段描写了小兴安岭春天的哪些景物”的问题，让学生理出“树木→积雪→小鹿→影子”的线索，然后按这条线索背诵。这样，学生就能很快背诵出这一段的内容。\r\n\r\n', 'https://tutor-learn.oss-cn-beijing.aliyuncs.com/%E6%96%B0%E9%97%BB/d7fad1ac3cd8e5cc30d203445bb47144.jpg', '2018-12-12', 99);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.order2 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `order2` DISABLE KEYS */;
INSERT INTO `order2` (`order_id`, `stu_id`, `tea_id`, `class_time`, `order_time`, `order_address`, `order_course`) VALUES
	(2, 15, 1000, '测试', '2018-11-19 12:29:2', '测试', '化学'),
	(3, 16, 1002, '测试', '2018-11-19 13:22:56', '测试', '数学'),
	(4, 19, 1007, '测试', '2018-11-19 13:34:7', '测试', '化学'),
	(5, 37, 1007, '12/19 下午2点', '2018-11-19 14:33:55', '河北师范大学公教楼', '化学'),
	(6, 17, 1002, '周六上午', '2018-11-19 14:38:42', '师范大学', '数学'),
	(7, 19, 1007, '下周六', '2018-11-19 14:40:8', '塔中', '化学'),
	(9, 19, 1007, '周日下午', '2018-11-19 17:13:22', '师大', '化学');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.students 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`stu_id`, `stu_name`, `stu_age`, `stu_sex`, `stu_grade`, `stu_phone`, `is_tea_ID`, `stu_password`, `head_src`) VALUES
	(10, '郭艳霞', 20, '女', '四年级', '18710225452', '1001', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(11, '李四', 20, '男', '四年级', '15613365436', '1004', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(12, '王青桔', 20, '女', '四年级', '17732106685', '1002', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545114126124.jpeg'),
	(13, '张三', 19, '男', '四年级', '15690302209', '1003', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1544940472223.jpeg'),
	(17, '小学生', 10, '男', '四年级', '17073406992', NULL, '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(18, '卓然老师小', 10, '男', '四年级', '15690580872', '1007', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545226776148.jpeg'),
	(19, '学生张', 10, '男', '四年级', '15227181379', NULL, '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545211138053.jpeg'),
	(20, '大学生', 20, '男', '四年级', '18648251121', NULL, '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg'),
	(21, '小学生', 10, '男', '四年级', '15690580870', '1012', '123456', 'http://tutor666.oss-cn-beijing.aliyuncs.com/head/1545036703884.jpeg');
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
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.teachers 的数据：~10 rows (大约)
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
	(1012, '张胜然', 21, '男', '128669358@qq.com', '高中', '化学', '河北师范大学', '软件工程', '大一', '130727199704012415', 'test');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

-- 导出  表 tutor.video 结构
CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_src` char(200) CHARACTER SET utf8 DEFAULT NULL,
  `course_name` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `course_time` char(50) COLLATE utf8_bin DEFAULT NULL,
  `course_author` char(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  tutor.video 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` (`id`, `course_src`, `course_name`, `course_time`, `course_author`) VALUES
	(1, 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/MB7S90J9L_1.mp4', NULL, '2018-12-19', 'admin'),
	(2, 'https://tutor666.oss-cn-beijing.aliyuncs.com/video/ME09FSRAU_1.mp4', NULL, '2018-12-19', 'admin'),
	(3, 'http://tutor666.oss-cn-beijing.aliyuncs.com/video/%E7%AE%A1%E7%90%86%E6%97%B6%E9%97%B4.mp4', '管理时间', '2018-12-19', 'admin'),
	(4, 'https://tutor666.oss-cn-beijing.aliyuncs.com/video/%E8%83%BD%E6%BA%90%E5%8C%96%E5%AD%A6.mp4', '能源化学', '2018-12-19', 'admin');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
