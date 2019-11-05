/*
 Navicat Premium Data Transfer

 Source Server         : .
 Source Server Type    : MariaDB
 Source Server Version : 100313
 Source Host           : localhost:3306
 Source Schema         : next-superhero-dev

 Target Server Type    : MariaDB
 Target Server Version : 100313
 File Encoding         : 65001

 Date: 02/06/2019 14:28:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` varchar(64) NOT NULL,
  `movie_id` varchar(64) NOT NULL COMMENT '电影id，页面跳转需要用到',
  `image` varchar(255) NOT NULL COMMENT '图片地址',
  `sort` int(2) NOT NULL COMMENT '排序，从零开始，数字越小优先级越大',
  `is_show` int(1) NOT NULL COMMENT '是否展示：\r\n1：展示\r\n0：不展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

-- ----------------------------
-- Records of carousel
-- ----------------------------
BEGIN;
INSERT INTO `carousel` VALUES ('1', 'marvel-1011', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1ZHiASu_7AAfGb_KNy8Y861.png', 1, 1);
INSERT INTO `carousel` VALUES ('2', 'xman-1004', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1ZSiAaDteAAdT5PsVWXs099.png', 2, 1);
INSERT INTO `carousel` VALUES ('3', 'dc-1011', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1ZNaAAIGuAAg376bqqfo080.png', 3, 0);
INSERT INTO `carousel` VALUES ('4', 'dc-1011', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1ZW6AHqLOAAe4KaofyAU209.png', 4, 1);
INSERT INTO `carousel` VALUES ('5', 'dc-1005', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1ZauAKb7sAAe1cnsz_BQ313.png', 5, 1);
INSERT INTO `carousel` VALUES ('6', 'dc-1008', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1ZgSAdG-rAAfcNtoF_n8219.png', 6, 1);
INSERT INTO `carousel` VALUES ('7', 'marvel-1022', 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw1Z_aASu2VAAf-RnvbnhY123.png', 7, 1);
COMMIT;

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '电影名称',
  `poster` varchar(255) NOT NULL COMMENT '海报',
  `cover` varchar(255) NOT NULL COMMENT '电影封面',
  `trailer` varchar(255) NOT NULL COMMENT '预告片的播放地址',
  `score` float(3,1) NOT NULL,
  `prised_counts` int(11) NOT NULL DEFAULT 0 COMMENT '影片获得赞的数量',
  `basic_info` varchar(128) NOT NULL COMMENT '基本介绍，例：\r\n2018 / 美国 / 科幻 / 超级英雄',
  `original_name` varchar(64) NOT NULL COMMENT '电影原名，例：\r\n原名：Super Man',
  `release_date` varchar(64) NOT NULL COMMENT '上映时间：2018-12-17（中国大陆）',
  `total_time` varchar(64) NOT NULL COMMENT '影片时长：189分钟（中国大陆）',
  `plot_desc` varchar(1500) NOT NULL COMMENT '剧情介绍',
  `directors` varchar(255) NOT NULL COMMENT '导演，数组表示，一部电影可以有多个或者至少1个，例：\r\n["1001"，"1002"]',
  `actors` varchar(255) NOT NULL COMMENT '主要演员，数组表示，例：\r\n["", "", ""]',
  `plot_pics` varchar(2500) NOT NULL COMMENT '剧照，数组表示，例如：\r\n["","",""]',
  `create_time` datetime NOT NULL COMMENT '创建时间，保持和电影上映时间一致',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电影表';

-- ----------------------------
-- Records of movie
-- ----------------------------
BEGIN;
INSERT INTO `movie` VALUES ('dc-1001', '海王', 'http://122.152.205.72:88/superhero/DC/Aquaman/poster.jpg', 'http://122.152.205.72:88/superhero/DC/Aquaman/cover.jpg', 'http://122.152.205.72:88/superhero/DC/Aquaman/trailer.mp4', 8.2, 2678, '2018 / 美国 / 科幻 / 超级英雄', '原名：Aquaman‎', '上映时间：2018-12-07(中国大陆)', '影片时长：143分钟（中国大陆）', '华纳兄弟影片公司与导演温子仁联手为您呈现波澜壮阔的动作冒险电影——《海王》！横跨七大洋的广阔海底世界徐徐展开，给观众带来震撼十足的视觉奇观。本片由杰森·莫玛领衔主演，讲述半人半亚特兰蒂斯血统的亚瑟·库瑞踏上永生难忘的征途——他不但需要直面自己的特殊身世，更不得不面对生而为王的考验：自己究竟能否配得上“海王”之名。', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/5.jpg\",\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/6.jpg\",\"http://122.152.205.72:88/superhero/DC/Aquaman/photos/7.jpg\"]', '2018-12-07 15:40:37');
INSERT INTO `movie` VALUES ('dc-1002', '蝙蝠侠:侠影之谜', 'http://122.152.205.72:88/superhero/DC/BatmanBegins/poster.jpg', 'http://122.152.205.72:88/superhero/DC/BatmanBegins/cover.jpg', 'http://122.152.205.72:88/superhero/DC/BatmanBegins/trailer.mp4', 8.3, 5634, '2018 / 美国 / 科幻 / 超级英雄', '原名：Batman Begins', '上映时间：2005-06-29(中国大陆) ', '影片时长：140分钟（中国大陆）', '布鲁斯 韦恩（克里斯汀•贝尔 Christian Bale 饰）童年亲眼目睹了父母在高谭市街头被歹徒枪杀，韦恩充满怒火。在继承了父亲亿万家产后，韦恩开始环游世界，希望凭自己的力量复仇和打击犯罪！ \r\n　　韦恩为了了解罪犯的心理，在亚洲他亲自体现了犯罪的感觉，最后被捕入狱。他在狱中遇到了武艺高强的杜卡，杜卡传授了韦恩高强的武艺和坚韧的意志力。韦恩很快被神秘的影忍者盟看上，忍者大师一直想邀他加入。 \r\n　　韦恩不久发现影忍者盟对自己的家乡高谭市另有企图，他毅然回到了故乡。韦恩在自己的庄园发现了一个地下室，从此他多了一个身份—蝙蝠侠。蝙蝠侠开始了对抗笼罩在高谭市的黑暗。', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/BatmanBegins/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanBegins/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanBegins/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanBegins/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanBegins/photos/5.jpg\"]', '2005-06-29 15:40:37');
INSERT INTO `movie` VALUES ('dc-1003', '蝙蝠侠:黑暗骑士', 'http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/poster.jpg', 'http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/cover.jpg', 'http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/trailer.mp4', 8.4, 8959, '2018 / 美国 / 科幻 / 超级英雄', '原名：The Dark Knight‎', '上映时间：2008-07-18(美国)', '影片时长：152分钟(美国)', '从亲眼目睹父母被人杀死的阴影中走出来的“蝙蝠侠”，经历了成长之后，已经不再是那个桀骜不的孤单英雄了。在警官吉姆·戈登和检查官哈维·登特的通力帮助下，“蝙蝠侠”无后顾之忧地继续满世界的奔波，与日益增长起来的犯罪威胁做着永无休止的争斗，而他所在的高谭市，也是进展最为明显的地方，犯罪率以一种惊人的速度持续下降着，毕竟对方是能够上天入地的“蝙蝠侠”，不借两个胆子谁还敢造次呢？不过像高谭这种科技与污秽并存的城市，平静是不可能维持太久的，果不其然，新一轮的混乱很快就席卷了整个城市，人们再一被被恐慌所笼罩着，而声称愿意为这一切负责的，自然就是所有混乱的源头以及支配者--“小丑”了。', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/photos/5.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnight/photos/6.jpg\"]', '2008-07-18 15:40:37');
INSERT INTO `movie` VALUES ('dc-1004', '蝙蝠侠:黑暗骑士崛起', 'http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/poster.jpg', 'http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/cover.jpg', 'http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/trailer.mp4', 9.1, 7561, '2018 / 美国 / 科幻 / 超级英雄', '原名：The Dark Knight‎ Rises ', '上映时间：2012-08-27(中国大陆)', '影片时长：165分钟(中国大陆)', '检察官哈维·登特（艾伦·艾克哈特 Aaron Eckhart 饰）死后的八年间，哥谭市在戈登警长（加里·奥德曼 Gary Oldman 饰）的努力下有效地遏制了犯罪活动。而蝙蝠侠布鲁斯·韦恩（克里斯蒂安·贝尔 Christian Bale 饰）因为背负谋杀登特的罪名，被 警方通缉，在哥谭市销声匿迹。然而，这看似平静的状态被恐怖分子贝恩（汤姆·哈迪 Tom Hardy 饰）的出现打破，他利用猫女（安妮·海瑟薇 Anne Hathaway 饰）偷取布鲁斯的指纹，致使韦恩集团面临破财，布鲁斯被赶出董事会。为了保证韦恩集团投资的能源项目不被坏人利用制造核弹，布鲁斯帮助米兰达（玛丽昂·歌迪亚 Marion Cotillard 饰）成为董事会主席。贝恩接下来一连串精密设计的计划将哥谭市陷入孤绝之境，毁灭之日指日可待。布鲁斯只能再次肩负起拯救哥谭的重任，然而至亲的管家阿福辞职离开、猫女的背叛、贝恩的凶残手段，爱人米拉达的真实面目露出，都让他拯救哥谭的行动变得不可能…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/photos/5.jpg\",\"http://122.152.205.72:88/superhero/DC/BatManTheDarkKnightRises/photos/6.jpg\"]', '2012-08-27 15:40:37');
INSERT INTO `movie` VALUES ('dc-1005', '蝙蝠侠大战超人：正义黎明', 'http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/poster.jpg', 'http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/cover.jpg', 'http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/trailer.mp4', 7.5, 4539, '2018 / 美国 / 科幻 / 超级英雄', '原名：Batman vs Superman', '上映时间：2016-03-25(中国大陆/美国)', '影片时长：151分钟 / 183分钟', '故事发生在大都会之战18个月后，在那场战斗中许多建筑和市民惨遭波及。因为超人（亨利·卡维尔 饰）帮助人类解决了很多问题而被当做神来膜拜，但超人也因与佐德之战对城市造成的破坏而遭到逮捕和审讯，一度成为都市传说的蝙蝠侠韦恩（本·阿弗莱克 饰）重新出现在人们面前，他似乎正是为了惩罚超人而来。年轻的富豪莱克斯·卢瑟（杰西·艾森伯格 饰）又在二者的矛盾中挑拨离间，神秘的戴安娜·普林斯（盖尔·加朵 饰）也因自己的目的介入其中…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/BatmanVSSuperman/photos/5.jpg\"]', '2016-03-25 15:40:37');
INSERT INTO `movie` VALUES ('dc-1006', '超人：钢铁之躯', 'http://122.152.205.72:88/superhero/DC/SuperMan/poster.jpg', 'http://122.152.205.72:88/superhero/DC/SuperMan/cover.jpg', 'http://122.152.205.72:88/superhero/DC/SuperMan/trailer.mp4', 6.9, 2697, '2018 / 美国 / 科幻 / 超级英雄', '原名：Man of Steel ', '上映时间： 2013-06-20(中国大陆) ', '影片时长：143分钟', '遥远的宇宙深处，随着氪星的毁灭，超人的传奇故事拉开序幕。氪星人乔·艾尔（罗素·克劳 Russell Crowe 饰）抵死反抗佐德将军（迈克尔·珊农 Michael Shannon 饰）的邪恶计划，冒险将刚出生不久的儿子卡尔·艾尔被送到银河系另一边的地球。卡尔降落在美国堪萨斯一座小镇，他幸运地成为乔纳森·肯特（凯文·科斯特纳 Kevin Costner 饰）和玛莎（黛安·莲恩 Diane Lane 饰）的养子，并且得名克拉克。克拉克从小显露出与众不同的能力与特征，但这些带给他惊讶的同时还有数不清的烦恼。通过养父的引导，克拉克（亨利·卡维尔 Henry Cavill 饰）慢慢弄清自己的身世以及所肩负的使命。终于有一天，遥远的故乡“同胞”莅临。 \r\n　　站在故乡与地球、邪恶与正义的两端，超人即将面临重大的抉择…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/SuperMan/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/SuperMan/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/SuperMan/photos/3.jpg\"]', '2013-06-20 15:40:37');
INSERT INTO `movie` VALUES ('dc-1007', '正义联盟', 'http://122.152.205.72:88/superhero/DC/JusticeLeague/poster.jpg', 'http://122.152.205.72:88/superhero/DC/JusticeLeague/cover.jpg', 'http://122.152.205.72:88/superhero/DC/JusticeLeague/trailer.mp4', 6.7, 4694, '2018 / 美国 / 科幻 / 超级英雄', '原名：Justice League', '上映时间： 2017-11-17(美国/中国大陆)', '影片时长：120分钟', '受到超人无私奉献的影响，蝙蝠侠重燃了对人类的信心，接受了新盟友——神奇女侠（戴安娜·普林斯）的帮助，去对抗更加强大的敌人。蝙蝠侠和神奇女侠一同寻找并招募了一支超人类联盟来抵挡新觉醒的威胁。但尽管这支队伍集结了超人、蝙蝠侠、神奇女侠、闪电侠、海王和钢骨等人，他们似乎无法阻止敌人对地球的进攻…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/5.jpg\",\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/6.jpg\",\"http://122.152.205.72:88/superhero/DC/JusticeLeague/photos/7.jpg\"]', '2017-11-17 15:40:37');
INSERT INTO `movie` VALUES ('dc-1008', '神奇女侠', 'http://122.152.205.72:88/superhero/DC/WonderWoman/poster.jpg', 'http://122.152.205.72:88/superhero/DC/WonderWoman/cover.jpg', 'http://122.152.205.72:88/superhero/DC/WonderWoman/trailer.mp4', 7.1, 5214, '2018 / 美国 / 科幻 / 超级英雄', '原名：Wonder Woman', '上映时间： 2017-06-02(中国大陆)', '影片时长：141分钟', '戴安娜（盖尔·加朵 Gal Gadot 饰）是女王希波吕忒（康妮·尼尔森 Connie Nielsen 饰）的女儿，自幼生活在天堂岛上。巨大的屏障将这座岛屿同外界的纷纷扰扰隔开犹如一个世外桃源，而岛上生活着的亦都是女性。在女武官安提奥普（罗宾·莱特 Robin Wright 饰）的教导之下，戴安娜习得了高强的武艺，而她的体内，似乎隐藏着某种强大的未知力量。 \r\n　　一场意外中，一位名为史蒂夫（克里斯·派恩 Chris Pine 饰）的男子来到了岛上，从他口中，戴安娜得知外面的世界正在经历战争的磨难，而造成这一切的罪魁祸首，是战神阿瑞斯（大卫·休里斯 David Thewlis 饰）。为了拯救人类于水火之中，戴安娜依然拿起了长剑与盾牌，发誓要彻底摧毁阿瑞斯的阴谋。', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/WonderWoman/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/WonderWoman/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/WonderWoman/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/WonderWoman/photos/4.jpg\"]', '2017-06-02 15:40:37');
INSERT INTO `movie` VALUES ('dc-1009', '绿灯侠', 'http://122.152.205.72:88/superhero/DC/GreenLantern/poster.jpg', 'http://122.152.205.72:88/superhero/DC/GreenLantern/cover.jpg', 'http://122.152.205.72:88/superhero/DC/GreenLantern/trailer.mp4', 5.9, 5214, '2018 / 美国 / 科幻 / 超级英雄', '原名：Green Lantern', '上映时间： 2011-10-20(中国大陆)', '影片时长：114分钟', '几个世纪以来，有一群拥有强大力量的精英团队维护着浩瀚宇宙的和平。他们每人都有一只绿色的能量戒指，绿色的灯光就是他们的力量之源，他们被称为“绿灯军团”。但是，突然有一天，身处宇宙多处的绿灯侠不断传来受到袭击身亡的事件。原来，沉寂多年的邪恶魔王派瑞莱克斯苏醒，他要抢夺绿灯侠们的绿色能量源，因此展开了全宇宙追杀绿灯侠。这时在地球上，拥有非凡天赋却自命不凡的试飞员哈尔（瑞安·雷诺兹 Ryan Reynolds 饰）无意中获得了陨落地球的绿灯侠的绿色戒指，成为了守护地球的新的绿灯侠。而且其作为人类散发出的人性，也是其他绿灯侠们所不具备的独特气息。为了能打败派瑞莱克斯，保护地球拯救人类，哈尔需要克服恐惧，熟练运用自己的绿灯能量。魔王临近，哈尔能否打败魔王，成为最伟大的绿灯侠？', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/GreenLantern/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/GreenLantern/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/GreenLantern/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/GreenLantern/photos/4.jpg\"]', '2011-10-20 15:40:37');
INSERT INTO `movie` VALUES ('dc-1010', '自杀小队', 'http://122.152.205.72:88/superhero/DC/SuicideSquad/poster.jpg', 'http://122.152.205.72:88/superhero/DC/SuicideSquad/cover.jpg', 'http://122.152.205.72:88/superhero/DC/SuicideSquad/trailer.mp4', 6.3, 4218, '2018 / 美国 / 科幻 / 超级英雄', '原名：Suicide Squad', '上映时间： 2016-08-05(美国)', '影片时长：123分钟', '阿曼达（维奥拉·戴维斯 Viola Davis 饰）身为政府秘密机构的领导人，面对社会中出现的层出不穷的暴力恐怖袭击事件，决心启用一批被关押在监狱中判了无期徒刑的超级反派们，他们是小丑女（玛歌特·罗比 Margot Robbie 饰）、死亡射手（威尔·史密斯 Will Smith 饰）、回旋镖队长（杰·科特尼 Jai Courtney 饰）、复仇恶魔（杰伊·赫尔南德兹 Jay Hernandez 饰）和杀手鳄（阿德沃尔·阿吉纽依-艾格拜吉 Adewale Akinnuoye-Agbaje 饰）。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/5.jpg\",\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/6.jpg\",\"http://122.152.205.72:88/superhero/DC/SuicideSquad/photos/7.jpg\"]', '2016-08-05 15:40:37');
INSERT INTO `movie` VALUES ('dc-1011', '沙赞', 'http://122.152.205.72:88/superhero/DC/Shazam/poster.jpg', 'http://122.152.205.72:88/superhero/DC/Shazam/cover.jpg', 'http://122.152.205.72:88/superhero/DC/Shazam/trailer.mp4', 0.0, 4218, '2018 / 美国 / 科幻 / 超级英雄', '原名：Shazam', '上映时间： 2019-04-05(美国)', '影片时长：未知', '每个人身体里都潜藏着一位超级英雄，只需要一点魔力便能将其释放。14岁的街头小混混比利·巴特森(亚瑟·安其饰)通过大喊“沙赞”这个词，就可以变身为成年超级英雄沙赞(扎克瑞·莱维饰)，这是一种来自于古老巫师的恩惠。如神一般的肌肉身体里，仍存有一颗孩子心，他开心地与超能力为伴。他能飞吗？他能X光透视吗？他能从手中射出闪电吗？他能不用再考试了吗？沙赞以孩子般轻率又鲁莽的方式，开始测试他的能力极限。但他需要尽快掌握这些力量，以对抗塞迪斯·希瓦纳博士控制的邪恶势力。', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/DC/Shazam/photos/1.jpg\",\"http://122.152.205.72:88/superhero/DC/Shazam/photos/2.jpg\",\"http://122.152.205.72:88/superhero/DC/Shazam/photos/3.jpg\",\"http://122.152.205.72:88/superhero/DC/Shazam/photos/4.jpg\",\"http://122.152.205.72:88/superhero/DC/Shazam/photos/5.jpg\"]', '2019-04-05 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1001', '蚁人', 'http://122.152.205.72:88/superhero/MARVEL/AntMan1/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/AntMan1/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/AntMan1/trailer.mp4', 7.8, 6932, '2018 / 美国 / 科幻 / 超级英雄', '原名：Ant-Man', '上映时间：2015-10-16(中国大陆)', '影片时长：117分钟', '前工程师斯科特（保罗·路德 Paul Rudd 饰）由于劫富济贫进了监狱，出狱后的他为了争取看望女儿的权利又走上了盗窃之路。没想到一次意外的偷盗事件让他成为了新一代“蚁人”，老蚁人汉克.皮姆博士（迈克尔·道格拉斯 Michael Douglas 饰）成为了他的导师，可皮姆博士的女儿霍普（伊万杰琳·莉莉 Evangeline Lilly 饰）却并不看好他。但是危机迫在眉睫，为了对付强大的敌人拯救世界，斯科特不得不叫来自己的一帮狐朋狗友帮助自己完成一个不可能完成的任务。而取得任务的成功也是斯科特挽回女儿的关键，屌丝能否逆袭就看最后一击', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/AntMan1/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan1/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan1/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan1/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan1/photos/5.png\"]', '2015-10-16 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1002', '蚁人2: 黄蜂女现身', 'http://122.152.205.72:88/superhero/MARVEL/AntMan2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/AntMan2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/AntMan2/trailer.mp4', 7.3, 5932, '2018 / 美国 / 科幻 / 超级英雄', '原名：Ant-Man and the Wasp', '上映时间：2018-08-24(中国大陆)', '影片时长：118分钟', '来自漫威电影宇宙的新片《蚁人2：黄蜂女现身》重点展现了两位超级英雄令人惊叹的收缩能力。继《美国队长3》的故事线之后，斯科特·朗迎来了自己作为超级英雄和孩子父亲的双重身份。一方面，他在背负着蚁人职责的同时努力过好自己的生活；另一方面，二代黄蜂女霍普·凡·戴恩和汉克·皮姆博士又向他传达了一项紧迫的新任务。斯科特必须再次穿上战衣，与黄蜂女并肩作战，共同破解来自过去的谜题', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/AntMan2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/AntMan2/photos/5.png\"]', '2018-08-24 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1003', '复仇者联盟', 'http://122.152.205.72:88/superhero/MARVEL/Avengers1/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers1/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers1/trailer.mp4', 8.2, 7451, '2018 / 美国 / 科幻 / 超级英雄', '原名：The Avengers', '上映时间：2012-05-05(中国大陆) ', '影片时长：142分钟', '一股突如其来的强大邪恶势力对地球造成致命威胁，没有任何一个超级英雄能够单独抵挡。长期致力于保护全球安危的神盾局（SHIELD）感到措手不及，其指挥官“独眼侠”尼克·弗瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）意识到他必须创建一个“史上最强”的联盟组织， 云集各方超级英雄一起发威，才能拯救世界于水深火热，抵御黑暗势力的侵袭。于是由六大超级英雄——“钢铁侠”（小罗伯特·唐尼 Robert Downey Jr. 饰）、“雷神” （克里斯·海姆斯沃斯 Chris Hemsworth 饰）、“美国队长”（克里斯·埃文斯 Chris Evans 饰）、“绿巨人” （马克·鲁弗洛 Mark Ruffalo 饰）、“黑寡妇”（斯嘉丽·约翰逊 Scarlett Johansson 饰）和“鹰眼”（杰瑞米·雷纳 Jeremy Renner 饰）组成的 “复仇者联盟”应运而生。他们各显神通，团结一心，终于战胜了邪恶势力，保证了地球的安全', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/5.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/6.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/7.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers1/photos/8.png\"]', '2012-05-05 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1004', '复仇者联盟2：奥创纪元', 'http://122.152.205.72:88/superhero/MARVEL/Avengers2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers2/trailer.mp4', 8.2, 7451, '2018 / 美国 / 科幻 / 超级英雄', '原名：Avengers: Age of Ultron2', '上映时间：2015-05-12(中国大陆)', '影片时长：142分钟', '托尼·斯塔克（小罗伯特·唐尼 Robert Downey Jr. 饰）试图重启一个已经废弃的维和项目，不料该项目却成为危机导火索。世上最强大的超级英雄——钢铁侠、美国队长（克里斯·埃文斯 Chris Evans 饰）、雷神（克里斯·海姆斯沃斯 Chris Hemsworth 饰）、绿巨人（马克·鲁弗洛 Mark Ruffalo 饰）、黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和鹰眼（杰瑞米·雷纳 Jeremy Renner 饰），不得不接受终极考验，拯救危在旦夕的地球。神秘反派奥创（詹姆斯·斯派德 James Spader 配音）逐渐崛起，超级英雄们必须重新集结，竭力阻止奥创实施人类灭绝计划。战斗中，复仇者联盟成员们还遇到了两个新人物——旺达·马克西莫夫（伊丽莎白·奥尔森 Elizabeth Olsen 饰）和皮特罗·马克西莫夫（亚伦·泰勒-约翰逊 Aaron Taylor-Johnson 饰），以及以全新面目归来的老朋友——幻视（保罗·贝坦尼 Paul Bettany 饰）。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/5.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/6.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/7.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers2/photos/8.png\"]', '2015-05-12 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1005', '复仇者联盟3：无限战争', 'http://122.152.205.72:88/superhero/MARVEL/Avengers3/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers3/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers3/trailer.mp4', 8.8, 9637, '2018 / 美国 / 科幻 / 超级英雄', '原名：Avengers: Infinity War ', '上映时间：2018-05-11(中国大陆) ', '影片时长：150分钟', '最先与灭霸军团遭遇的雷神索尔一行遭遇惨烈打击，洛基遇害，空间宝石落入灭霸之手。未几，灭霸的先锋部队杀至地球，一番缠斗后掳走奇异博士。为阻止时间宝石落入敌手，斯塔克和蜘蛛侠闯入了敌人的飞船。与此同时，拥有心灵宝石的幻视也遭到外星侵略者的袭击，为此美国队长、黑寡妇等人将其带到瓦坎达王国，向黑豹求助。幸免于难的索尔与星爵一行相逢，随后他们兵分两路。索尔与火箭、格鲁特踏上再铸雷神之锤的旅程，星爵则与卡魔拉等人试图阻止灭霸的恶行。而知晓灵魂宝石下落的卡魔拉，同样是其义父灭霸追踪的对象。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Avengers3/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers3/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers3/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers3/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers3/photos/5.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers3/photos/6.png\"]', '2018-05-11 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1006', '复仇者联盟4：终局之战', 'http://122.152.205.72:88/superhero/MARVEL/Avengers4/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers4/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Avengers4/trailer.mp4', 0.0, 6666, '2018 / 美国 / 科幻 / 超级英雄', '原名：Avengers: Endgame', '上映时间：2019-05(中国大陆)', '影片时长：未知', '《复仇者联盟4》（Untitled Avengers film）是未上映的美国超级英雄电影，改编自漫威漫画，也是漫威电影宇宙第22部影片。由安东尼·罗素和乔·罗素执导，小罗伯特·唐尼、乔什·布洛林、马克·鲁法洛、汤姆·希德勒斯顿、克里斯·埃文斯、汤姆·赫兰德等主演。最终定档于2019年5月3日在美国上映', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/5.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/6.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/7.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/8.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/9.png\",\"http://122.152.205.72:88/superhero/MARVEL/Avengers4/photos/10.png\"]', '2019-05-10 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1007', '黑豹', 'http://122.152.205.72:88/superhero/MARVEL/BlackPanther/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/BlackPanther/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/BlackPanther/trailer.mp4', 5.9, 2367, '2018 / 美国 / 科幻 / 超级英雄', '原名：Black Panther', '上映时间：2018-03-09(中国大陆) ', '影片时长：134分钟', '位于非洲的神秘国家瓦坎达，凭借来自宇宙的振金而成为科技极度发达的国家，不过他们长久封闭，始终对外界保守这个秘密。在前国王死于联合国爆炸袭击后，特查拉王子（查德维克·博斯曼 Chadwick Boseman 饰）继任成为新的国王，同时他也是黑豹的继承者。登基之后，特查拉与前女友娜吉雅（露皮塔·尼永奥 Lupita Nyong\'o 饰）、贴身侍卫奥姆烨（丹娜·奎里拉 Danai Gurira 饰）追查曾经盗取振金并杀害瓦坎达人的尤利西斯·克劳（安迪·瑟金斯 Andy Serkis 饰）。一番厮杀后，克劳侥幸逃脱，谁知最终死于合伙人艾瑞克·克尔芒戈（迈克尔·B·乔丹 Michael B. Jordan 饰）之手。艾瑞克同样具有瓦坎达血统，而且当年他的父亲死在了自己的兄弟——特查拉父亲的手中。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/BlackPanther/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/BlackPanther/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/BlackPanther/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/BlackPanther/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/BlackPanther/photos/5.png\"]', '2018-03-09 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1008', '美国队长', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/trailer.mp4', 7.1, 5364, '2018 / 美国 / 科幻 / 超级英雄', '原名：Captain America', '上映时间：2011-09-09(中国大陆) ', '影片时长：124分钟', '上世纪40年代，纳粹及其邪恶轴心的战火烧遍世界各个角落。居住在布鲁克林的小个子史蒂夫·罗格斯（克里斯·埃文斯 Chris Evans 饰）心系国家，一心上阵杀敌，可是糟糕的体格让他始终被征兵办拒之门外。偶然的机会，在德籍科学家厄斯金博士（Stanley Tucci 饰）的帮助下，这个小个子男孩得以走入兵营，并接受了博士的试验，化身成为高大健壮、膂力过人的超级战士。与此同时，德国纳粹红骷髅部队的首领约翰·施密特（雨果·维文 Hugo Weaving 饰）依靠超自然的力量建立起一支超级战队，企图称霸全世界。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica1/photos/5.png\"]', '2011-09-09 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1009', '美国队长2：冬日战士', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/trailer.mp4', 7.1, 5364, '2018 / 美国 / 科幻 / 超级英雄', '原名：The Winter Soldier', '上映时间：2014-04-04(美国/中国大陆) ', '影片时长：136分钟', '渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰），在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。某天，神盾局指挥官尼克-法瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）遭到一群武装分子袭击，他拼尽全力将一支U盘交到美国队长手中，这里面藏着该局二战以来最重要且最可怕的秘密。在此之后，美国队长因涉嫌杀害尼克而遭到前局长亚历山大·皮尔斯（罗伯特·雷德福/Robert Redford 饰）的通缉和追杀，逃亡中他得到黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和退伍老兵“猎鹰”（安东尼·麦凯 Anthony Mackie 饰）的帮助。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica2/photos/5.png\"]', '2014-04-04 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1010', '美国队长3：内战', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/trailer.mp4', 7.1, 5364, '2018 / 美国 / 科幻 / 超级英雄', '原名：Civil War', '上映时间：2016-05-06(中国大陆/美国)', '影片时长：148分钟', '美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰）带领着全新组建的复仇者联盟，继续维护世界和平。然而，一次执行任务时联盟成员不小心造成大量平民伤亡，从而激发政治压力，政府决定通过一套监管系统来管理和领导复仇者联盟。联盟内部因此分裂为两派：一方由史蒂夫· 罗杰斯领导，他主张维护成员自由，在免受政府干扰的情况下保护世界；另一方则追随托尼·斯塔克（小罗伯特·唐尼 Robert Downey Jr. 饰），他令人意外地决定支持政府的监管和责任制体系。神秘莫测的巴基（塞巴斯蒂安·斯坦 Sebastian Stan 饰）似乎成为内战的关键人物…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainAmerica3/photos/5.png\"]', '2016-05-06 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1011', '惊奇队长', 'http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/trailer.mp4', 0.0, 555, '2018 / 美国 / 科幻 / 超级英雄', '原名：Captain Marvel', '上映时间：2019-03-08(美国)', '影片时长：未知', '漫画中的初代“惊奇女士”原名Carol Danvers，她曾经是一名美国空军情报局探员，暗恋惊奇先生。此后她得到了超能力，成为“惊奇女士”，在漫画中是非常典型的女性英雄人物。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/CaptainMarvel/photos/5.png\"]', '2019-03-08 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1012', '奇异博士', 'http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/trailer.mp4', 7.8, 5658, '2018 / 美国 / 科幻 / 超级英雄', '原名：Doctor Strange', '上映时间：2016-11-04(中国大陆/美国) ', '影片时长：115分钟', '斯特兰奇博士（本尼迪克特·康伯巴奇 Benedict Cumberbatch 饰）是一名外科手术医生，他拥有着高超的智商和精湛的技艺，是医院乃至整个医学界的传奇人物。某一日，斯特兰奇博士遭遇了一场可怕的车祸，尽管保住了双手，但这双手伤痕累累不住颤抖，这也就意味着，他再也不能拿起手术刀，站在无影灯下了。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/photos/5.png\",\"http://122.152.205.72:88/superhero/MARVEL/DoctorStrange/photos/6.png\"]', '2016-11-04 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1013', '恶灵骑士1', 'http://122.152.205.72:88/superhero/MARVEL/GhostRider/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/GhostRider/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/GhostRider/trailer.mp4', 6.4, 3214, '2018 / 美国 / 科幻 / 超级英雄', '原名：Ghost Rider', '上映时间：2007-06-02(中国大陆)', '影片时长：114分钟', '约翰尼·布雷泽（尼古拉斯·凯奇 饰）本是摩托车特级演员，当他发现父亲身患癌症之时，他与恶魔梅菲斯特签订了契约。他自己变身幽灵车神，为恶魔服务。对恶魔的要求言听计从的约翰尼，白天是星光灿烂的特级明星；夜间一身皮装、身体化为骷髅、身披布满刺钉的战袍，开动摩托车，替恶魔追捕那 些 穷凶极恶之人。但约翰尼渐渐发现，最大的恶魔便是梅菲斯特，他开始在正义与邪恶之间游走。爱人洛克希安妮（伊娃·门德斯 饰）令约翰尼鼓起勇气，他心中做出了一个决定', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/GhostRider/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider/photos/5.png\"]', '2007-06-02 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1014', '恶灵骑士2：复仇时刻', 'http://122.152.205.72:88/superhero/MARVEL/GhostRider2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/GhostRider2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/GhostRider2/trailer.mp4', 5.5, 1735, '2018 / 美国 / 科幻 / 超级英雄', '原名：Spirit of Vengeance', '上映时间：2012-04-20(中国大陆) ', '影片时长：95分钟', '莫罗（伊德瑞斯·艾尔巴 Idris Elba 饰）请求布雷斯把小孩丹尼带来神殿以避免恶魔夺取他的灵魂，作为回报他将驱除布雷斯身上的诅咒。丹尼是魔鬼罗尔科的儿子，罗尔科为了把自己的魔力植入儿子体内正派卡里跟追踪逃跑途中的母子两人。正当母子俩被困在采石场的时候，布雷斯到来，他体内的天使爆发了出来，压制住了卡里根。他变成了恶灵骑士，毫不手软的把对手撕成碎片。当战争结束时，三人前往神殿，同时，罗尔科也救醒了死亡边缘的卡里根，并赋予他更可怕的摧毁力，让他再去把丹尼找回来。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/GhostRider2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/GhostRider2/photos/5.png\"]', '2012-04-20 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1015', '银河护卫队', 'http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/trailer.mp4', 8.2, 8634, '2018 / 美国 / 科幻 / 超级英雄', '原名：Guardians of the Galaxy', '上映时间：2014-10-10(中国大陆)', '影片时长：121分钟', '彼得·奎尔（克里斯·帕拉特 Chris Pratt 饰）是一名从小被劫持到外太空的地球人，在义父勇度（迈克尔·鲁克 Michael Rooker 饰）的培养下成了一个终极混混，自称“星爵”。一次行动中他偷了一块神秘球体，便成为了赏金猎人火箭浣熊（布莱德利·库珀 B radl ey Cooper 配音）、树人格鲁特（范·迪塞尔 Vin Diesel 配音）的绑架目标，而神秘的卡魔拉（佐伊·索尔达娜 Zoe Saldana 饰）也对神秘球体势在必得。经过笑料百出的坎坷遭遇，星爵被迫和这三人，以及复仇心切的“毁灭者”德拉克斯（戴夫·巴蒂斯塔 Dave Batista 饰）组成小分队逃避“指控者”罗南（李·佩斯 Lee Pace 饰）的追杀。然而这个神秘球体拥有无穷的力量，小分队必须团结一致对付罗南，才有可能解救整个银河系，银河护卫队由此诞生', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy/photos/5.png\"]', '2014-10-10 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1016', '银河护卫队2', 'http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/trailer.mp4', 8.7, 8632, '2018 / 美国 / 科幻 / 超级英雄', '原名：Guardians of the Galaxy Vol. 2', '上映时间：2017-05-05(中国大陆/美国) ', '影片时长：136分钟', '火箭浣熊（布莱德利·库珀 Bradley Cooper 饰）偷走了大祭司阿耶莎（伊丽莎白·德比齐 Elizabeth Debicki 饰）的能量电池，包括星爵（克里斯·帕拉特 Chris Pratt 饰）、卡魔拉（佐伊·索尔达娜 Zoe Saldana 饰）、德拉克斯（戴夫·巴蒂斯塔 Dave Bautista 饰）在内的一行人遭到了后者派出的舰队的袭击。一个神秘人物乘坐着飞船救下了银河护卫队的众人，而驾驶着飞船的不是别人，竟然正是星爵的亲生父亲伊戈（库尔特·拉塞尔 Kurt Russell 饰）', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/GuardiansOfTheGalaxy2/photos/5.png\"]', '2017-05-05 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1017', '钢铁侠', 'http://122.152.205.72:88/superhero/MARVEL/IronMan1/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/IronMan1/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/IronMan1/trailer.mp4', 8.5, 7695, '2018 / 美国 / 科幻 / 超级英雄', '原名：Iron Man', '上映时间：2008-04-30(中国大陆) ', '影片时长：126分钟', '斯塔克军火公司是美军在全球范围内第一大军火供应商，其新任掌门人托尼•斯塔克（小罗伯特·唐尼 Robert Downey Jr. 饰）风流倜傥，天资聪颖。他与公司元老俄巴迪亚•斯坦（杰夫·布里吉斯 Jeff Bridges 饰）合作无间，共同将斯塔克公司的业务推向顶峰。现 实生活中的托尼热衷收集名贵跑车，搞点儿发明创造，当然露水姻缘更不可少。所幸他身边有维吉尼亚•波茨（格温妮斯·帕特洛 Gwyneth Paltrow 饰）这样的好助手细心打理一切，才让他能自由自在过着贵公子的生活', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/IronMan1/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan1/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan1/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan1/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan1/photos/5.png\"]', '2008-04-30 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1018', '钢铁侠3', 'http://122.152.205.72:88/superhero/MARVEL/IronMan3/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/IronMan3/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/IronMan3/trailer.mp4', 8.7, 7854, '2018 / 美国 / 科幻 / 超级英雄', '原名： Iron Man 3', '上映时间：2013-05-01(中国大陆)', '影片时长：134分钟', '自纽约事件以来，托尼·斯塔克（小罗伯特·唐尼 Robert Downey Jr. 饰）为前所未有的焦虑症所困扰。他疯狂投入钢铁侠升级版的研发，为此废寝忘食，甚至忽略了女友佩珀·波茨（格温妮斯·帕特洛 Gwyneth Paltrow 饰）的感受。与此同时，臭名昭著的恐怖头目曼达林（本·金斯利 Ben Kingsley 饰）制造了一连串的爆炸袭击事件，托尼当年最忠诚的保镖即在最近的一次袭击中身负重伤。未过多久，托尼、佩珀以及曾与他有过一面之缘的女植物学家玛雅（丽贝卡·豪尔 Rebecca Hall 饰）在家中遭到猛烈的炮火袭击，几乎丧命，而这一切似乎都与22年前那名偶然邂逅的科学家阿尔德里奇·基连（盖·皮尔斯 Guy Pearce 饰）及其终极生物的研究有关', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/IronMan3/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan3/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan3/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan3/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/IronMan3/photos/5.png\"]', '2013-05-01 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1019', '蜘蛛侠2002', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/trailer.mp4', 7.8, 7145, '2018 / 美国 / 科幻 / 超级英雄', '原名：Spider-Man2002', '上映时间：2002-08-07(中国大陆) ', '影片时长：121分钟', '彼得 帕克（托比•马奎尔 Tobey Maguire 饰）只是美国一个平凡的高中生，当一次他被蜘蛛博物馆偷跑出来的变种蜘蛛咬了一口之后，彼得的生活彻底改变了。他变得和蜘蛛一样，拥有各种蜘蛛特有的超能力：从手指喷出粘力极强的蜘蛛丝、飞檐走壁等等。彼得兴奋异常，开始利用自己的超能力去赚钱。但当他最爱的叔叔被自己放走的罪犯杀死后，彼得发誓要用自己的超能力去打击犯罪', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2002/photos/5.png\"]', '2002-08-07 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1020', '蜘蛛侠2004', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/trailer.mp4', 7.5, 6696, '2018 / 美国 / 科幻 / 超级英雄', '原名： Spider-Man2004', '上映时间：2004-08-05(中国大陆) ', '影片时长：127分钟', '大战绿妖之后，蜘蛛侠帕克（托比•马奎尔 Tobey Maguire 饰）忍痛拒绝了他唯一的挚爱玛丽（克尔斯滕•邓斯特 Kirsten Dunst 饰），因为蜘蛛侠的身份会为自己和亲人带来巨大危险，帕克决定独立承担起蜘蛛侠的责任。', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2004/photos/5.png\"]', '2004-08-05 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1021', '蜘蛛侠2007', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/trailer.mp4', 7.5, 6324, '2018 / 美国 / 科幻 / 超级英雄', '原名：Spider-Man2007', '上映时间：2007-05-01(中国大陆)', '影片时长：139分钟', '蜘蛛侠（托比•马奎尔 Tobey Maguire 饰）在经历了重重考验之后，成为了人人敬仰的正义英雄，抱得美人归。但是，光环下蜘蛛侠，也有自己的心病：他在第一集时放走了小偷导致最亲爱的叔叔被小偷杀死，帕克一直耿耿于怀', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderMan2007/photos/5.png\"]', '2007-05-01 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1022', '蜘蛛侠：英雄归来', 'http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/trailer.mp4', 7.9, 9980, '2018 / 美国 / 科幻 / 超级英雄', '原名：Spider-Man: Homecoming', '上映时间：2017-09-08(中国大陆) ', '影片时长：133分钟', '彼得帕克（汤姆·赫兰德 Tom Holland 饰）在内战后受到了钢铁侠托尼斯塔克（小罗伯特·唐尼 Robert Downey Jr. 饰）的赏识，表面上，彼得进入托尼的公司成为了一名实习生，实际上，他和复仇者联盟的成员们一起接受了各种各样的训练。托尼虽然欣赏彼得的勇敢和正直，却并不认为他目前已经拥有加入复联的实力，他派出了特工哈皮（乔恩·费儒 Jon Favreau 饰）暗中观察，这让十分想证明自己的彼得感到万分焦躁', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/5.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/6.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/7.png\",\"http://122.152.205.72:88/superhero/MARVEL/SpiderManHomecoming/photos/8.png\"]', '2017-09-08 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1023', '超凡蜘蛛侠', 'http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/trailer.mp4', 7.6, 7634, '2018 / 美国 / 科幻 / 超级英雄', '原名：The Amazing Spider-Man', '上映时间：2012-08-27(中国大陆) ', '影片时长：136分钟', '童年的一起突发事件，令彼得·帕克（安德鲁·加菲尔德 Andrew Garfield 饰）和父母生离死别。转眼彼得成为一名高中生，他偶然发现父亲的公文包，并从叔父本（马丁·辛 Martin Sheen 饰）处得到线索，于是启程前往奥斯库公司拜访父亲当年的合作伙伴——科特·康纳斯博士（瑞斯·伊凡斯 Rhys Ifans 饰）。在公司内四处寻找线索的彼得意外被蜘蛛咬了一口，回程途中他的身体发生奇异的变化。在康纳斯博士德引导下，彼得不断了解并发掘体内着超乎寻常的能力，喜怒哀乐，各种意想不到的事情迅速向他袭来。直到某日，他便成了影响深远的超级战士蜘蛛侠', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan1/photos/5.png\"]', '2012-08-27 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1024', '超凡蜘蛛侠2', 'http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/trailer.mp4', 7.4, 7569, '2018 / 美国 / 科幻 / 超级英雄', '原名：The Amazing Spider-Man 2', '上映时间：2014-05-04(中国大陆)', '影片时长：142分钟', '能力越大，责任越大。蜘蛛侠彼得·帕克（安德鲁·加菲尔德 Andrew Garfield 饰）在全力和犯罪、灾难做斗争的同时，终于迎来了毕业的时刻。可是曾经的一段心结，让他和女友格温·斯坦西（艾玛·斯通 Emma Stone 饰）的关系降至冰点。格温应聘于为全城提供电力的 奥斯本集团公司，同一期间发生的两件事，不由得左右这家公司和彼得等人的命运。奥斯本的掌门人病故，他的儿子哈利（戴恩·德哈恩 Dane DeHaan 饰）以20岁的年龄接受这家市值2000亿美元的巨无霸。另一方面，极度崇拜蜘蛛侠的电力工程师麦克斯·威尔·迪伦（杰米·福克斯 Jamie Foxx 饰）在维修机组时意外身亡，当他再度醒来时发现自己变成了全身充满电能的超人类', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/TheAmazingSpiderMan2/photos/5.png\"]', '2014-05-04 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1025', '神奇四侠2015', 'http://122.152.205.72:88/superhero/MARVEL/Fantastic/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Fantastic/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Fantastic/trailer.mp4', 4.2, 961, '2018 / 美国 / 科幻 / 超级英雄', '原名：Fantastic Four2015', '上映时间：2015-08-07(美国)', '影片时长：100分钟', '天才少年理查德（迈尔斯·特勒 Miles Teller 饰）凭借物体传送装置的发明得到正研究量子门的富兰克林•斯通的赏识，他将理查德招至麾下，通过和维克多（托比·凯贝尔 Toby Kebbell 饰）、约翰尼（迈克尔·B·乔丹 Michael B. Jordan 饰）、苏珊（凯特·玛拉 Kate Mara 饰）等才华横溢的青年们的通力合作，量子门的研究终于取得突破性进展。不久之后，不甘成果被政府攫取的年轻人们叫上理查德的朋友本（杰米·贝尔 Jamie Bell 饰），偷偷潜入那个未知的世界探险，谁知却被神秘的能量所感染。在此之后，他们拥有了身体伸缩、控制火焰、岩石化以及隐形等能力', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Fantastic/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Fantastic/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Fantastic/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Fantastic/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Fantastic/photos/5.png\"]', '2015-08-07 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1026', '毒液：致命守护者', 'http://122.152.205.72:88/superhero/MARVEL/Venom/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Venom/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Venom/trailer.mp4', 8.9, 7892, '2018 / 美国 / 科幻 / 超级英雄', '原名：Venom', '上映时间：2018-11-09(中国大陆)', '影片时长：112分钟', '艾迪（汤姆·哈迪 Tom Hardy 饰）是一位深受观众喜爱的新闻记者，和女友安妮（米歇尔·威廉姆斯 Michelle Williams 饰）相恋多年，彼此之间感情十分要好。安妮是一名律师，接手了生命基金会的案件，在女友的邮箱里，艾迪发现了基金会老板德雷克（里兹·阿迈德 Riz Ahmed 饰）不为人知的秘密。为此，艾迪不仅丢了工作，女友也离他而去', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Venom/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Venom/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Venom/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Venom/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Venom/photos/5.png\"]', '2018-11-09 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1027', '雷神', 'http://122.152.205.72:88/superhero/MARVEL/Thor1/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Thor1/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Thor1/trailer.mp4', 6.8, 6354, '2018 / 美国 / 科幻 / 超级英雄', '原名：Thor', '上映时间：2011-05-08(中国大陆) ', '影片时长：115分钟', '勇敢善战雷神托尔（克里斯•海姆斯沃斯 Chris Hemsworth 饰），作为永恒境界阿斯加德的王位继承人，受人敬仰。然而由于一次鲁莽的行动，险些挑起一场古老的战争，因此被父亲天神奥丁（安东尼•霍普金斯 Anthony Hopkins 饰）流放到人间。托尔在人间认识了 美丽的女科学家珍•福斯特（娜塔莉•波特曼 Natalie Portman 饰）和她的工作伙伴，在他们的帮助下，托尔找到了和自己一起被贬的雷神之锤，但此时的雷神之锤并不属于他。此间，托尔的弟弟洛基为了成为阿斯加德的王，居然联合寒冰巨人，企图在永恒境界掀起一场腥风血雨。为了维持永恒之界的法度，托尔的四位朋友也来到人间，他们决定带托尔返回永恒之境。此时，为了阻止雷神重归永恒境界，洛基派出巨人杀死托尔。丧失能力和法战的托尔为了保护无辜的人类与自己的朋友，献出了自己的生命。托尔的死打破了天神的的咒语，托尔复活并重获雷神之力战胜巨人。此时，天神生命危在旦夕，托尔必须与自己的朋友们重返永恒之界，维护那里的法度…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Thor1/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor1/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor1/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor1/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor1/photos/5.png\"]', '2011-05-08 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1028', '雷神2：黑暗世界', 'http://122.152.205.72:88/superhero/MARVEL/Thor2/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Thor2/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Thor2/trailer.mp4', 7.4, 7449, '2018 / 美国 / 科幻 / 超级英雄', '原名：Thor: The Dark World', '上映时间：2013-11-08(中国大陆/美国)', '影片时长：112分钟', '纽约大战后，雷神索尔（克里斯·海姆斯沃斯 Chris Hemsworth 饰）将弟弟洛基（汤姆·希德勒斯顿 Tom Hiddleston 饰）带回仙宫囚禁起来，此外帮助九大国度平定纷争，威名扶摇直上。虽然父王奥丁（安东尼·霍普金斯 Anthony Hopkins 饰）劝其及早即位，但索尔念念不忘地球的美丽女孩简·福斯特（娜塔丽·波特曼 Natalie Portman 饰）。与此同时，简在和黛西及其助手伊安调查某个区域时意外被神秘物质入侵，却也因此重逢索尔，并随其返回仙宫。令人意想不到的是，藏在简体内的物质来自远古的黑暗精灵玛勒基斯（克里斯托弗·埃克莱斯顿 Christopher Eccleston 饰）。在“天体汇聚”的时刻再次到来之际，玛勒基斯企图摧毁九大国度，缔造一个全然黑暗的宇宙', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Thor2/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor2/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor2/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor2/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor2/photos/5.png\"]', '2013-11-08 15:40:37');
INSERT INTO `movie` VALUES ('marvel-1029', '雷神3：诸神黄昏', 'http://122.152.205.72:88/superhero/MARVEL/Thor3/poster.png', 'http://122.152.205.72:88/superhero/MARVEL/Thor3/cover.png', 'http://122.152.205.72:88/superhero/MARVEL/Thor3/trailer.mp4', 8.4, 9630, '2018 / 美国 / 科幻 / 超级英雄', '原名：Thor: Ragnarok', '上映时间：2017-11-03(美国/中国大陆)', '影片时长：130分钟', '在“索科维亚战役”两年后，雷神索尔（克里斯·海姆斯沃斯 Chris Hemsworth 饰）识破了洛基（汤姆·希德勒斯顿 Tom Hiddleston 饰）的伪装，辗转找到了被放逐到地球的奥丁（安东尼·霍普金斯 Anthony Hopkins 饰）。然而垂死的奥丁却告知两个儿子，“诸神的黄昏”已经开始，曾遭到奥丁封禁的死亡女神海拉（凯特·布兰切特 Cate Blanchett 饰）即将重返阿斯加德。与海拉的初次对决中，索尔失去了雷神之锤，他和洛基也被打落至混乱不堪的萨卡星。在萨卡的决斗场上，索尔重逢失踪许久的绿巨人，也见到了曾从海拉魔爪下逃得一生的女武神', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/MARVEL/Thor3/photos/1.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor3/photos/2.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor3/photos/3.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor3/photos/4.png\",\"http://122.152.205.72:88/superhero/MARVEL/Thor3/photos/5.png\"]', '2017-11-03 15:40:37');
INSERT INTO `movie` VALUES ('xman-1001', 'X战警：天启', 'http://122.152.205.72:88/superhero/xman/Apocalypse/poster.png', 'http://122.152.205.72:88/superhero/xman/Apocalypse/cover.png', 'http://122.152.205.72:88/superhero/xman/Apocalypse/trailer.mp4', 7.8, 5743, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Apocalypse', '上映时间：2016-06-03(中国大陆)', '影片时长：144分钟', '变种人天启（奥斯卡·伊萨克 Oscar Isaac 饰）诞生于人类文明的最开端，被人类当做神一般敬仰膜拜，然而，这样的他，却遭到了他最蔑视的人类的背叛，被埋葬于废墟石砾之下，一晃眼就是数千年过去。 ', '[\"s-1011\"]', '[\"s-1012\",\"s-1013\",\"s-1014\",\"s-1015\",\"s-1016\"]', '[\"http://122.152.205.72:88/superhero/xman/Apocalypse/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/Apocalypse/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/Apocalypse/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/Apocalypse/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/Apocalypse/photos/5.png\",\"http://122.152.205.72:88/superhero/xman/Apocalypse/photos/6.png\"]', '2016-06-03 15:40:37');
INSERT INTO `movie` VALUES ('xman-1002', 'X战警：逆转未来', 'http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/poster.png', 'http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/cover.png', 'http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/trailer.mp4', 8.5, 7965, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Days of Future Past', '上映时间：2014-05-23(美国/中国大陆)', '影片时长：131分钟(美国) ', '故事的设定发生在当下，变种人族群遭到了前所未有的毁灭性打击，而这一切的根源是“魔形女”瑞文（詹妮弗·劳伦斯 Jennifer Lawrence 饰）在1973年刺杀了玻利瓦尔·特拉斯克（彼特·丁拉基 Peter Dinklage 饰）。在得知“幻影猫”（艾伦·佩吉 E llen Page 饰）利用穿越时空的能力帮助Blink（范冰冰 饰）等战友逃脱巨型机器人“哨兵”的追杀后，X教授（帕特里克·斯图尔特 Patrick Stewart 饰）和万磁王（伊恩·麦克莱恩 Ian McKellen 饰）达成认同，决定让金刚狼（休·杰克曼 Hugh Jackman 饰）穿越回1973年，找到年轻的X教授（詹姆斯·麦卡沃伊 James McAvoy 饰）和年轻的万磁王（迈克尔·法斯宾德 Michael Fassbender 饰）并说服他们一起阻止魔形女的行动。于是，金刚狼踏上了回到过去的旅程，但是命运会不会发生逆转，任何人都无从知晓', '[\"s-1011\"]', '[\"s-1017\",\"s-1012\",\"s-1013\",\"s-1014\",\"s-1015\"]', '[\"http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/photos/5.png\",\"http://122.152.205.72:88/superhero/xman/DaysOfFuturePast/photos/6.png\"]', '2014-05-23 15:40:37');
INSERT INTO `movie` VALUES ('xman-1003', 'X战警：第一战', 'http://122.152.205.72:88/superhero/xman/FirstClass/poster.png', 'http://122.152.205.72:88/superhero/xman/FirstClass/cover.png', 'http://122.152.205.72:88/superhero/xman/FirstClass/trailer.mp4', 8.5, 7965, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: First Class', '上映时间：2011-05-25(纽约首映)', '影片时长：132分钟(美国) ', '年轻的X教授查尔斯（詹姆斯·麦卡沃伊 James McAvoy 饰）和万磁王埃里克（迈克尔·法斯宾德 Michael Fassbender 饰）是一对志向相投的好朋友。他们最早发现了自己的超能力，并与其他几个变种人一起在CIA工作。引发埃里克超能力的纳粹战争贩子肖（凯文·贝肯 Kevin Bacon 饰）一直试图挑起核战争，而想方设法挑起美苏两国的矛盾。埃里克和查尔斯一直与肖手下的变种人战斗，努力阻止肖的阴谋。肖怂恿苏联引发古巴导弹危机，查尔斯和埃里克获知消息后，在海湾与肖手下的变种人拉开了对决的一战。最终，肖被查尔斯和埃里克合力消灭。可是，在这个过程中，埃里克逐渐被肖的政治观点影响，与查尔斯产生裂痕。通过海湾的这一战，埃里克和查尔斯最终决裂，一方变成支持人类与变种人和平共存的X教授；另一方坚持通过消灭人类换来变种人兴起的观点，自称万磁王..', '[\"s-1018\"]', '[\"s-1017\",\"s-1012\",\"s-1013\",\"s-1014\",\"s-1015\"]', '[\"http://122.152.205.72:88/superhero/xman/FirstClass/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/FirstClass/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/FirstClass/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/FirstClass/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/FirstClass/photos/5.png\",\"http://122.152.205.72:88/superhero/xman/FirstClass/photos/6.png\"]', '2019-05-29 15:40:37');
INSERT INTO `movie` VALUES ('xman-1004', 'X战警：黑凤凰', 'http://122.152.205.72:88/superhero/xman/DarkPhoenix/poster.png', 'http://122.152.205.72:88/superhero/xman/DarkPhoenix/cover.png', 'http://122.152.205.72:88/superhero/xman/DarkPhoenix/trailer.mp4', 0.0, 1573, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Dark Phoenix', '上映时间：2019-06-07(美国)', '影片时长：未知', '在《X战警：黑凤凰》中，X战警将面临他们最强大又可怕的敌人：他们的一位成员——琴·葛蕾。在一次太空救援任务中，琴被一股神秘的宇宙力量击中险些死亡。返回家中后，这股力量令她变得无比强大的同时也极不稳定。琴在与体内能量搏斗期间释放了自己无法控制也无法领会的力量。随着不断失去控制，琴伤害了她的至亲之人。这一举动割裂了维系X战警的纽带。现在随着X战警家族渐渐分崩离析，他们必须找到办法重新团结一心——不仅为拯救琴的灵魂，更为地球的安全。因为外星势力正意图武器化琴体内的力量并以此统治银河系', '[\"s-1019\"]', '[\"s-1020\",\"s-1012\",\"s-1013\",\"s-1014\",\"s-1015\"]', '[\"http://122.152.205.72:88/superhero/xman/DarkPhoenix/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/DarkPhoenix/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/DarkPhoenix/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/DarkPhoenix/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/DarkPhoenix/photos/5.png\"]', '2019-05-28 00:00:01');
INSERT INTO `movie` VALUES ('xman-1005', 'X战警：死侍', 'http://122.152.205.72:88/superhero/xman/Deadpool/poster.png', 'http://122.152.205.72:88/superhero/xman/Deadpool/cover.png', 'http://122.152.205.72:88/superhero/xman/Deadpool/trailer.mp4', 7.7, 5863, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Deadpool', '上映时间：2016-02-12(美国)', '影片时长：108分钟', '该片是《X战警》系列电影的外传。讲述了前任特种兵韦德·威尔逊得了不治之症，而自愿加入“X武器计划”获得了快速自愈能力。在饱受虐待折磨后他成功逃脱并对Ajax进行追杀的故事。 ', '[\"s-1007\"]', '[\"s-1002\",\"s-1004\",\"s-1008\",\"s-1009\",\"s-1010\"]', '[\"http://122.152.205.72:88/superhero/xman/Deadpool/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool/photos/5.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool/photos/6.png\"]', '2016-02-12 15:40:37');
INSERT INTO `movie` VALUES ('xman-1006', 'X战警：死侍2', 'http://122.152.205.72:88/superhero/xman/Deadpool2/poster.png', 'http://122.152.205.72:88/superhero/xman/Deadpool2/cover.png', 'http://122.152.205.72:88/superhero/xman/Deadpool2/trailer.mp4', 7.8, 5963, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Deadpool2', '上映时间：2018-05-18(美国)', '影片时长：119分钟', '漫威史上最贱的雇佣兵死侍再度归来！本与女友过着幸福生活的死侍（瑞安·雷诺兹 饰）上门寻仇，美好生活岌岌可危。然而悲惨的日子还没结束，死侍还和想要接纳他的X战警剪不断，理还乱。就在这位平日里插科打诨的英雄人生跌入谷底之时，一位强大的时空穿越者——电索（乔什·布洛林 饰）却盯上了死侍想要保护的少年。为迎强敌，死侍广发英雄帖，临时组建了X特攻队。就凭他们真的能打过这位来自未来的敌人么？', '[\"s-1001\"]', '[\"s-1002\",\"s-1003\",\"s-1004\",\"s-1005\",\"s-1006\"]', '[\"http://122.152.205.72:88/superhero/xman/Deadpool2/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool2/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool2/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool2/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/Deadpool2/photos/5.png\"]', '2019-05-28 15:40:37');
INSERT INTO `movie` VALUES ('xman-1007', '金刚狼：殊死一战', 'http://122.152.205.72:88/superhero/xman/Logan/poster.png', 'http://122.152.205.72:88/superhero/xman/Logan/cover.png', 'http://122.152.205.72:88/superhero/xman/Logan/trailer.mp4', 8.5, 9631, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Logan', '上映时间：2017-03-03(中国大陆/美国)', '影片时长：123分钟(中国大陆)', '故事发生在2029年，彼时，X战警早已经解散，作为为数不多的仅存的变种人，金刚狼罗根（休·杰克曼 Hugh Jackman 饰）和卡利班（斯戴芬·莫昌特 Stephen Merchant 饰）照顾着年迈的X教授（帕特里克·斯图尔特 Patrick Stewart 饰），由于衰老，X教授已经丧失了对于自己超能力的控制，如果不依赖药物，他的超能力就会失控，在全球范围内制造无法挽回的灾难。不仅如此，金刚狼的自愈能力亦随着时间的流逝逐渐减弱，体能和力量都早已经大不如从前。 ', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/xman/Logan/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/Logan/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/Logan/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/Logan/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/Logan/photos/5.png\"]', '2017-03-03 15:40:37');
INSERT INTO `movie` VALUES ('xman-1008', '金刚狼1', 'http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/poster.png', 'http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/cover.png', 'http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/trailer.mp4', 7.4, 7894, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: Wolverine', '上映时间：2009-05-03(中国大陆)', '影片时长：107分钟(中国大陆)', '1845年，尚年幼的维克多与詹姆斯兄弟俩在长辈之间一场突如其来争执中唤醒了自身的潜能，詹姆斯情急之下将陌生的生父杀死，自此兄弟两人流落战场，他们凭借不死不衰之身和野兽一般的天赋在各个时代的战争中大开杀戒，直到遇见史崔克少校并加入了他的异能人特殊部队。詹姆斯（休·杰克曼 Hugh Jackman 饰）很快厌倦了对弱势者的杀戮，离开了团队和维克多（列维·施瑞博尔 Liev Schreiber 饰），与女友凯拉隐居在山林中，做了一名伐木工人。六年后，詹姆斯惊闻昔日的超能力队友纷纷被杀害，而杀手正是哥哥维克多，不久连凯拉也遭其毒手，愤怒的詹姆斯与史崔克合作，将自己的身体改造，成为钢筋铁骨的“金刚狼”。金刚狼摆脱军方控制后，发誓要杀死维克多和史崔克为凯拉报仇…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/XmenOriginsWolverine/photos/5.png\"]', '2019-06-01 15:40:37');
INSERT INTO `movie` VALUES ('xman-1009', '金刚狼2', 'http://122.152.205.72:88/superhero/xman/TheWolverine/poster.png', 'http://122.152.205.72:88/superhero/xman/TheWolverine/cover.png', 'http://122.152.205.72:88/superhero/xman/TheWolverine/trailer.mp4', 6.5, 4863, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: The Wolverine', '上映时间：2013-10-17(中国大陆) ', '影片时长：126分钟(中国大陆)', '位于加拿大的深山老林，背负着永生之苦的“金刚狼”罗根（休·杰克曼 Hugh Jackman 饰）隐居于此。在一次与猎人的冲突中，他得到东瀛女子雪生（福岛莉拉 饰）的帮助。雪生是罗根二战期间的旧相识矢志田派来的下属，似乎不久于人世的老友渴望死去之间再见罗根一面。跨越重洋的罗根终于见到在虚弱的矢志田，对方希望他能够保护自己的孙女真理子（冈本多绪 饰）。随着老人谢世，葬礼上突然战火点燃。罗根在雪生的帮助下拼死救出真理子，而矢志田的儿子信玄（真田广之 饰）似乎另有所图。逃亡途中，罗根意外发现他丧失了自愈的能力，金刚狼最大的危机降临…', '[\'\']', '[\'\']', '[\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/4.png\",\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/5.png\",\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/6.png\",\"http://122.152.205.72:88/superhero/xman/TheWolverine/photos/7.png\"]', '2019-05-31 15:40:37');
INSERT INTO `movie` VALUES ('xman-1010', 'X战警：新变种人', 'http://122.152.205.72:88/superhero/xman/TheNewMutants/poster.png', 'http://122.152.205.72:88/superhero/xman/TheNewMutants/cover.png', 'http://122.152.205.72:88/superhero/xman/TheNewMutants/trailer.mp4', 0.0, 123, '2018 / 美国 / 科幻 / 超级英雄', '原名：xman: The New Mutants', '上映时间：2019-08-02(美国)', '影片时长：未知', '二十世纪福斯准备拓展“X战警”系列，立项《新变种人》，找来导演乔什·布恩自编自导。《新变种人》算是《X战警》漫画比较冷门的分支(死侍首次在这里亮相)，角色都是X教授和万磁王的学生，能力比较特别、奇怪。《逆转未来》中的太阳黑子和闪烁在漫画中曾是新变种人成员', '[\"\"]', '[\'\']', '[\"http://122.152.205.72:88/superhero/xman/TheNewMutants/photos/1.png\",\"http://122.152.205.72:88/superhero/xman/TheNewMutants/photos/2.png\",\"http://122.152.205.72:88/superhero/xman/TheNewMutants/photos/3.png\",\"http://122.152.205.72:88/superhero/xman/TheNewMutants/photos/4.png\"]', '2019-05-30 15:40:37');
COMMIT;

-- ----------------------------
-- Table structure for prised_movie
-- ----------------------------
DROP TABLE IF EXISTS `prised_movie`;
CREATE TABLE `prised_movie` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `movie_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`movie_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='被用户喜欢的次数';

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` varchar(64) NOT NULL,
  `name` varchar(24) NOT NULL COMMENT '姓名',
  `sex` int(1) NOT NULL COMMENT '性别：\r\n1： 男\r\n0： 女',
  `photo` varchar(255) NOT NULL COMMENT '人物照片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='演职人员表，主要包含 导演 演员 等';

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES ('s-1001', '大卫·雷奇', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8chiATjFMAAIKAvqZZFI007.png');
INSERT INTO `staff` VALUES ('s-1002', '瑞恩·雷诺兹', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8cmiAFsINAAGp5G2N3P4601.png');
INSERT INTO `staff` VALUES ('s-1003', '乔什·布洛林', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8c0yAEStFAAFtNtwToM8174.png');
INSERT INTO `staff` VALUES ('s-1004', '莫蕾娜·巴卡琳', 2, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8dH6ANjwuAAFqwovb_ko026.png');
INSERT INTO `staff` VALUES ('s-1005', '朱利安·迪尼森', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8dXKAce6jAAJZxGFx8JY012.png');
INSERT INTO `staff` VALUES ('s-1006', '莎姬·贝兹', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8dfuAZPRnAALdQOyfD34321.png');
INSERT INTO `staff` VALUES ('s-1007', '蒂姆·米勒', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8dy-AWx2-AAJVdEvaa0g189.png');
INSERT INTO `staff` VALUES ('s-1008', '艾德·斯克林', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8eeiASb9BAAHMi-X4hyU592.png');
INSERT INTO `staff` VALUES ('s-1009', 'T·J·米勒', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8eouAXASKAALUA5qtibs414.png');
INSERT INTO `staff` VALUES ('s-1010', '吉娜·卡拉诺', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8e2eAR2DTAADF6CWTVs8169.png');
INSERT INTO `staff` VALUES ('s-1011', '布莱恩·辛格', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8fGKAMz6yAAHR7G0TP_s472.png');
INSERT INTO `staff` VALUES ('s-1012', '詹姆斯·麦卡沃伊', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8fP6AK66uAAE4PZi8RoY493.png');
INSERT INTO `staff` VALUES ('s-1013', '迈克尔·法斯宾德', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8femAaXj4AAEvmltS6ug982.png');
INSERT INTO `staff` VALUES ('s-1014', '詹妮弗·劳伦斯', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8flaAS1_iAAC0eio4RyE434.png');
INSERT INTO `staff` VALUES ('s-1015', '尼古拉斯·霍尔特', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8fx-AELytAAGW6M06tto667.png');
INSERT INTO `staff` VALUES ('s-1016', '奥斯卡·伊萨克', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8f_-AG7gnAAIfdYnXOpg548.png');
INSERT INTO `staff` VALUES ('s-1017', '休·杰克曼', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8gW2AdlJdAAIekK3m6zc256.png');
INSERT INTO `staff` VALUES ('s-1018', '马修·沃恩', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8gwuAHaW2AAJS3MwBMXU897.png');
INSERT INTO `staff` VALUES ('s-1019', '西蒙·金伯格', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8hcyAJ4SFAAJLNlLUrcw449.png');
INSERT INTO `staff` VALUES ('s-1020', '苏菲·特纳', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw8hg-AMiDFAAIYcZW9fEg990.png');
INSERT INTO `staff` VALUES ('s-1021', '加文·胡德', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9UYiANdqvAAFr_hyl1c8815.png');
INSERT INTO `staff` VALUES ('s-1022', '列维·施瑞博尔', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9UpyAQTvlAAEnawYNyjY420.png');
INSERT INTO `staff` VALUES ('s-1023', '丹尼·赫斯顿', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9UuuAC8-oAAIItHCOE9Q869.png');
INSERT INTO `staff` VALUES ('s-1024', '泰勒·克奇', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9U0-AelfOAAHaydUlLCM608.png');
INSERT INTO `staff` VALUES ('s-1025', '詹姆斯·曼高德', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9VhaAMvR1AAFODJOSKEE865.png');
INSERT INTO `staff` VALUES ('s-1026', '冈本多绪', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9V0mAEYFEAAFo22SgHjI987.png');
INSERT INTO `staff` VALUES ('s-1027', '福岛莉拉', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9WI-ALFKlAAERDCc69Lk172.png');
INSERT INTO `staff` VALUES ('s-1028', '真田广之', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9WP6ASAtxAAI9KHzU96s161.png');
INSERT INTO `staff` VALUES ('s-1029', '斯维特拉纳·库德钦科娃', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9WWWARsp_AAHdSVmR76g652.png');
INSERT INTO `staff` VALUES ('s-1030', '帕特里克·斯图尔特', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9bqyAM0abAAG6kNnTV6Q949.png');
INSERT INTO `staff` VALUES ('s-1031', '达芙妮·基恩 ', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9bweASx_DAAKdk5dPpUo265.png');
INSERT INTO `staff` VALUES ('s-1032', '波伊德·霍布鲁克', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9cAiAWnLDAAEFnflqbgs495.png');
INSERT INTO `staff` VALUES ('s-1033', '斯戴芬·莫昌特', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9cPOAP-JSAAI0nS2Sfn0839.png');
INSERT INTO `staff` VALUES ('s-1034', '约什·布恩', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9cbuAaSq8AAHywki6Lik174.png');
INSERT INTO `staff` VALUES ('s-1035', '安雅·泰勒-乔伊', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9cnWAYqIMAAK15JLk284914.png');
INSERT INTO `staff` VALUES ('s-1036', '麦茜·威廉姆斯', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9ctSAeoK-AAISl_Z7zD8616.png');
INSERT INTO `staff` VALUES ('s-1037', '安东尼奥·班德拉斯', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9czeAQ-HMAAEFyfOL0-g104.png');
INSERT INTO `staff` VALUES ('s-1038', '艾莉丝·布拉加', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9c4mAWzsbAAIkKzJ79AI065.png');
INSERT INTO `staff` VALUES ('s-1039', '查理·希顿', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9c-OAc5uwAAFr1v6sAUU280.png');
INSERT INTO `staff` VALUES ('s-1040', '温子仁', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9dVKALw0EAAJTu-Zylkc005.png');
INSERT INTO `staff` VALUES ('s-1041', '杰森·莫玛', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9d72AYyhWAAJIvrbqSUs132.png');
INSERT INTO `staff` VALUES ('s-1042', '艾梅柏·希尔德', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9eD2AV0hkAAI3TxLz54w815.png');
INSERT INTO `staff` VALUES ('s-1043', '威廉·达福', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9eO6AVP-5AAGtRU477bU631.png');
INSERT INTO `staff` VALUES ('s-1044', '帕特里克·威尔森', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9eVeAWNmtAAGGHr226z8073.png');
INSERT INTO `staff` VALUES ('s-1045', '妮可·基德曼', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9ec6AUzpQAALGMlNJQhs988.png');
INSERT INTO `staff` VALUES ('s-1046', '扎克·施奈德', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9e4WACxMmAAHam_1U--o575.png');
INSERT INTO `staff` VALUES ('s-1047', '本·阿弗莱克', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9e-qAXNjLAAHS4bP2I4I827.png');
INSERT INTO `staff` VALUES ('s-1048', '亨利·卡维尔', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9fFWALt94AAHfELqDWeM722.png');
INSERT INTO `staff` VALUES ('s-1049', '盖尔·加朵', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9fNeALcbmAAJVmfo_KuI690.png');
INSERT INTO `staff` VALUES ('s-1050', '杰西·艾森伯格', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9fT6APOy_AAG429QOwBs846.png');
INSERT INTO `staff` VALUES ('s-1051', '艾米·亚当斯', 0, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9faOADHU2AAIVGdylnxk840.png');
INSERT INTO `staff` VALUES ('s-1052', '迈克尔·珊农', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9fvyAL389AAHlqz4ZW48916.png');
INSERT INTO `staff` VALUES ('s-1053', '凯文·科斯特纳', 1, 'http://122.152.205.72:88/group1/M00/00/03/CpoxxFw9f2-AS4jfAAHhDA6dN08523.png');
INSERT INTO `staff` VALUES ('s-1054', '戴安·琳恩', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9f76Af6LoAANNihdQX1M073.png');
INSERT INTO `staff` VALUES ('s-1055', '派蒂·杰金斯', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9gEyALJGHAAGrGNzQSkQ962.png');
INSERT INTO `staff` VALUES ('s-1056', '克里斯·派恩', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9gRyAZk6mAAHxTdSWgoc816.png');
INSERT INTO `staff` VALUES ('s-1057', '康妮·尼尔森', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9gYuAJfHGAAJbbD4en54350.png');
INSERT INTO `staff` VALUES ('s-1058', '罗宾·怀特', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9ge2ABEhrAAG5tTq8yHs187.png');
INSERT INTO `staff` VALUES ('s-1059', '克里斯托弗·诺兰', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9g_SAERa_AAIdXgg7sAA866.png');
INSERT INTO `staff` VALUES ('s-1060', '克里斯蒂安·贝尔', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9hHaAPrzeAAGSYIU5LMY971.png');
INSERT INTO `staff` VALUES ('s-1061', '迈克尔·凯恩', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9hRCAfWvJAAEiuCYHmqc426.png');
INSERT INTO `staff` VALUES ('s-1062', '加里·奥德曼', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9hX-AEH3HAAJXpqGjlmk048.png');
INSERT INTO `staff` VALUES ('s-1063', '连姆·尼森', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9hf2AexA7AAEpT4p_bPE749.png');
INSERT INTO `staff` VALUES ('s-1064', '凯蒂·霍尔姆斯', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9hjWAeTxJAAJjHTHRt1M482.png');
INSERT INTO `staff` VALUES ('s-1065', '希斯·莱杰', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9hxGAXgxUAAH6BCyc6w8698.png');
INSERT INTO `staff` VALUES ('s-1066', '艾伦·艾克哈特', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9h3aAbR1hAAGpuAuqXG8263.png');
INSERT INTO `staff` VALUES ('s-1067', '玛吉·吉伦哈尔', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9h72ALuoBAAJGkm9jVOY299.png');
INSERT INTO `staff` VALUES ('s-1068', '安妮·海瑟薇', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9iPiANJMuAAFfTCMLYlQ277.png');
INSERT INTO `staff` VALUES ('s-1069', '约瑟夫·高登-莱维特', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9iSuAFehPAALh6se_-yk776.png');
INSERT INTO `staff` VALUES ('s-1070', '汤姆·哈迪', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9iWCATnktAAJKgrN2poY145.png');
INSERT INTO `staff` VALUES ('s-1071', '马丁·坎贝尔', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9iyOAGAHIAAJXiY8xheo045.png');
INSERT INTO `staff` VALUES ('s-1072', '布蕾克·莱弗利', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9i-2AFKVoAAJ2Erarxio962.png');
INSERT INTO `staff` VALUES ('s-1073', '彼得·萨斯加德', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9jQGAYki_AAJBG39VcvQ024.png');
INSERT INTO `staff` VALUES ('s-1074', '马克·斯特朗', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9jMSAeIR-AAF6wU6cnLY701.png');
INSERT INTO `staff` VALUES ('s-1075', '特穆拉·莫里森', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9jJyAS_RhAAItgSrirAw100.png');
INSERT INTO `staff` VALUES ('s-1076', '大卫·阿耶', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9jZmAdxYrAAIUSaKm254421.png');
INSERT INTO `staff` VALUES ('s-1077', '威尔·史密斯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9jjCAMABbAAH2pLabS6c273.png');
INSERT INTO `staff` VALUES ('s-1078', '杰瑞德·莱托', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9jniAR6pWAAKWfjcJiAE781.png');
INSERT INTO `staff` VALUES ('s-1079', '玛格特·罗比', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9kEOANl78AAMcGTBcbHw428.png');
INSERT INTO `staff` VALUES ('s-1080', '乔尔·金纳曼', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9j_2ASjQgAAKWuvwkKRg503.png');
INSERT INTO `staff` VALUES ('s-1081', '大卫·F·桑德伯格', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9kdSAFC9YAAG4YaUhdH4657.png');
INSERT INTO `staff` VALUES ('s-1082', '扎克瑞·莱维', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9kYiAMtcNAAH6lZXRvyY566.png');
INSERT INTO `staff` VALUES ('s-1083', '米歇尔·博斯', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9klmAYDy6AAG2eZ3Ol5c594.png');
INSERT INTO `staff` VALUES ('s-1084', '杰曼·翰苏', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9ko-AKkrnAAEt6H8VAOA916.png');
INSERT INTO `staff` VALUES ('s-1085', '亚当·布罗迪', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9k1mARC-pAAIXfAsQWGQ288.png');
INSERT INTO `staff` VALUES ('s-1086', '佩顿·里德', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9uReAIziGAAJSpdzJWGw648.png');
INSERT INTO `staff` VALUES ('s-1087', '保罗·路德', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9uV6AQ3_zAAHThqtLCY4004.png');
INSERT INTO `staff` VALUES ('s-1088', '伊万杰琳·莉莉', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9ugiAIoBGAAIQeRbfecs108.png');
INSERT INTO `staff` VALUES ('s-1089', '迈克尔·佩纳', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9uluATLvIAAMCLpViBhA997.png');
INSERT INTO `staff` VALUES ('s-1090', '迈克尔·道格拉斯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9uyyAYN63AAEFA6wW8eE905.png');
INSERT INTO `staff` VALUES ('s-1091', '寇瑞·斯托尔', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9u6eAZ_gMAAKEkcO4vSM939.png');
INSERT INTO `staff` VALUES ('s-1092', '汉娜·乔恩-卡门', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9vGiAbK_3AAC8SEEG4d0160.png');
INSERT INTO `staff` VALUES ('s-1093', '乔斯·韦登', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9vVWAfXJTAAHFzwB3IKM619.png');
INSERT INTO `staff` VALUES ('s-1094', '小罗伯特·唐尼', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9ve2ASE8vAAGXqoczExI168.png');
INSERT INTO `staff` VALUES ('s-1095', '克里斯·埃文斯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9vluAPHeGAAJGIpV1lto237.png');
INSERT INTO `staff` VALUES ('s-1096', '克里斯·海姆斯沃斯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9vueAOtM_AAHkEXe-iGI691.png');
INSERT INTO `staff` VALUES ('s-1097', '斯嘉丽·约翰逊', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9v4aAcKW1AAJPJTjki68132.png');
INSERT INTO `staff` VALUES ('s-1098', '马克·鲁弗洛', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9wCuAX7vCAAJEEItM4Ng295.png');
INSERT INTO `staff` VALUES ('s-1099', '杰瑞米·雷纳', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9wJeAWvWvAAHJQsGhFVw049.png');
INSERT INTO `staff` VALUES ('s-1100', '汤姆·希德勒斯顿', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9wR-AG_umAAHAgP3ggS0347.png');
INSERT INTO `staff` VALUES ('s-1101', '塞缪尔·杰克逊', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9waSAdwScAAIjhPNgb1s529.png');
INSERT INTO `staff` VALUES ('s-1102', '伊丽莎白·奥尔森', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9xFWAKcoRAAMNuvCBEFk244.png');
INSERT INTO `staff` VALUES ('s-1103', '亚伦·泰勒-约翰逊', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9xN2AAWO-AAKmSAbTL9g996.png');
INSERT INTO `staff` VALUES ('s-1104', '安东尼·罗素', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9xe-APzk7AAHjyb84sR0824.png');
INSERT INTO `staff` VALUES ('s-1105', '乔·罗素', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9xkGACaS4AAKsdd9cqHM231.png');
INSERT INTO `staff` VALUES ('s-1106', '保罗·贝坦尼', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9yCCAAoR1AAKIlEPQq9U990.png');
INSERT INTO `staff` VALUES ('s-1107', '本尼迪克特·康伯巴奇', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9yO2AafQzAAKH2nlFrYI998.png');
INSERT INTO `staff` VALUES ('s-1108', '查德维克·博斯曼', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9yYiALz--AAJhGeRSA0s134.png');
INSERT INTO `staff` VALUES ('s-1109', '汤姆·赫兰德', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9ysWAUtPyAAJSPBI-wO0868.png');
INSERT INTO `staff` VALUES ('s-1110', '安东尼·麦凯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9zMiADmsyAAJFWVheAQE073.png');
INSERT INTO `staff` VALUES ('s-1111', '克里斯·帕拉特', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9zU2AEEgPAALTZsoRDZo967.png');
INSERT INTO `staff` VALUES ('s-1112', '佐伊·索尔达娜', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9zeuARnxmAAHALX9Loec443.png');
INSERT INTO `staff` VALUES ('s-1113', '范·迪塞尔', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9zweAKs2xAAIKeA8ND24801.png');
INSERT INTO `staff` VALUES ('s-1114', '戴夫·巴蒂斯塔', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw9z82ABzjOAAJwGfYghsA975.png');
INSERT INTO `staff` VALUES ('s-1115', '瑞恩·库格勒', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-wkaAAScGAAJmEs3557Q717.png');
INSERT INTO `staff` VALUES ('s-1116', '露皮塔·尼永奥', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-wvaAGaIfAAJEnmnGC4Q920.png');
INSERT INTO `staff` VALUES ('s-1117', '迈克尔·B·乔丹', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-w4SAFj0CAAIVaQ6PCoM160.png');
INSERT INTO `staff` VALUES ('s-1118', '马丁·弗瑞曼', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-xZSAAj2TAAIdM5V4pOo370.png');
INSERT INTO `staff` VALUES ('s-1119', '丹娜·奎里拉', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-xcGABkowAAIxqIX6N0Q307.png');
INSERT INTO `staff` VALUES ('s-1120', '乔·庄斯顿', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-xxyAAWBuAALunZBJJso960.png');
INSERT INTO `staff` VALUES ('s-1121', '海莉·阿特维尔', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-yE6AE8ciAAJkPopKyh4165.png');
INSERT INTO `staff` VALUES ('s-1122', '塞巴斯蒂安·斯坦', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-yNeAbF5sAAJcZrPIhS0855.png');
INSERT INTO `staff` VALUES ('s-1123', '汤米·李·琼斯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-yeiAeJheAAJJgH_EOPo942.png');
INSERT INTO `staff` VALUES ('s-1124', '雨果·维文', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-ypeAJU4lAAKRzC941Tk913.png');
INSERT INTO `staff` VALUES ('s-1125', '安娜·波顿', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0A2AdRjvAAHe-JYUH4Y948.png');
INSERT INTO `staff` VALUES ('s-1126', '瑞安·弗雷克', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0A-AU0StAAGd-GHKgsE568.png');
INSERT INTO `staff` VALUES ('s-1127', '布丽·拉尔森', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-zu2AYCLTAAJVM1RR71I873.png');
INSERT INTO `staff` VALUES ('s-1128', '麦肯娜·格瑞丝', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-z6OAQrjIAAGr_xae_Vk358.png');
INSERT INTO `staff` VALUES ('s-1129', '李·佩斯', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-z2uAYD5QAAF1fifjK2U373.png');
INSERT INTO `staff` VALUES ('s-1130', '斯科特·德瑞克森', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0MeADpNpAAJA_zzGZmI103.png');
INSERT INTO `staff` VALUES ('s-1131', '蒂尔达·斯文顿', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0nKAOiSIAAMH7q45o0k380.png');
INSERT INTO `staff` VALUES ('s-1132', '麦斯·米科尔森', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0nKAOHRpAAHNAdt7sl8003.png');
INSERT INTO `staff` VALUES ('s-1133', '切瓦特·埃加福特', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0nKARNJEAAI0A_alkKk563.png');
INSERT INTO `staff` VALUES ('s-1134', '瑞秋·麦克亚当斯', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-0nmASK-eAAKiBVUIzJE251.png');
INSERT INTO `staff` VALUES ('s-1135', '马克·斯蒂文·约翰逊', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-1HKAYognAAIWa6gRbyo623.png');
INSERT INTO `staff` VALUES ('s-1136', '尼古拉斯·凯奇', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-1b2ASk9xAAIcXUBDo2M117.png');
INSERT INTO `staff` VALUES ('s-1137', '伊娃·门德斯', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-1YuAZ7QsAALa4vCXTOs084.png');
INSERT INTO `staff` VALUES ('s-1138', '彼得·方达', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-1qeAWfdfAAHod4J_SoA972.png');
INSERT INTO `staff` VALUES ('s-1139', '山姆·艾里奥特', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-11aALVgOAAGOgpccO4I456.png');
INSERT INTO `staff` VALUES ('s-1140', '韦斯·本特利', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-13KAKhawAALF8InCL_E676.png');
INSERT INTO `staff` VALUES ('s-1141', '马克·耐沃尔代', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw-1-6AGGszAAIYPXlVO1A692.png');
INSERT INTO `staff` VALUES ('s-1142', '詹姆斯·古恩', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw_Fd2Ac_SWAAKY0zwOu6E151.png');
INSERT INTO `staff` VALUES ('s-1143', '乔恩·费儒', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw_FuGAB_LTAAJ98ORI_Tw503.png');
INSERT INTO `staff` VALUES ('s-1144', '泰伦斯·霍华德', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw_F4OAM1rcAAIBslXJ1Ew257.png');
INSERT INTO `staff` VALUES ('s-1145', '格温妮斯·帕特洛', 0, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw_GAqADcyfAAI0aNjA874499.png');
INSERT INTO `staff` VALUES ('s-1146', '沙恩·布莱克', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw_GPSAJ4ciAAI9jbBkzu0599.png');
INSERT INTO `staff` VALUES ('s-1147', '山姆·雷米', 1, 'http://122.152.205.72:88/group1/M00/00/04/CpoxxFw_GdKASct-AAIion7KsjM717.png');
INSERT INTO `staff` VALUES ('s-1148', '托比·马奎尔', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_GoCACLpOAAEtS1VImeU468.png');
INSERT INTO `staff` VALUES ('s-1149', '克斯汀·邓斯特', 0, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_Gz-AI3Y7AAIousGPaTc084.png');
INSERT INTO `staff` VALUES ('s-1150', '詹姆斯·弗兰科', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_G1OAUJIXAAH6fOnQ2pU089.png');
INSERT INTO `staff` VALUES ('s-1151', '乔·沃茨', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_G_CAbZIyAAJ4c0tYjbw231.png');
INSERT INTO `staff` VALUES ('s-1152', '迈克尔·基顿', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_HJqAF-oHAAHB4EEtrhI868.png');
INSERT INTO `staff` VALUES ('s-1153', '马克·韦布', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_HWGACkrOAAImlFXEsak552.png');
INSERT INTO `staff` VALUES ('s-1154', '安德鲁·加菲尔德', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_HhOAaNZuAAIIp9HffRs751.png');
INSERT INTO `staff` VALUES ('s-1155', '艾玛·斯通', 0, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_HoKAOjtAAAIpIt4LBl4384.png');
INSERT INTO `staff` VALUES ('s-1156', '瑞斯·伊凡斯', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_HoCAawN2AAGLKF4BZik464.png');
INSERT INTO `staff` VALUES ('s-1157', '杰米·福克斯', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_H2KANCioAAHQ7kQD5ig672.png');
INSERT INTO `staff` VALUES ('s-1158', '戴恩·德哈恩', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_H2aAQ6p-AAJFAL2g8u8883.png');
INSERT INTO `staff` VALUES ('s-1159', '乔什·特兰克', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_ICqAO1r6AAIZ7B0UqCA063.png');
INSERT INTO `staff` VALUES ('s-1160', '迈尔斯·特勒', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_IP-Af3JPAAKkraCPXDk232.png');
INSERT INTO `staff` VALUES ('s-1161', '凯特·玛拉', 0, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_IQOAW7cgAAHh4aZRHOc348.png');
INSERT INTO `staff` VALUES ('s-1162', '杰米·贝尔', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_Ic2AUggEAAGXGKqsJ_Y505.png');
INSERT INTO `staff` VALUES ('s-1163', '蒂姆·布雷克·尼尔森', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_IcqANFL6AAG6dn3n9vM480.png');
INSERT INTO `staff` VALUES ('s-1164', '鲁本·弗雷斯彻', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_InuAYBYnAAJ5gThYH3k993.png');
INSERT INTO `staff` VALUES ('s-1165', '米歇尔·威廉姆斯', 0, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_Ix2ARks-AAI0X1Il-ro838.png');
INSERT INTO `staff` VALUES ('s-1166', '里兹·阿迈德', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_I4qAAYgTAAFfKos0dgQ231.png');
INSERT INTO `staff` VALUES ('s-1167', '肯尼思·布拉纳', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_JPKAVmSUAAEubBKbK-0240.png');
INSERT INTO `staff` VALUES ('s-1168', '娜塔莉·波特曼', 0, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_JtiAUXZXAAFVBHoCSp4352.png');
INSERT INTO `staff` VALUES ('s-1169', '安东尼·霍普金斯', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_JhaAX820AADQzdwIVec170.png');
INSERT INTO `staff` VALUES ('s-1170', '阿兰·泰勒', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_JxKAF4tSAAIuYWTWRvE107.png');
INSERT INTO `staff` VALUES ('s-1171', '塔伊加·维迪提', 1, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_J6uAWWunAAHW7u6kwpM631.png');
INSERT INTO `staff` VALUES ('s-1172', '凯特·布兰切特', 0, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_KByATHSdAAI4SGKB7UI965.png');
COMMIT;

-- ----------------------------
-- Table structure for staff_movie
-- ----------------------------
DROP TABLE IF EXISTS `staff_movie`;
CREATE TABLE `staff_movie` (
  `id` varchar(64) NOT NULL,
  `staff_id` varchar(64) NOT NULL COMMENT '演职人员id',
  `movie_id` varchar(64) NOT NULL COMMENT '电影id',
  `role` int(11) NOT NULL COMMENT '角色：\r\n1：导演\r\n2：演员',
  `act_name` varchar(24) NOT NULL COMMENT '饰演人物',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='演职人员和电影的多对的关联关系表\r\n';

-- ----------------------------
-- Records of staff_movie
-- ----------------------------
BEGIN;
INSERT INTO `staff_movie` VALUES ('rel-1001', 's-1001', 'xman-1006', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1002', 's-1002', 'xman-1006', 2, '死侍');
INSERT INTO `staff_movie` VALUES ('rel-1003', 's-1003', 'xman-1006', 2, '电索');
INSERT INTO `staff_movie` VALUES ('rel-1004', 's-1004', 'xman-1006', 2, '瓦内莎');
INSERT INTO `staff_movie` VALUES ('rel-1005', 's-1005', 'xman-1006', 2, '罗素');
INSERT INTO `staff_movie` VALUES ('rel-1006', 's-1006', 'xman-1006', 2, '多米诺');
INSERT INTO `staff_movie` VALUES ('rel-1007', 's-1007', 'xman-1005', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1008', 's-1002', 'xman-1005', 2, '死侍');
INSERT INTO `staff_movie` VALUES ('rel-1009', 's-1004', 'xman-1005', 2, '瓦内莎');
INSERT INTO `staff_movie` VALUES ('rel-1010', 's-1008', 'xman-1005', 2, 'Ajax');
INSERT INTO `staff_movie` VALUES ('rel-1011', 's-1009', 'xman-1005', 2, '杰克·哈默');
INSERT INTO `staff_movie` VALUES ('rel-1012', 's-1010', 'xman-1005', 2, 'Angel Dust');
INSERT INTO `staff_movie` VALUES ('rel-1013', 's-1011', 'xman-1001', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1014', 's-1012', 'xman-1001', 2, 'X博士');
INSERT INTO `staff_movie` VALUES ('rel-1015', 's-1013', 'xman-1001', 2, '万磁王');
INSERT INTO `staff_movie` VALUES ('rel-1016', 's-1014', 'xman-1001', 2, '魔形女');
INSERT INTO `staff_movie` VALUES ('rel-1017', 's-1015', 'xman-1001', 2, '野兽');
INSERT INTO `staff_movie` VALUES ('rel-1018', 's-1016', 'xman-1001', 2, '天启');
INSERT INTO `staff_movie` VALUES ('rel-1019', 's-1017', 'xman-1002', 2, '金刚狼');
INSERT INTO `staff_movie` VALUES ('rel-1020', 's-1011', 'xman-1002', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1021', 's-1012', 'xman-1002', 2, 'X博士');
INSERT INTO `staff_movie` VALUES ('rel-1022', 's-1013', 'xman-1002', 2, '万磁王');
INSERT INTO `staff_movie` VALUES ('rel-1023', 's-1014', 'xman-1002', 2, '魔形女');
INSERT INTO `staff_movie` VALUES ('rel-1024', 's-1015', 'xman-1002', 2, '野兽');
INSERT INTO `staff_movie` VALUES ('rel-1025', 's-1017', 'xman-1003', 2, '金刚狼');
INSERT INTO `staff_movie` VALUES ('rel-1026', 's-1012', 'xman-1003', 2, 'X博士');
INSERT INTO `staff_movie` VALUES ('rel-1027', 's-1013', 'xman-1003', 2, '万磁王');
INSERT INTO `staff_movie` VALUES ('rel-1028', 's-1014', 'xman-1003', 2, '魔形女');
INSERT INTO `staff_movie` VALUES ('rel-1029', 's-1015', 'xman-1003', 2, '野兽');
INSERT INTO `staff_movie` VALUES ('rel-1030', 's-1018', 'xman-1003', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1031', 's-1019', 'xman-1004', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1032', 's-1020', 'xman-1004', 2, '琴·格蕾');
INSERT INTO `staff_movie` VALUES ('rel-1033', 's-1012', 'xman-1004', 2, 'X博士');
INSERT INTO `staff_movie` VALUES ('rel-1034', 's-1013', 'xman-1004', 2, '万磁王');
INSERT INTO `staff_movie` VALUES ('rel-1035', 's-1014', 'xman-1004', 2, '魔形女');
INSERT INTO `staff_movie` VALUES ('rel-1036', 's-1015', 'xman-1004', 2, '野兽');
INSERT INTO `staff_movie` VALUES ('rel-1037', 's-1021', 'xman-1008', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1038', 's-1017', 'xman-1008', 2, '金刚狼');
INSERT INTO `staff_movie` VALUES ('rel-1039', 's-1002', 'xman-1008', 2, '死侍');
INSERT INTO `staff_movie` VALUES ('rel-1040', 's-1021', 'xman-1008', 2, 'Victor');
INSERT INTO `staff_movie` VALUES ('rel-1041', 's-1023', 'xman-1008', 2, 'Stryker');
INSERT INTO `staff_movie` VALUES ('rel-1042', 's-1024', 'xman-1008', 2, 'Remy');
INSERT INTO `staff_movie` VALUES ('rel-1043', 's-1025', 'xman-1009', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1044', 's-1017', 'xman-1009', 2, '金刚狼');
INSERT INTO `staff_movie` VALUES ('rel-1045', 's-1026', 'xman-1009', 2, 'Mariko');
INSERT INTO `staff_movie` VALUES ('rel-1046', 's-1027', 'xman-1009', 2, 'Yukio');
INSERT INTO `staff_movie` VALUES ('rel-1047', 's-1028', 'xman-1009', 2, 'Shingen');
INSERT INTO `staff_movie` VALUES ('rel-1048', 's-1029', 'xman-1009', 2, 'Viper');
INSERT INTO `staff_movie` VALUES ('rel-1049', 's-1025', 'xman-1007', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1050', 's-1017', 'xman-1007', 2, '金刚狼');
INSERT INTO `staff_movie` VALUES ('rel-1051', 's-1030', 'xman-1007', 2, 'X教授');
INSERT INTO `staff_movie` VALUES ('rel-1052', 's-1031', 'xman-1007', 2, '劳拉 X-23');
INSERT INTO `staff_movie` VALUES ('rel-1053', 's-1032', 'xman-1007', 2, '唐纳德');
INSERT INTO `staff_movie` VALUES ('rel-1054', 's-1033', 'xman-1007', 2, '卡利班');
INSERT INTO `staff_movie` VALUES ('rel-1055', 's-1034', 'xman-1010', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1056', 's-1035', 'xman-1010', 2, '秘客');
INSERT INTO `staff_movie` VALUES ('rel-1057', 's-1036', 'xman-1010', 2, '狼毒');
INSERT INTO `staff_movie` VALUES ('rel-1058', 's-1037', 'xman-1010', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1059', 's-1038', 'xman-1010', 2, '塞西利亚');
INSERT INTO `staff_movie` VALUES ('rel-1060', 's-1039', 'xman-1010', 2, '加农炮');
INSERT INTO `staff_movie` VALUES ('rel-1061', 's-1040', 'dc-1001', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1062', 's-1041', 'dc-1001', 2, '海王/亚瑟');
INSERT INTO `staff_movie` VALUES ('rel-1063', 's-1042', 'dc-1001', 2, '湄拉');
INSERT INTO `staff_movie` VALUES ('rel-1064', 's-1043', 'dc-1001', 2, '努迪斯');
INSERT INTO `staff_movie` VALUES ('rel-1065', 's-1044', 'dc-1001', 2, '海洋领主/奥姆王');
INSERT INTO `staff_movie` VALUES ('rel-1066', 's-1045', 'dc-1001', 2, '亚特兰娜女王');
INSERT INTO `staff_movie` VALUES ('rel-1067', 's-1046', 'dc-1005', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1068', 's-1047', 'dc-1005', 2, '蝙蝠侠');
INSERT INTO `staff_movie` VALUES ('rel-1069', 's-1048', 'dc-1005', 2, '超人');
INSERT INTO `staff_movie` VALUES ('rel-1070', 's-1049', 'dc-1005', 2, '神奇女侠');
INSERT INTO `staff_movie` VALUES ('rel-1071', 's-1050', 'dc-1005', 2, 'Lex Luthor');
INSERT INTO `staff_movie` VALUES ('rel-1072', 's-1051', 'dc-1005', 2, 'Lois Lane');
INSERT INTO `staff_movie` VALUES ('rel-1073', 's-1046', 'dc-1006', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1074', 's-1048', 'dc-1006', 2, '超人');
INSERT INTO `staff_movie` VALUES ('rel-1075', 's-1051', 'dc-1006', 2, 'Lois Lane');
INSERT INTO `staff_movie` VALUES ('rel-1076', 's-1052', 'dc-1006', 2, '佐德将军');
INSERT INTO `staff_movie` VALUES ('rel-1077', 's-1053', 'dc-1006', 2, '乔纳森·肯特');
INSERT INTO `staff_movie` VALUES ('rel-1078', 's-1054', 'dc-1006', 2, '玛莎');
INSERT INTO `staff_movie` VALUES ('rel-1079', 's-1055', 'dc-1008', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1080', 's-1049', 'dc-1008', 2, '神奇女侠');
INSERT INTO `staff_movie` VALUES ('rel-1081', 's-1023', 'dc-1008', 2, '鲁登道夫');
INSERT INTO `staff_movie` VALUES ('rel-1082', 's-1056', 'dc-1008', 2, '史蒂夫');
INSERT INTO `staff_movie` VALUES ('rel-1083', 's-1057', 'dc-1008', 2, '希波吕忒');
INSERT INTO `staff_movie` VALUES ('rel-1084', 's-1058', 'dc-1008', 2, '安提俄珀');
INSERT INTO `staff_movie` VALUES ('rel-1085', 's-1046', 'dc-1007', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1086', 's-1041', 'dc-1007', 2, '海王/亚瑟');
INSERT INTO `staff_movie` VALUES ('rel-1087', 's-1047', 'dc-1007', 2, '蝙蝠侠');
INSERT INTO `staff_movie` VALUES ('rel-1088', 's-1048', 'dc-1007', 2, '超人');
INSERT INTO `staff_movie` VALUES ('rel-1089', 's-1049', 'dc-1007', 2, '神奇女侠');
INSERT INTO `staff_movie` VALUES ('rel-1090', 's-1042', 'dc-1007', 2, '湄拉');
INSERT INTO `staff_movie` VALUES ('rel-1091', 's-1059', 'dc-1002', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1092', 's-1060', 'dc-1002', 2, '蝙蝠侠');
INSERT INTO `staff_movie` VALUES ('rel-1093', 's-1061', 'dc-1002', 2, '阿尔弗雷德');
INSERT INTO `staff_movie` VALUES ('rel-1094', 's-1062', 'dc-1002', 2, '吉姆·戈登');
INSERT INTO `staff_movie` VALUES ('rel-1095', 's-1063', 'dc-1002', 2, '亨利·杜卡');
INSERT INTO `staff_movie` VALUES ('rel-1096', 's-1064', 'dc-1002', 2, '瑞秋·道斯');
INSERT INTO `staff_movie` VALUES ('rel-1097', 's-1059', 'dc-1003', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1098', 's-1060', 'dc-1003', 2, '蝙蝠侠');
INSERT INTO `staff_movie` VALUES ('rel-1099', 's-1061', 'dc-1003', 2, '阿尔弗雷德');
INSERT INTO `staff_movie` VALUES ('rel-1100', 's-1065', 'dc-1003', 2, '小丑');
INSERT INTO `staff_movie` VALUES ('rel-1101', 's-1066', 'dc-1003', 2, '哈维·丹特');
INSERT INTO `staff_movie` VALUES ('rel-1102', 's-1067', 'dc-1003', 2, '瑞秋·道斯');
INSERT INTO `staff_movie` VALUES ('rel-1103', 's-1059', 'dc-1004', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1104', 's-1060', 'dc-1004', 2, '蝙蝠侠');
INSERT INTO `staff_movie` VALUES ('rel-1105', 's-1061', 'dc-1004', 2, '阿尔弗雷德');
INSERT INTO `staff_movie` VALUES ('rel-1106', 's-1068', 'dc-1004', 2, '猫女');
INSERT INTO `staff_movie` VALUES ('rel-1107', 's-1069', 'dc-1004', 2, '约翰·布莱克');
INSERT INTO `staff_movie` VALUES ('rel-1108', 's-1070', 'dc-1004', 2, '贝恩');
INSERT INTO `staff_movie` VALUES ('rel-1109', 's-1071', 'dc-1009', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1110', 's-1002', 'dc-1009', 2, '绿灯侠');
INSERT INTO `staff_movie` VALUES ('rel-1111', 's-1072', 'dc-1009', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1112', 's-1073', 'dc-1009', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1113', 's-1074', 'dc-1009', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1114', 's-1075', 'dc-1009', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1115', 's-1076', 'dc-1010', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1116', 's-1077', 'dc-1010', 2, 'Deadshot');
INSERT INTO `staff_movie` VALUES ('rel-1117', 's-1078', 'dc-1010', 2, 'Joker');
INSERT INTO `staff_movie` VALUES ('rel-1118', 's-1047', 'dc-1010', 2, '蝙蝠侠');
INSERT INTO `staff_movie` VALUES ('rel-1119', 's-1079', 'dc-1010', 2, '小丑女');
INSERT INTO `staff_movie` VALUES ('rel-1120', 's-1080', 'dc-1010', 2, 'Rick Flag');
INSERT INTO `staff_movie` VALUES ('rel-1121', 's-1081', 'dc-1011', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1122', 's-1082', 'dc-1011', 2, 'Shazam');
INSERT INTO `staff_movie` VALUES ('rel-1123', 's-1074', 'dc-1011', 2, 'Dr.Thaddeus');
INSERT INTO `staff_movie` VALUES ('rel-1124', 's-1083', 'dc-1011', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1125', 's-1084', 'dc-1011', 2, 'The Wizard');
INSERT INTO `staff_movie` VALUES ('rel-1126', 's-1085', 'dc-1011', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1127', 's-1086', 'marvel-1001', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1128', 's-1087', 'marvel-1001', 2, '蚁人');
INSERT INTO `staff_movie` VALUES ('rel-1129', 's-1088', 'marvel-1001', 2, '黄蜂女');
INSERT INTO `staff_movie` VALUES ('rel-1130', 's-1089', 'marvel-1001', 2, '路易斯');
INSERT INTO `staff_movie` VALUES ('rel-1131', 's-1090', 'marvel-1001', 2, '皮姆博士');
INSERT INTO `staff_movie` VALUES ('rel-1132', 's-1091', 'marvel-1001', 2, '黄衫战士');
INSERT INTO `staff_movie` VALUES ('rel-1133', 's-1086', 'marvel-1002', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1134', 's-1087', 'marvel-1002', 2, '蚁人');
INSERT INTO `staff_movie` VALUES ('rel-1135', 's-1088', 'marvel-1002', 2, '黄蜂女');
INSERT INTO `staff_movie` VALUES ('rel-1136', 's-1089', 'marvel-1002', 2, '路易斯');
INSERT INTO `staff_movie` VALUES ('rel-1137', 's-1090', 'marvel-1002', 2, '皮姆博士');
INSERT INTO `staff_movie` VALUES ('rel-1138', 's-1092', 'marvel-1002', 2, 'Ghost');
INSERT INTO `staff_movie` VALUES ('rel-1139', 's-1093', 'marvel-1003', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1140', 's-1094', 'marvel-1003', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1141', 's-1095', 'marvel-1003', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1142', 's-1096', 'marvel-1003', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1143', 's-1097', 'marvel-1003', 2, '黑寡妇');
INSERT INTO `staff_movie` VALUES ('rel-1144', 's-1098', 'marvel-1003', 2, '绿巨人');
INSERT INTO `staff_movie` VALUES ('rel-1145', 's-1099', 'marvel-1003', 2, '鹰眼');
INSERT INTO `staff_movie` VALUES ('rel-1146', 's-1100', 'marvel-1003', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1147', 's-1101', 'marvel-1003', 2, '弗瑞局长');
INSERT INTO `staff_movie` VALUES ('rel-1148', 's-1093', 'marvel-1004', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1149', 's-1094', 'marvel-1004', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1150', 's-1095', 'marvel-1004', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1151', 's-1096', 'marvel-1004', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1152', 's-1097', 'marvel-1004', 2, '黑寡妇');
INSERT INTO `staff_movie` VALUES ('rel-1153', 's-1098', 'marvel-1004', 2, '绿巨人');
INSERT INTO `staff_movie` VALUES ('rel-1155', 's-1100', 'marvel-1004', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1156', 's-1101', 'marvel-1004', 2, '弗瑞局长');
INSERT INTO `staff_movie` VALUES ('rel-1157', 's-1102', 'marvel-1004', 2, '猩红女巫');
INSERT INTO `staff_movie` VALUES ('rel-1158', 's-1103', 'marvel-1004', 2, '快银');
INSERT INTO `staff_movie` VALUES ('rel-1159', 's-1104', 'marvel-1005', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1160', 's-1105', 'marvel-1005', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1161', 's-1094', 'marvel-1005', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1162', 's-1095', 'marvel-1005', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1163', 's-1096', 'marvel-1005', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1164', 's-1097', 'marvel-1005', 2, '黑寡妇');
INSERT INTO `staff_movie` VALUES ('rel-1165', 's-1098', 'marvel-1005', 2, '绿巨人');
INSERT INTO `staff_movie` VALUES ('rel-1166', 's-1100', 'marvel-1005', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1167', 's-1101', 'marvel-1005', 2, '弗瑞局长');
INSERT INTO `staff_movie` VALUES ('rel-1168', 's-1102', 'marvel-1005', 2, '猩红女巫');
INSERT INTO `staff_movie` VALUES ('rel-1169', 's-1003', 'marvel-1005', 2, '灭霸');
INSERT INTO `staff_movie` VALUES ('rel-1170', 's-1106', 'marvel-1005', 2, '幻世');
INSERT INTO `staff_movie` VALUES ('rel-1171', 's-1106', 'marvel-1004', 2, '幻世');
INSERT INTO `staff_movie` VALUES ('rel-1172', 's-1107', 'marvel-1005', 2, '奇异博士');
INSERT INTO `staff_movie` VALUES ('rel-1173', 's-1108', 'marvel-1005', 2, '黑豹');
INSERT INTO `staff_movie` VALUES ('rel-1174', 's-1109', 'marvel-1005', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1175', 's-1110', 'marvel-1005', 2, '猎鹰');
INSERT INTO `staff_movie` VALUES ('rel-1176', 's-1111', 'marvel-1005', 2, '星爵');
INSERT INTO `staff_movie` VALUES ('rel-1177', 's-1112', 'marvel-1005', 2, '卡魔拉');
INSERT INTO `staff_movie` VALUES ('rel-1178', 's-1113', 'marvel-1005', 2, '格鲁特');
INSERT INTO `staff_movie` VALUES ('rel-1179', 's-1114', 'marvel-1005', 2, '德拉克斯');
INSERT INTO `staff_movie` VALUES ('rel-1180', 's-1104', 'marvel-1006', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1181', 's-1105', 'marvel-1006', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1182', 's-1094', 'marvel-1006', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1183', 's-1095', 'marvel-1006', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1184', 's-1096', 'marvel-1006', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1185', 's-1097', 'marvel-1006', 2, '黑寡妇');
INSERT INTO `staff_movie` VALUES ('rel-1186', 's-1098', 'marvel-1006', 2, '绿巨人');
INSERT INTO `staff_movie` VALUES ('rel-1187', 's-1100', 'marvel-1006', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1188', 's-1101', 'marvel-1006', 2, '弗瑞局长');
INSERT INTO `staff_movie` VALUES ('rel-1189', 's-1102', 'marvel-1006', 2, '猩红女巫');
INSERT INTO `staff_movie` VALUES ('rel-1190', 's-1003', 'marvel-1006', 2, '灭霸');
INSERT INTO `staff_movie` VALUES ('rel-1191', 's-1106', 'marvel-1006', 2, '幻世');
INSERT INTO `staff_movie` VALUES ('rel-1193', 's-1107', 'marvel-1006', 2, '奇异博士');
INSERT INTO `staff_movie` VALUES ('rel-1194', 's-1108', 'marvel-1006', 2, '黑豹');
INSERT INTO `staff_movie` VALUES ('rel-1195', 's-1109', 'marvel-1006', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1196', 's-1110', 'marvel-1006', 2, '猎鹰');
INSERT INTO `staff_movie` VALUES ('rel-1197', 's-1111', 'marvel-1006', 2, '星爵');
INSERT INTO `staff_movie` VALUES ('rel-1198', 's-1112', 'marvel-1006', 2, '卡魔拉');
INSERT INTO `staff_movie` VALUES ('rel-1199', 's-1113', 'marvel-1006', 2, '格鲁特');
INSERT INTO `staff_movie` VALUES ('rel-1200', 's-1114', 'marvel-1006', 2, '德拉克斯');
INSERT INTO `staff_movie` VALUES ('rel-1201', 's-1099', 'marvel-1006', 2, '鹰眼');
INSERT INTO `staff_movie` VALUES ('rel-1202', 's-1087', 'marvel-1006', 2, '蚁人');
INSERT INTO `staff_movie` VALUES ('rel-1203', 's-1088', 'marvel-1006', 2, '黄蜂女');
INSERT INTO `staff_movie` VALUES ('rel-1204', 's-1115', 'marvel-1007', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1205', 's-1108', 'marvel-1007', 2, '黑豹');
INSERT INTO `staff_movie` VALUES ('rel-1206', 's-1116', 'marvel-1007', 2, '娜奇雅');
INSERT INTO `staff_movie` VALUES ('rel-1207', 's-1117', 'marvel-1007', 2, '艾瑞克');
INSERT INTO `staff_movie` VALUES ('rel-1208', 's-1118', 'marvel-1007', 2, '埃尔佛特');
INSERT INTO `staff_movie` VALUES ('rel-1209', 's-1119', 'marvel-1007', 2, '奥科烨');
INSERT INTO `staff_movie` VALUES ('rel-1210', 's-1120', 'marvel-1008', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1211', 's-1095', 'marvel-1008', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1212', 's-1121', 'marvel-1008', 2, '佩姬·卡特');
INSERT INTO `staff_movie` VALUES ('rel-1213', 's-1122', 'marvel-1008', 2, '巴基');
INSERT INTO `staff_movie` VALUES ('rel-1214', 's-1123', 'marvel-1008', 2, '斯特·菲利普斯');
INSERT INTO `staff_movie` VALUES ('rel-1215', 's-1124', 'marvel-1008', 2, '红骷髅');
INSERT INTO `staff_movie` VALUES ('rel-1216', 's-1104', 'marvel-1009', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1217', 's-1105', 'marvel-1009', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1218', 's-1095', 'marvel-1009', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1219', 's-1122', 'marvel-1009', 2, '巴基/冬兵');
INSERT INTO `staff_movie` VALUES ('rel-1220', 's-1097', 'marvel-1009', 2, '黑寡妇');
INSERT INTO `staff_movie` VALUES ('rel-1221', 's-1110', 'marvel-1009', 2, '猎鹰');
INSERT INTO `staff_movie` VALUES ('rel-1222', 's-1104', 'marvel-1010', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1223', 's-1105', 'marvel-1010', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1224', 's-1095', 'marvel-1010', 2, '美国队长');
INSERT INTO `staff_movie` VALUES ('rel-1225', 's-1094', 'marvel-1010', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1226', 's-1122', 'marvel-1010', 2, '巴基/冬兵');
INSERT INTO `staff_movie` VALUES ('rel-1227', 's-1097', 'marvel-1010', 2, '黑寡妇');
INSERT INTO `staff_movie` VALUES ('rel-1228', 's-1110', 'marvel-1010', 2, '猎鹰');
INSERT INTO `staff_movie` VALUES ('rel-1229', 's-1125', 'marvel-1011', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1230', 's-1126', 'marvel-1011', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1231', 's-1127', 'marvel-1011', 2, '惊奇队长');
INSERT INTO `staff_movie` VALUES ('rel-1232', 's-1101', 'marvel-1011', 2, '弗瑞局长');
INSERT INTO `staff_movie` VALUES ('rel-1233', 's-1128', 'marvel-1011', 2, '童年惊奇队长');
INSERT INTO `staff_movie` VALUES ('rel-1234', 's-1129', 'marvel-1011', 2, '罗南');
INSERT INTO `staff_movie` VALUES ('rel-1235', 's-1130', 'marvel-1012', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1236', 's-1107', 'marvel-1012', 2, '奇异博士');
INSERT INTO `staff_movie` VALUES ('rel-1237', 's-1131', 'marvel-1012', 2, 'Ancient One');
INSERT INTO `staff_movie` VALUES ('rel-1238', 's-1132', 'marvel-1012', 2, 'Kaecilius');
INSERT INTO `staff_movie` VALUES ('rel-1239', 's-1133', 'marvel-1012', 2, 'Mordo');
INSERT INTO `staff_movie` VALUES ('rel-1240', 's-1134', 'marvel-1012', 2, 'Christine');
INSERT INTO `staff_movie` VALUES ('rel-1241', 's-1135', 'marvel-1013', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1242', 's-1136', 'marvel-1013', 2, '恶灵骑士');
INSERT INTO `staff_movie` VALUES ('rel-1243', 's-1137', 'marvel-1013', 2, '萝珊·辛普森');
INSERT INTO `staff_movie` VALUES ('rel-1244', 's-1138', 'marvel-1013', 2, '梅菲斯特');
INSERT INTO `staff_movie` VALUES ('rel-1245', 's-1139', 'marvel-1013', 2, '卡特·史雷');
INSERT INTO `staff_movie` VALUES ('rel-1246', 's-1140', 'marvel-1013', 2, '巫心魔');
INSERT INTO `staff_movie` VALUES ('rel-1247', 's-1141', 'marvel-1014', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1248', 's-1136', 'marvel-1014', 2, '恶灵骑士');
INSERT INTO `staff_movie` VALUES ('rel-1249', 's-1141', 'marvel-1015', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1250', 's-1111', 'marvel-1015', 2, '星爵');
INSERT INTO `staff_movie` VALUES ('rel-1251', 's-1112', 'marvel-1015', 2, '卡魔拉');
INSERT INTO `staff_movie` VALUES ('rel-1252', 's-1113', 'marvel-1015', 2, '格鲁特');
INSERT INTO `staff_movie` VALUES ('rel-1253', 's-1114', 'marvel-1015', 2, '德拉克斯');
INSERT INTO `staff_movie` VALUES ('rel-1254', 's-1141', 'marvel-1016', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1255', 's-1111', 'marvel-1016', 2, '星爵');
INSERT INTO `staff_movie` VALUES ('rel-1256', 's-1112', 'marvel-1016', 2, '卡魔拉');
INSERT INTO `staff_movie` VALUES ('rel-1257', 's-1113', 'marvel-1016', 2, '格鲁特');
INSERT INTO `staff_movie` VALUES ('rel-1258', 's-1114', 'marvel-1016', 2, '德拉克斯');
INSERT INTO `staff_movie` VALUES ('rel-1259', 's-1143', 'marvel-1017', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1260', 's-1094', 'marvel-1017', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1261', 's-1144', 'marvel-1017', 2, 'Rhodey');
INSERT INTO `staff_movie` VALUES ('rel-1262', 's-1145', 'marvel-1017', 2, '小辣椒');
INSERT INTO `staff_movie` VALUES ('rel-1263', 's-1143', 'marvel-1017', 2, 'Hogan');
INSERT INTO `staff_movie` VALUES ('rel-1264', 's-1146', 'marvel-1018', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1265', 's-1094', 'marvel-1018', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1266', 's-1145', 'marvel-1018', 2, '小辣椒');
INSERT INTO `staff_movie` VALUES ('rel-1267', 's-1143', 'marvel-1018', 2, 'Hogan');
INSERT INTO `staff_movie` VALUES ('rel-1268', 's-1147', 'marvel-1019', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1269', 's-1148', 'marvel-1019', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1270', 's-1149', 'marvel-1019', 2, 'Mary Jane');
INSERT INTO `staff_movie` VALUES ('rel-1271', 's-1150', 'marvel-1019', 2, 'Harry Osborn');
INSERT INTO `staff_movie` VALUES ('rel-1272', 's-1147', 'marvel-1020', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1273', 's-1148', 'marvel-1020', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1274', 's-1149', 'marvel-1020', 2, 'Mary Jane');
INSERT INTO `staff_movie` VALUES ('rel-1275', 's-1150', 'marvel-1020', 2, 'Harry Osborn');
INSERT INTO `staff_movie` VALUES ('rel-1276', 's-1147', 'marvel-1021', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1277', 's-1148', 'marvel-1021', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1278', 's-1149', 'marvel-1021', 2, 'Mary Jane');
INSERT INTO `staff_movie` VALUES ('rel-1279', 's-1150', 'marvel-1021', 2, 'Harry Osborn');
INSERT INTO `staff_movie` VALUES ('rel-1280', 's-1151', 'marvel-1022', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1281', 's-1109', 'marvel-1022', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1282', 's-1094', 'marvel-1022', 2, '钢铁侠');
INSERT INTO `staff_movie` VALUES ('rel-1283', 's-1143', 'marvel-1022', 2, 'Hogan');
INSERT INTO `staff_movie` VALUES ('rel-1284', 's-1145', 'marvel-1022', 2, '小辣椒');
INSERT INTO `staff_movie` VALUES ('rel-1285', 's-1152', 'marvel-1022', 2, '秃鹫');
INSERT INTO `staff_movie` VALUES ('rel-1286', 's-1153', 'marvel-1023', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1287', 's-1154', 'marvel-1023', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1288', 's-1155', 'marvel-1023', 2, '格温');
INSERT INTO `staff_movie` VALUES ('rel-1289', 's-1156', 'marvel-1023', 2, '蜥蜴人');
INSERT INTO `staff_movie` VALUES ('rel-1290', 's-1153', 'marvel-1024', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1291', 's-1154', 'marvel-1024', 2, '蜘蛛侠');
INSERT INTO `staff_movie` VALUES ('rel-1292', 's-1155', 'marvel-1024', 2, '格温');
INSERT INTO `staff_movie` VALUES ('rel-1293', 's-1157', 'marvel-1024', 2, '电光人');
INSERT INTO `staff_movie` VALUES ('rel-1294', 's-1158', 'marvel-1024', 2, 'Harry');
INSERT INTO `staff_movie` VALUES ('rel-1295', 's-1159', 'marvel-1025', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1296', 's-1160', 'marvel-1025', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1297', 's-1161', 'marvel-1025', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1298', 's-1117', 'marvel-1025', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1299', 's-1162', 'marvel-1025', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1300', 's-1163', 'marvel-1025', 2, '演员');
INSERT INTO `staff_movie` VALUES ('rel-1301', 's-1164', 'marvel-1026', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1302', 's-1070', 'marvel-1026', 2, '毒液');
INSERT INTO `staff_movie` VALUES ('rel-1303', 's-1165', 'marvel-1026', 2, '安妮·韦英');
INSERT INTO `staff_movie` VALUES ('rel-1304', 's-1166', 'marvel-1026', 2, '德雷克博士');
INSERT INTO `staff_movie` VALUES ('rel-1305', 's-1167', 'marvel-1027', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1306', 's-1096', 'marvel-1027', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1307', 's-1100', 'marvel-1027', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1308', 's-1168', 'marvel-1027', 2, '简·福斯特');
INSERT INTO `staff_movie` VALUES ('rel-1309', 's-1169', 'marvel-1027', 2, '奥丁');
INSERT INTO `staff_movie` VALUES ('rel-1310', 's-1170', 'marvel-1028', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1311', 's-1096', 'marvel-1028', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1312', 's-1100', 'marvel-1028', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1313', 's-1168', 'marvel-1028', 2, '简·福斯特');
INSERT INTO `staff_movie` VALUES ('rel-1314', 's-1169', 'marvel-1028', 2, '奥丁');
INSERT INTO `staff_movie` VALUES ('rel-1315', 's-1171', 'marvel-1029', 1, '导演');
INSERT INTO `staff_movie` VALUES ('rel-1316', 's-1096', 'marvel-1029', 2, '雷神');
INSERT INTO `staff_movie` VALUES ('rel-1317', 's-1100', 'marvel-1029', 2, '洛基');
INSERT INTO `staff_movie` VALUES ('rel-1318', 's-1169', 'marvel-1029', 2, '奥丁');
INSERT INTO `staff_movie` VALUES ('rel-1319', 's-1172', 'marvel-1029', 2, '海拉');
COMMIT;

-- ----------------------------
-- Table structure for system_switch
-- ----------------------------
DROP TABLE IF EXISTS `system_switch`;
CREATE TABLE `system_switch` (
  `is_show_video` int(1) NOT NULL,
  `app_weixin_login` int(1) NOT NULL,
  `app_qq_login` int(1) NOT NULL,
  `app_weibo_login` int(1) NOT NULL,
  `mp_weixin_login` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统开关';

-- ----------------------------
-- Records of system_switch
-- ----------------------------
BEGIN;
INSERT INTO `system_switch` VALUES (0, 1, 1, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(64) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `mp_wx_open_id` varchar(64) DEFAULT NULL COMMENT '其实就是openId',
  `app_qq_open_id` varchar(64) DEFAULT NULL,
  `app_wx_open_id` varchar(64) DEFAULT NULL,
  `app_weibo_uid` varchar(64) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `birthday` varchar(12) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `is_certified` int(4) DEFAULT NULL COMMENT '是否实名认证\r\n1：已实名\r\n0：未实名',
  `regist_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('19051902WTY0T168', NULL, NULL, 'abcdhtr54', 'owJvE5Jx5pudVA1Hei1jQyZDOpHw', NULL, NULL, NULL, 0, '1998-12-12', 'http://192.168.1.3:8088/19051902WTY0T168/face-19051902WTY0T168.png?t=20190602142147', 0, '2019-05-19 00:08:40');
INSERT INTO `users` VALUES ('190520K0GA41RSY8', 'abc', '4QrcOUm6Wau+VuBX8g+IPg==', 'abc', NULL, NULL, NULL, NULL, NULL, '1900-01-01', 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', 0, '2019-05-20 23:50:50');
INSERT INTO `users` VALUES ('1905210280AG3M5P', 'next', '4QrcOUm6Wau+VuBX8g+IPg==', 'next', NULL, NULL, NULL, NULL, NULL, '1900-01-01', 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', 0, '2019-05-21 00:06:51');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
