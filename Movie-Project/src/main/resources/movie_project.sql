create database movie_project character set = utf8;
use movie_project;

create table coupon(
        coupon_code varchar(50) not null,
        coupon_form varchar(20) not null,
        coupon_give date not null,
        coupon_end date not null,
        coupon_id varchar(20) null,
        coupon_flag boolean default true,
        primary key(coupon_code)
);

create table user(
        user_id varchar(20) not null,
    user_pw varchar(30) not null,
    user_name varchar(10) not null,
    user_jumin varchar(15) not null,
    user_phone varchar(15) not null,
    user_email varchar(50) not null,
    user_date date,
    user_class varchar(10) default 'bronze',
    primary key(user_id)
);

create table movie(
        movie_code int auto_increment,
    movie_title varchar(50) not null,
    movie_date date,
    movie_genre varchar(50) not null,
    movie_grade int not null,
    movie_director varchar(30) null,
    movie_actor varchar(100) null,
    movie_time int not null,
    movie_board varchar(500) null,
    movie_img varchar(100),
    movie_like int default 0,
    movie_flag boolean default false,
    primary key (movie_code)
);

create table notice(
        notice_code int auto_increment,
    notice_title varchar(50) ,
    notice_content varchar(300) ,
    notice_date datetime,
    notice_hit int,
    primary key (notice_code)
);

create table ask(
   ask_code int auto_increment,
   ask_id varchar(50) not null,
   ask_title varchar(100) not null,
   ask_content varchar(1000) not null,
   ask_hit int not null,
   ask_date datetime not null,
   ask_re_content varchar(1000),
   ask_re_date datetime,
   primary key(ask_code),
   foreign key(ask_id) references user (user_id)
);

create table screen(
   scr_code int auto_increment,
   scr_movie int not null,
   scr_seat varchar(500) not null,
   scr_screen varchar(10) not null,
   scr_time time not null,
   scr_date date not null, 
   scr_flag boolean default false,
   primary key(scr_code),
   foreign key(scr_movie) references movie(movie_code)
);



create table ticket(
   tic_num int auto_increment,
   tic_code int,
   tic_id varchar(20),
   tic_seat varchar(100),
   tic_payment int,
   tic_paytime datetime,
   primary key(tic_num),
   foreign key(tic_code) references screen (scr_code),
   foreign key(tic_id) references user(user_id)
);

create table review(
   review_code int auto_increment,
   review_id varchar(20) not null,
   review_movie int not null,
   review_star float not null,
   review_date datetime,
   review_content varchar(1000) not null,
   primary key(review_code),
   foreign key(review_id) references user (user_id),
   foreign key(review_movie) references movie(movie_code)
);

create table event(
        event_code int auto_increment,
    event_title varchar(50) not null,
    event_content varchar(300) not null,
    event_date datetime not null,
    event_hit int null,
    event_if varchar(10) null,
    event_ticket int not null,
    event_win varchar(500) null,
    primary key (event_code)
);