/*
 Navicat MySQL Data Transfer

 Source Server         : newone
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : english_learning

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 07/12/2023 11:59:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除：0：未删除 1：已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for t_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `t_advertisement`;
CREATE TABLE `t_advertisement`  (
  `ad_id` int NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `ad_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '广告内容',
  `ad_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '广告链接',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '广告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for t_choice_options
-- ----------------------------
DROP TABLE IF EXISTS `t_choice_options`;
CREATE TABLE `t_choice_options`  (
  `option_id` int NOT NULL AUTO_INCREMENT COMMENT '选项ID',
  `question_id` int NOT NULL COMMENT '所属题目ID',
  `option_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项文本',
  `is_correct` tinyint(1) NOT NULL COMMENT '是否正确选项 (1为正确，0为错误)',
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '选择题选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_choice_options
-- ----------------------------
INSERT INTO `t_choice_options` VALUES (2001, 1001, 'portable', 0);
INSERT INTO `t_choice_options` VALUES (2002, 1001, 'primary', 0);
INSERT INTO `t_choice_options` VALUES (2003, 1001, 'possession', 0);
INSERT INTO `t_choice_options` VALUES (2004, 1001, 'positive', 1);
INSERT INTO `t_choice_options` VALUES (2005, 1002, 'motive', 1);
INSERT INTO `t_choice_options` VALUES (2006, 1002, 'motion', 0);
INSERT INTO `t_choice_options` VALUES (2007, 1002, 'mood', 0);
INSERT INTO `t_choice_options` VALUES (2008, 1002, 'moral', 0);
INSERT INTO `t_choice_options` VALUES (2009, 1003, 'midst', 0);
INSERT INTO `t_choice_options` VALUES (2010, 1003, 'mild', 0);
INSERT INTO `t_choice_options` VALUES (2011, 1003, 'mention', 0);
INSERT INTO `t_choice_options` VALUES (2012, 1003, 'neutral', 1);
INSERT INTO `t_choice_options` VALUES (2013, 1004, 'critical', 1);
INSERT INTO `t_choice_options` VALUES (2014, 1004, 'belt', 0);
INSERT INTO `t_choice_options` VALUES (2015, 1004, 'conscience', 0);
INSERT INTO `t_choice_options` VALUES (2016, 1004, 'copper', 0);
INSERT INTO `t_choice_options` VALUES (2017, 1005, 'observation', 0);
INSERT INTO `t_choice_options` VALUES (2018, 1005, 'transportation', 0);
INSERT INTO `t_choice_options` VALUES (2019, 1005, 'advanced', 1);
INSERT INTO `t_choice_options` VALUES (2020, 1005, 'transfer', 0);
INSERT INTO `t_choice_options` VALUES (2021, 1006, 'headlines', 1);
INSERT INTO `t_choice_options` VALUES (2022, 1006, 'headquarters', 0);
INSERT INTO `t_choice_options` VALUES (2023, 1006, 'heaven', 0);
INSERT INTO `t_choice_options` VALUES (2024, 1006, 'horizon', 0);
INSERT INTO `t_choice_options` VALUES (2025, 1007, 'count', 0);
INSERT INTO `t_choice_options` VALUES (2026, 1007, 'vanish', 0);
INSERT INTO `t_choice_options` VALUES (2027, 1007, 'weave', 0);
INSERT INTO `t_choice_options` VALUES (2028, 1007, 'assess', 1);
INSERT INTO `t_choice_options` VALUES (2029, 1008, 'treatment', 0);
INSERT INTO `t_choice_options` VALUES (2030, 1008, 'assistance', 0);
INSERT INTO `t_choice_options` VALUES (2031, 1008, 'scholarship', 1);
INSERT INTO `t_choice_options` VALUES (2032, 1008, 'protein', 0);
INSERT INTO `t_choice_options` VALUES (2033, 1009, 'a stock', 0);
INSERT INTO `t_choice_options` VALUES (2034, 1009, 'a representative', 0);
INSERT INTO `t_choice_options` VALUES (2035, 1009, 'an undergraduate', 1);
INSERT INTO `t_choice_options` VALUES (2036, 1009, 'a gulf', 0);
INSERT INTO `t_choice_options` VALUES (2037, 1010, 'exit', 1);
INSERT INTO `t_choice_options` VALUES (2038, 1010, 'deposit', 0);
INSERT INTO `t_choice_options` VALUES (2039, 1010, 'discharge', 0);
INSERT INTO `t_choice_options` VALUES (2040, 1010, 'elaborate', 0);
INSERT INTO `t_choice_options` VALUES (2041, 1011, 'scatter', 0);
INSERT INTO `t_choice_options` VALUES (2042, 1011, 'overtake', 1);
INSERT INTO `t_choice_options` VALUES (2043, 1011, 'site', 0);
INSERT INTO `t_choice_options` VALUES (2044, 1011, 'sponsor', 0);
INSERT INTO `t_choice_options` VALUES (2045, 1012, 'whistle', 0);
INSERT INTO `t_choice_options` VALUES (2046, 1012, 'vigorous', 0);
INSERT INTO `t_choice_options` VALUES (2047, 1012, 'robot', 0);
INSERT INTO `t_choice_options` VALUES (2048, 1012, 'transparent', 1);
INSERT INTO `t_choice_options` VALUES (2049, 1013, 'omitted', 1);
INSERT INTO `t_choice_options` VALUES (2050, 1013, 'disputed', 0);
INSERT INTO `t_choice_options` VALUES (2051, 1013, 'designed', 0);
INSERT INTO `t_choice_options` VALUES (2052, 1013, 'chased', 0);
INSERT INTO `t_choice_options` VALUES (2053, 1014, 'mixed', 0);
INSERT INTO `t_choice_options` VALUES (2054, 1014, 'alloy', 1);
INSERT INTO `t_choice_options` VALUES (2055, 1014, 'champion', 0);
INSERT INTO `t_choice_options` VALUES (2056, 1014, 'grasp', 0);
INSERT INTO `t_choice_options` VALUES (2057, 1015, 'determination', 0);
INSERT INTO `t_choice_options` VALUES (2058, 1015, 'distribution', 0);
INSERT INTO `t_choice_options` VALUES (2059, 1015, 'discipline', 0);
INSERT INTO `t_choice_options` VALUES (2060, 1015, 'evolution', 1);
INSERT INTO `t_choice_options` VALUES (2061, 1016, 'pushed', 0);
INSERT INTO `t_choice_options` VALUES (2062, 1016, 'purchased', 0);
INSERT INTO `t_choice_options` VALUES (2063, 1016, 'promoted', 1);
INSERT INTO `t_choice_options` VALUES (2064, 1016, 'promised', 0);
INSERT INTO `t_choice_options` VALUES (2065, 1017, 'possible', 0);
INSERT INTO `t_choice_options` VALUES (2066, 1017, 'potential', 1);
INSERT INTO `t_choice_options` VALUES (2067, 1017, 'underneath', 0);
INSERT INTO `t_choice_options` VALUES (2068, 1017, 'vital', 0);
INSERT INTO `t_choice_options` VALUES (2069, 1018, 'interior', 0);
INSERT INTO `t_choice_options` VALUES (2070, 1018, 'insurance', 0);
INSERT INTO `t_choice_options` VALUES (2071, 1018, 'initial', 1);
INSERT INTO `t_choice_options` VALUES (2072, 1018, 'invisible', 0);
INSERT INTO `t_choice_options` VALUES (2073, 1019, 'interior', 0);
INSERT INTO `t_choice_options` VALUES (2074, 1019, 'insurance', 0);
INSERT INTO `t_choice_options` VALUES (2075, 1019, 'initial', 1);
INSERT INTO `t_choice_options` VALUES (2076, 1019, 'invisible', 0);
INSERT INTO `t_choice_options` VALUES (2077, 1020, 'metropolitan', 0);
INSERT INTO `t_choice_options` VALUES (2078, 1020, 'microphone', 0);
INSERT INTO `t_choice_options` VALUES (2079, 1020, 'microscope', 1);
INSERT INTO `t_choice_options` VALUES (2080, 1020, 'microwave', 0);
INSERT INTO `t_choice_options` VALUES (2081, 1021, 'psychologically', 1);
INSERT INTO `t_choice_options` VALUES (2082, 1021, 'moderately', 0);
INSERT INTO `t_choice_options` VALUES (2083, 1021, 'naturally', 0);
INSERT INTO `t_choice_options` VALUES (2084, 1021, 'precisely', 0);
INSERT INTO `t_choice_options` VALUES (2085, 1022, 'additional', 0);
INSERT INTO `t_choice_options` VALUES (2086, 1022, 'advantage', 0);
INSERT INTO `t_choice_options` VALUES (2087, 1022, 'announce', 0);
INSERT INTO `t_choice_options` VALUES (2088, 1022, 'academic', 1);
INSERT INTO `t_choice_options` VALUES (2089, 1023, 'haste', 1);
INSERT INTO `t_choice_options` VALUES (2090, 1023, 'range', 0);
INSERT INTO `t_choice_options` VALUES (2091, 1023, 'possession', 0);
INSERT INTO `t_choice_options` VALUES (2092, 1023, 'purse', 0);
INSERT INTO `t_choice_options` VALUES (2093, 1024, 'less', 0);
INSERT INTO `t_choice_options` VALUES (2094, 1024, 'sandy', 0);
INSERT INTO `t_choice_options` VALUES (2095, 1024, 'stain', 0);
INSERT INTO `t_choice_options` VALUES (2096, 1024, 'minimum', 1);
INSERT INTO `t_choice_options` VALUES (2097, 1025, 'maintenance', 1);
INSERT INTO `t_choice_options` VALUES (2098, 1025, 'merit', 0);
INSERT INTO `t_choice_options` VALUES (2099, 1025, 'philosophy', 0);
INSERT INTO `t_choice_options` VALUES (2100, 1025, 'pigeon', 0);
INSERT INTO `t_choice_options` VALUES (2101, 1026, 'dam', 0);
INSERT INTO `t_choice_options` VALUES (2102, 1026, 'protein', 1);
INSERT INTO `t_choice_options` VALUES (2103, 1026, 'cash', 0);
INSERT INTO `t_choice_options` VALUES (2104, 1026, 'bloody', 0);
INSERT INTO `t_choice_options` VALUES (2105, 1027, 'coin', 0);
INSERT INTO `t_choice_options` VALUES (2106, 1027, 'disaster', 0);
INSERT INTO `t_choice_options` VALUES (2107, 1027, 'cheat', 1);
INSERT INTO `t_choice_options` VALUES (2108, 1027, 'resort', 0);
INSERT INTO `t_choice_options` VALUES (2109, 1028, 'routine', 1);
INSERT INTO `t_choice_options` VALUES (2110, 1028, 'surgery', 0);
INSERT INTO `t_choice_options` VALUES (2111, 1028, 'rifle', 0);
INSERT INTO `t_choice_options` VALUES (2112, 1028, 'sake', 0);
INSERT INTO `t_choice_options` VALUES (2113, 1029, 'clarify', 1);
INSERT INTO `t_choice_options` VALUES (2114, 1029, 'cheek', 0);
INSERT INTO `t_choice_options` VALUES (2115, 1029, 'claim', 0);
INSERT INTO `t_choice_options` VALUES (2116, 1029, 'clap', 0);
INSERT INTO `t_choice_options` VALUES (2117, 1030, 'disgust', 0);
INSERT INTO `t_choice_options` VALUES (2118, 1030, 'proceed', 0);
INSERT INTO `t_choice_options` VALUES (2119, 1030, 'pioneer', 0);
INSERT INTO `t_choice_options` VALUES (2120, 1030, 'anticipate', 1);
INSERT INTO `t_choice_options` VALUES (2121, 1031, 'feedback', 1);
INSERT INTO `t_choice_options` VALUES (2122, 1031, 'frost', 0);
INSERT INTO `t_choice_options` VALUES (2123, 1031, 'outline', 0);
INSERT INTO `t_choice_options` VALUES (2124, 1031, 'overlook', 0);
INSERT INTO `t_choice_options` VALUES (2125, 1032, 'flashed', 1);
INSERT INTO `t_choice_options` VALUES (2126, 1032, 'wicked', 0);
INSERT INTO `t_choice_options` VALUES (2127, 1032, 'voted', 0);
INSERT INTO `t_choice_options` VALUES (2128, 1032, 'protested', 0);
INSERT INTO `t_choice_options` VALUES (2129, 1033, 'respective', 1);
INSERT INTO `t_choice_options` VALUES (2130, 1033, 'responsible', 0);
INSERT INTO `t_choice_options` VALUES (2131, 1033, 'resource', 0);
INSERT INTO `t_choice_options` VALUES (2132, 1033, 'resolution', 0);
INSERT INTO `t_choice_options` VALUES (2133, 1034, 'omitted', 1);
INSERT INTO `t_choice_options` VALUES (2134, 1034, 'disputed', 0);
INSERT INTO `t_choice_options` VALUES (2135, 1034, 'designed', 0);
INSERT INTO `t_choice_options` VALUES (2136, 1034, 'chased', 0);
INSERT INTO `t_choice_options` VALUES (2137, 1035, 'mixed', 0);
INSERT INTO `t_choice_options` VALUES (2138, 1035, 'alloy', 1);
INSERT INTO `t_choice_options` VALUES (2139, 1035, 'champion', 0);
INSERT INTO `t_choice_options` VALUES (2140, 1035, 'grasp', 0);
INSERT INTO `t_choice_options` VALUES (2141, 1036, 'determination', 0);
INSERT INTO `t_choice_options` VALUES (2142, 1036, 'distribution', 0);
INSERT INTO `t_choice_options` VALUES (2143, 1036, 'discipline', 0);
INSERT INTO `t_choice_options` VALUES (2144, 1036, 'evolution', 1);
INSERT INTO `t_choice_options` VALUES (2145, 1037, 'pushed', 0);
INSERT INTO `t_choice_options` VALUES (2146, 1037, 'purchased', 0);
INSERT INTO `t_choice_options` VALUES (2147, 1037, 'promoted', 1);
INSERT INTO `t_choice_options` VALUES (2148, 1037, 'promised', 0);
INSERT INTO `t_choice_options` VALUES (2149, 1038, 'possible', 0);
INSERT INTO `t_choice_options` VALUES (2150, 1038, 'potential', 1);
INSERT INTO `t_choice_options` VALUES (2151, 1038, 'underneath', 0);
INSERT INTO `t_choice_options` VALUES (2152, 1038, 'vital', 0);
INSERT INTO `t_choice_options` VALUES (2153, 1039, 'interior', 0);
INSERT INTO `t_choice_options` VALUES (2154, 1039, 'insurance', 0);
INSERT INTO `t_choice_options` VALUES (2155, 1039, 'initial', 1);
INSERT INTO `t_choice_options` VALUES (2156, 1039, 'invisible', 0);
INSERT INTO `t_choice_options` VALUES (2157, 1040, 'interior', 0);
INSERT INTO `t_choice_options` VALUES (2158, 1040, 'insurance', 0);
INSERT INTO `t_choice_options` VALUES (2159, 1040, 'initial', 1);
INSERT INTO `t_choice_options` VALUES (2160, 1040, 'invisible', 0);
INSERT INTO `t_choice_options` VALUES (2161, 1041, 'metropolitan', 0);
INSERT INTO `t_choice_options` VALUES (2162, 1041, 'microphone', 0);
INSERT INTO `t_choice_options` VALUES (2163, 1041, 'microscope', 1);
INSERT INTO `t_choice_options` VALUES (2164, 1041, 'microwave', 0);
INSERT INTO `t_choice_options` VALUES (2165, 1042, 'psychologically', 1);
INSERT INTO `t_choice_options` VALUES (2166, 1042, 'moderately', 0);
INSERT INTO `t_choice_options` VALUES (2167, 1042, 'naturally', 0);
INSERT INTO `t_choice_options` VALUES (2168, 1042, 'precisely', 0);
INSERT INTO `t_choice_options` VALUES (2169, 1043, 'additional', 0);
INSERT INTO `t_choice_options` VALUES (2170, 1043, 'advantage', 0);
INSERT INTO `t_choice_options` VALUES (2171, 1043, 'announce', 0);
INSERT INTO `t_choice_options` VALUES (2172, 1043, 'academic', 1);
INSERT INTO `t_choice_options` VALUES (2173, 1044, 'haste', 1);
INSERT INTO `t_choice_options` VALUES (2174, 1044, 'range', 0);
INSERT INTO `t_choice_options` VALUES (2175, 1044, 'possession', 0);
INSERT INTO `t_choice_options` VALUES (2176, 1044, 'purse', 0);
INSERT INTO `t_choice_options` VALUES (2177, 1045, 'less', 0);
INSERT INTO `t_choice_options` VALUES (2178, 1045, 'sandy', 0);
INSERT INTO `t_choice_options` VALUES (2179, 1045, 'stain', 0);
INSERT INTO `t_choice_options` VALUES (2180, 1045, 'minimum', 1);
INSERT INTO `t_choice_options` VALUES (2181, 1046, 'omitted', 1);
INSERT INTO `t_choice_options` VALUES (2182, 1046, 'disputed', 0);
INSERT INTO `t_choice_options` VALUES (2183, 1046, 'designed', 0);
INSERT INTO `t_choice_options` VALUES (2184, 1046, 'chased', 0);
INSERT INTO `t_choice_options` VALUES (2185, 1047, 'mixed', 0);
INSERT INTO `t_choice_options` VALUES (2186, 1047, 'alloy', 1);
INSERT INTO `t_choice_options` VALUES (2187, 1047, 'champion', 0);
INSERT INTO `t_choice_options` VALUES (2188, 1047, 'grasp', 0);
INSERT INTO `t_choice_options` VALUES (2189, 1048, 'determination ', 0);
INSERT INTO `t_choice_options` VALUES (2190, 1048, 'distribution ', 0);
INSERT INTO `t_choice_options` VALUES (2191, 1048, 'discipline', 0);
INSERT INTO `t_choice_options` VALUES (2192, 1048, 'evolution', 1);
INSERT INTO `t_choice_options` VALUES (2193, 1049, 'pushed', 0);
INSERT INTO `t_choice_options` VALUES (2194, 1049, 'purchased', 0);
INSERT INTO `t_choice_options` VALUES (2195, 1049, 'promoted', 1);
INSERT INTO `t_choice_options` VALUES (2196, 1049, 'promised', 0);
INSERT INTO `t_choice_options` VALUES (2197, 1050, 'possible', 0);
INSERT INTO `t_choice_options` VALUES (2198, 1050, 'potential', 1);
INSERT INTO `t_choice_options` VALUES (2199, 1050, 'underneath', 0);
INSERT INTO `t_choice_options` VALUES (2200, 1050, 'vital', 0);
INSERT INTO `t_choice_options` VALUES (2201, 1051, 'interior', 0);
INSERT INTO `t_choice_options` VALUES (2202, 1051, 'insurance', 0);
INSERT INTO `t_choice_options` VALUES (2203, 1051, 'initial', 1);
INSERT INTO `t_choice_options` VALUES (2204, 1051, 'invisible', 0);
INSERT INTO `t_choice_options` VALUES (2205, 1052, 'interior', 0);
INSERT INTO `t_choice_options` VALUES (2206, 1052, 'insurance', 0);
INSERT INTO `t_choice_options` VALUES (2207, 1052, 'initial', 1);
INSERT INTO `t_choice_options` VALUES (2208, 1052, 'invisible', 0);
INSERT INTO `t_choice_options` VALUES (2209, 1053, 'metropolitan', 0);
INSERT INTO `t_choice_options` VALUES (2210, 1053, 'microphone', 0);
INSERT INTO `t_choice_options` VALUES (2211, 1053, 'microscope', 1);
INSERT INTO `t_choice_options` VALUES (2212, 1053, 'microwave', 0);
INSERT INTO `t_choice_options` VALUES (2213, 1054, 'psychologically', 1);
INSERT INTO `t_choice_options` VALUES (2214, 1054, 'moderately', 0);
INSERT INTO `t_choice_options` VALUES (2215, 1054, 'naturally', 0);
INSERT INTO `t_choice_options` VALUES (2216, 1054, 'precisely', 0);
INSERT INTO `t_choice_options` VALUES (2217, 1055, 'additional', 0);
INSERT INTO `t_choice_options` VALUES (2218, 1055, 'advantage', 0);
INSERT INTO `t_choice_options` VALUES (2219, 1055, 'announce', 0);
INSERT INTO `t_choice_options` VALUES (2220, 1055, 'academic', 1);
INSERT INTO `t_choice_options` VALUES (2221, 1056, 'haste', 1);
INSERT INTO `t_choice_options` VALUES (2222, 1056, 'range', 0);
INSERT INTO `t_choice_options` VALUES (2223, 1056, 'possession', 0);
INSERT INTO `t_choice_options` VALUES (2224, 1056, 'purse', 0);
INSERT INTO `t_choice_options` VALUES (2225, 1057, 'less', 0);
INSERT INTO `t_choice_options` VALUES (2226, 1057, 'sandy', 0);
INSERT INTO `t_choice_options` VALUES (2227, 1057, 'stain', 0);
INSERT INTO `t_choice_options` VALUES (2228, 1057, 'minimum', 1);

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程描述',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_course
-- ----------------------------

-- ----------------------------
-- Table structure for t_course_question_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_course_question_relation`;
CREATE TABLE `t_course_question_relation`  (
  `relation_id` int NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `question_id` int NULL DEFAULT NULL COMMENT '题目ID',
  PRIMARY KEY (`relation_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程与题目关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_course_question_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `feedback_id` int NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `admin_id` int NULL DEFAULT NULL COMMENT '管理员ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `feedback_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户反馈',
  `feesback_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '管理员回应',
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '反馈信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_matching_options
-- ----------------------------
DROP TABLE IF EXISTS `t_matching_options`;
CREATE TABLE `t_matching_options`  (
  `matching_id` int NOT NULL AUTO_INCREMENT COMMENT '匹配项ID',
  `question_id` int NOT NULL COMMENT '所属题目ID',
  `english_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文',
  `chinese_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文',
  PRIMARY KEY (`matching_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '匹配题选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_matching_options
-- ----------------------------

-- ----------------------------
-- Table structure for t_question_status
-- ----------------------------
DROP TABLE IF EXISTS `t_question_status`;
CREATE TABLE `t_question_status`  (
  `status_id` int NOT NULL AUTO_INCREMENT COMMENT '状态ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `question_id` int NULL DEFAULT NULL COMMENT '题目ID',
  `question_status` enum('未学习','已学习','已完成') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目状态',
  PRIMARY KEY (`status_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_question_status
-- ----------------------------

-- ----------------------------
-- Table structure for t_questions
-- ----------------------------
DROP TABLE IF EXISTS `t_questions`;
CREATE TABLE `t_questions`  (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `question_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目',
  `correct_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '正确答案',
  `question_type` enum('判断题','填空题','选择题','匹配题') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '选择题' COMMENT '题目类型',
  `scores` int NOT NULL COMMENT '题目分值',
  `difficulty_level` int NULL DEFAULT 1 COMMENT '题目难度',
  `course_id` int NULL DEFAULT NULL COMMENT '关联的课程ID',
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1058 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_questions
-- ----------------------------
INSERT INTO `t_questions` VALUES (1001, 'Mary has a _______ view of our future. But nobody believes what she said.', 'positive', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1002, 'Nobody knows his _______ for helping us.', 'motive', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1003, 'Both sides agree to establish a _______ zone between the south and north.', 'neutral', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1004, 'This is a _______ moment for our research. We should be careful.', 'critical', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1005, 'This textbook is for the _______ students, not for the beginners.', 'advanced', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1006, 'When I read the newspaper, I always read the _______ first.', 'headlines', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1007, 'They _______ our house at $10,000.', 'assess', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1008, 'When he studied at college, Jack was supported by a _______.', 'scholarship', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1009, 'Even as _______, he made several wonderful inventions.', 'an undergraduate', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1010, 'An emergency _______ is very important in case of fire.', 'exit', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1011, 'He drove very fast to _______ that red car.', 'overtake', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1012, 'Slides are sometimes called ________ film.', 'transparent', '选择题', 10, 1, 101);
INSERT INTO `t_questions` VALUES (1013, 'Professor Smith _______the most important part in his paper.', 'omitted', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1014, 'This knife is made of steel _______ and it can be used for a long time.', 'alloy', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1015, 'The theory of _______ was developed by Darwin and is now understood by nearly everybody in the world.', 'evolution', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1016, 'Mr. Green has recently been _______ to director of the president’s office.', 'promoted', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1017, 'We don’t think that his _______ ability has been well developed.', 'potential', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1018, 'Our _______ talks promise a good future for our cooperation.', 'initial', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1019, 'The _______ can help people to see very small objects.', 'initial', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1020, 'The _______ can help people to see very small objects.', 'microscope', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1021, 'Physically we feel comfortable. But _______, we suffer a lot.', 'psychologically', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1022, 'This is a purely _______ problem, not a political one.', 'academic', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1023, 'The best example of a paradox is the proverb ‘More _______, less speed’.', 'haste', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1024, 'The _______ TOEFL score for entering this program is 600.', 'minimum', '选择题', 10, 1, 102);
INSERT INTO `t_questions` VALUES (1025, 'This company provides a very good _______ service for its products.', 'maintenance', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1026, 'There is more _______ in meat than in vegetables.', 'protein', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1027, 'Do not _______ in the exam. This will do you no good.', 'cheat', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1028, 'Because of the boring _______, we need to take a vacation every year.', 'routine', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1029, 'We need to _______ the purpose of the experiment again.', 'clarify', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1030, 'I _______ great success for my study in this university.', 'anticipate', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1031, 'From the _______ from this examination, we know it is too easy for the students.', 'feedback', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1032, 'His eyes _______ with rage but he did not dare to say anything.', 'flashed', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1033, 'The list is arranged according to the _______ professions of the audience.', 'respective', '选择题', 5, 1, 103);
INSERT INTO `t_questions` VALUES (1034, 'Professor Smith _______the most important part in his paper.', 'omitted', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1035, 'This knife is made of steel _______ and it can be used for a long time.', 'alloy', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1036, 'The theory of _______ was developed by Darwin and is now understood by nearly everybody in the world.', 'evolution', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1037, 'Mr. Green has recently been _______ to director of the president’s office.', 'promoted', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1038, 'We don’t think that his _______ ability has been well developed.', 'potential', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1039, 'Our _______ talks promise a good future for our cooperation.', 'initial', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1040, 'The _______ can help people to see very small objects.', 'initial', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1041, 'The _______ can help people to see very small objects.', 'microscope', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1042, 'Physically we feel comfortable. But _______, we suffer a lot.', 'psychologically', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1043, 'This is a purely _______ problem, not a political one.', 'academic', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1044, 'The best example of a paradox is the proverb ‘More _______, less speed’.', 'haste', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1045, 'The _______ TOEFL score for entering this program is 600.', 'minimum', '选择题', 10, 1, 103);
INSERT INTO `t_questions` VALUES (1046, 'Professor Smith _______the most important part in his paper.', 'omitted', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1047, 'This knife is made of steel _______ and it can be used for a long time.', 'alloy', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1048, 'The theory of _______ was developed by Darwin and is now understood by nearly everybody in the world.', 'evolution', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1049, 'Mr. Green has recently been _______ to director of the president’s office.', 'promoted', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1050, 'We don’t think that his _______ ability has been well developed.', 'potential', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1051, 'Our _______ talks promise a good future for our cooperation.', 'initial', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1052, 'The _______ can help people to see very small objects.', 'initial', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1053, 'The _______ can help people to see very small objects.', 'microscope', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1054, 'Physically we feel comfortable. But _______, we suffer a lot.', 'psychologically', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1055, 'This is a purely _______ problem, not a political one.', 'academic', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1056, 'The best example of a paradox is the proverb ‘More _______, less speed’.', 'haste', '选择题', 10, 1, 104);
INSERT INTO `t_questions` VALUES (1057, 'The _______ TOEFL score for entering this program is 600.', 'minimum', '选择题', 10, 1, 104);

-- ----------------------------
-- Table structure for t_subscription
-- ----------------------------
DROP TABLE IF EXISTS `t_subscription`;
CREATE TABLE `t_subscription`  (
  `subscription_id` int NOT NULL AUTO_INCREMENT COMMENT '订阅ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除：0：未删除 1：已删除',
  PRIMARY KEY (`subscription_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订阅关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_subscription
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除：0：未删除 1：已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'newone', '123456', 'newonehow@163.com', 0, '2023-12-05 16:59:32', '2023-12-05 16:59:32');

-- ----------------------------
-- Table structure for t_user_course_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_user_course_relation`;
CREATE TABLE `t_user_course_relation`  (
  `relation_id` int NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `last_completed_question` int NULL DEFAULT NULL COMMENT '上次完成的题目序号',
  `completed_question_count` int NULL DEFAULT NULL COMMENT '已完成的题目数量',
  `total_questions` int NULL DEFAULT NULL COMMENT '课程的总题目数量',
  PRIMARY KEY (`relation_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与课程关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_course_relation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
