--                        ## LR9 ##


--Вивести середю заробітню плату серед працівників.
select avg(salary) as "Середня заробітня плата" from seller;


--вивести загальну кількість постачальників
select count(id_produser) as "Кількість постачальників" from produser; 

--Вивести ціну найдорожчої відеокарти
select max(price) as "Вартість найдорожчої відеокарти" from product 
	where category =2;

--Вивести ціну найдешевшої відеокарти
select min(price) as "Вартість найдорощо відеокарти" from product 
	where category =2;

--Вивести загальний обєм продаж за 2021-04-04
SELECT SUM(purchase_amount) AS "Сума продаж за 2021-04-04" FROM sales
	where date_of_sale ='2021-04-04';


-- Вивести кількість товарів кожного виробника
select produser, count(product_name) as "Кількість товарів кожного виробника" 
	from product group by produser;
