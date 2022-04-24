--                        ## LR7 ##
--вивести всіх постачальників 
select * from produser;

--вивести всіх продавців магазину
select * from seller;

--вивести всі категорії товарів магазину
select * from category;

--вивести інформацію про товари категорії процесори
select product_name, price, description from product where category=1;

-- вивести всі накопичувачі ціною до 500
select product_name, price, description  from product where category=4 and price < 500;
 
--Відобразити всі товари в яких немає опису
select * from product where description is null;

--Вивести всіх клієнтів чоловіків
select * from shopper where sex = 'Man';


-- вивести всі відеокарти ціна яких між 2000 та 3000
select  product_name, price, description from product where category=2 and price between 2000 and 3000;

-- вивести всі товари категорії оперативна память відсортовані за ціною
select product_name, price, description from product where category=3 order by price;

--вивести всіх продавців які проживають на Проспекті                 &&&&&
select * from seller where address in('Prospect');

--вивести всі продажі за 2021-04-04
select * from sales where date_of_sale = '2021-04-04';

--Вивести всі товари виробиника AMD
select  produser.name_produser, product.product_name,product.price, product.description  from product, produser where product.produser = produser.id_produser----
	and  product.produser = 2;

--Відобразити клієнтів, які не проживають в місті Чернівці.+
select * from shopper where column_b not in ('Чернівці')


--Вивести всіх клієнтів в яких мобільним оператором є водафон                &&&&&
select * from shopper where phone_shopper = '050' or phone_shopper = '066' or  phone_shopper = '095' or  phone_shopper = '099';


-- Вивести всіх виробників блоків живлення з їхнім товаром відсортованим по виробниках
select produser.name_produser, category.category_name, produser.name_produser, product.product_name,product.price, product.description
	from product, category,produser, 
	 	where product.produser = produser.id_produser 
		and product.category = id_category and product.category =6
			order by produser.name_produser;
