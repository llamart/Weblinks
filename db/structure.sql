create database if not exists weblinks character set utf8 collate utf8_unicode_ci;
use weblinks;

grant all privileges on weblinks.* to 'weblinks_user'@'localhost' identified by 'secret';

drop table if exists t_link;
drop table if exists t_user;
drop table if exists t_theme;

create table t_user (
    usr_id integer not null primary key auto_increment,
    usr_name varchar(50) not null,
    usr_password varchar(88) not null,
    usr_salt varchar(23) not null,
    usr_role varchar(50) not null
) engine=innodb character set utf8 collate utf8_unicode_ci;

create table t_link (
    lin_id integer not null primary key auto_increment,
    lin_title varchar(500) not null,
    lin_url varchar(200) not null,
    usr_id integer not null,
    constraint fk_lin_usr foreign key(usr_id) references t_user(usr_id)
) engine=innodb character set utf8 collate utf8_unicode_ci;
