create database tkt_booking;
use tkt_booking;

-- register data  
create table signup (
sid int primary key auto_increment,
email varchar(300) unique not null,
first_name varchar(350) not null,
last_name varchar(350) null,
mobile varchar(15) not null,
password varchar(100) not null
);

alter table signup
modify last_name varchar(350) null default "";

insert into signup(email,first_name,mobile,password) 
values("radha5@gmail.com","radha","lolly","+91 9089020390","defaultpass"); 

insert into signup(email,first_name,mobile,password)
values("radh0@gmail.com","radha","+91 9089020390","defaultpassword"),
("ra509@gmail.com","riya","+91 9089090390","deltpassword");

select * from signup;

-- movies and theatres data
create table movies (
mid int primary key auto_increment,
poster varchar(500) not null unique,
title varchar(350) not null unique,
rating varchar(100) not null,
language varchar(250) not null,
duration varchar(50) not null,
genre varchar(150) not null,
certification varchar(90) not null,
summary varchar(600) null,
cast varchar(350) not null,
reviews varchar(200) null
)auto_increment=1001;

insert into movies(poster,title,rating,language,duration,genre,certification,summary,cast,reviews)
values ("https://encrypted-tbn0.gstatic.com/images q=tbn:ANd9GcR4YX41aXPvObz3NY7Zf44qK6LlQGA0gsnmqA&s","Crayon Shin-chan the Movie: Super Hot! The Spicy Kasukabe Dancers","8.8/10 (89k+ votes)","Telugu,Tamil,Hindi,Japanese","2h 35min","Action,Comedy,Adventure","u","After the Kasukabe Defence Force wins a trip to India, Shinnosuke and Bo-chan enter a suspicious general store and find a backpack that holds a terrifying secret.","Kento Kaku,Toshiyuki Morikawa,Satomi Kōrogi",""),
("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq8eiRxKhNlimzGKM6RkJ-WF0CsIZ5x5MxVw&s","Demon Slayer: Kimetsu no Yaiba Infinity Castle","9.5/10 (300k+ votes)","Telugu,Tamil,Hindi,Japanese","2h 53min","Action,,Adventure","u","Tanjiro Kamado and other members of the Demon Slayer Corps find themselves in an epic battle at Infinity Castle.","Kana Hanazawa,Saori Hayami,Natsuki Hanae,Mamoru Miyano,Akira Ishida","After such a long wait, Demon Slayer: Infinity Castle finally arrived — and I can honestly say it was worth every second."),
("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSlacjk-N2t0Ool13mp3eZJAHGCfN-ce_J6qt6BsL08mYbzeJetpHS2kTjRzy8kZMVHdP_OnA","Chainsaw Man - The Movie: Reze Arc","8.7/10 (150k+ votes)","Hindi,Japanese","2h 15min","Action,Comedy","ua",null,"Kikunosuke Toya,Tomori Kusunoki",null),
("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc1wRH-F9T9hqurHuDoBw-9QtbPISgILytGw&s","Your Name","9.7/10 (450k+ votes)","English,Hindi,Japanese","2h 27min","Romance,Fantasy,Supernatural,Drama","ua","Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.","Ryuunosuke Kamiki,Masami Nagasawa,Mone KamishiraishiEtsuko Ichihara",null);

select * from movies;

create table theatres (
tid int primary key auto_increment,
show_day varchar(100) not null,
name varchar(250) not null,
show_time varchar(100) not null,
price varchar(90) not null,
mid int,
foreign key(mid) references movies(mid)
);

insert into theatres(mid,show_day,name,show_time,price)
values(1001,"Sat 25 oct","INOX: varun beach,beach road","07:55pm,10:50pm","$100 - $200,$200 - $300"),
(1002,"Sun 26 oct","INOX: CMR central,maddilapalem","07:55pm,09:50pm","$100 - $200,$200 - $300"),
(1003,"Mon 27 oct","INOX: varun beach,beach road","01:55pm,10:50pm","$100 - $200,$200 - $300"),
(1004,"Tue 26 oct","Sree Kanya cinemas:Gajuwaka","02:55pm,08:10pm","$100 - $200,$200 - $300");

select * from theatres;

select * from movies inner join theatres on movies.mid=theatres.mid;
