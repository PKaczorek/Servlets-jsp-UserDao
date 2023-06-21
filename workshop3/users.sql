create table workshop3.users
(
    id       int auto_increment
        unique,
    username varchar(255) not null,
    email    varchar(255) not null,
    password varchar(65)  not null
        primary key
);

