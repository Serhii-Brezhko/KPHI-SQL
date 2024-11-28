-- 1 Check
drop table if exists Users;
drop table if exists Projects;
drop table if exists ProjectUsers;
drop table if exists Tasks;
drop table if exists TaskExecutors;
drop table if exists Files;

-- 2 Database Creation
drop database if exists TaskManagement;
create database TaskManagement;
use TaskManagement;

-- 3.1 Users Table
create table Users (
    Userid int auto_increment primary key,
    UserName varchar(63) not null,
    Email varchar(255) unique not null,
    CreatedAt timestamp default current_timestamp
);

-- 3.2 Projects Table
create table Projects (
    ProjectID int auto_increment primary key,
    ProjectName varchar(255) not null,
    Description text,
    CreatedAt timestamp default current_timestamp,
    UpdatedAt timestamp default current_timestamp on update current_timestamp
);

-- 3.3 ProjectsUsers Table
create table ProjectUsers (
    ProjectID int,
    UserID int,
    Role enum('author', 'executor') not null,
    AddedAt timestamp default current_timestamp,
    primary key (ProjectID, UserID),
    foreign key (ProjectID) references Projects(ProjectID) on delete cascade,
    foreign key (UserID) references Users(UserID) on delete cascade
);

-- 3.4 Tasks Table
create table Tasks (
    TaskID int auto_increment primary key,
    ProjectID int,
    TaskName varchar(255) not null,
    Description text,
    AuthorID int,
    Status enum('pending', 'in_progress', 'completed') DEFAULT 'pending',
    CreatedAt timestamp default current_timestamp,
    UpdatedAt timestamp default current_timestamp on update current_timestamp,
    foreign key (ProjectID) references Projects(ProjectID) on delete cascade,
    foreign key (AuthorID) references Users(UserID) on delete set null
);

-- 3.5 TaskExecutors Table
create table TaskExecutors (
    TaskID int,
    UserID int,
    AssignedAt timestamp default current_timestamp,
    primary key (TaskID, UserID),
    foreign key (TaskID) references Tasks(TaskID) on delete cascade,
    foreign key (UserID) references Users(UserID) on delete cascade
);

-- 3.6 Files Table
create table Files (
    FileID int auto_increment primary key,
    ProjectID int,
    TaskID int,
    FilePath varchar(255) not null,
    UploadedAt timestamp default current_timestamp,
    foreign key (ProjectID) references Projects(ProjectID) on delete cascade,
    foreign key (TaskID) references Tasks(TaskID) on delete cascade
);


-- 4 Preinserted Tables information as examples
insert into Users (Userid, UserName, Email, CreatedAt) values 
(1, 'Oleg Tinkoff',       'OlegBANK.Tinkoff@gmail.com',    '2023-06-27 09:30:00'),
(2, 'Arkadiy Ukupnik',    'ArkadiyUkupnik.VEVO@gmail.com', '2024-05-06 14:45:00'),
(3, 'Jake Paul',          'Jake.PaulREAL@gmail.com',       '2023-11-28 15:25:00'),
(4, 'Roman Filchemenkof', 'Filchemenkof.Roma@gmail.com',   '2023-05-02 16:15:00');

insert into Projects (ProjectID, ProjectName, Description, CreatedAt, UpdatedAt) values
(1, 'CRM-system development',    'CRM development for controlling users and sales',  '2023-06-27 10:50:00', '2023-11-16 18:25:00'),
(2, 'New track',                 'Track writing for a new album',                    '2024-05-06 15:35:00', null),
(3, 'Website for Internet-shop', 'New-gen site for saling clothes - "Mirohodec.ru"', '2023-07-02 17:20:00', null);

insert into ProjectUsers (ProjectID, UserID, Role, AddedAt) values
(1, 1, 'author',   '2023-06-27 10:30:00'),
(1, 4, 'executor', '2024-06-27 11:25:00'),
(2, 2, 'author',   '2024-05-06 15:35:00'),
(2, 3, 'executor', '2023-05-07 12:40:00'),
(3, 4, 'author',   '2023-07-02 17:00:00'),
(3, 3, 'executor', '2023-07-16 14:05:00');

insert into Tasks (TaskID, ProjectID, TaskName, Description, AuthorID, Status, CreatedAt, UpdatedAt) values
(1, 1, 'DB settings',        'Creating structure for DB and CRM',       1, 'pending',     '2023-06-27 11:00:00', null),
(2, 1, 'API Development',    'Making REST API for DB interactions',     1, 'in_progress', '2023-07-05 09:30:00', '2023-07-17 17:25:00'),
(3, 2, 'Text for new track', 'Writing text for track in the new album', 2, 'pending',     '2024-05-06 15:30:00', null),
(4, 3, 'Hosting setting up', 'Hosting site on a separate server',       4, 'completed',   '2023-07-16 14:10:00', '2023-09-25 16:30:00');

insert into TaskExecutors (TaskID, UserID, AssignedAt) values
(1, 4, '2024-07-01 15:00:00'),
(2, 3, '2023-06-27 13:30:00'),
(3, 3, '2023-07-16 14:05:00');

insert into Files (FileID, ProjectID, TaskID, FilePath, UploadedAt) values
(1, 1, null, '/files/projects/crm_overview.pdf',             '2023-06-27 10:30:00'),
(2, 1, 1,    '/files/tasks/db_schema.sql',                   '2023-07-04 09:00:00'),
(3, 2, 3,    '/files/tasks/song_lyrics_draft.docx',          '2024-05-06 16:00:00'),
(4, 3, 4,    '/files/tasks/hosting_configuration_guide.pdf', '2023-07-16 15:00:00'),
(5, 3, null, '/files/projects/shop_design_mockup.zip',       '2023-07-02 17:00:00')