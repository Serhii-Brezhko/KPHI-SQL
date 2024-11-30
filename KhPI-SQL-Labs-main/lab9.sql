-- 1 DB creation
create database if not exists metro_map;
use metro_map;

-- 2.1 Metro Lines Table
create table metro_lines (
    id int auto_increment primary key,
    name varchar(255) not null,
    color varchar(7) not null comment 'Колір лінії (Hex-код)',
    unique (name)
);

-- 2.2 Stations Table
create table stations (
    id int auto_increment primary key,
    name varchar(255) not null,
    unique (name)
);

-- 2.3 Line Links Table
create table station_line_links (
    id int auto_increment primary key,
    station_id int not null,
    line_id int not null,
    numstation int not null comment 'Station number on line',
    foreign key (station_id) references stations(id) on delete cascade,
    foreign key (line_id) references metro_lines(id) on delete cascade,
    unique (station_id, line_id), -- Makes it, so that station can only connect to only 1 line
    unique (line_id, numstation) -- Ensures unique order of stations on line
);

-- 2.4 Station connections Table
create table station_connections (
    id int auto_increment primary key,
    station1_id int not null,
    station2_id int not null,
    connection_type enum('transition', 'track') not null comment 'Conection type: transition or колія',
    foreign key (station1_id) references stations(id) on delete cascade,
    foreign key (station2_id) references stations(id) on delete cascade,
    check (station1_id != station2_id)
);

-- 3 Preinstalled stations and lines
-- 3.1 Metro Lines
insert into metro_lines (name, color) values
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Green', '#008000');

-- 3.2 Stations
insert into stations (name) values
('Холодна гора'),
('Південний вокзал'),
('Центральний ринок'),
('Майдан Конституції'),
('Проспект Гагаріна'),
('Спортивна'),
('Метробудівників'),
('Завод імені Малишева'),
('Ім. О. С. Масельського'),
('Тракторний завод'),
('Індустріальна'),
('Героїв Праці'),
('Студентська'),
('Академіка Павлова'),
('Академіка Барабашова'),
('Київська'),
('Пушкінська'),
('Історичний музей'),
('Університет'),
('Наукова'),
('Ботанічний сад'),
('23 Серпня'),
('Олексіївська'),
('Перемога');

-- 3.3 Red Line
insert into station_line_links (station_id, line_id, numstation) values
(1, 1, 1),  -- Холодна гора
(2, 1, 2),  -- Південний вокзал
(3, 1, 3),  -- Центральний ринок
(4, 1, 4),  -- Майдан Конституції
(5, 1, 5),  -- Проспект Гагаріна
(6, 1, 6),  -- Спортивна
(7, 1, 7),  -- Метробудівників
(8, 1, 8),  -- Завод імені Малишева
(9, 1, 9),  -- Ім. О. С. Масельського
(10, 1, 10), -- Тракторний завод
(11, 1, 11); -- Індустріальна

-- 3.4 Blue Line
insert into station_line_links (station_id, line_id, numstation) values
(12, 2, 1),  -- Героїв Праці
(13, 2, 2),  -- Студентська
(14, 2, 3),  -- Академіка Павлова
(15, 2, 4),  -- Академіка Барабашова
(16, 2, 5),  -- Київська
(17, 2, 6),  -- Пушкінська
(18, 2, 7);  -- Історичний музей

-- 3.5 Green Line
insert into station_line_links (station_id, line_id, numstation) values
(24, 3, 1),  -- Перемога
(23, 3, 2),  -- Олексіївська
(22, 3, 3),  -- 23 Серпня
(21, 3, 4),  -- Ботанічний сад
(20, 3, 5),  -- Наукова
(19, 3, 6),  -- Університет
(18, 3, 7);  -- Історичний музей

-- 4
insert into station_connections (id, station1_id, station2_id, connection_type) values 
(1, 4, 18, 'transition');