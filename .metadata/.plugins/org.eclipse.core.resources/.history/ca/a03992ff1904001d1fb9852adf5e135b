create database movie_project;

create table user(
	user_id varchar(20) not null,
    user_pw varchar(30) not null,
    user_name varchar(10) not null,
    user_phone varchar(15) not null,
    user_email varchar(50) not null,
    user_coupon varchar(50) null,
    user_date datetime,
    user_class varchar(10) default 'bronze',
    primary key(user_id),
	foreign key (user_coupon) references coupon (coupon_code)
);

create table movie(
	movie_code int auto_increment,
    movie_title varchar(50) not null,
    movie_date datetime,
    movie_genre varchar(50) not null,
    movie_grade int not null,
    movie_director varchar(30) null,
    movie_actor varchar(100) null,
    movie_time int not null,
    movie_board varchar(200) null,
    movie_img varchar(100),
    movie_like int default 0,
    primary key (movie_code)
);

create table notice(
	notice_code int auto_increment,
    notice_title varchar(50) ,
    notice_content varchar(200) ,
    notice_date datetime,
    notice_hit int,
    primary key (notice_code)
);

create table coupon(
	coupon_code varchar(50) not null,
	coupon_form varchar(20) not null,
	coupon_give datetime not null,
	coupon_end datetime not null,
	primary key(coupon_code)
);