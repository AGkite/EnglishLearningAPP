/*
 Navicat MySQL Data Transfer

 Source Server         : newone
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : english_learning_app

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 22/10/2023 19:11:07
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '广告信息表' ROW_FORMAT = Dynamic;

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
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `t_choice_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `t_questions` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '选择题选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_choice_options
-- ----------------------------

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程描述',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

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
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `t_course_question_relation_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_course_question_relation_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `t_questions` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程与题目关系表' ROW_FORMAT = Dynamic;

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
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `t_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_feedback_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `t_admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '反馈信息表' ROW_FORMAT = Dynamic;

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
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `t_matching_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `t_questions` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '匹配题选项表' ROW_FORMAT = Dynamic;

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
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `t_question_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_question_status_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_question_status_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `t_questions` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_question_status
-- ----------------------------

-- ----------------------------
-- Table structure for t_questions
-- ----------------------------
DROP TABLE IF EXISTS `t_questions`;
CREATE TABLE `t_questions`  (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `question_type` enum('判断题','填空题','选择题','匹配题') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目类型',
  `question_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目',
  `correct_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '正确答案',
  `difficulty_level` int NULL DEFAULT NULL COMMENT '题目难度',
  `course_id` int NULL DEFAULT NULL COMMENT '关联的课程ID',
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `t_questions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_questions
-- ----------------------------

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
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `t_subscription_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_subscription_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订阅关系表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------

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
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `t_user_course_relation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_user_course_relation_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与课程关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_course_relation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
