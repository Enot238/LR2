
create table if not exists shopper (ID_shopper int generated always as identity primary key, --cтворюється таблиця Покупець з головним полем код покупця який автомаично заповнюється лічильником
    first_name varchar(44),
    last_name varchar(44),
    surname varchar(44),
    phone_shopper varchar(15) 
);


create table if not exists seller (ID_seller int generated always as identity primary key,--cтворюемо таблицю Продавець з головним полем код_продавця який автомаично заповнюється лічильником
	first_name varchar(44),
    last_name varchar(44),
    surname varchar(44),
    sex varchar(10),
    phone_seller varchar(15),
    address varchar(150) default null
);


create table if not exists product (ID_product int generated always as identity primary key,----cтворюемо таблицю Товари з головним полем код_товару який автомаично заповнюється лічильником
	category int,
	product_name varchar (44),
	produser int,
	price int,
	description varchar(300)default null
);


create table if not exists sales(ID_sales int generated always as identity primary key, --cтворюемо таблицю Продажі з головним полем код_продажі який автомаично заповнюється лічильником
	ID_shopper int,
    ID_seller int,
    ID_product int,
    date_of_sale date,
    amount int,
    purchase_amount float
);
				   
				   
create table if not exists category(ID_category int generated always as identity primary key, --cтворюемо таблицю Категорія з головним полем код-категорії який автомаично заповнюється лічильником
	category_name varchar(50)
);  
				   
create table if not exists produser( ID_produser int generated always as identity primary key,--cтворюемо таблицю Виробник з головним полем код-виробника який автомаично заповнюється лічильником
	name_produser varchar(30)
);
		  
alter table sales add foreign key (ID_shopper) references shopper(ID_shopper) on update cascade on delete cascade ;--поле код_покупця з талиці Продажі з'єднане з полем код_покупця талиці Покупець з каскадним оновленням та видаленням 	
alter table sales add foreign key(ID_seller) references seller(ID_seller) on update cascade on delete cascade;      --поле код_продавця з талиці Продажі з'єднане з полем код_продавця талиці Продавець з каскадним оновленням та видаленням
alter table sales add foreign key(ID_product) references product (ID_product) on update cascade on delete cascade;  --поле код_товару з талиці продажі з'єднане з полем код_товару талиці Товар з каскадним оновленням та видаленням
alter table product add foreign key(category) references  category(ID_category) on update cascade on delete cascade; --поле категорія з таблиці Товар з'єднане з полем код_категорії таблиці Категорія з каскадним оновленням та видаленням


alter table product add foreign key(produser) references  produser(ID_produser) on update cascade on delete cascade; --поле виробник з таблиці Товар з'єднане з полем код_виробника таблиці Виробник з каскадним оновленням та видаленням 
			  


      --       ## LR3 ## 
--#1						
alter table sales drop foreign key (ID_shopper);


--#2
alter table product drop colum description;

--#3
alter table seller rename column sex to sexxx;

--#4
alter table shopper add column sex varchar(10);

--#5
alter table product add foreign key(category) references  category(ID_category) ;


--                        ## LR4 ##

--#1
insert into shopper(first_name,last_name,surname,phone_shopper,sex) values ('Philip','Dmutriichuk','Philipovich','0506743431','чоловік');

insert into shopper(first_name,last_name,surname,phone_shopper,sex) 
values ('Oleg','Tkach','Volodimirovich','0501111111','Man'),
		('Max','Bezushko','Batkovich','0502222222','Man'),
		('Dasha','Moroz','batkivna','0953333333','Voman');


--#2




--#3
update shopper set	sex='Man'
	where sex='чоловік';
	
--#4	
delete from shopper 
	where (	sex = 'Voman');
	
	
delete from shopper
	where (sex='Man');

delete from produser;


COPY shopper(first_name,last_name)
FROM 'D:\RBD\comp.csv'
DELIMITER ','
CSV HEADER;
select* from shopper;





--                        ## LR5 ##
CREATE TABLE IF NOT EXISTS T1(numbers int primary key, SHOTO varchar(20),SHREK int);
CREATE TABLE IF NOT EXISTS T2(numbers int primary key, SHOTO varchar(20),SHREK int);

         
INSERT INTO T1 VALUES('1','A','11'),('2','B','22'),('3','B','33');
INSERT INTO T2 VALUES('2','B','222'),('3','B','33'),('5','F','55');


--#1
SELECT *FROM T1 UNION SELECT *FROM T2;


SELECT *FROM T1 UNION ALL SELECT *FROM T2;

--#2
SELECT *FROM T1 INTERSECT SELECT *FROM T2;

--#3
SELECT * FROM T1 EXCEPT SELECT * FROM T2;


--#4

SELECT *FROM T1,T2;




--                        ## LR6 ##

--#1
create view product2 as select distinct produser, product_name, description, price from product;   
select*from product2;

--#2
create OR REPLACE view shoto as select distinct product_name, category_name 
	from product, category 	
		where product.category=category.id_category;
select *from shoto;

--#3

select *from product2
	where produser='10';


--#4
select produser.name_produser, product.product_name,  product.price 
	from produser, product 
		where produser.id_produser=product.produser;


--#5

select produser.name_produser, product.product_name,  product.price 
	from produser, product 
		where produser.id_produser=product.produser and product.produser='10' ;










