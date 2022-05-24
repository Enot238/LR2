--Функція--
DROP FUNCTION IF EXISTS Sum_all_sells;
CREATE FUNCTION Sum_all_sells()
RETURNS int 
AS $$
DECLARE 
copies int;
BEGIN
select sum(purchase_amount) into copies from sales;
RETURN copies;
END;
$$ LANGUAGE plpgsql;
select *from Sum_all_sells();



DROP PROCEDURE IF EXISTS add_product(IN cat int, IN nam CHAR(23), IN pro int, IN pri int);
CREATE PROCEDURE add_product( IN cat int, IN nam CHAR(23), IN pro int, IN pri int)
AS $$
INSERT INTO product( category, product_name, produser,price ) Values (cat,nam,pro,pri);
$$ LANGUAGE sql;

CALL add_product(1, 'Test',1 , 200);

select *from product;
