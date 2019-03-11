/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50557
Source Host           : localhost:3306
Source Database       : fund

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2019-03-11 15:15:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_administrators
-- ----------------------------
DROP TABLE IF EXISTS `account_administrators`;
CREATE TABLE `account_administrators` (
  `id` int(11) NOT NULL COMMENT '管理员账号',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` int(11) DEFAULT NULL COMMENT '头像（外键 fund->file）',
  PRIMARY KEY (`id`),
  KEY `photo` (`photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_administrators
-- ----------------------------

-- ----------------------------
-- Table structure for approval_addition_file
-- ----------------------------
DROP TABLE IF EXISTS `approval_addition_file`;
CREATE TABLE `approval_addition_file` (
  `addition_file_id` int(11) NOT NULL COMMENT '附表文件',
  `indoor_expenses` varchar(255) DEFAULT NULL COMMENT '室内费用',
  `travel expenses` varchar(255) DEFAULT NULL COMMENT '出差费用',
  `total` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL COMMENT '文件，关联外键（fund->file)',
  PRIMARY KEY (`addition_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_addition_file
-- ----------------------------

-- ----------------------------
-- Table structure for approval_archives_borrow_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_archives_borrow_admin`;
CREATE TABLE `approval_archives_borrow_admin` (
  `id` int(11) NOT NULL COMMENT '行政档案借阅申请',
  `use_name` int(11) DEFAULT NULL COMMENT '文件使用人',
  `department` varchar(255) DEFAULT NULL COMMENT '使用部门',
  `appliation_date` float DEFAULT NULL COMMENT '申请日期',
  `borrow_nature` varchar(255) DEFAULT NULL COMMENT '借阅性质',
  `start_time` float DEFAULT NULL COMMENT '使用时间',
  `end_time` float DEFAULT NULL COMMENT '归还时间',
  `file_name` varchar(255) DEFAULT NULL COMMENT '档案名称',
  `purpose` varchar(255) DEFAULT NULL COMMENT '用途',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `use_name` (`use_name`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_archives_borrow_admin_ibfk_1` FOREIGN KEY (`use_name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_archives_borrow_admin_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_archives_borrow_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_business_capital_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `approval_business_capital_expenditure`;
CREATE TABLE `approval_business_capital_expenditure` (
  `id` int(11) NOT NULL,
  `name` int(255) DEFAULT NULL COMMENT '经办人',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `time` varchar(255) DEFAULT NULL COMMENT '填表时间',
  `payment_route` varchar(255) DEFAULT NULL COMMENT '申请事由',
  `num` int(11) DEFAULT NULL COMMENT '单号',
  `expense` float DEFAULT NULL COMMENT '金额',
  `expense_zh` varchar(255) DEFAULT NULL COMMENT '金额大写',
  `fund` varchar(255) DEFAULT NULL COMMENT '所属基金',
  `manager_company` varchar(255) DEFAULT NULL COMMENT '所属管理公司',
  `payment_data` varchar(255) DEFAULT NULL COMMENT '付款日期',
  `payment_money` float DEFAULT NULL COMMENT '申请金额',
  `file_upload` int(11) DEFAULT NULL COMMENT '上传文件，外键（found->file)',
  `abstract` varchar(255) DEFAULT NULL COMMENT '内容摘要',
  `payment_count` varchar(255) DEFAULT NULL COMMENT '支出账号',
  `receipt_name` varchar(255) DEFAULT NULL COMMENT '收款方名称',
  `receipt_bank` varchar(255) DEFAULT NULL COMMENT '收款方开户行',
  `receipt_count` varchar(255) DEFAULT NULL COMMENT '收款方账号',
  `file_upload2` int(11) DEFAULT NULL COMMENT '申请文件',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `file_upload` (`file_upload`),
  KEY `file_upload2` (`file_upload2`),
  CONSTRAINT `approval_business_capital_expenditure_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_business_capital_expenditure_ibfk_2` FOREIGN KEY (`file_upload`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_business_capital_expenditure_ibfk_3` FOREIGN KEY (`file_upload2`) REFERENCES `fund_file` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of approval_business_capital_expenditure
-- ----------------------------

-- ----------------------------
-- Table structure for approval_company_establish_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_company_establish_admin`;
CREATE TABLE `approval_company_establish_admin` (
  `id` int(11) NOT NULL COMMENT '工商注册变更',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `company_type` varchar(255) DEFAULT NULL COMMENT '企业性质',
  `business_type` varchar(255) DEFAULT NULL COMMENT '业务办理类型',
  `register_fund` float DEFAULT NULL COMMENT '注册资金',
  `register_time` float DEFAULT NULL COMMENT '拟办理时间',
  `business_scope` varchar(255) DEFAULT NULL COMMENT '经营范围',
  `shareholder_name` varchar(255) DEFAULT NULL COMMENT '股东姓名',
  `identity_number` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `share_holding` float DEFAULT NULL COMMENT '持股比例',
  `shareholder_fund` float DEFAULT NULL COMMENT '认缴金额',
  `paid_fund` float DEFAULT NULL COMMENT '实际出资金额',
  `reason` varchar(255) DEFAULT NULL COMMENT '企业设立原因',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_company_establish_admin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_company_establish_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_consultant_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `approval_consultant_expenditure`;
CREATE TABLE `approval_consultant_expenditure` (
  `id` int(11) NOT NULL,
  `name` int(255) DEFAULT NULL COMMENT '经办人',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `expense_type` varchar(255) DEFAULT NULL COMMENT '费用类别',
  `num` int(11) DEFAULT NULL COMMENT '单号',
  `time` varchar(255) DEFAULT NULL COMMENT '申请时间',
  `expense` float DEFAULT NULL COMMENT '合计金额',
  `introducer` varchar(255) DEFAULT NULL COMMENT '介绍人',
  `is_sign` bit(1) DEFAULT NULL COMMENT '协议是否签订',
  `apply_data` varchar(255) DEFAULT NULL COMMENT '申请日期',
  `num2` int(11) DEFAULT NULL COMMENT '单据',
  `payment_amount` float DEFAULT NULL COMMENT '付款金额',
  `abstract` varchar(255) DEFAULT NULL COMMENT '内容摘要',
  `receipt_company` varchar(255) DEFAULT NULL COMMENT '收款方单位',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `project_leader` varchar(255) DEFAULT NULL COMMENT '项目负责人',
  `payment_count` varchar(255) DEFAULT NULL COMMENT '支出账号',
  `receipt_name` varchar(255) DEFAULT NULL COMMENT '收款方名称',
  `receipt_bank` varchar(255) DEFAULT NULL COMMENT '收款方开户行',
  `receipt_count` varchar(255) DEFAULT NULL COMMENT '收款方账号',
  `file_upload` int(11) DEFAULT NULL COMMENT '上传文件，外键（found->file)',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `file_upload` (`file_upload`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_consultant_expenditure_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_consultant_expenditure_ibfk_2` FOREIGN KEY (`file_upload`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_consultant_expenditure_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of approval_consultant_expenditure
-- ----------------------------

-- ----------------------------
-- Table structure for approval_contract_seal_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_contract_seal_admin`;
CREATE TABLE `approval_contract_seal_admin` (
  `id` int(11) NOT NULL COMMENT '合同用印',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同编号',
  `contract_type` varchar(255) DEFAULT NULL COMMENT '文件类别',
  `contract_time` datetime DEFAULT NULL COMMENT '合同申请时间',
  `contract_department` varchar(255) DEFAULT NULL COMMENT '合同承办部门',
  `contractor` varchar(255) DEFAULT NULL COMMENT '合同承办人',
  `telephone` varchar(255) DEFAULT NULL COMMENT '承办人电话',
  `contract_name` varchar(255) DEFAULT NULL COMMENT '合同名称',
  `abstract` varchar(255) DEFAULT NULL COMMENT '简要说明',
  `partner_situation` varchar(255) DEFAULT NULL COMMENT '合作方情况',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `company_type` varchar(255) DEFAULT NULL COMMENT '企业性质',
  `company_fund` varchar(255) DEFAULT NULL COMMENT '注册资本',
  `credit_status` varchar(255) DEFAULT NULL COMMENT '资信状况',
  `business_situation` varchar(255) DEFAULT NULL COMMENT '业务往来情况',
  `is_deal` bit(1) DEFAULT NULL COMMENT '是否涉及会签',
  `file` int(11) DEFAULT NULL COMMENT '保密文件上传',
  `seal_type` varchar(255) DEFAULT NULL COMMENT '用印类别',
  `seal_time` datetime DEFAULT NULL,
  `seal_num` int(11) DEFAULT NULL COMMENT '用印时间',
  `seal_user` varchar(255) DEFAULT NULL COMMENT '用印分数',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `file` (`file`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_contract_seal_admin_ibfk_1` FOREIGN KEY (`file`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_contract_seal_admin_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_contract_seal_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_cost_list
-- ----------------------------
DROP TABLE IF EXISTS `approval_cost_list`;
CREATE TABLE `approval_cost_list` (
  `cost_list_id` int(11) NOT NULL COMMENT '报销清单',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `address` varchar(255) DEFAULT NULL COMMENT '地点',
  `project_id` int(11) DEFAULT NULL COMMENT '项目名称，关联外键（fund->project）',
  `cost_type` varchar(255) DEFAULT NULL COMMENT '费用类型',
  `cost_num` int(11) DEFAULT NULL COMMENT '费用金额',
  `fund_id` int(255) DEFAULT NULL COMMENT '归属基金名称，关联fund->fund外键',
  `fapiaohao` int(11) DEFAULT NULL COMMENT '发票号',
  `abstract` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cost_list_id`),
  KEY `project_id` (`project_id`),
  KEY `fund_id` (`fund_id`),
  CONSTRAINT `approval_cost_list_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `fund_project` (`project_id`),
  CONSTRAINT `approval_cost_list_ibfk_2` FOREIGN KEY (`fund_id`) REFERENCES `fund_fund` (`fund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_cost_list
-- ----------------------------

-- ----------------------------
-- Table structure for approval_daily_capital_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `approval_daily_capital_expenditure`;
CREATE TABLE `approval_daily_capital_expenditure` (
  `id` int(11) NOT NULL,
  `name` int(255) DEFAULT NULL COMMENT '经办人 外键 fund_people',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `num` int(11) DEFAULT NULL COMMENT '单号',
  `time` varchar(255) DEFAULT NULL COMMENT '申请时间',
  `payment_route` varchar(255) DEFAULT NULL COMMENT '付款用途',
  `other_expenditure_daily` varchar(255) DEFAULT NULL COMMENT '其他支出明细',
  `expense` float DEFAULT NULL COMMENT '付款金额',
  `payment_data` varchar(255) DEFAULT NULL COMMENT '付款日期',
  `payment_count` varchar(255) DEFAULT NULL COMMENT '支出账号',
  `receipt_name` varchar(255) DEFAULT NULL COMMENT '收款方名称',
  `receipt_bank` varchar(255) DEFAULT NULL COMMENT '收款方开户行',
  `receipt_count` varchar(255) DEFAULT NULL COMMENT '收款方账号',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `file_upload` int(11) DEFAULT NULL COMMENT '上传文件，外键（fund_file)',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `file_upload` (`file_upload`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_daily_capital_expenditure_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_daily_capital_expenditure_ibfk_2` FOREIGN KEY (`file_upload`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_daily_capital_expenditure_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `fund_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_daily_capital_expenditure
-- ----------------------------

-- ----------------------------
-- Table structure for approval_department
-- ----------------------------
DROP TABLE IF EXISTS `approval_department`;
CREATE TABLE `approval_department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_department
-- ----------------------------

-- ----------------------------
-- Table structure for approval_employee_turnover_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_employee_turnover_admin`;
CREATE TABLE `approval_employee_turnover_admin` (
  `id` int(11) NOT NULL,
  `name` int(255) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `to_person` int(11) DEFAULT NULL,
  `job_start_time` datetime DEFAULT NULL,
  `job_end_time` datetime DEFAULT NULL,
  `performance` varchar(255) DEFAULT NULL,
  `file` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `department` (`department`),
  KEY `to_person` (`to_person`),
  KEY `file` (`file`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_employee_turnover_admin_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_employee_turnover_admin_ibfk_2` FOREIGN KEY (`department`) REFERENCES `approval_department` (`id`),
  CONSTRAINT `approval_employee_turnover_admin_ibfk_3` FOREIGN KEY (`to_person`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_employee_turnover_admin_ibfk_4` FOREIGN KEY (`file`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_employee_turnover_admin_ibfk_5` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_employee_turnover_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_leave_request_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_leave_request_admin`;
CREATE TABLE `approval_leave_request_admin` (
  `id` int(11) NOT NULL COMMENT '请假',
  `name` int(255) DEFAULT NULL COMMENT '申请人',
  `department_id` int(11) DEFAULT NULL COMMENT '部门',
  `position` varchar(255) DEFAULT NULL COMMENT '职务',
  `time` datetime DEFAULT NULL COMMENT '申请日期',
  `type_id` int(11) DEFAULT NULL COMMENT '假别，外键 approval_leave_type',
  `date_num` int(11) DEFAULT NULL COMMENT '请假天数',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL COMMENT '请假事由',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `department_id` (`department_id`),
  KEY `type_id` (`type_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_leave_request_admin_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_leave_request_admin_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `approval_department` (`id`),
  CONSTRAINT `approval_leave_request_admin_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `approval_leave_type` (`id`),
  CONSTRAINT `approval_leave_request_admin_ibfk_4` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_leave_request_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_leave_type
-- ----------------------------
DROP TABLE IF EXISTS `approval_leave_type`;
CREATE TABLE `approval_leave_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_leave_type
-- ----------------------------

-- ----------------------------
-- Table structure for approval_loan_approval_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `approval_loan_approval_expenditure`;
CREATE TABLE `approval_loan_approval_expenditure` (
  `id` int(11) NOT NULL,
  `name` int(255) DEFAULT NULL COMMENT '经办人',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `principal` varchar(255) DEFAULT NULL COMMENT '负责人',
  `num` int(11) DEFAULT NULL COMMENT '单号',
  `time` varchar(255) DEFAULT NULL COMMENT '借款时间',
  `expense` float DEFAULT NULL COMMENT '借款金额',
  `payment_route` varchar(255) DEFAULT NULL COMMENT '支付方式',
  `payment_reason` varchar(255) DEFAULT NULL COMMENT '借款事由',
  `debtor_name` varchar(255) DEFAULT NULL COMMENT '借款方',
  `debtor_bank` varchar(255) DEFAULT NULL COMMENT '借款方开户行',
  `debtor_count` varchar(255) DEFAULT NULL COMMENT '借款方账号',
  `lender_name` varchar(255) DEFAULT NULL COMMENT '出借方',
  `lender_bank` varchar(255) DEFAULT NULL COMMENT '出借方开户行',
  `lender_count` varchar(255) DEFAULT NULL COMMENT '出借方账号',
  `file_upload` int(11) DEFAULT NULL COMMENT '上传文件，外键（found->file)',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `file_upload` (`file_upload`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_loan_approval_expenditure_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_loan_approval_expenditure_ibfk_2` FOREIGN KEY (`file_upload`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_loan_approval_expenditure_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of approval_loan_approval_expenditure
-- ----------------------------

-- ----------------------------
-- Table structure for approval_meeting_application_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_meeting_application_admin`;
CREATE TABLE `approval_meeting_application_admin` (
  `id` varchar(255) NOT NULL COMMENT '会议申请',
  `time` datetime DEFAULT NULL COMMENT '会议时间',
  `address` varchar(255) DEFAULT NULL COMMENT '会议地点',
  `reason` varchar(255) DEFAULT NULL COMMENT '会议事由',
  `name_id` int(11) DEFAULT NULL COMMENT '参会人员',
  `project_name` int(255) DEFAULT NULL COMMENT '项目名称',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `company_abstract` varchar(255) DEFAULT NULL COMMENT '公司简介',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `fund` float DEFAULT NULL COMMENT '注册资本',
  `establish_time` varchar(255) DEFAULT NULL COMMENT '成立时间',
  `establish_address` varchar(255) DEFAULT NULL COMMENT '注册地址',
  `project_leader` varchar(255) DEFAULT NULL COMMENT '项目负责人',
  `project_participant` varchar(255) DEFAULT NULL COMMENT '项目参与人员',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name_id` (`name_id`),
  KEY `project_name` (`project_name`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_meeting_application_admin_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_meeting_application_admin_ibfk_2` FOREIGN KEY (`project_name`) REFERENCES `fund_project` (`project_id`),
  CONSTRAINT `approval_meeting_application_admin_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_meeting_application_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_new_employee_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_new_employee_admin`;
CREATE TABLE `approval_new_employee_admin` (
  `id` int(11) NOT NULL COMMENT '新员工入职',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` bit(1) DEFAULT NULL COMMENT '性别',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门（外键->approval_department）',
  `position` varchar(255) DEFAULT NULL COMMENT '部门职位',
  `to_person` int(11) DEFAULT NULL COMMENT '汇报对象',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `start_time` datetime DEFAULT NULL COMMENT '劳动合同开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '劳动合同结束时间',
  `file_ID` int(11) DEFAULT NULL COMMENT '身份证扫描版',
  `file_photo` int(11) DEFAULT NULL COMMENT '一寸照片',
  `birthplace` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `birthday` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `marital_status` bit(1) DEFAULT NULL COMMENT '婚姻状况',
  `person_ID` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `registered_residence` varchar(255) DEFAULT NULL COMMENT '户口所在地',
  `present_address` varchar(255) DEFAULT NULL COMMENT '现住址',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '紧急联系人姓名',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '紧急联系人电话',
  `contact_relation` varchar(255) DEFAULT NULL COMMENT '紧急联系人的关系',
  `file_zige` int(11) DEFAULT NULL COMMENT '资格证书',
  `file_education` int(11) DEFAULT NULL COMMENT '学位及学历证书',
  `graduated_school` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `specialty` varchar(255) DEFAULT NULL COMMENT '专业',
  `study_start_time` datetime DEFAULT NULL COMMENT '起始时间',
  `study_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `company_position` varchar(255) DEFAULT NULL COMMENT '职位',
  `company_address` varchar(255) DEFAULT NULL COMMENT '工作地点',
  `job_start_time` datetime DEFAULT NULL COMMENT '起始时间',
  `job_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `witness` varchar(255) DEFAULT NULL COMMENT '证明人',
  `witness_phone` varchar(255) DEFAULT NULL COMMENT '证明人联系方式',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `to_person` (`to_person`),
  KEY `file_ID` (`file_ID`),
  KEY `file_photo` (`file_photo`),
  KEY `file_zige` (`file_zige`),
  KEY `file_education` (`file_education`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_new_employee_admin_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `approval_department` (`id`),
  CONSTRAINT `approval_new_employee_admin_ibfk_2` FOREIGN KEY (`to_person`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_new_employee_admin_ibfk_3` FOREIGN KEY (`file_ID`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_new_employee_admin_ibfk_4` FOREIGN KEY (`file_photo`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_new_employee_admin_ibfk_5` FOREIGN KEY (`file_zige`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_new_employee_admin_ibfk_6` FOREIGN KEY (`file_education`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_new_employee_admin_ibfk_7` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_new_employee_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_non-project_expense_reimbursement
-- ----------------------------
DROP TABLE IF EXISTS `approval_non-project_expense_reimbursement`;
CREATE TABLE `approval_non-project_expense_reimbursement` (
  `id` int(11) NOT NULL COMMENT '非项目费用报销',
  `name` varchar(255) DEFAULT NULL COMMENT '申请人',
  `application_department` varchar(255) DEFAULT NULL COMMENT '申请部门',
  `datetime` varchar(0) DEFAULT NULL COMMENT '日期',
  `number` int(11) DEFAULT NULL COMMENT '编号',
  `expense` float DEFAULT NULL COMMENT '金额',
  `file_num` int(11) DEFAULT NULL COMMENT '附单据张数',
  `abstract` varchar(255) DEFAULT NULL,
  `file_upload` int(11) DEFAULT NULL COMMENT '上传文件，外键（addition_file）',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_non-project_expense_reimbursement_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_non-project_expense_reimbursement
-- ----------------------------

-- ----------------------------
-- Table structure for approval_none_meeting_apllication_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_none_meeting_apllication_admin`;
CREATE TABLE `approval_none_meeting_apllication_admin` (
  `id` int(11) NOT NULL COMMENT '非项目会议申请',
  `content` varchar(255) DEFAULT NULL COMMENT '会议主体',
  `time` datetime DEFAULT NULL COMMENT '会议时间',
  `address` varchar(255) DEFAULT NULL COMMENT '会议地点',
  `type` varchar(255) DEFAULT NULL COMMENT '会议类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '会议事由',
  `agenda` varchar(255) DEFAULT NULL COMMENT '议程',
  `person` int(11) DEFAULT NULL COMMENT '参会人员',
  `file` int(11) DEFAULT NULL COMMENT '上传文件',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `person` (`person`),
  KEY `file` (`file`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_none_meeting_apllication_admin_ibfk_1` FOREIGN KEY (`person`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_none_meeting_apllication_admin_ibfk_2` FOREIGN KEY (`file`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_none_meeting_apllication_admin_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_none_meeting_apllication_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_project_cost_reimbursement
-- ----------------------------
DROP TABLE IF EXISTS `approval_project_cost_reimbursement`;
CREATE TABLE `approval_project_cost_reimbursement` (
  `id` int(11) NOT NULL COMMENT '项目费用报销',
  `name` int(255) DEFAULT NULL COMMENT '申请人',
  `department` varchar(255) DEFAULT NULL COMMENT '申请部门',
  `cost_type` bit(1) DEFAULT NULL COMMENT '费用类别',
  `cost_list_id` int(11) DEFAULT NULL COMMENT '报销清单_id，关联外键 approval_cost_list',
  `addition_file` int(255) DEFAULT NULL COMMENT '附表，关联外键（approval_addition_file）',
  `file` int(11) DEFAULT NULL COMMENT '上传文件',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `cost_list_id` (`cost_list_id`),
  KEY `addition_file` (`addition_file`),
  KEY `file` (`file`),
  CONSTRAINT `approval_project_cost_reimbursement_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_project_cost_reimbursement_ibfk_2` FOREIGN KEY (`cost_list_id`) REFERENCES `approval_cost_list` (`cost_list_id`),
  CONSTRAINT `approval_project_cost_reimbursement_ibfk_3` FOREIGN KEY (`addition_file`) REFERENCES `approval_addition_file` (`addition_file_id`),
  CONSTRAINT `approval_project_cost_reimbursement_ibfk_4` FOREIGN KEY (`file`) REFERENCES `fund_file` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of approval_project_cost_reimbursement
-- ----------------------------

-- ----------------------------
-- Table structure for approval_seal_applition
-- ----------------------------
DROP TABLE IF EXISTS `approval_seal_applition`;
CREATE TABLE `approval_seal_applition` (
  `id` int(11) NOT NULL COMMENT '用章申请',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `department` varchar(255) DEFAULT NULL COMMENT '用印部门',
  `type` varchar(255) DEFAULT NULL COMMENT '用印类别',
  `person` int(11) DEFAULT NULL COMMENT '用印人，外键（fund_person）',
  `time` datetime DEFAULT NULL COMMENT '用印日期',
  `user` varchar(255) DEFAULT NULL COMMENT '用印主体',
  `number` int(11) DEFAULT NULL COMMENT '用印份数',
  `reason` varchar(255) DEFAULT NULL COMMENT '事由',
  `file` int(255) DEFAULT NULL COMMENT '附件',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `person` (`person`),
  KEY `file` (`file`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_seal_applition_ibfk_1` FOREIGN KEY (`person`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_seal_applition_ibfk_2` FOREIGN KEY (`file`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `approval_seal_applition_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_seal_applition
-- ----------------------------

-- ----------------------------
-- Table structure for approval_seal_outside_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_seal_outside_admin`;
CREATE TABLE `approval_seal_outside_admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '经办人',
  `department` varchar(255) DEFAULT NULL COMMENT '申请部门',
  `seal_ouside` varchar(255) DEFAULT NULL COMMENT '外带印章',
  `other_seal` varchar(255) DEFAULT NULL COMMENT '其他章',
  `start_time` float DEFAULT NULL COMMENT '外带时间',
  `end_time` float DEFAULT NULL COMMENT '归还时间',
  `file` varchar(255) DEFAULT NULL COMMENT '外带文件',
  `somethings` varchar(255) DEFAULT NULL COMMENT '办理事项',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_seal_outside_admin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_seal_outside_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_travel_application_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_travel_application_admin`;
CREATE TABLE `approval_travel_application_admin` (
  `id` int(11) NOT NULL COMMENT '出差申请表',
  `name` int(255) DEFAULT NULL COMMENT '申请人',
  `department` varchar(255) DEFAULT NULL COMMENT '所在部门',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `start_time` float DEFAULT NULL COMMENT '出差时间',
  `money` float DEFAULT NULL COMMENT '差旅预算',
  `reason` varchar(255) DEFAULT NULL COMMENT '出差事由',
  `travel` varchar(255) DEFAULT NULL COMMENT '出差行程',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_travel_application_admin_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_travel_application_admin_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `fund_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of approval_travel_application_admin
-- ----------------------------

-- ----------------------------
-- Table structure for approval_travel_expense
-- ----------------------------
DROP TABLE IF EXISTS `approval_travel_expense`;
CREATE TABLE `approval_travel_expense` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '出差人',
  `department` varchar(100) DEFAULT NULL COMMENT '部门',
  `belong_to` varchar(100) DEFAULT NULL COMMENT '费用归属项目',
  `start_time` varchar(100) DEFAULT NULL,
  `end_time` varchar(100) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '单号',
  `total_cost` float DEFAULT NULL COMMENT '差旅费合计',
  `total_cost_zh` varchar(200) DEFAULT NULL COMMENT '差旅费合计大写',
  `number` int(11) DEFAULT NULL COMMENT '单据',
  `explain` varchar(500) DEFAULT NULL COMMENT '特殊事项及金额说明',
  `reasons_business` varchar(500) DEFAULT NULL COMMENT '出差事由',
  `hotel_expense` float DEFAULT NULL COMMENT '住宿费',
  `travel_expense` float DEFAULT NULL COMMENT '交通费',
  `business_entertainment_expenses` float DEFAULT NULL COMMENT '业务招待费',
  `other_expense` float DEFAULT NULL COMMENT '其他费用',
  `other_explain` varchar(500) DEFAULT NULL COMMENT '特殊事项说明',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_travel_expense_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_travel_expense
-- ----------------------------

-- ----------------------------
-- Table structure for approval_work_application_admin
-- ----------------------------
DROP TABLE IF EXISTS `approval_work_application_admin`;
CREATE TABLE `approval_work_application_admin` (
  `id` int(11) NOT NULL COMMENT '工作请示',
  `name` int(255) DEFAULT NULL COMMENT '请示人',
  `department` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL COMMENT '请示事由',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT '下一步审批人',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `uid` (`uid`),
  CONSTRAINT `approval_work_application_admin_ibfk_1` FOREIGN KEY (`name`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `approval_work_application_admin_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_work_application_admin
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add user infor', '7', 'add_userinfor');
INSERT INTO `auth_permission` VALUES ('20', 'Can change user infor', '7', 'change_userinfor');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete user infor', '7', 'delete_userinfor');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$aZ4sjQ9DqP60$uD3bdyzCUYTs0ca5n/QhTQlyXRkoB/28b+kTsXEfz68=', '2019-01-03 02:23:41', '1', 'admin', '', '', '904156108@qq.com', '1', '1', '2019-01-03 02:22:25');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$100000$uTSjKBtVtFtL$B98/haVKiPW1/epHjmI32q8aawOvZrL0G4FJW67ph7U=', '2019-01-08 08:20:55', '1', 'zyngoo', '', '', '1664323211@qq.com', '1', '1', '2019-01-07 06:40:35');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for direct3_file
-- ----------------------------
DROP TABLE IF EXISTS `direct3_file`;
CREATE TABLE `direct3_file` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filetime` datetime DEFAULT NULL,
  `fileaddress` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `fileuse` varchar(255) DEFAULT NULL,
  `file_upload_person` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of direct3_file
-- ----------------------------

-- ----------------------------
-- Table structure for direct_assindustry
-- ----------------------------
DROP TABLE IF EXISTS `direct_assindustry`;
CREATE TABLE `direct_assindustry` (
  `assindustry_id` int(11) NOT NULL,
  `assindustry_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`assindustry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of direct_assindustry
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-01-03 02:29:14', '1', 'zy', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-01-07 09:01:23', '6', 'hehe', '1', '[{\"added\": {}}]', '7', '2');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'userInfor', 'userinfor');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-01-03 02:17:03');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-01-03 02:17:06');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-01-03 02:17:06');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-01-03 02:17:06');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2019-01-03 02:17:07');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2019-01-03 02:17:08');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2019-01-03 02:17:08');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0010_auto_20180416_2139', '2019-01-03 02:17:09');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2019-01-03 02:17:09');
INSERT INTO `django_migrations` VALUES ('16', 'userInfor', '0001_initial', '2019-01-03 02:17:09');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0011_auto_20190107_1510', '2019-01-07 07:12:06');
INSERT INTO `django_migrations` VALUES ('18', 'userInfor', '0002_userinfor_photo', '2019-01-07 07:12:06');
INSERT INTO `django_migrations` VALUES ('19', 'userInfor', '0003_auto_20190107_1536', '2019-01-07 07:37:19');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('9xei2h92duin7oda8euhibhjwqakf19y', 'NTEwYmQ2NGNkOTFjNDIyMmIzNTYxOWQ1MTg4YTdhMjBlNTg1NTVjZTp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6Inp5bmdvbyIsImhlYWRfcGhvdG8iOiJpbWFnZXNcXDQzN2ExOTJkNWI5NDcwNGIuanBnIn0=', '2019-02-07 08:23:37');
INSERT INTO `django_session` VALUES ('j6k2jsv8qzkel5zmuc32hmjxq4prtk0r', 'ZjgxMjFlZGUwMmQxMjVhNmMzNmQyMjdkODI5YjM0ZmUzZTg1NzZmNDp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6IjEyMyIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Nzk4ZjQyOTdkNjMwMWRiZjkwZWJhNjZjNWY0MjNiM2M5YTYzMzBhIn0=', '2019-01-21 06:41:28');
INSERT INTO `django_session` VALUES ('jh5dethz3ewm7aeanhpl8ase7w5u8c2z', 'ODQwYzljNzAwNTZkODNjNDI2OTE1MGMzZDM4ZjRkNTBlZDI4YjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjgwY2I3ZDE3YTM3ODJkZjNhZTUxYWUxODFlM2E0MGFmNTM0NTYwIn0=', '2019-01-17 02:23:40');
INSERT INTO `django_session` VALUES ('lbyy0atixi784txaymg82rkka5avpv4x', 'YjhiYTIzOTA5OWE4ZDE5MmYxZDkxYzRlZmE0ZGM4NzRhZGUwYTUzODp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InNkZiIsImhlYWRfcGhvdG8iOiJDOlxcVXNlcnNcXEFkbWluaXN0cmF0b3JcXERlc2t0b3BcXHN5c3RlbVxcZnVuZFxcc3RhdGljL21lZGlhL2ltYWdlcy80YTcxNWJhMDFkNTlkYWUzODIzNTdmNzFmMmZjMzIxYi5qcGcifQ==', '2019-01-23 03:20:58');
INSERT INTO `django_session` VALUES ('o60bplp6lxbsffdole3wp3wmusa76wrb', 'NTEwYmQ2NGNkOTFjNDIyMmIzNTYxOWQ1MTg4YTdhMjBlNTg1NTVjZTp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6Inp5bmdvbyIsImhlYWRfcGhvdG8iOiJpbWFnZXNcXDQzN2ExOTJkNWI5NDcwNGIuanBnIn0=', '2019-03-13 03:35:14');

-- ----------------------------
-- Table structure for event_association
-- ----------------------------
DROP TABLE IF EXISTS `event_association`;
CREATE TABLE `event_association` (
  `association_id` int(11) NOT NULL,
  `association_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`association_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_association
-- ----------------------------

-- ----------------------------
-- Table structure for event_fund_event
-- ----------------------------
DROP TABLE IF EXISTS `event_fund_event`;
CREATE TABLE `event_fund_event` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `event_name` varchar(255) DEFAULT NULL,
  `event_association` int(255) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `event_publisher` varchar(255) DEFAULT NULL COMMENT '发布人',
  `publish_date` varchar(255) DEFAULT NULL COMMENT '发布日期',
  `event_status` varchar(255) DEFAULT NULL COMMENT '状态',
  `event_content` varchar(255) DEFAULT NULL COMMENT '时间内容',
  `event_annex` varchar(255) DEFAULT NULL COMMENT '附件',
  `event_executive` varchar(255) DEFAULT NULL COMMENT '执行人',
  `file` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`title_id`),
  KEY `event_association` (`event_association`),
  KEY `event_executive` (`event_executive`),
  KEY `event_status` (`event_status`),
  KEY `event_type` (`event_type`),
  KEY `file` (`file`),
  CONSTRAINT `event_fund_event_ibfk_1` FOREIGN KEY (`event_association`) REFERENCES `fund_fund` (`fund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_fund_event
-- ----------------------------
INSERT INTO `event_fund_event` VALUES ('1', '事件四', '1', '事件', 'zyngoo', '2019-02-27', '代办', '测试修改事件一', null, null, null, '0');
INSERT INTO `event_fund_event` VALUES ('2', '事件二', '1', '事件', 'zyngoo', '2019-02-27', '代办', '测试事件二', null, null, null, '0');
INSERT INTO `event_fund_event` VALUES ('3', '事件三', '2', '事件', 'zyngoo', '2019-02-27', '完成', '测试事件三', null, null, null, '0');
INSERT INTO `event_fund_event` VALUES ('4', '尽快', '3', '事件', 'zyngoo', '2019-03-01', '完成', '会尽快', null, null, null, '0');

-- ----------------------------
-- Table structure for event_fund_executive
-- ----------------------------
DROP TABLE IF EXISTS `event_fund_executive`;
CREATE TABLE `event_fund_executive` (
  `executive_id` int(11) DEFAULT NULL,
  `executive_name` varchar(255) DEFAULT NULL,
  KEY `executive_id` (`executive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_fund_executive
-- ----------------------------

-- ----------------------------
-- Table structure for event_status
-- ----------------------------
DROP TABLE IF EXISTS `event_status`;
CREATE TABLE `event_status` (
  `status_id` int(11) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_status
-- ----------------------------

-- ----------------------------
-- Table structure for event_type
-- ----------------------------
DROP TABLE IF EXISTS `event_type`;
CREATE TABLE `event_type` (
  `type_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_type
-- ----------------------------

-- ----------------------------
-- Table structure for fund_association
-- ----------------------------
DROP TABLE IF EXISTS `fund_association`;
CREATE TABLE `fund_association` (
  `association_id` int(11) NOT NULL,
  `association_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`association_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_association
-- ----------------------------

-- ----------------------------
-- Table structure for fund_company
-- ----------------------------
DROP TABLE IF EXISTS `fund_company`;
CREATE TABLE `fund_company` (
  `id` int(11) NOT NULL COMMENT '公司',
  `company_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `whose` varchar(255) DEFAULT NULL COMMENT '法人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_company
-- ----------------------------

-- ----------------------------
-- Table structure for fund_file
-- ----------------------------
DROP TABLE IF EXISTS `fund_file`;
CREATE TABLE `fund_file` (
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_address` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_upload_person` varchar(255) DEFAULT NULL COMMENT '文件上传者',
  `file_use` varchar(255) DEFAULT NULL COMMENT '文件用途',
  `file_time` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_file
-- ----------------------------

-- ----------------------------
-- Table structure for fund_fund
-- ----------------------------
DROP TABLE IF EXISTS `fund_fund`;
CREATE TABLE `fund_fund` (
  `fund_id` int(11) NOT NULL,
  `fund_name` varchar(255) DEFAULT NULL COMMENT '基金名称',
  PRIMARY KEY (`fund_id`),
  KEY `fund_name` (`fund_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_fund
-- ----------------------------
INSERT INTO `fund_fund` VALUES ('3', 'zhanglei');
INSERT INTO `fund_fund` VALUES ('1', 'zy');
INSERT INTO `fund_fund` VALUES ('2', 'zyngoo');

-- ----------------------------
-- Table structure for fund_industry
-- ----------------------------
DROP TABLE IF EXISTS `fund_industry`;
CREATE TABLE `fund_industry` (
  `id` int(11) NOT NULL,
  `technology` varchar(255) DEFAULT NULL,
  `internet` varchar(255) DEFAULT NULL,
  `medical` varchar(255) DEFAULT NULL,
  `other1` varchar(255) DEFAULT NULL,
  `other2` varchar(255) DEFAULT NULL,
  `other3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_industry
-- ----------------------------

-- ----------------------------
-- Table structure for fund_meeting_file
-- ----------------------------
DROP TABLE IF EXISTS `fund_meeting_file`;
CREATE TABLE `fund_meeting_file` (
  `meeting_file_id` int(11) NOT NULL,
  `meeting_file_address` varchar(255) DEFAULT NULL,
  `meeting_file_type` varchar(255) DEFAULT NULL,
  `meeting_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meeting_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_meeting_file
-- ----------------------------

-- ----------------------------
-- Table structure for fund_person
-- ----------------------------
DROP TABLE IF EXISTS `fund_person`;
CREATE TABLE `fund_person` (
  `person_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_person
-- ----------------------------
INSERT INTO `fund_person` VALUES ('1', '曾勇');
INSERT INTO `fund_person` VALUES ('2', '张蕾');
INSERT INTO `fund_person` VALUES ('3', '杨帆');

-- ----------------------------
-- Table structure for fund_project
-- ----------------------------
DROP TABLE IF EXISTS `fund_project`;
CREATE TABLE `fund_project` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_project
-- ----------------------------

-- ----------------------------
-- Table structure for fund_remind
-- ----------------------------
DROP TABLE IF EXISTS `fund_remind`;
CREATE TABLE `fund_remind` (
  `remind_id` int(11) NOT NULL,
  `remind_name` tinyint(4) DEFAULT '5',
  PRIMARY KEY (`remind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_remind
-- ----------------------------

-- ----------------------------
-- Table structure for fund_schedule
-- ----------------------------
DROP TABLE IF EXISTS `fund_schedule`;
CREATE TABLE `fund_schedule` (
  `schedule_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `association_id` int(11) DEFAULT NULL,
  `participation` varchar(255) DEFAULT NULL,
  `is_public` tinyint(4) DEFAULT '1',
  `address` varchar(255) DEFAULT NULL,
  `is_all_day_event` tinyint(4) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `time_id` int(11) DEFAULT NULL,
  `util_time` datetime DEFAULT NULL,
  `remind_id` int(11) DEFAULT NULL,
  `meeting_summary` text,
  `meeting_file_id` int(11) DEFAULT NULL,
  `schedule_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`,`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for fund_state
-- ----------------------------
DROP TABLE IF EXISTS `fund_state`;
CREATE TABLE `fund_state` (
  `id` int(11) NOT NULL COMMENT '持有现状',
  `state_01` varchar(255) DEFAULT NULL,
  `state_02` varchar(255) DEFAULT NULL,
  `state_03` varchar(255) DEFAULT NULL,
  `state_06` varchar(255) DEFAULT NULL,
  `state_04` varchar(255) DEFAULT NULL,
  `state_05` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_state
-- ----------------------------

-- ----------------------------
-- Table structure for fund_time_repeat
-- ----------------------------
DROP TABLE IF EXISTS `fund_time_repeat`;
CREATE TABLE `fund_time_repeat` (
  `time_id` int(11) NOT NULL,
  `time_select` tinyint(4) DEFAULT '5',
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_time_repeat
-- ----------------------------

-- ----------------------------
-- Table structure for fund_type
-- ----------------------------
DROP TABLE IF EXISTS `fund_type`;
CREATE TABLE `fund_type` (
  `id` int(11) NOT NULL,
  `type1` varchar(255) DEFAULT NULL,
  `type2` varchar(255) DEFAULT NULL,
  `type3` varchar(255) DEFAULT NULL,
  `type4` varchar(255) DEFAULT NULL,
  `type5` varchar(255) DEFAULT NULL,
  `type6` varchar(255) DEFAULT NULL COMMENT '项目类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_type
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_afterinvest
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_afterinvest`;
CREATE TABLE `guquan_management_afterinvest` (
  `id` int(11) NOT NULL COMMENT '投后管理',
  `company` int(11) DEFAULT NULL COMMENT '企业名称',
  `investor` int(11) DEFAULT NULL COMMENT '基金投资主体',
  `time` datetime DEFAULT NULL COMMENT '交割时间',
  `is_leader` bit(1) DEFAULT NULL COMMENT '是否领投',
  `hold_state` int(11) DEFAULT NULL COMMENT '持有现状',
  `round` int(11) DEFAULT NULL COMMENT '投资轮次',
  `premoney` int(11) DEFAULT NULL COMMENT '投前估值',
  `postmoney` int(11) DEFAULT NULL COMMENT '投后估值',
  `totalmoney` int(11) DEFAULT NULL COMMENT '投资总额',
  `proportion` float DEFAULT NULL COMMENT '本轮投资总占比',
  `all_investor` varchar(255) DEFAULT NULL COMMENT '本轮公共投资人',
  `xieyi` int(11) DEFAULT NULL COMMENT '协议投资额',
  `postproportion` float DEFAULT NULL COMMENT '投后协议股权占比',
  `pay_in` float DEFAULT NULL COMMENT '实缴',
  `now_proportion` float DEFAULT NULL COMMENT '现有持股比例',
  `valuation` float DEFAULT NULL COMMENT '投资估值',
  `exit` varchar(255) DEFAULT NULL COMMENT '退出方式',
  `exit_time` datetime DEFAULT NULL COMMENT '退出日期',
  `exit_money` float DEFAULT NULL COMMENT '退出收益',
  `return_multiple` float DEFAULT NULL COMMENT '回报倍数',
  `director` varchar(255) DEFAULT NULL COMMENT '驻派董事',
  `valuation_method` varchar(255) DEFAULT NULL COMMENT '项目估值方法',
  `file` int(11) DEFAULT NULL COMMENT '上传文件',
  PRIMARY KEY (`id`),
  KEY `company` (`company`),
  KEY `investor` (`investor`),
  KEY `hold_state` (`hold_state`),
  KEY `file` (`file`),
  CONSTRAINT `guquan_management_afterinvest_ibfk_1` FOREIGN KEY (`company`) REFERENCES `fund_company` (`id`),
  CONSTRAINT `guquan_management_afterinvest_ibfk_2` FOREIGN KEY (`investor`) REFERENCES `fund_fund` (`fund_id`),
  CONSTRAINT `guquan_management_afterinvest_ibfk_3` FOREIGN KEY (`hold_state`) REFERENCES `fund_state` (`id`),
  CONSTRAINT `guquan_management_afterinvest_ibfk_4` FOREIGN KEY (`file`) REFERENCES `fund_file` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_afterinvest
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_associated_project
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_associated_project`;
CREATE TABLE `guquan_management_associated_project` (
  `id` int(11) NOT NULL COMMENT '关联项目',
  `project_name` int(11) DEFAULT NULL COMMENT '项目名称 外键 fund_fund',
  `industry` int(11) DEFAULT NULL COMMENT '产业 外键 fund_industry',
  `detailed_market` varchar(255) DEFAULT NULL COMMENT '细分市场',
  PRIMARY KEY (`id`),
  KEY `project_name` (`project_name`),
  KEY `industry` (`industry`),
  CONSTRAINT `guquan_management_associated_project_ibfk_1` FOREIGN KEY (`project_name`) REFERENCES `fund_fund` (`fund_id`),
  CONSTRAINT `guquan_management_associated_project_ibfk_2` FOREIGN KEY (`industry`) REFERENCES `fund_industry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_associated_project
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_complete_dicision
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_complete_dicision`;
CREATE TABLE `guquan_management_complete_dicision` (
  `id` int(11) NOT NULL COMMENT '完成决策',
  `file1` int(11) DEFAULT NULL COMMENT '股权转让协议',
  `file1_upload` bit(1) DEFAULT NULL COMMENT '原件是否递交',
  `file2` int(11) DEFAULT NULL COMMENT '可转债协议',
  `file2_upload` bit(1) DEFAULT NULL,
  `file3` int(11) DEFAULT NULL COMMENT '股东协议',
  `file3_upload` bit(1) DEFAULT NULL,
  `file4` int(11) DEFAULT NULL COMMENT '工商变更文件',
  `file4_upload` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file1` (`file1`),
  KEY `file2` (`file2`),
  KEY `file3` (`file3`),
  KEY `file4` (`file4`),
  CONSTRAINT `guquan_management_complete_dicision_ibfk_1` FOREIGN KEY (`file1`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `guquan_management_complete_dicision_ibfk_2` FOREIGN KEY (`file2`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `guquan_management_complete_dicision_ibfk_3` FOREIGN KEY (`file3`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `guquan_management_complete_dicision_ibfk_4` FOREIGN KEY (`file4`) REFERENCES `fund_file` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_complete_dicision
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_contact
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_contact`;
CREATE TABLE `guquan_management_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_contact
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_detailed_investigation
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_detailed_investigation`;
CREATE TABLE `guquan_management_detailed_investigation` (
  `id` int(11) NOT NULL COMMENT '初期尽责调查',
  `opition` bit(1) DEFAULT NULL COMMENT '投资委员会意见',
  `Interview` bit(1) DEFAULT NULL COMMENT '核心团队访谈',
  `data_analysis` bit(1) DEFAULT NULL COMMENT '运营数据分析',
  `report_analysis` bit(1) DEFAULT NULL COMMENT '财务报表分析',
  `interview_coop` bit(1) DEFAULT NULL COMMENT '合作方访谈',
  `interview_oppo` bit(1) DEFAULT NULL COMMENT '竞争对手访谈',
  `interview_client` bit(1) DEFAULT NULL COMMENT '客户访谈',
  `study` bit(1) DEFAULT NULL COMMENT '国际案例学习',
  `abstract` varchar(255) DEFAULT '' COMMENT '概述',
  `file` int(11) DEFAULT NULL COMMENT '附件',
  `law` bit(1) DEFAULT NULL COMMENT '法务尽责调查',
  `file_law` int(11) DEFAULT NULL COMMENT '文件',
  `finance` bit(1) DEFAULT NULL COMMENT '财务尽责调查',
  `file_finance` int(11) DEFAULT NULL COMMENT '上传文件',
  `file_finance_DD` int(11) DEFAULT NULL COMMENT '财务DD报告',
  PRIMARY KEY (`id`),
  KEY `file` (`file`),
  KEY `file_law` (`file_law`),
  KEY `file_finance` (`file_finance`),
  KEY `file_finance_DD` (`file_finance_DD`),
  CONSTRAINT `guquan_management_detailed_investigation_ibfk_1` FOREIGN KEY (`file`) REFERENCES `guquan_management_file` (`file_id`),
  CONSTRAINT `guquan_management_detailed_investigation_ibfk_2` FOREIGN KEY (`file_law`) REFERENCES `guquan_management_file` (`file_id`),
  CONSTRAINT `guquan_management_detailed_investigation_ibfk_3` FOREIGN KEY (`file_finance`) REFERENCES `guquan_management_file` (`file_id`),
  CONSTRAINT `guquan_management_detailed_investigation_ibfk_4` FOREIGN KEY (`file_finance_DD`) REFERENCES `guquan_management_file` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_detailed_investigation
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_file
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_file`;
CREATE TABLE `guquan_management_file` (
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_address` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_upload_person` varchar(255) DEFAULT NULL COMMENT '文件上传者',
  `file_use` varchar(255) DEFAULT NULL COMMENT '文件用途',
  `file_time` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_file
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_grouping
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_grouping`;
CREATE TABLE `guquan_management_grouping` (
  `id` int(11) NOT NULL,
  `grouping` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_grouping
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_investment_intention
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_investment_intention`;
CREATE TABLE `guquan_management_investment_intention` (
  `id` int(11) NOT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `file` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file` (`file`),
  CONSTRAINT `guquan_management_investment_intention_ibfk_1` FOREIGN KEY (`file`) REFERENCES `guquan_management_file` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_investment_intention
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_investor
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_investor`;
CREATE TABLE `guquan_management_investor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of guquan_management_investor
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_label
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_label`;
CREATE TABLE `guquan_management_label` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_label
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_priority
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_priority`;
CREATE TABLE `guquan_management_priority` (
  `id` int(11) NOT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_priority
-- ----------------------------

-- ----------------------------
-- Table structure for guquan_management_technology
-- ----------------------------
DROP TABLE IF EXISTS `guquan_management_technology`;
CREATE TABLE `guquan_management_technology` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科技产业',
  `project` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目全称',
  `jijin` int(11) DEFAULT NULL,
  `project_state` varchar(255) DEFAULT NULL COMMENT '项目状态',
  `project_industry` varchar(255) DEFAULT NULL COMMENT '行业划分',
  `project_process` varchar(255) DEFAULT NULL COMMENT '投资流程',
  `creat_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建者',
  `executor` int(11) DEFAULT NULL COMMENT '执行者',
  `project_source` varchar(255) DEFAULT NULL COMMENT '项目来源',
  `invest_money` int(11) DEFAULT NULL COMMENT '投资金额',
  `industry` varchar(255) DEFAULT NULL COMMENT '行业',
  `grouping` varchar(255) DEFAULT NULL COMMENT '分组',
  `priority` varchar(255) DEFAULT NULL COMMENT '优先级',
  `is_public` tinyint(1) DEFAULT NULL COMMENT '是否公开',
  `label` varchar(255) DEFAULT NULL COMMENT '标签',
  `project_member` varchar(255) DEFAULT NULL COMMENT '项目组成员',
  `BP_file` varchar(255) DEFAULT NULL COMMENT '附件',
  `weekly_file` varchar(255) DEFAULT NULL COMMENT '周例会汇报',
  `abstract` varchar(255) DEFAULT NULL COMMENT '公司概况',
  PRIMARY KEY (`id`),
  KEY `project_state` (`project_state`),
  KEY `project_industry` (`project_industry`),
  KEY `creator` (`creator`),
  KEY `project_source` (`project_source`),
  KEY `industry` (`industry`),
  KEY `grouping` (`grouping`),
  KEY `priority` (`priority`),
  KEY `label` (`label`),
  KEY `project_member` (`project_member`),
  KEY `executor` (`executor`),
  KEY `jijin` (`jijin`),
  KEY `guquan_management_technology_ibfk_11` (`BP_file`),
  KEY `guquan_management_technology_ibfk_12` (`weekly_file`),
  CONSTRAINT `guquan_management_technology_ibfk_13` FOREIGN KEY (`executor`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `guquan_management_technology_ibfk_14` FOREIGN KEY (`jijin`) REFERENCES `jijin_jijin` (`fund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guquan_management_technology
-- ----------------------------
INSERT INTO `guquan_management_technology` VALUES ('1', '项目一', '产业项目一', '2', '审阅BP', '科技产业', '审阅BP', '2019-03-11', '曾勇', '1', '内部推荐', '15', '医疗', '', '普通(P2)', '1', '12,13', '13,15', '', '', '风格化<b>风格化<img src=\"http://127.0.0.1:8000/static/layui/images/face/13.gif\" alt=\"[偷笑]\"></b>');

-- ----------------------------
-- Table structure for hongkong_stock
-- ----------------------------
DROP TABLE IF EXISTS `hongkong_stock`;
CREATE TABLE `hongkong_stock` (
  `company_id` int(11) NOT NULL,
  `main_business` varchar(255) DEFAULT NULL COMMENT '主营业务',
  `Registered capital` varchar(255) DEFAULT NULL COMMENT '注册资本',
  `company_overview` varchar(255) DEFAULT NULL COMMENT '公司概况	',
  `main_product_composition` varchar(255) DEFAULT NULL COMMENT '主营产品构成',
  `total_income` varchar(255) DEFAULT NULL COMMENT '总计收入',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hongkong_stock
-- ----------------------------

-- ----------------------------
-- Table structure for jijin_industry_of_concern
-- ----------------------------
DROP TABLE IF EXISTS `jijin_industry_of_concern`;
CREATE TABLE `jijin_industry_of_concern` (
  `industry_of_concern_id` int(11) NOT NULL,
  `industry_of_concern_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`industry_of_concern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_industry_of_concern
-- ----------------------------

-- ----------------------------
-- Table structure for jijin_investment_areas
-- ----------------------------
DROP TABLE IF EXISTS `jijin_investment_areas`;
CREATE TABLE `jijin_investment_areas` (
  `area_id` int(11) NOT NULL,
  `arer_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_investment_areas
-- ----------------------------

-- ----------------------------
-- Table structure for jijin_investment_committee
-- ----------------------------
DROP TABLE IF EXISTS `jijin_investment_committee`;
CREATE TABLE `jijin_investment_committee` (
  `id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL COMMENT '职务',
  `fund_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `fund_member` varchar(255) DEFAULT NULL COMMENT '投委会成员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_investment_committee
-- ----------------------------

-- ----------------------------
-- Table structure for jijin_investment_stage
-- ----------------------------
DROP TABLE IF EXISTS `jijin_investment_stage`;
CREATE TABLE `jijin_investment_stage` (
  `stage_id` int(11) NOT NULL,
  `stage_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_investment_stage
-- ----------------------------

-- ----------------------------
-- Table structure for jijin_jijin
-- ----------------------------
DROP TABLE IF EXISTS `jijin_jijin`;
CREATE TABLE `jijin_jijin` (
  `fund_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '简称',
  `fund_abbreviation` varchar(255) DEFAULT NULL,
  `fundname` varchar(255) DEFAULT NULL COMMENT '全称',
  `fundscope` varchar(255) DEFAULT NULL COMMENT '基金规模',
  `presentscope` varchar(255) DEFAULT NULL COMMENT '当前规模',
  `management_company` varchar(255) DEFAULT NULL,
  `builddate` varchar(255) DEFAULT NULL COMMENT '设立日期',
  `investenddate` varchar(255) DEFAULT NULL COMMENT '投资期结束日',
  `businessdate` varchar(255) DEFAULT NULL COMMENT '经营期到期日',
  `address` varchar(255) DEFAULT NULL COMMENT '注册地址',
  `industryfocus` varchar(255) DEFAULT NULL COMMENT '关注行业',
  `concernstage` varchar(255) DEFAULT NULL COMMENT '关注阶段',
  `fund_introduce` varchar(255) DEFAULT NULL COMMENT '基金简介',
  `file` varchar(255) DEFAULT NULL,
  `manage_money` varchar(255) DEFAULT NULL COMMENT '管理费',
  `income_distribution` varchar(255) DEFAULT NULL COMMENT '收益分配',
  `threshold` varchar(255) DEFAULT NULL COMMENT '门槛',
  `investment_num` varchar(255) DEFAULT NULL COMMENT '已投资项目个数',
  `investment_account` varchar(255) DEFAULT NULL COMMENT '已投资项目总额',
  `hosting_bank_name` varchar(255) DEFAULT NULL COMMENT '托管行名称',
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `audit_institution` varchar(255) DEFAULT NULL,
  `law_office` varchar(255) DEFAULT NULL,
  `target_size` varchar(255) DEFAULT NULL,
  `approved_by_the_Commission` varchar(255) DEFAULT NULL,
  `commitment_funding_summary` varchar(255) DEFAULT NULL,
  `scale_summary` varchar(255) DEFAULT NULL,
  `cumulative_investment_amount` varchar(255) DEFAULT NULL,
  `cumulative_recovery_amount` varchar(255) DEFAULT NULL,
  `current_size_summary` varchar(255) DEFAULT NULL,
  `current_commitment_summary` varchar(255) DEFAULT NULL,
  `parent_fund_DPI` varchar(255) DEFAULT NULL,
  `annual_management_rate` varchar(255) DEFAULT NULL,
  `annual_management_fee_base` varchar(255) DEFAULT NULL,
  `annual_inspection_result` varchar(255) DEFAULT NULL,
  `filing_agency` varchar(255) DEFAULT NULL,
  `filing_time` varchar(255) DEFAULT NULL,
  `filing_result` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`fund_id`),
  KEY `management_company` (`management_company`),
  KEY `concernstage` (`concernstage`),
  KEY `industryfocus` (`industryfocus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_jijin
-- ----------------------------
INSERT INTO `jijin_jijin` VALUES ('2', '基金二', '基金项目二', '1000', '1000', '江西财大', '2019-03-01', '2019-03-26', '2019-03-31', '南昌市', 'on', '成长期', '水电费<b>水电费</b><i style=\"font-weight: bold;\">谁的风格</i><u style=\"\"><i style=\"font-weight: bold;\">大风刮过电饭锅电饭锅电饭锅<img src=\"http://127.0.0.1:8000/static/layui/images/face/26.gif\" alt=\"[怒]\"></i></u>', '', '十万元', '随机分配', '10万元门槛', null, null, '中国工商银行', '曾勇', '81721076', '南昌市审计局', '南昌市律师事务所', '10.1', '10', '10000', '10', '12', '12', '2323', '2431', '0.54', '54', '0.67', '成功', '南昌市工商局', '2019年三月一号', '成功', '0');

-- ----------------------------
-- Table structure for jijin_management_company
-- ----------------------------
DROP TABLE IF EXISTS `jijin_management_company`;
CREATE TABLE `jijin_management_company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_management_company
-- ----------------------------

-- ----------------------------
-- Table structure for jijin_operational_information
-- ----------------------------
DROP TABLE IF EXISTS `jijin_operational_information`;
CREATE TABLE `jijin_operational_information` (
  `hosting_bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_bank_name` varchar(255) DEFAULT NULL COMMENT '托管行名称	',
  `account_name` varchar(255) DEFAULT NULL COMMENT '户名',
  `account_number` varchar(255) DEFAULT NULL COMMENT '账号',
  `audit_institution` varchar(255) DEFAULT NULL COMMENT '审计机构',
  `law_office` varchar(255) DEFAULT NULL COMMENT '律师事务所',
  `target_size` varchar(255) DEFAULT NULL COMMENT '目标规模',
  `approved_by_the_Commission` varchar(255) DEFAULT NULL COMMENT '投委会批准金额',
  `commitment_funding_summary` varchar(255) DEFAULT NULL COMMENT '承诺出资汇总',
  `scale_summary` varchar(255) DEFAULT NULL COMMENT '规模汇总',
  `cumulative_investment_amount` varchar(255) DEFAULT NULL COMMENT '累计投资金额',
  `cumulative_recovery_amount` varchar(255) DEFAULT NULL COMMENT '累计回收金额',
  `current_size_summary` varchar(255) DEFAULT NULL COMMENT '当前规模汇总',
  `current_commitment_summary` varchar(255) DEFAULT NULL COMMENT '当前承诺汇总',
  `parent_fund_DPI` varchar(255) DEFAULT NULL COMMENT '母基金DPI',
  PRIMARY KEY (`hosting_bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_operational_information
-- ----------------------------
INSERT INTO `jijin_operational_information` VALUES ('1', '', '', '', '', '', '1.52', '20', '10', '100', '1000', '1000', '', '', '');

-- ----------------------------
-- Table structure for jijin_other_information
-- ----------------------------
DROP TABLE IF EXISTS `jijin_other_information`;
CREATE TABLE `jijin_other_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annual_management_rate` varchar(255) DEFAULT NULL COMMENT '年度管理费率',
  `annual_management_fee_base` varchar(255) DEFAULT NULL COMMENT '年度管理费基数',
  `annual_inspection_result` varchar(255) DEFAULT NULL COMMENT '年检结果	',
  `filing_agency` varchar(255) DEFAULT NULL COMMENT '备案机构',
  `filing_time` varchar(255) DEFAULT NULL COMMENT '备案时间',
  `filing_result` varchar(255) DEFAULT NULL COMMENT '备案结果',
  `investment_stage` int(255) DEFAULT NULL COMMENT '投资阶段',
  `configuration_amount` varchar(255) DEFAULT NULL COMMENT '配置金额',
  `actual_investment_amount` varchar(255) DEFAULT NULL COMMENT '实际投资金额',
  `investment_areas` int(255) DEFAULT NULL COMMENT '投资领域',
  `configuration_amount_2` varchar(255) DEFAULT NULL COMMENT '配置金额',
  `actual_investment_amount_2` varchar(255) DEFAULT NULL COMMENT '实际投资金额',
  PRIMARY KEY (`id`),
  KEY `investment_areas` (`investment_areas`),
  KEY `investment_stage` (`investment_stage`),
  CONSTRAINT `jijin_other_information_ibfk_1` FOREIGN KEY (`investment_areas`) REFERENCES `jijin_investment_areas` (`area_id`),
  CONSTRAINT `jijin_other_information_ibfk_2` FOREIGN KEY (`investment_stage`) REFERENCES `jijin_investment_stage` (`stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_other_information
-- ----------------------------
INSERT INTO `jijin_other_information` VALUES ('1', '15.5%', '', '', '', '', '', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for jijin_stage_of_concern
-- ----------------------------
DROP TABLE IF EXISTS `jijin_stage_of_concern`;
CREATE TABLE `jijin_stage_of_concern` (
  `stage_id` int(11) NOT NULL,
  `stage_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jijin_stage_of_concern
-- ----------------------------

-- ----------------------------
-- Table structure for land_management_contact
-- ----------------------------
DROP TABLE IF EXISTS `land_management_contact`;
CREATE TABLE `land_management_contact` (
  `id` int(11) NOT NULL,
  `project_name` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_name` (`project_name`),
  CONSTRAINT `land_management_contact_ibfk_1` FOREIGN KEY (`project_name`) REFERENCES `land_management_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of land_management_contact
-- ----------------------------

-- ----------------------------
-- Table structure for land_management_detail
-- ----------------------------
DROP TABLE IF EXISTS `land_management_detail`;
CREATE TABLE `land_management_detail` (
  `id` int(11) NOT NULL COMMENT '地产管理',
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `company_name` int(11) DEFAULT NULL COMMENT '企业名称',
  `project_state` int(11) DEFAULT NULL COMMENT '项目状态 外键  fund_state',
  `industry_id` int(11) DEFAULT NULL COMMENT '地产划分 外键 land_management_industry',
  `company_address` varchar(255) DEFAULT NULL COMMENT '企业所在地',
  `asset_type` varchar(255) DEFAULT NULL COMMENT '资产类型',
  `asset_address` varchar(255) DEFAULT NULL COMMENT '资产所在地',
  `project_type` int(11) DEFAULT NULL COMMENT '项目类型 外键 fund_type',
  `project_source` varchar(255) DEFAULT NULL COMMENT '项目来源',
  `project_abstract` varchar(255) DEFAULT NULL COMMENT '项目简介',
  PRIMARY KEY (`id`),
  KEY `project_state` (`project_state`),
  KEY `industry_id` (`industry_id`),
  KEY `project_type` (`project_type`),
  CONSTRAINT `land_management_detail_ibfk_1` FOREIGN KEY (`project_state`) REFERENCES `fund_state` (`id`),
  CONSTRAINT `land_management_detail_ibfk_2` FOREIGN KEY (`industry_id`) REFERENCES `land_management_industry` (`id`),
  CONSTRAINT `land_management_detail_ibfk_3` FOREIGN KEY (`project_type`) REFERENCES `fund_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of land_management_detail
-- ----------------------------

-- ----------------------------
-- Table structure for land_management_industry
-- ----------------------------
DROP TABLE IF EXISTS `land_management_industry`;
CREATE TABLE `land_management_industry` (
  `id` int(11) NOT NULL,
  `industry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of land_management_industry
-- ----------------------------

-- ----------------------------
-- Table structure for land_management_invest
-- ----------------------------
DROP TABLE IF EXISTS `land_management_invest`;
CREATE TABLE `land_management_invest` (
  `id` int(11) NOT NULL COMMENT '投资基金 + 项目团队成员',
  `client_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `fund_name` int(11) DEFAULT NULL COMMENT '基金名称',
  `estable_time` datetime DEFAULT NULL COMMENT '设立日期',
  `fund_term` varchar(255) DEFAULT NULL COMMENT '基金期限',
  `fund_size` float DEFAULT NULL COMMENT '基金规模',
  `is_only` bit(1) DEFAULT NULL COMMENT '是否设立专项计划',
  `plan_name` varchar(255) DEFAULT NULL COMMENT '计划名称',
  `starttime` datetime DEFAULT NULL COMMENT '计划启动时间',
  `endtime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `plan_size` float DEFAULT NULL COMMENT '计划规模',
  `business_owner` int(11) DEFAULT NULL COMMENT '业务负责人',
  `project_manager` int(11) DEFAULT NULL COMMENT '项目经理',
  `project_member` int(11) DEFAULT NULL COMMENT '项目组成员',
  `member` int(11) DEFAULT NULL COMMENT '项目资管成员',
  PRIMARY KEY (`id`),
  KEY `fund_name` (`fund_name`),
  KEY `business_owner` (`business_owner`),
  KEY `project_manager` (`project_manager`),
  KEY `project_member` (`project_member`),
  KEY `member` (`member`),
  CONSTRAINT `land_management_invest_ibfk_1` FOREIGN KEY (`fund_name`) REFERENCES `fund_fund` (`fund_id`),
  CONSTRAINT `land_management_invest_ibfk_2` FOREIGN KEY (`business_owner`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `land_management_invest_ibfk_3` FOREIGN KEY (`project_manager`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `land_management_invest_ibfk_4` FOREIGN KEY (`project_member`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `land_management_invest_ibfk_5` FOREIGN KEY (`member`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of land_management_invest
-- ----------------------------

-- ----------------------------
-- Table structure for market_management_detail
-- ----------------------------
DROP TABLE IF EXISTS `market_management_detail`;
CREATE TABLE `market_management_detail` (
  `id` int(11) NOT NULL COMMENT '二级市场管理-详细',
  `main_business` varchar(255) DEFAULT NULL COMMENT '主营业务',
  `registered_capital` float DEFAULT NULL COMMENT '注册资本',
  `company_overview` varchar(255) DEFAULT NULL COMMENT '公司概况',
  `main_product` varchar(255) DEFAULT NULL COMMENT '主营产品构成',
  `total_income` float DEFAULT NULL COMMENT '总计收入',
  `main_industry` varchar(255) DEFAULT NULL COMMENT '行业收入构成',
  `industry_income` float DEFAULT NULL COMMENT '总计收入',
  `main_regional` varchar(255) DEFAULT NULL COMMENT '地区收入构成',
  `regional_income` float DEFAULT NULL COMMENT '总计收入',
  `market_time` datetime DEFAULT NULL COMMENT '上市时间',
  `issue_price` decimal(10,2) DEFAULT NULL COMMENT '发行价格',
  `issue_number` float DEFAULT NULL COMMENT '发行价格',
  `involved_concept` varchar(255) DEFAULT NULL COMMENT '涉及概念',
  `income_type` varchar(255) DEFAULT NULL COMMENT '收入方式',
  `money` float DEFAULT NULL COMMENT '金额',
  `year` varchar(255) DEFAULT NULL COMMENT '年度',
  `progarm` varchar(255) DEFAULT NULL COMMENT '方案',
  `the_day` varchar(255) DEFAULT NULL COMMENT '除权日',
  `per_share` float DEFAULT NULL COMMENT '每股收益',
  `per_asset` float DEFAULT NULL COMMENT '每股净资产',
  `per_capital` float DEFAULT NULL COMMENT '每股资本公积',
  `per_profit` float DEFAULT NULL COMMENT '每股分配利润',
  `per_cash` float DEFAULT NULL COMMENT '每股经营性现金流',
  `total_money` float DEFAULT NULL COMMENT '营业总收入',
  `net_profit` float DEFAULT NULL COMMENT '净利润',
  `operate_profit` float DEFAULT NULL COMMENT '营业利润',
  `operate_profit_rate` float DEFAULT NULL COMMENT '营业利润增长率',
  `total_money_rate` float DEFAULT NULL COMMENT '营业总收入增长率',
  `net_profit_rate` float DEFAULT NULL COMMENT '净利润增长率',
  `total_capital_stock` varchar(255) DEFAULT NULL COMMENT '总股本',
  `toatal_A_stock` varchar(255) DEFAULT NULL COMMENT '流通A股',
  `porprotion_A_stock` float DEFAULT NULL COMMENT '流通A股占比',
  `shareholder_number` int(11) DEFAULT NULL COMMENT '股东人数',
  `older_shareholder_number` int(11) DEFAULT NULL COMMENT '上期股东人数',
  `shareholder_porprotion` float DEFAULT NULL COMMENT '较上期变化',
  `chip` varchar(255) DEFAULT NULL COMMENT '筹码集中度',
  `per_capita_shares` varchar(255) DEFAULT NULL COMMENT '人均流通股',
  `per_capita_sharehold` varchar(255) DEFAULT NULL COMMENT '人均持股金额',
  `investor_porprotion` float DEFAULT NULL COMMENT '机构投资者占比',
  `top_ten_shareholder` varchar(255) DEFAULT NULL COMMENT '十大流通股东',
  `shareholser_name` varchar(255) DEFAULT NULL COMMENT '股东名称',
  `porprotion` float DEFAULT NULL COMMENT '占比',
  `change` varchar(255) DEFAULT NULL COMMENT '变动',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_management_detail
-- ----------------------------

-- ----------------------------
-- Table structure for market_management_gaikuang
-- ----------------------------
DROP TABLE IF EXISTS `market_management_gaikuang`;
CREATE TABLE `market_management_gaikuang` (
  `id` int(11) NOT NULL COMMENT '二级市场管理',
  `stock_number` int(11) DEFAULT NULL COMMENT '股票编号',
  `industry_id` int(11) DEFAULT NULL COMMENT '划分 外键 market_management_industry',
  `company` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `indusrty` varchar(255) DEFAULT NULL COMMENT '行业',
  `stock_money` float DEFAULT NULL COMMENT '股价',
  `time` datetime DEFAULT NULL COMMENT '价格更新时间',
  `own` float DEFAULT NULL COMMENT '当前持仓',
  `market_value` float DEFAULT NULL COMMENT '市值',
  `cost` float DEFAULT NULL COMMENT '成本',
  `profit_loss` float DEFAULT NULL COMMENT '盈亏',
  `porprotion` float DEFAULT NULL COMMENT '盈亏比例',
  `abstract` varchar(255) DEFAULT NULL COMMENT '备注',
  `transaction_date` datetime DEFAULT NULL COMMENT '交易日期',
  `transaction_type` varchar(255) DEFAULT NULL COMMENT '交易类型',
  `transaction_number` int(11) DEFAULT NULL COMMENT '交易数量',
  `transaction_classes` varchar(255) DEFAULT NULL COMMENT '币种',
  `transaction_price` decimal(10,2) DEFAULT NULL COMMENT '成交均价',
  `transaction_money` float DEFAULT NULL COMMENT '成交金额',
  PRIMARY KEY (`id`),
  KEY `industry_id` (`industry_id`),
  CONSTRAINT `market_management_gaikuang_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `market_management_industry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_management_gaikuang
-- ----------------------------

-- ----------------------------
-- Table structure for market_management_industry
-- ----------------------------
DROP TABLE IF EXISTS `market_management_industry`;
CREATE TABLE `market_management_industry` (
  `id` int(11) NOT NULL,
  `industry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_management_industry
-- ----------------------------

-- ----------------------------
-- Table structure for other_business_statistics
-- ----------------------------
DROP TABLE IF EXISTS `other_business_statistics`;
CREATE TABLE `other_business_statistics` (
  `id` int(11) NOT NULL COMMENT '业务统计',
  `fund_id` int(11) DEFAULT NULL COMMENT '项目，（外键 fund_fund）',
  `organ_id` int(11) DEFAULT NULL COMMENT '中介（外键：intermediary_organ）',
  `fee` float DEFAULT NULL COMMENT '费用',
  `start_time` datetime DEFAULT NULL COMMENT '启动时间',
  `due_time` datetime DEFAULT NULL COMMENT '交付时间',
  `service_comment` varchar(255) DEFAULT NULL COMMENT '服务评价',
  `report` varchar(255) DEFAULT NULL COMMENT '报告',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fund_id` (`fund_id`),
  KEY `organ_id` (`organ_id`),
  CONSTRAINT `other_business_statistics_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `fund_fund` (`fund_id`),
  CONSTRAINT `other_business_statistics_ibfk_2` FOREIGN KEY (`organ_id`) REFERENCES `other_intermediary_organ` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_business_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for other_cooperative_organization
-- ----------------------------
DROP TABLE IF EXISTS `other_cooperative_organization`;
CREATE TABLE `other_cooperative_organization` (
  `id` int(11) NOT NULL COMMENT '合作机构',
  `organization_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `abbreviation` varchar(255) DEFAULT NULL COMMENT '缩写',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `classification` varchar(255) DEFAULT NULL COMMENT '分类',
  `number` int(11) DEFAULT NULL COMMENT '项目总数',
  `investment_step` varchar(255) DEFAULT NULL COMMENT '投资阶段',
  `fund_size` double DEFAULT NULL COMMENT '基金规模',
  `field` varchar(255) DEFAULT NULL COMMENT '领域',
  `location` varchar(255) DEFAULT NULL COMMENT '所在地',
  `established_time` datetime DEFAULT NULL COMMENT '成立时间',
  `internet_site` varchar(255) DEFAULT NULL COMMENT '网址',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `famous_case` varchar(255) DEFAULT NULL COMMENT '知名案例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_cooperative_organization
-- ----------------------------

-- ----------------------------
-- Table structure for other_intermediary_organ
-- ----------------------------
DROP TABLE IF EXISTS `other_intermediary_organ`;
CREATE TABLE `other_intermediary_organ` (
  `id` int(11) NOT NULL COMMENT '中介机构',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类别',
  `grade` varchar(255) DEFAULT NULL COMMENT '评级',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_intermediary_organ
-- ----------------------------

-- ----------------------------
-- Table structure for other_news
-- ----------------------------
DROP TABLE IF EXISTS `other_news`;
CREATE TABLE `other_news` (
  `id` int(11) NOT NULL COMMENT '消息',
  `news_name` varchar(255) DEFAULT NULL COMMENT '消息名称',
  `news_content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `news_time` datetime DEFAULT NULL COMMENT '发布时间',
  `news_publisher` varchar(255) DEFAULT NULL COMMENT '发布来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_news
-- ----------------------------

-- ----------------------------
-- Table structure for other_recycle_bin_file
-- ----------------------------
DROP TABLE IF EXISTS `other_recycle_bin_file`;
CREATE TABLE `other_recycle_bin_file` (
  `id` int(11) NOT NULL COMMENT '回收站-文件',
  `belong_to` varchar(255) DEFAULT NULL COMMENT '归属',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `last_modification` varchar(255) DEFAULT NULL COMMENT '最后修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_recycle_bin_file
-- ----------------------------

-- ----------------------------
-- Table structure for other_recyle_bin_object
-- ----------------------------
DROP TABLE IF EXISTS `other_recyle_bin_object`;
CREATE TABLE `other_recyle_bin_object` (
  `id` int(11) NOT NULL COMMENT '回收站-对象',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_person` varchar(255) DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_recyle_bin_object
-- ----------------------------

-- ----------------------------
-- Table structure for other_talent_pool
-- ----------------------------
DROP TABLE IF EXISTS `other_talent_pool`;
CREATE TABLE `other_talent_pool` (
  `id` int(11) NOT NULL COMMENT '人才库',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `company` varchar(255) DEFAULT NULL COMMENT '所属公司',
  `contact_information` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `file` varchar(255) DEFAULT NULL COMMENT '简历上传',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_talent_pool
-- ----------------------------

-- ----------------------------
-- Table structure for research_industry
-- ----------------------------
DROP TABLE IF EXISTS `research_industry`;
CREATE TABLE `research_industry` (
  `industry_id` int(11) NOT NULL,
  `industry_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`industry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of research_industry
-- ----------------------------

-- ----------------------------
-- Table structure for research_industry_research
-- ----------------------------
DROP TABLE IF EXISTS `research_industry_research`;
CREATE TABLE `research_industry_research` (
  `industry_research_id` int(11) NOT NULL COMMENT '行业研究',
  `industry_research_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `industry_research_state` varchar(255) DEFAULT NULL COMMENT '项目状态',
  `create_creater` varchar(255) DEFAULT NULL COMMENT '创建者',
  `person_id` int(11) DEFAULT NULL COMMENT '执行者',
  `industry_id` int(11) DEFAULT NULL COMMENT '行业',
  `project_label_id` int(11) DEFAULT NULL COMMENT '标签',
  `project_member` int(11) DEFAULT NULL COMMENT '项目组成员',
  `abstract` varchar(255) DEFAULT NULL COMMENT '摘要',
  `situation` varchar(255) DEFAULT NULL COMMENT '跟进情况',
  `research_report_id` int(11) DEFAULT NULL COMMENT '文件',
  PRIMARY KEY (`industry_research_id`),
  KEY `person_id` (`person_id`),
  KEY `industry_id` (`industry_id`),
  KEY `project_label_id` (`project_label_id`),
  KEY `research_report_id` (`research_report_id`),
  KEY `project_member` (`project_member`),
  CONSTRAINT `research_industry_research_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `fund_person` (`person_id`),
  CONSTRAINT `research_industry_research_ibfk_2` FOREIGN KEY (`industry_id`) REFERENCES `research_industry` (`industry_id`),
  CONSTRAINT `research_industry_research_ibfk_3` FOREIGN KEY (`project_label_id`) REFERENCES `research_project_label` (`project_label_id`),
  CONSTRAINT `research_industry_research_ibfk_4` FOREIGN KEY (`research_report_id`) REFERENCES `fund_file` (`file_id`),
  CONSTRAINT `research_industry_research_ibfk_5` FOREIGN KEY (`project_member`) REFERENCES `fund_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of research_industry_research
-- ----------------------------

-- ----------------------------
-- Table structure for research_people
-- ----------------------------
DROP TABLE IF EXISTS `research_people`;
CREATE TABLE `research_people` (
  `person_id` int(11) NOT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_authority` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of research_people
-- ----------------------------

-- ----------------------------
-- Table structure for research_project_label
-- ----------------------------
DROP TABLE IF EXISTS `research_project_label`;
CREATE TABLE `research_project_label` (
  `project_label_id` int(11) NOT NULL,
  `project_label_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of research_project_label
-- ----------------------------

-- ----------------------------
-- Table structure for research_research_report
-- ----------------------------
DROP TABLE IF EXISTS `research_research_report`;
CREATE TABLE `research_research_report` (
  `research_report_id` int(11) NOT NULL,
  `research_report_file_name` varchar(255) DEFAULT NULL,
  `research_report_file_type` varchar(255) DEFAULT NULL,
  `research_report_file_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`research_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of research_research_report
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_association
-- ----------------------------
DROP TABLE IF EXISTS `schedule_association`;
CREATE TABLE `schedule_association` (
  `association_id` int(11) NOT NULL,
  `association_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`association_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_association
-- ----------------------------
INSERT INTO `schedule_association` VALUES ('0', '股权直投');
INSERT INTO `schedule_association` VALUES ('1', '二级市场');
INSERT INTO `schedule_association` VALUES ('2', '地产');

-- ----------------------------
-- Table structure for schedule_meeting_file
-- ----------------------------
DROP TABLE IF EXISTS `schedule_meeting_file`;
CREATE TABLE `schedule_meeting_file` (
  `meeting_file_id` int(11) NOT NULL,
  `meeting_file_address` varchar(255) DEFAULT NULL,
  `meeting_file_type` varchar(255) DEFAULT NULL,
  `meeting_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meeting_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_meeting_file
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_person
-- ----------------------------
DROP TABLE IF EXISTS `schedule_person`;
CREATE TABLE `schedule_person` (
  `person_id` int(11) NOT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_person
-- ----------------------------
INSERT INTO `schedule_person` VALUES ('0', '陈桥');
INSERT INTO `schedule_person` VALUES ('1', '徐菲菲');
INSERT INTO `schedule_person` VALUES ('2', '赵云澜');
INSERT INTO `schedule_person` VALUES ('3', '沈巍');
INSERT INTO `schedule_person` VALUES ('4', 'Nancy');
INSERT INTO `schedule_person` VALUES ('5', 'zhang');

-- ----------------------------
-- Table structure for schedule_remind
-- ----------------------------
DROP TABLE IF EXISTS `schedule_remind`;
CREATE TABLE `schedule_remind` (
  `remind_id` int(11) NOT NULL,
  `remind_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`remind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_remind
-- ----------------------------
INSERT INTO `schedule_remind` VALUES ('0', '不提醒');
INSERT INTO `schedule_remind` VALUES ('1', '提前一小时');
INSERT INTO `schedule_remind` VALUES ('2', '提前一天');
INSERT INTO `schedule_remind` VALUES ('3', '提前一周');

-- ----------------------------
-- Table structure for schedule_schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule_schedule`;
CREATE TABLE `schedule_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(255) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `association_id` int(11) DEFAULT NULL,
  `participation` varchar(255) DEFAULT NULL,
  `is_public` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT NULL,
  `is_all_day_event` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `time_id` int(11) DEFAULT NULL,
  `util_time` datetime DEFAULT NULL,
  `remind_id` int(11) DEFAULT NULL,
  `meeting_summary` text,
  `meeting_file_id` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`schedule_id`),
  KEY `association_id` (`association_id`) USING BTREE,
  KEY `time_id` (`time_id`) USING BTREE,
  KEY `remind_id` (`remind_id`) USING BTREE,
  KEY `meeting_file_id` (`meeting_file_id`) USING BTREE,
  KEY `person_id` (`person_id`) USING BTREE,
  CONSTRAINT `association_id` FOREIGN KEY (`association_id`) REFERENCES `schedule_association` (`association_id`),
  CONSTRAINT `meeting_file_id` FOREIGN KEY (`meeting_file_id`) REFERENCES `schedule_meeting_file` (`meeting_file_id`),
  CONSTRAINT `person_id` FOREIGN KEY (`person_id`) REFERENCES `schedule_person` (`person_id`),
  CONSTRAINT `remind_id` FOREIGN KEY (`remind_id`) REFERENCES `schedule_remind` (`remind_id`),
  CONSTRAINT `time_id` FOREIGN KEY (`time_id`) REFERENCES `schedule_time_repeat` (`time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_schedule
-- ----------------------------
INSERT INTO `schedule_schedule` VALUES ('1', '大幅广告', '1', '1', 'fdg', '', 'gh', '', '2019-01-16 19:35:41', '2019-01-23 19:35:46', '1', '2019-01-22 19:35:53', '1', 'fgh', null, '1');
INSERT INTO `schedule_schedule` VALUES ('5', 'fgh', '1', '1', 'fgh', '', 'fgh', '', '2019-01-29 00:00:00', '2019-01-08 00:00:00', '3', '2019-01-08 00:00:00', '1', 'gjh', null, '1');
INSERT INTO `schedule_schedule` VALUES ('6', 'jhk', '2', '1', 'hgj', '', 'hgj', '', '2019-01-30 00:00:00', '2019-01-08 00:00:00', '2', '2019-01-29 00:00:00', '1', 'hgj', null, '1');
INSERT INTO `schedule_schedule` VALUES ('9', 'test9', '2', '1', 'dfgdfg', '1', 'dfgdfg', '', '2019-01-24 00:00:00', '2019-01-24 00:00:00', '2', '2019-01-24 00:00:00', '1', 'dfg', null, '0');
INSERT INTO `schedule_schedule` VALUES ('10', 'test10', '2', '1', 'ghj', '1', 'ghj', '', '2019-01-23 00:00:00', '2019-01-23 00:00:00', '3', '2019-01-23 00:00:00', '1', 'ghjghj', null, '0');
INSERT INTO `schedule_schedule` VALUES ('11', 'dfg', '2', '1', 'dfg', '', 'dfg', '', '2019-01-30 00:00:00', '2019-01-29 00:00:00', '3', '2019-01-11 00:00:00', '1', 'ghjghj', null, '1');
INSERT INTO `schedule_schedule` VALUES ('12', 'fghfjh', '2', '1', 'hgjhgj', '', 'ghjgj', '', '2019-01-30 00:00:00', '2019-01-29 00:00:00', '3', '2019-01-11 00:00:00', '1', 'ghjghj', null, '1');
INSERT INTO `schedule_schedule` VALUES ('13', 'zengyong ', '2', '1', 'zhanglei', '', '', '', '2019-01-30 00:00:00', '2019-01-29 00:00:00', '3', '2019-01-11 00:00:00', '1', '测试', null, '0');
INSERT INTO `schedule_schedule` VALUES ('14', 'zengyong ', '2', '1', 'zhanglei', '', '', '', '2019-01-30 00:00:00', '2019-01-29 00:00:00', '3', '2019-01-11 00:00:00', '1', '测试', null, '0');
INSERT INTO `schedule_schedule` VALUES ('15', 'ytuytu', '3', '1', 'tyutyu', '', 'tyutu', '', '2019-01-09 00:00:00', '2019-01-09 00:00:00', '1', '2019-01-09 00:00:00', '2', 'ghj', null, '0');
INSERT INTO `schedule_schedule` VALUES ('16', 'kljl', '3', '1', 'jkljl', '', 'jkljl', '', '2019-01-09 00:00:00', '2019-01-09 00:00:00', '1', '2019-01-09 00:00:00', '2', 'ghj', null, '1');
INSERT INTO `schedule_schedule` VALUES ('17', 'hjghjghj', '3', '1', 'ghjghj', '', '', '', '2019-01-09 00:00:00', '2019-01-09 00:00:00', '1', '2019-01-09 00:00:00', '2', 'ghj', null, '1');
INSERT INTO `schedule_schedule` VALUES ('18', '日程1', '0', '0', '张三', '', '', '', '2019-01-13 00:00:00', '2019-01-13 00:00:00', '2', '2019-01-13 00:00:00', '0', '第一次测试', null, '1');
INSERT INTO `schedule_schedule` VALUES ('19', '日程2', '0', '0', '李四', '', '中国', '', '2019-01-15 00:00:00', '2019-01-28 00:00:00', '0', '2019-01-28 00:00:00', '0', '测试2', null, '1');
INSERT INTO `schedule_schedule` VALUES ('20', '风格化', '2', '1', '风格化', '1', '风格化', '', '2019-01-24 00:00:00', '2019-01-24 00:00:00', '2', '2019-01-24 00:00:00', '1', '风格化风格化', null, '0');
INSERT INTO `schedule_schedule` VALUES ('21', '日程', '1', '1', '小明', '1', '发给', '', '2019-01-24 00:00:00', '2019-01-24 00:00:00', '2', '2019-01-24 00:00:00', '2', '电饭锅', null, '0');
INSERT INTO `schedule_schedule` VALUES ('22', '得分', '2', '1', '电饭锅', '1', '电饭锅', '1', '2019-01-19 00:00:00', '2019-01-19 00:00:00', '2', '2019-01-19 00:00:00', '1', '电饭锅', null, '0');
INSERT INTO `schedule_schedule` VALUES ('23', '好好写', '4', '0', '张蕾', '1', '南昌市', '', '2019-01-23 00:00:00', '2019-01-23 00:00:00', '2', '2019-01-23 00:00:00', '0', '一个会议记录', null, '1');
INSERT INTO `schedule_schedule` VALUES ('25', '风格化', '1', '1', '风格化', '1', '风格化', '', '2019-01-24 00:00:00', '2019-01-24 00:00:00', '2', '2019-01-24 00:00:00', '1', '风格化', null, '0');
INSERT INTO `schedule_schedule` VALUES ('27', '测试', '4', '2', '哈哈哈', '1', '哈哈哈', null, '2019-01-21 00:00:00', '2019-01-21 00:00:00', '4', '2019-01-21 00:00:00', '3', 'is_public:1; is_all_day_event:0', null, '0');
INSERT INTO `schedule_schedule` VALUES ('28', '新年', '3', '2', '哈哈', '1', '第三方', null, '2019-01-21 00:00:00', '2019-01-21 00:00:00', '4', '2019-01-21 00:00:00', '3', ' 水电费', null, '0');
INSERT INTO `schedule_schedule` VALUES ('29', '测试11', '5', '2', '哈哈', '1', '南昌', '1', '2019-01-23 00:00:00', '2019-01-23 00:00:00', '1', '2019-01-23 00:00:00', '1', '一个测试', null, '0');
INSERT INTO `schedule_schedule` VALUES ('30', '测试12', '1', '1', '水电费', '1', '第三方', '1', '2019-01-23 00:00:00', '2019-01-23 00:00:00', '2', '2019-01-23 00:00:00', '2', '第三方', null, '0');

-- ----------------------------
-- Table structure for schedule_time_repeat
-- ----------------------------
DROP TABLE IF EXISTS `schedule_time_repeat`;
CREATE TABLE `schedule_time_repeat` (
  `time_id` int(11) NOT NULL,
  `time_select` varchar(255) DEFAULT '',
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_time_repeat
-- ----------------------------
INSERT INTO `schedule_time_repeat` VALUES ('0', '不重复');
INSERT INTO `schedule_time_repeat` VALUES ('1', '每日');
INSERT INTO `schedule_time_repeat` VALUES ('2', '每周');
INSERT INTO `schedule_time_repeat` VALUES ('3', '每月');
INSERT INTO `schedule_time_repeat` VALUES ('4', '每年');

-- ----------------------------
-- Table structure for userinfor_userinfor
-- ----------------------------
DROP TABLE IF EXISTS `userinfor_userinfor`;
CREATE TABLE `userinfor_userinfor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) DEFAULT NULL,
  `upwd` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT '',
  `userEmail` varchar(30) DEFAULT NULL,
  `userAddress` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `head_photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `userEmail` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfor_userinfor
-- ----------------------------
INSERT INTO `userinfor_userinfor` VALUES ('1', 'zy', '123', '15797929803', '904156108@qq.com', '江西省南昌市昌北经济开发区', null, null, null);
INSERT INTO `userinfor_userinfor` VALUES ('2', 'zhang', '123', null, '123@qq.com', null, null, null, null);
INSERT INTO `userinfor_userinfor` VALUES ('4', 'sdf', '123', 'dfs', 'sdf', null, null, '', 'images/4a715ba01d59dae382357f71f2fc321b.jpg');
INSERT INTO `userinfor_userinfor` VALUES ('5', 'zyngoo', '123', null, '1664323211@qq.com', null, null, null, 'images\\437a192d5b94704b.jpg');
INSERT INTO `userinfor_userinfor` VALUES ('6', 'hehe', '123', '1887082156', '12387@qq.com', '南昌市', 'test', 'files/437a192d5b94704b.jpg', 'images/437a192d5b94704b_MIrxqTa.jpg');
INSERT INTO `userinfor_userinfor` VALUES ('7', '李四', '123', null, '111@qq.com', null, null, '', '');

-- ----------------------------
-- View structure for calender_list
-- ----------------------------
DROP VIEW IF EXISTS `calender_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calender_list` AS select `schedule_association`.`association_name` AS `association_name`,`schedule_person`.`person_name` AS `person_name`,`schedule_schedule`.`schedule_id` AS `schedule_id`,`schedule_schedule`.`schedule_name` AS `schedule_name`,`schedule_schedule`.`person_id` AS `person_id`,`schedule_schedule`.`association_id` AS `association_id`,`schedule_schedule`.`participation` AS `participation`,`schedule_schedule`.`is_public` AS `is_public`,`schedule_schedule`.`address` AS `address`,`schedule_schedule`.`is_all_day_event` AS `is_all_day_event`,`schedule_schedule`.`start_time` AS `start_time`,`schedule_schedule`.`end_time` AS `end_time`,`schedule_schedule`.`time_id` AS `time_id`,`schedule_schedule`.`util_time` AS `util_time`,`schedule_schedule`.`remind_id` AS `remind_id`,`schedule_schedule`.`meeting_summary` AS `meeting_summary`,`schedule_schedule`.`meeting_file_id` AS `meeting_file_id`,`schedule_schedule`.`is_delete` AS `is_delete`,`schedule_remind`.`remind_name` AS `remind_name`,`schedule_time_repeat`.`time_select` AS `time_select` from ((((`schedule_schedule` join `schedule_association` on((`schedule_schedule`.`association_id` = `schedule_association`.`association_id`))) join `schedule_person` on((`schedule_schedule`.`person_id` = `schedule_person`.`person_id`))) join `schedule_remind` on((`schedule_schedule`.`remind_id` = `schedule_remind`.`remind_id`))) join `schedule_time_repeat` on((`schedule_schedule`.`time_id` = `schedule_time_repeat`.`time_id`))) ;

-- ----------------------------
-- View structure for event_list
-- ----------------------------
DROP VIEW IF EXISTS `event_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_list` AS select `fund_fund`.`fund_name` AS `fund_name`,`fund_fund`.`fund_id` AS `fund_id`,`event_fund_event`.`title_id` AS `title_id`,`event_fund_event`.`event_name` AS `event_name`,`event_fund_event`.`event_association` AS `event_association`,`event_fund_event`.`event_type` AS `event_type`,`event_fund_event`.`event_publisher` AS `event_publisher`,`event_fund_event`.`publish_date` AS `publish_date`,`event_fund_event`.`event_status` AS `event_status`,`event_fund_event`.`event_content` AS `event_content`,`event_fund_event`.`event_annex` AS `event_annex`,`event_fund_event`.`event_executive` AS `event_executive`,`event_fund_event`.`file` AS `file`,`event_fund_event`.`is_delete` AS `is_delete` from (`fund_fund` join `event_fund_event` on((`event_fund_event`.`event_association` = `fund_fund`.`fund_id`))) ;
