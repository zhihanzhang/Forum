DROP DATABASE IF EXISTS sampledb17;
CREATE DATABASE sampledb17 DEFAULT CHARACTER SET utf8;
USE sampledb17;


/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2011-10-3 0:34:13                             */
/*==============================================================*/


drop index IDX_POST_TOPIC_ID on t_post;

drop index IDX_TOPIC_TITLE on t_topic;

drop index IDX_TOPIC_USER_ID on t_topic;

drop table if exists t_board;

drop table if exists t_board_manager;

drop table if exists t_post;

drop table if exists t_topic;

drop table if exists t_user;

drop table if exists t_login_log;

CREATE TABLE `t_board` (
  `board_id` int(11) NOT NULL auto_increment COMMENT '��̳���ID',
  `board_name` varchar(150) NOT NULL default '' COMMENT '��̳�����',
  `board_desc` varchar(255) default NULL COMMENT '��̳�������',
  `topic_num` int(11) NOT NULL default '0' COMMENT '������Ŀ',
  PRIMARY KEY  (`board_id`),
  KEY `AK_Board_NAME` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_board
#


#
# Source for table t_board_manager
#

CREATE TABLE `t_board_manager` (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`board_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��̳����Ա';

#
# Dumping data for table t_board_manager
#


#
# Source for table t_login_log
#

CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `ip` varchar(30) NOT NULL default '',
  `login_datetime` varchar(14) NOT NULL,
  PRIMARY KEY  (`login_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_login_log
#


#
# Source for table t_post
#

CREATE TABLE `t_post` (
  `post_id` int(11) NOT NULL auto_increment COMMENT '����ID',
  `board_id` int(11) NOT NULL default '0' COMMENT '��̳ID',
  `topic_id` int(11) NOT NULL default '0' COMMENT '����ID',
  `user_id` int(11) NOT NULL default '0' COMMENT '������ID',
  `post_type` tinyint(4) NOT NULL default '2' COMMENT '�������� 1:������ 2:�ظ�����',
  `post_title` varchar(50) NOT NULL COMMENT '���ӱ���',
  `post_text` text NOT NULL COMMENT '��������',
  `create_time` date NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`post_id`),
  KEY `IDX_POST_TOPIC_ID` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='����';

#
# Dumping data for table t_post
#


#
# Source for table t_topic
#

CREATE TABLE `t_topic` (
  `topic_id` int(11) NOT NULL auto_increment COMMENT '����ID',
  `board_id` int(11) NOT NULL COMMENT '������̳',
  `topic_title` varchar(100) NOT NULL default '' COMMENT '���ӱ���',
  `user_id` int(11) NOT NULL default '0' COMMENT '�����û�',
  `create_time` date NOT NULL COMMENT '����ʱ��',
  `last_post` date NOT NULL COMMENT '���ظ�ʱ��',
  `topic_views` int(11) NOT NULL default '1' COMMENT '�����',
  `topic_replies` int(11) NOT NULL default '0' COMMENT '�ظ���',
  `digest` int(11) NOT NULL COMMENT '0:���Ǿ������� 1:�Ǿ�������',
  PRIMARY KEY  (`topic_id`),
  KEY `IDX_TOPIC_USER_ID` (`user_id`),
  KEY `IDX_TOPIC_TITLE` (`topic_title`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='����';

#
# Dumping data for table t_topic
#


#
# Source for table t_user
#

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL auto_increment COMMENT '�û�Id',
  `user_name` varchar(30) NOT NULL COMMENT '�û���',
  `password` varchar(30) NOT NULL default '' COMMENT '����',
  `user_type` tinyint(4) NOT NULL default '1' COMMENT '1:��ͨ�û� 2:����Ա',
  `locked` tinyint(4) NOT NULL default '0' COMMENT '0:δ���� 1:����',
  `credit` int(11) default NULL COMMENT '����',
  `last_visit` datetime default NULL COMMENT '����½ʱ��',
  `last_ip` varchar(20) default NULL COMMENT '����½IP',
  PRIMARY KEY  (`user_id`),
  KEY `AK_AK_USER_USER_NAME` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_user
#
