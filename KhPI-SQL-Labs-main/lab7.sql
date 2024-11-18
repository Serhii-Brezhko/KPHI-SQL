-- 1 Check  
drop table if exists comments;  
drop table if exists ratings;  
drop table if exists articles;  
drop table if exists categories;  
  
  
-- 2 Category Table  
create table categories (  
   id int auto_increment primary key,  
   name varchar(100) not null unique 
);  
  
  
-- 3 Article Table  
create table articles (  
   id int auto_increment primary key,  
   category_id int not null, -- Link  
   title varchar(255) not null, -- Header  
   content text not null, -- Article content  
   publication_date timestamp default current_timestamp, -- Publication date  
   update_date timestamp default current_timestamp on update current_timestamp, -- Update date  
   foreign key (category_id) references categories(id) on delete cascade  
);  
  
  
-- 4 Commentaries Table  
create table comments (  
   id int auto_increment primary key,  
   article_id int not null, -- Link to article  
   user_name varchar(100) not null, -- Comment Username  
   comment text not null, -- Comment text  
   comment_date timestamp default current_timestamp, -- Comment date  
   foreign key (article_id) references articles(id) on delete cascade  
);  
  
  
-- 5 Rating Table  
create table ratings (  
   id int auto_increment primary key,  
   article_id int not null, -- Article link  
   ip_address varchar(45) not null, -- User's IP  
   rating tinyint not null check (rating between 1 and 5), -- Rating from 1 to 5  
   rating_date timestamp default current_timestamp, -- Rating date  
   unique (article_id, ip_address), -- Restriction to single IP  
   foreign key (article_id) references articles(id) on delete cascade  
);  
  
  
-- 2.1 Category inserting  
insert into categories (name) values  
('Technology'), 
('Health'), 
('Sports'), 
('Cinema'), 
('Politics'); 
  
  
-- 2.2 Articles inserting  
insert into articles (category_id, title, content, publication_date, update_date) values  
(1, 'Scientist’s at Nichia made QLED more affordable with cheaper structure',  
'In the past years new LED technology struck with more Vibrant colors...',  
'2024-11-01 13:50:00', '2024-11-03 15:26:51'),  
  
(2, 'How to Stay Healthy During the Winter',  
'As the Winter gets closer, we need to focus on our...',  
'2024-11-21 13:00:00', 'never updated'),  
  
(3, 'Top 10 Football Teams in the World',  
'Football is the most popular sport, the tension for the best of the best is insane...',  
'2024-11-17 19:00:00', 'never updated'),  
  
(4, 'Long awaited Disney’s Cartoon will release this week!',  
'Way back in November 16th 2016, Disney released "Moana", and soonely we’ll get a sequel...',  
'2024-11-25 14:00:00', 'never updated'),  
  
(5, 'US presidential elections were more confusing than we thought',  
'Few days ago last elections ended with Trump getting most of the votes...',  
'2024-11-09 11:25:00', '2024-11-09 14:26:51');  
  
  
-- 2.3 Comments inserting  
insert into comments (article_id, user_name, comment) values  
(1, 'Shuji Nakamura',  
'Thats a great article about our work, thank you! - Shuji Nakamura!'),  
  
(1, 'Jape Paul',  
'I’ve always dreamt about new TV with vibrant colors, but now it slowly turns into reality! :D Amazing article!'),  
  
(2, 'Arkadiy Ukupnik',  
'That’s some pretty cool tips, it’s always hard to stay healthy in winter, thank you!.'),  
  
(2, 'TheLastSurvivor',  
'Cool article, but some tips are not that useful.'),  
  
(3, 'SpartakIsTheGOAT',  
'Nice list, can’t wait to see how my team performs this season, sadly it’s not in the list...'),  
  
(3, 'Lionel Messi',  
'Cool article, but the team on the 2nd place is overrated in my opinion.'),  
  
(4, 'KinoHot',  
'Excited for the next part, I could also make a 
cool short-review about it!'),  
  
(4, 'CliffHanger',  
'I agree with the @KinoHot, Would love to watch the review after watching the Cartoon!.'),  
  
(5, 'Joe Biden',  
'Yes, sometimes the elections are more confusing than my speeches. Cool article!'),  
  
(5, 'Barack Obama',  
'IMPO, the system definitely needs some reworking. The comment on top is true');  
  
  
-- 2.4 Ratings inserting  
insert into ratings (article_id, ip_address, rating) values  
(1, '192.168.1.1', 5),  
(1, '192.168.1.2', 5),  
(2, '192.168.1.3', 5),  
(2, '192.168.1.4', 3),  
(3, '192.168.1.5', 5),  
(3, '192.168.1.6', 3),  
(4, '192.168.1.7', 5),  
(4, '192.168.1.8', 5),  
(5, '192.168.1.9', 4),  
(5, '192.168.1.10', 4);