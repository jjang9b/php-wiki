<pre><code class="sql">
insert into mysql.user (host, user, password, ssl_cipher, x509_issuer, x509_subject) values( 'localhost', 'root', password('root'), 0, 0, 0);


CREATE TABLE `t_char` (
`user_idx` bigint(20) NOT NULL,
`char_idx` bigint(20) NOT NULL,
`item_idx` bigint(20) NOT NULL,
`item_add_idx` bigint(20) NOT NULL,
`lev` int(11) NOT NULL,
`exp_count` int(11) NOT NULL,
`reg_dt` datetime NOT NULL,
PRIMARY KEY (`user_idx`,`char_idx`),
UNIQUE KEY `char_idx_UNIQUE` (`char_idx`),
UNIQUE KEY `item_add_idx_UNIQUE` (`item_add_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `t_char_prop` (
`user_idx` bigint(20) NOT NULL,
`char_idx` bigint(20) NOT NULL,
`prop_idx` bigint(20) NOT NULL,
`prop_val` varchar(10) NOT NULL,
`reg_dt` datetime NOT NULL,
PRIMARY KEY (`user_idx`,`char_idx`,`prop_idx`),
UNIQUE KEY `char_idx_UNIQUE` (`char_idx`),
UNIQUE KEY `user_idx_UNIQUE` (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `t_char_stat_mst` (
`char_idx` bigint(20) NOT NULL,
`att` varchar(10) NOT NULL,
`def` varchar(10) NOT NULL,
`magic_att` varchar(10) NOT NULL,
`magic_def` varchar(10) NOT NULL,
`avoid` varchar(10) NOT NULL,
`hit` varchar(10) NOT NULL,
`att_speed` varchar(10) NOT NULL,
`fatal` varchar(10) NOT NULL,
PRIMARY KEY (`char_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `t_user` (
`user_idx` bigint(20) NOT NULL,
`id` varchar(15) NOT NULL,
`passwd` varchar(45) NOT NULL,
`reg_dt` datetime NOT NULL,
PRIMARY KEY (`user_idx`,`id`),
UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

</code></pre>