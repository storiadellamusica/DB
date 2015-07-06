# ************************************************************
#
# Author: Stefano Peloso (http://stefano.io)
# Released under CC BY-NC-SA 4.0 (http://creativecommons.org/licenses/by-nc-sa/4.0/)
#
# ************************************************************
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE TABLE `_cache` (
  `tipo` varchar(255) NOT NULL DEFAULT '',
  `id` varchar(255) NOT NULL DEFAULT '',
  `valore` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id` (`id`),
  KEY `data` (`data`),
  KEY `tipo` (`tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `_cron_jobs` (
  `job` varchar(255) NOT NULL DEFAULT '',
  `frequenza` int(11) NOT NULL DEFAULT '300',
  `lastrun` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `_goldies_automatici` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recensione` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `_sessioni` (
  `chiave` char(32) NOT NULL DEFAULT '',
  `utente` mediumint(8) NOT NULL DEFAULT '-1',
  `ultimo_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `chiave` (`chiave`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `_sezione_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `titolo` tinytext NOT NULL,
  `sottotitolo` tinytext NOT NULL,
  `data` date NOT NULL,
  `testo` text NOT NULL,
  `immagini` text NOT NULL,
  `video` text NOT NULL,
  `autore` int(11) unsigned NOT NULL,
  `kws` text NOT NULL,
  `stato` enum('bozza','proposto','approvato','pubblicato','rifiutato') NOT NULL DEFAULT 'bozza',
  `modificata` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `_sezione_serietv` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `titolo` varchar(255) DEFAULT NULL,
  `data_recensione` datetime DEFAULT NULL,
  `anno` year(4) DEFAULT NULL,
  `produttore` int(25) DEFAULT NULL,
  `genere1` int(25) NOT NULL DEFAULT '0',
  `genere2` int(25) NOT NULL DEFAULT '0',
  `genere3` int(25) NOT NULL DEFAULT '0',
  `testo` longtext,
  `voto` int(5) DEFAULT NULL,
  `kws` mediumtext,
  `recensore` int(25) DEFAULT NULL,
  `recensore2` int(25) NOT NULL DEFAULT '0',
  `mailto` mediumtext,
  `imdb` varchar(255) DEFAULT '-1',
  `plot` mediumtext,
  `youtube` varchar(255) DEFAULT NULL,
  `stagioni` int(11) DEFAULT NULL,
  `episodi` int(11) DEFAULT NULL,
  `stato` enum('bozza','proposto','approvato','pubblicato','rifiutato') NOT NULL DEFAULT 'bozza',
  PRIMARY KEY (`id`),
  KEY `Genere1` (`genere1`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `_speciali` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('a','x') NOT NULL DEFAULT 'a',
  `id_contenuto` int(11) NOT NULL DEFAULT '0',
  `in_home` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `to` (`to`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `facebook_favorites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `recensione_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_auth_access` (
  `group_id` mediumint(8) NOT NULL DEFAULT '0',
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `auth_view` tinyint(1) NOT NULL DEFAULT '0',
  `auth_read` tinyint(1) NOT NULL DEFAULT '0',
  `auth_post` tinyint(1) NOT NULL DEFAULT '0',
  `auth_reply` tinyint(1) NOT NULL DEFAULT '0',
  `auth_edit` tinyint(1) NOT NULL DEFAULT '0',
  `auth_delete` tinyint(1) NOT NULL DEFAULT '0',
  `auth_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `auth_announce` tinyint(1) NOT NULL DEFAULT '0',
  `auth_vote` tinyint(1) NOT NULL DEFAULT '0',
  `auth_pollcreate` tinyint(1) NOT NULL DEFAULT '0',
  `auth_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `auth_mod` tinyint(1) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` mediumint(8) NOT NULL DEFAULT '0',
  `ban_ip` varchar(8) NOT NULL DEFAULT '',
  `ban_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ban_id`),
  KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_categories` (
  `cat_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) DEFAULT NULL,
  `cat_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_confirm` (
  `confirm_id` char(32) NOT NULL DEFAULT '',
  `session_id` char(32) NOT NULL DEFAULT '',
  `code` char(8) DEFAULT NULL,
  PRIMARY KEY (`session_id`,`confirm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_easymod` (
  `mod_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `mod_title` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `mod_file` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `mod_version` varchar(15) COLLATE latin1_general_ci DEFAULT '',
  `mod_author_handle` varchar(25) COLLATE latin1_general_ci DEFAULT '',
  `mod_author_email` varchar(100) COLLATE latin1_general_ci DEFAULT '',
  `mod_author_name` varchar(100) COLLATE latin1_general_ci DEFAULT '',
  `mod_author_url` varchar(100) COLLATE latin1_general_ci DEFAULT '',
  `mod_description` text COLLATE latin1_general_ci,
  `mod_process_date` int(11) DEFAULT '0',
  `mod_phpBB_version` varchar(15) COLLATE latin1_general_ci DEFAULT '',
  `mod_processed_themes` varchar(200) COLLATE latin1_general_ci DEFAULT '',
  `mod_processed_langs` varchar(200) COLLATE latin1_general_ci DEFAULT '',
  `mod_files_edited` mediumint(8) DEFAULT '0',
  `mod_tables_added` mediumint(8) DEFAULT '0',
  `mod_tables_altered` mediumint(8) DEFAULT '0',
  `mod_rows_inserted` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
CREATE TABLE `phpbb_easymod_processed_files` (
  `mod_processed_file` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `mod_id` mediumint(8) NOT NULL DEFAULT '0',
  KEY `mod_processed_file` (`mod_processed_file`),
  KEY `mod_id` (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
CREATE TABLE `phpbb_forum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prune_days` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prune_freq` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`prune_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_forums` (
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_name` varchar(150) DEFAULT NULL,
  `forum_desc` text,
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_order` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `forum_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) DEFAULT NULL,
  `prune_enable` tinyint(1) NOT NULL DEFAULT '0',
  `auth_view` tinyint(2) NOT NULL DEFAULT '0',
  `auth_read` tinyint(2) NOT NULL DEFAULT '0',
  `auth_post` tinyint(2) NOT NULL DEFAULT '0',
  `auth_reply` tinyint(2) NOT NULL DEFAULT '0',
  `auth_edit` tinyint(2) NOT NULL DEFAULT '0',
  `auth_delete` tinyint(2) NOT NULL DEFAULT '0',
  `auth_sticky` tinyint(2) NOT NULL DEFAULT '0',
  `auth_announce` tinyint(2) NOT NULL DEFAULT '0',
  `auth_vote` tinyint(2) NOT NULL DEFAULT '0',
  `auth_pollcreate` tinyint(2) NOT NULL DEFAULT '0',
  `auth_attachments` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forums_order` (`forum_order`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_groups` (
  `group_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_name` varchar(40) NOT NULL DEFAULT '',
  `group_description` varchar(255) NOT NULL DEFAULT '',
  `group_moderator` mediumint(8) NOT NULL DEFAULT '0',
  `group_single_user` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_groups_copy` (
  `group_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_name` varchar(40) NOT NULL DEFAULT '',
  `group_description` varchar(255) NOT NULL DEFAULT '',
  `group_moderator` mediumint(8) NOT NULL DEFAULT '0',
  `group_single_user` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) NOT NULL DEFAULT '0',
  `post_time` int(11) NOT NULL DEFAULT '0',
  `poster_ip` varchar(8) NOT NULL DEFAULT '',
  `post_username` varchar(25) DEFAULT NULL,
  `enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) NOT NULL DEFAULT '1',
  `post_edit_time` int(11) DEFAULT NULL,
  `post_edit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_time` (`post_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_posts_text` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bbcode_uid` varchar(10) NOT NULL DEFAULT '',
  `post_subject` varchar(60) DEFAULT NULL,
  `post_text` text,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_privmsgs` (
  `privmsgs_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `privmsgs_type` tinyint(4) NOT NULL DEFAULT '0',
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '0',
  `privmsgs_from_userid` mediumint(8) NOT NULL DEFAULT '0',
  `privmsgs_to_userid` mediumint(8) NOT NULL DEFAULT '0',
  `privmsgs_date` int(11) NOT NULL DEFAULT '0',
  `privmsgs_ip` varchar(8) NOT NULL DEFAULT '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`privmsgs_id`),
  KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  KEY `privmsgs_to_userid` (`privmsgs_to_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_privmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL DEFAULT '0',
  `privmsgs_text` text,
  PRIMARY KEY (`privmsgs_text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_ranks` (
  `rank_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` mediumint(8) NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) DEFAULT '0',
  `rank_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_search_results` (
  `search_id` int(11) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `search_array` text NOT NULL,
  `search_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_search_wordlist` (
  `word_text` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_text`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) NOT NULL DEFAULT '0',
  KEY `post_id` (`post_id`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_sessions` (
  `session_id` char(32) NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) NOT NULL DEFAULT '0',
  `session_start` int(11) NOT NULL DEFAULT '0',
  `session_time` int(11) NOT NULL DEFAULT '0',
  `session_ip` char(8) NOT NULL DEFAULT '0',
  `session_page` int(11) NOT NULL DEFAULT '0',
  `session_logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `session_admin` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_sessions_keys` (
  `key_id` varchar(32) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `last_ip` varchar(8) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_smilies` (
  `smilies_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `smile_url` varchar(100) DEFAULT NULL,
  `emoticon` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`smilies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_spam_log` (
  `log_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `log_time` int(11) NOT NULL DEFAULT '0',
  `username` varchar(25) NOT NULL DEFAULT '',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_ip` varchar(40) NOT NULL DEFAULT '',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(25) NOT NULL DEFAULT '',
  `log_triggers` text NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_themes` (
  `themes_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(30) NOT NULL DEFAULT '',
  `style_name` varchar(30) NOT NULL DEFAULT '',
  `head_stylesheet` varchar(100) DEFAULT NULL,
  `body_background` varchar(100) DEFAULT NULL,
  `body_bgcolor` varchar(6) DEFAULT NULL,
  `body_text` varchar(6) DEFAULT NULL,
  `body_link` varchar(6) DEFAULT NULL,
  `body_vlink` varchar(6) DEFAULT NULL,
  `body_alink` varchar(6) DEFAULT NULL,
  `body_hlink` varchar(6) DEFAULT NULL,
  `tr_color1` varchar(6) DEFAULT NULL,
  `tr_color2` varchar(6) DEFAULT NULL,
  `tr_color3` varchar(6) DEFAULT NULL,
  `tr_class1` varchar(25) DEFAULT NULL,
  `tr_class2` varchar(25) DEFAULT NULL,
  `tr_class3` varchar(25) DEFAULT NULL,
  `th_color1` varchar(6) DEFAULT NULL,
  `th_color2` varchar(6) DEFAULT NULL,
  `th_color3` varchar(6) DEFAULT NULL,
  `th_class1` varchar(25) DEFAULT NULL,
  `th_class2` varchar(25) DEFAULT NULL,
  `th_class3` varchar(25) DEFAULT NULL,
  `td_color1` varchar(6) DEFAULT NULL,
  `td_color2` varchar(6) DEFAULT NULL,
  `td_color3` varchar(6) DEFAULT NULL,
  `td_class1` varchar(25) DEFAULT NULL,
  `td_class2` varchar(25) DEFAULT NULL,
  `td_class3` varchar(25) DEFAULT NULL,
  `fontface1` varchar(50) DEFAULT NULL,
  `fontface2` varchar(50) DEFAULT NULL,
  `fontface3` varchar(50) DEFAULT NULL,
  `fontsize1` tinyint(4) DEFAULT NULL,
  `fontsize2` tinyint(4) DEFAULT NULL,
  `fontsize3` tinyint(4) DEFAULT NULL,
  `fontcolor1` varchar(6) DEFAULT NULL,
  `fontcolor2` varchar(6) DEFAULT NULL,
  `fontcolor3` varchar(6) DEFAULT NULL,
  `span_class1` varchar(25) DEFAULT NULL,
  `span_class2` varchar(25) DEFAULT NULL,
  `span_class3` varchar(25) DEFAULT NULL,
  `img_size_poll` smallint(5) unsigned DEFAULT NULL,
  `img_size_privmsg` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`themes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_themes_name` (
  `themes_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tr_color1_name` char(50) DEFAULT NULL,
  `tr_color2_name` char(50) DEFAULT NULL,
  `tr_color3_name` char(50) DEFAULT NULL,
  `tr_class1_name` char(50) DEFAULT NULL,
  `tr_class2_name` char(50) DEFAULT NULL,
  `tr_class3_name` char(50) DEFAULT NULL,
  `th_color1_name` char(50) DEFAULT NULL,
  `th_color2_name` char(50) DEFAULT NULL,
  `th_color3_name` char(50) DEFAULT NULL,
  `th_class1_name` char(50) DEFAULT NULL,
  `th_class2_name` char(50) DEFAULT NULL,
  `th_class3_name` char(50) DEFAULT NULL,
  `td_color1_name` char(50) DEFAULT NULL,
  `td_color2_name` char(50) DEFAULT NULL,
  `td_color3_name` char(50) DEFAULT NULL,
  `td_class1_name` char(50) DEFAULT NULL,
  `td_class2_name` char(50) DEFAULT NULL,
  `td_class3_name` char(50) DEFAULT NULL,
  `fontface1_name` char(50) DEFAULT NULL,
  `fontface2_name` char(50) DEFAULT NULL,
  `fontface3_name` char(50) DEFAULT NULL,
  `fontsize1_name` char(50) DEFAULT NULL,
  `fontsize2_name` char(50) DEFAULT NULL,
  `fontsize3_name` char(50) DEFAULT NULL,
  `fontcolor1_name` char(50) DEFAULT NULL,
  `fontcolor2_name` char(50) DEFAULT NULL,
  `fontcolor3_name` char(50) DEFAULT NULL,
  `span_class1_name` char(50) DEFAULT NULL,
  `span_class2_name` char(50) DEFAULT NULL,
  `span_class3_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`themes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(60) NOT NULL DEFAULT '',
  `topic_poster` mediumint(8) NOT NULL DEFAULT '0',
  `topic_time` int(11) NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_vote` tinyint(1) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sdm_type` char(1) DEFAULT NULL,
  `sdm_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_moved_id` (`topic_moved_id`),
  KEY `topic_status` (`topic_status`),
  KEY `topic_type` (`topic_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) NOT NULL DEFAULT '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_user_group` (
  `group_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) DEFAULT NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_user_group_copy` (
  `group_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) DEFAULT NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_users` (
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_active` tinyint(1) DEFAULT '1',
  `username` varchar(25) NOT NULL DEFAULT '',
  `user_password` varchar(32) NOT NULL DEFAULT '',
  `user_session_time` int(11) NOT NULL DEFAULT '0',
  `user_session_page` smallint(5) NOT NULL DEFAULT '0',
  `user_lastvisit` int(11) NOT NULL DEFAULT '0',
  `user_regdate` int(11) NOT NULL DEFAULT '0',
  `user_level` tinyint(4) DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_timezone` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_style` tinyint(4) DEFAULT NULL,
  `user_lang` varchar(255) DEFAULT NULL,
  `user_dateformat` varchar(14) NOT NULL DEFAULT 'd M Y H:i',
  `user_new_privmsg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_unread_privmsg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_emailtime` int(11) DEFAULT NULL,
  `user_viewemail` tinyint(1) DEFAULT NULL,
  `user_attachsig` tinyint(1) DEFAULT NULL,
  `user_allowhtml` tinyint(1) DEFAULT '1',
  `user_allowbbcode` tinyint(1) DEFAULT '1',
  `user_allowsmile` tinyint(1) DEFAULT '1',
  `user_allowavatar` tinyint(1) NOT NULL DEFAULT '1',
  `user_allow_pm` tinyint(1) NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) NOT NULL DEFAULT '1',
  `user_notify` tinyint(1) NOT NULL DEFAULT '1',
  `user_notify_pm` tinyint(1) NOT NULL DEFAULT '0',
  `user_popup_pm` tinyint(1) NOT NULL DEFAULT '0',
  `user_rank` int(11) DEFAULT '0',
  `user_avatar` varchar(100) DEFAULT NULL,
  `user_avatar_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_email` varchar(255) DEFAULT NULL,
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(100) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) DEFAULT NULL,
  `user_aim` varchar(255) DEFAULT NULL,
  `user_yim` varchar(255) DEFAULT NULL,
  `user_msnm` varchar(255) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_interests` varchar(255) DEFAULT NULL,
  `user_actkey` varchar(32) DEFAULT NULL,
  `user_newpasswd` varchar(32) DEFAULT NULL,
  `user_login_tries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_last_login_try` int(11) NOT NULL DEFAULT '0',
  `user_facebook` bigint(20) DEFAULT NULL,
  `user_livello` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nome` tinytext,
  PRIMARY KEY (`user_id`),
  KEY `user_session_time` (`user_session_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_vote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL DEFAULT '0',
  `vote_length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_vote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `vote_option_text` varchar(255) NOT NULL DEFAULT '',
  `vote_result` int(11) NOT NULL DEFAULT '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_vote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_user_id` mediumint(8) NOT NULL DEFAULT '0',
  `vote_user_ip` char(8) NOT NULL DEFAULT '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(100) NOT NULL DEFAULT '',
  `replacement` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_artista` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `Artista` tinytext,
  `discografia` mediumtext,
  `biografia` mediumtext,
  `kws` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `imdb` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_classifiche` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `Label` mediumtext,
  `LastRefresh` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_dischimese` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `ID_disco` int(25) DEFAULT NULL,
  `posizione` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_etichetta` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Etichetta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `sdml_generi` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `Genere` tinytext,
  `sezione_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB';
CREATE TABLE `sdml_locale` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_recensore` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `Recensore` varchar(250) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `ID_user` int(25) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_search` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `search` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdml_sezioni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sezione` varchar(200) DEFAULT NULL,
  `colore` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_admin_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `permission` varchar(10) DEFAULT 'false',
  `rule` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_admin_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `api_key` int(11) DEFAULT NULL,
  `requests` bigint(20) DEFAULT '0',
  `last_request` datetime DEFAULT NULL,
  `full_text` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_articoli` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `Num` int(5) DEFAULT NULL,
  `Titolo` varchar(255) DEFAULT NULL,
  `Autore` varchar(255) DEFAULT NULL,
  `Articolo` int(25) NOT NULL DEFAULT '0',
  `Link` varchar(255) DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  `Artista` int(25) NOT NULL DEFAULT '0',
  `Genere1` int(25) NOT NULL DEFAULT '0',
  `Genere2` int(25) NOT NULL DEFAULT '0',
  `Genere3` int(25) NOT NULL DEFAULT '0',
  `Text` longtext,
  `kws` mediumtext,
  `keywords` tinytext,
  `description` tinytext,
  `type` char(1) DEFAULT 'a',
  `active` int(1) DEFAULT '0',
  `img` tinytext,
  `voto` int(1) DEFAULT NULL,
  `Mail` varchar(200) DEFAULT NULL,
  `Recensore` int(25) DEFAULT NULL,
  `Recensore2` int(25) NOT NULL DEFAULT '0',
  `Mailto` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `Genere1` (`Genere1`),
  KEY `url` (`url`),
  FULLTEXT KEY `Titolo` (`Titolo`,`kws`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_bacheca` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `artista` int(25) DEFAULT NULL,
  `titolo` mediumtext,
  `anno` int(4) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `stato` int(1) DEFAULT '0',
  `data_prenotazione` date DEFAULT NULL,
  `utente` int(25) DEFAULT '0',
  `descrizione` longtext,
  `uscita` date DEFAULT NULL,
  `label` varchar(200) DEFAULT NULL,
  `data_inserzione` date DEFAULT NULL,
  `urgenza` int(2) DEFAULT '5',
  `imdb` varchar(100) NOT NULL,
  `ftid` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_calendar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `artista` int(11) DEFAULT NULL,
  `locale` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_classifica_anno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recensione_id` int(11) DEFAULT NULL,
  `recensore_id` int(11) DEFAULT NULL,
  `voto` tinyint(2) DEFAULT NULL,
  `commento` blob,
  `selected` int(1) DEFAULT '0',
  `anno` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_classifiche` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `ID_CL` int(25) DEFAULT NULL,
  `Artista` mediumtext,
  `Disco` longtext,
  `TotVoto` double DEFAULT NULL,
  `NumVoti` int(11) DEFAULT NULL,
  `LastRefresh` datetime DEFAULT NULL COMMENT 'AAAAMMGG',
  `LastPosition` int(11) DEFAULT NULL,
  `LastMove` char(1) DEFAULT 's' COMMENT 's=new entry, u=salita, d=discesa, n=stabile',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_comments` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(250) DEFAULT NULL,
  `ID_user` int(25) DEFAULT NULL,
  `NAME_user` varchar(100) DEFAULT NULL,
  `text` longblob,
  `active` int(1) DEFAULT NULL,
  `type` char(2) DEFAULT NULL,
  `ID_obj` int(25) DEFAULT NULL,
  `ID_response` int(25) DEFAULT NULL,
  `data_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `voto` char(2) DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_comments_copy` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(250) DEFAULT NULL,
  `ID_user` int(25) DEFAULT NULL,
  `NAME_user` varchar(100) DEFAULT NULL,
  `text` longblob,
  `active` int(1) DEFAULT NULL,
  `type` char(2) DEFAULT NULL,
  `ID_obj` int(25) DEFAULT NULL,
  `ID_response` int(25) DEFAULT NULL,
  `data_post` datetime NOT NULL,
  `voto` char(2) DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `note` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `news` mediumtext,
  `author` varchar(200) DEFAULT NULL,
  `data_news` datetime DEFAULT NULL,
  `artista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opt` varchar(20) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_recensioni` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `Num` int(5) DEFAULT NULL,
  `Tipo` enum('film','serie') NOT NULL DEFAULT 'film',
  `Titolo_Disco` varchar(255) DEFAULT NULL,
  `Titolo` varchar(255) DEFAULT NULL,
  `Articolo` int(25) NOT NULL,
  `Autore` varchar(255) DEFAULT NULL,
  `Link` varchar(255) DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  `Uscita` date DEFAULT NULL,
  `Artista` int(25) NOT NULL DEFAULT '0',
  `Genere1` int(25) NOT NULL DEFAULT '0',
  `Genere2` int(25) NOT NULL DEFAULT '0',
  `Genere3` int(25) NOT NULL DEFAULT '0',
  `Text` longtext,
  `kws` mediumtext,
  `keywords` tinytext,
  `description` tinytext,
  `type` char(1) DEFAULT 'r',
  `active` int(1) DEFAULT '0',
  `img` tinytext,
  `data_disco` year(4) DEFAULT NULL,
  `data_recensione` date DEFAULT NULL,
  `voto` int(5) DEFAULT NULL,
  `Mail` varchar(200) DEFAULT NULL,
  `Etichetta` varchar(200) DEFAULT NULL,
  `Recensore` int(25) DEFAULT NULL,
  `Recensore2` int(25) NOT NULL DEFAULT '0',
  `Mailto` mediumtext,
  `imdb` varchar(255) DEFAULT '-1',
  `tracks` mediumtext,
  `nazione` varchar(255) DEFAULT NULL,
  `runtime` varchar(255) DEFAULT NULL,
  `sceneggiatura` mediumtext,
  `produzione` mediumtext,
  `musiche` mediumtext,
  `plot` mediumtext,
  `youtube` varchar(255) DEFAULT NULL,
  `filmtrailer_ID` int(6) NOT NULL DEFAULT '0',
  `soundtracks` mediumtext,
  `ownair` tinytext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Genere1` (`Genere1`),
  KEY `url` (`url`),
  FULLTEXT KEY `Titolo` (`Titolo`,`kws`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_users_options` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) DEFAULT NULL,
  `user_bio` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_voti` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `value` double DEFAULT NULL,
  `tot` int(25) DEFAULT NULL,
  `tipo` varchar(5) DEFAULT NULL,
  `ID_obj` int(25) DEFAULT NULL,
  `ID_users` blob,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `sdmt_voti_new` (
  `ID` int(25) NOT NULL AUTO_INCREMENT,
  `value` double DEFAULT NULL,
  `tot` int(25) NOT NULL DEFAULT '1',
  `tipo` varchar(5) NOT NULL DEFAULT 'r',
  `ID_obj` int(25) DEFAULT NULL,
  `ID_user` int(25) DEFAULT NULL,
  `quando` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
