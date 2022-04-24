--                        ## LR8 ##

--Вивести перелік клієнтів відсортованих за прізвищем в алфавітному порядку
select *from shopper order by last_name;

--Вивести перелік працівників відсортованих за датою народження.
select*from seller order by date_nar;  

--Вивести Блоки живлення відсортовані за назвою
select * from product where category =6 order by product_name;

--Вивести перелік відеокарт відсортованих за ціною в порядку:
--1.зростання;
select  produser.name_produser, product.product_name,product.price, product.description  
	from product, produser 
		where product.produser = produser.id_produser and  category = 2
			order by price;
--2 cпадання
select  produser.name_produser, product.product_name,product.price, product.description  
	from product, produser 
		where product.produser = produser.id_produser and  category = 2
			order by price DESC;

--вивести товар відсортований по назві 
select product.product_name, category.category_name, product.price
	from product, category where category.id_category = product.category
	order by product_name,category ; 

-- вивести продавців відсортованих за гендером 
select first_name,last_name,sex,date_nar,salary from seller order by sex;



--Вивести перелік працівників відсортованих за зарплатою в порядку спадання:
select first_name, last_name, sex, phone_seller from seller order by salary desc;



--Вивести перелік 2 (по даті народження) наймолодших продавців
select first_name,last_name,sex,date_nar,salary from seller order by date_nar DESC LIMIT 2;


--Вивести суму продажів по кожному дню.
Select date_of_sale, SUM(purchase_amount) as "Sum" FROM sales GROUP BY date_of_sale;
