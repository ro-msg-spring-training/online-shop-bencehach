drop table if exists adresa;
drop table if exists category;
drop table if exists hibernate_sequence;
drop table if exists location;
drop table if exists order_detail;
drop table if exists orders;
drop table if exists product;
drop table if exists revenue;
drop table if exists roles;
drop table if exists stock;
drop table if exists user;
create table adresa (id integer not null, city varchar(255), country varchar(255), street varchar(255), location_id integer, orders_id integer, primary key (id)) engine=InnoDB;
create table category (product_category_id integer not null, description varchar(255), name varchar(255), primary key (product_category_id)) engine=InnoDB;
create table hibernate_sequence (next_val bigint) engine=InnoDB;
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
create table location (id integer not null, name varchar(255), primary key (id)) engine=InnoDB;
create table order_detail (id integer not null, product_id integer, quantity integer, order_id integer, primary key (id)) engine=InnoDB;
create table orders (id integer not null, created_at datetime, shipped_from_id integer, user_user_id integer, primary key (id)) engine=InnoDB;
create table product (product_id integer not null, description varchar(255), image varchar(255), name varchar(255), price decimal(19,2), weight double precision, product_category_product_category_id integer, primary key (product_id)) engine=InnoDB;
create table revenue (id integer not null, local_date datetime, sum decimal(19,2), location_id integer, primary key (id)) engine=InnoDB;
create table roles (role_id integer not null, role_name varchar(255), primary key (role_id)) engine=InnoDB;
create table stock (id integer not null, quantity integer, location_id integer, product_product_id integer, primary key (id)) engine=InnoDB;
create table user (user_id integer not null, email_address varchar(255), fist_name varchar(255), last_name varchar(255), password varchar(255), username varchar(255), role_role_id integer, primary key (user_id)) engine=InnoDB;
alter table adresa add constraint FK4u8gcsae3t3r692h5793sul8f foreign key (location_id) references location (id);
alter table adresa add constraint FKlqmr2e5qengk9aefu3rfxahvk foreign key (orders_id) references orders (id);
alter table order_detail add constraint FKrws2q0si6oyd6il8gqe2aennc foreign key (order_id) references orders (id);
alter table orders add constraint FKftf58a58sqnkcw7h7b5dbmgst foreign key (shipped_from_id) references location (id);
alter table orders add constraint FKcooejujh32cpgw33d02snbufy foreign key (user_user_id) references user (user_id);
alter table product add constraint FKdeb2o4e1j6k1ehuky2ht9te9l foreign key (product_category_product_category_id) references category (product_category_id);
alter table revenue add constraint FK6xukepd8ssa1ok6iakkhp83p7 foreign key (location_id) references location (id);
alter table stock add constraint FK6t3m0kaf6fubuus331gf7xmn8 foreign key (location_id) references location (id);
alter table stock add constraint FKrwdkwjf037066qtbpq0pg0h6n foreign key (product_product_id) references product (product_id);
alter table user add constraint FK4keqlw3ucfmfsbeu8r1ijdppf foreign key (role_role_id) references roles (role_id);
