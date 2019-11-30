/*
Example data for inventory display:
insert into product values (12345678, 'item', 'hypo', 10, 10);
insert into location values (1234, 'Willys', '123 idgaf ave', '1234567890');
insert into inventory values (1234, 12345678, 666);
insert into employee values (1234, 'Dom', 9);
insert into employees values (1234, 1234, "clerk");
*/
drop table if exists product;
create table product
	(SKU		numeric(8,0) not null,
	 p_name		varchar(20),
	 p_type		varchar(5),
	 price		numeric(5,0),
	 p_size 	numeric(5,0),
	 primary key (SKU)
	);
drop table if exists distributor;
create table distributor
	(dist_ID	numeric(4,0) not null,
	 d_name		varchar(15),
	 address	varchar(30),
	 phone		varchar(10),
	 primary key (dist_ID)
	);
drop table if exists employee;
create table employee
	(ID			numeric(4,0) not null,
	 e_name		varchar(30),
	 pay		numeric(4,0) check (pay > 8.1),
	 primary key (ID)
	);
drop table if exists location;
create table location
	(storenum	numeric(4,0) not null,
	 l_name		varchar(20),
	 address	varchar(30),
	 phone		varchar(10),
	 primary key (storenum)
	);
drop table if exists inventory;
create table inventory
	(storenum	numeric(4,0) not null,
     SKU		numeric(8,0),
	 no_item	numeric(10,0),
	 primary key (storenum, SKU),
	 foreign key (storenum) references location(storenum),
	 foreign key (SKU) references product(SKU)
	);
drop table if exists orders;
create table orders
	(ordernum	varchar(5) not null,
	 dist_ID	numeric(4,0),
	 storenum	numeric(4,0),
	 primary key (ordernum),
	 foreign key (dist_ID) references distributor(dist_ID),
	 foreign key (storenum) references location(storenum)
	);
drop table if exists employees;
create table employees
	(ID		numeric(4,0),
	 storenum	numeric(4,0),
	 role		varchar(20),
	 primary key (ID),
	 foreign key (ID) references employee(ID),
	 foreign key (storenum) references location(storenum)
	);
drop table if exists order_amount;
create table order_amount
	(ordernum	varchar(5),
	 SKU		numeric(8,0),
	 no_item	numeric(10,0),
	 primary key (ordernum),
	 foreign key (ordernum) references orders(ordernum),
	 foreign key (SKU) references product(SKU)
	);
