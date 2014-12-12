create database postfix;
use postfix;

CREATE TABLE `domain` (
  `domain` varchar(255) NOT NULL default '',
  `actif` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`domain`)
) ENGINE=MyISAM COMMENT='Postfix Admin - Domaines Virtuels';

CREATE TABLE `mailbox` (
  `email` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `quota` int(10) NOT NULL default '0',
  `actif` tinyint(1) NOT NULL default '1',
  `imap` tinyint(1) NOT NULL default '1',
  `pop3` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`email`)
) ENGINE=MyISAM COMMENT='Postfix Admin - Boites Emails Virtuelles';

CREATE TABLE `alias` (
  `source` varchar(255) NOT NULL default '',
  `destination` text NOT NULL,
  `actif` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`source`)
) ENGINE=MyISAM COMMENT='Postfix Admin - Alias Virtuels';

GRANT SELECT ON `postfix`.* TO 'postfix'@'%' IDENTIFIED BY 'admin';
FLUSH PRIVILEGES;
exit;