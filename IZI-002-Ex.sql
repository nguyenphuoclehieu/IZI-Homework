go 
create database DBORDER --Tạo database có tên là DBORDER
use DBORDER

create table cusomters ( -- Tạo bảng có tên là cusomters
customerid		int primary key, -- khóa chính
fisrtname		nvarchar(255),
lastname		nvarchar(255),
city			nvarchar(255),
state			nvarchar(255),
)
create table items_ordered (-- Tạo bảng có tên là items_ordered
customerid		 int Foreign key references cusomters(customerid), -- khóa ngoại
order_date		datetime,
item			nvarchar(255),
quantity		int,
price			decimal,
)
drop table cusomters
Insert into cusomters(customerid,fisrtname,lastname,city,state) -- thêm dữ liệu vào bảng cusomters
values	(10101,'John','Gray','Lynden','Washington'),
		(10298,'Leroy','Brown','Pinetop','Arizona'),
		(10299,'Elroy','Keller','Snoqualmie','Washington'),
		(10315,'Lisa','Jones','Oshkash','Wisconsin'),
		(10325,'Ginger','Schultz','Pocatello','Idaho'),
		(10329,'Kelly','Mendoza','Kailua','Hawaii'),
		(10330,'Shawn','Dalton','Cannon Beach','Oregon'),
		(10338,'Micheal','Howell','Tillamook','Oregon'),
		(10339,'Anthony','Sanchez','Winslow','Arizona'),
		(10408,'Elroy','Cleaver','Globe','Arizona'),
		(10410,'Mary Ann','Howell','Charleston','South Carolina'),
		(10413,'Donald','Davids','Gila Bend','Arizona'),
		(10419,'Linda','Sakahara','Nogales','Arizona'),
		(10429,'Sarah','Graham','Greensboro','North Canolina'),
		(10438,'Kevin','Smith','Durango','Colerado'),
		(10439,'Conrad','Giles','Telluride','Colerado'),
		(10449,'Isabele','Moore','Yama','Arizona');
		
Insert into items_ordered(customerid,order_date,item,quantity,price) -- thêm dữ liệu vào bảng items_ordered
values 
	(10330,'2021-12-06','Pogo stick',1,28.00),
	(10101,'2021-12-07','Raft',1,58.00),
	(10298,'2021-12-08','Skateboard',1,33.00),
	(10101,'2021-12-05','Life Vest',4,152.00),
	(10299,'2021-12-04','Parachute',1,1250.00),

	(10339,'2021-12-03','Umbrellea',1,4.50),
	(10449,'2021-12-01','Unicycle',1,180.79),
	(10439,'2021-12-09','Ski Poles',2,25.50),
	(10101,'2021-12-07','Rain Coat',1,18.30),
	(10449,'2021-12-08','Snow Shoes',1,45.00),

	(10439,'2021-12-05','Tent',1,88.00),
	(10298,'2021-12-04','Lantern',2,45.00),
	(10410,'2021-12-03','Sleeping Bag',1,88.00),
	(10438,'2021-12-01','Umbrellea',1,29.00),
	(10438,'2021-12-09','Pillow',1,89.22),

	(10298,'2021-12-14','Helmet',1,6.75),
	(10449,'2021-12-15','Bicycle',1,8.50),
	(10449,'2021-12-16','Canoe',1,22.00),
	(10101,'2021-12-17','Hoola Hoop',3,380.00),
	(10330,'2021-12-18','Flashlight',4,14.75),

	(10101,'2021-12-18','Lantern',1,28.00),
	(10299,'2021-12-18','Inflatable Mattress',1,16.00),
	(10438,'2021-12-19','Tent',1,38.00),

	(10413,'2021-12-20','Lawnchair',4,79.99),
	(10410,'2021-12-21','Unicycle',1,32.00),
	(10315,'2021-12-22','Compass',1,192.50),
	(10449,'2021-12-23','Flashlight',1,8.00),
	(10101,'2021-12-24','Sleeping Bag',2,4.50),

	(10298,'2021-12-25','Pocket Knife',1,88.70),
	(10449,'2021-12-26','Canoe paddle',2,22.38),
	(10298,'2021-12-27','Ear Muffs',1,40.00),
	(10330,'2021-12-28','Shovel',1,12.50);

		select * from cusomters  -- câu lệnh này là truy xuất dữ liệu ở bảng cusomters
		select * from items_ordered   -- câu lệnh này là truy xuất dữ liệu ở bảng items_ordered


		--------------------------------------------------------Bài tập-------------------------------------------------------------------

		  /* Nguyễn Phước Lê Hiếu (Tạo Database, câu 1, và 16)
		  1. From the items_ordered table, select a list of all items purchased for customerid 10449. 
		  Display the customerid, item, and price for this customer.
		  16. Same thing as exercise #1, but display the results in Descending order.
		  Start LeHieu

		
		 
		 
		 
		 End LeHieu
		 






		 Nguyễn Phi Nhật (Câu 2, 8, 13, 14)
		 2.Select all columns from the items_ordered table for whoever purchased a Tent.

		 8.For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent?
		 Hint: Your query should return the price only.
		 13.From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table.
		 Only display the results if the maximum price for one of the items is greater than 190.00.
		 14.How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made,
		 and the sum of their orders if they purchased more than 1 item.
		 */
		 -- Start Nguyễn Phi Nhật
		 
		 /* Câu 2 */
		 select * from items_ordered -- hiển thị tất cả các cột của bảng items_ordered
		 where item ='Tent' -- với điều kiện item='Tent'
		 /* Câu 8*/
		 select item,Min(price) as MinPrice from items_ordered -- truy vấn, hiển thị giá thấp nhất trong bảng items_ordered
		 where item='Tent' group by item -- với điều kiện item = 'Tent'
		 
		 /* Câu 13 */
		 select item, MAX(price) as MaxPrice, MIN(price) as Minprice from items_ordered  -- truy vấn và hiển thị item, giá tối đa, tối thiểu trong bảng items_ordered
		 group by item having MAX(price) > 190 -- nhóm các giá trị trên vào cột item và sử dụng câu lệnh having để lọc các giá trị price lớn hơn 190 và hiển thị ra
		
		 /* Câu 14 */
		 select customerid, COUNT(quantity) as Soluongdondathang, SUM(price) as Tonggiadondathang from items_ordered -- truy vấn và hiển thị customerid, soluongdondathang , tonggiadondathang 
		 group by customerid having COUNT(quantity) > 1 -- nhóm các giá trị ở trên vào customerid và sử dụng câu lệnh having count để lọc số lượng(quanlity) lớn hơn 1 và hiển thị ra
		 

		 

		 -- End Nguyễn Phi Nhật
		 /*


		 Phan Văn Tin (Câu 5, 11, 17)
		 5.Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.
		 11.How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders. 
		 Click the Group By answers link below if you have any problems.
		 17.Select the item and price for all of the items in the items_ordered table that the price is greater than 10.00. 
		 Display the results in Ascending order based on the price.
		 Start Phan Văn Tin







		 End Phan Văn Tin

		 Đào Duy Phương (Câu 6, 12, 18, 21)
		 6.Select the average price of all of the items ordered that were purchased in the month of Dec.
		 12.How many people are in each unique state in the customers table that have more than one person in the state?
		 Select the state and display the number of how many people are in each if it's greater than 1.
		 18.Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'.
		 Display the rows as long as they are not either of these two items.
		 21.Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.
		 Start Đào Duy Phương


		/* Câu 6  : */
			SELECT AVG(price) as TongTienTB
			FROM items_ordered
			WHERE  MONTH(order_date) = 12
			
			/*
			Ex : Sử dụng hàm AVG để tính tổng trung bình (Price) , Đặt tên (TongTienTB) 
			của bảng items_ordered trong tháng 12 */
		
			/* Câu 12  : */
			SELECT state, COUNT(customerid)as TongSo
			FROM cusomters
			GROUP BY state
			HAVING COUNT(customerid) > 1
			
			
			/*
				Hiển thị stata và tông số Khách hàng thỏa điều kiện khách hàng nhiều hơn 1 state 
				Vì ta nhóm bằng Group by nên Having để tạo điền kiện cho nó .Chớ không thể dùng where ở trên 
			*/
			
			/* Câu 18  : */
			SELECT customerid, order_date, item
			FROM items_ordered
			WHERE (item <> 'Snow shoes') AND (item <> 'Ear muffs');
			
			/*
				Hiển thị các trường trong đề , 
				Từ bẳng items_ordered 
				và thỏa điều kiện item khác 'Snow shoes' or 'Ear muffs' .Dấu  "<>" phủ định (ko có cái này )
			*/
			
			
			/* Câu 21  : */
			SELECT fisrtname, city, state
			FROM cusomters
			WHERE state IN ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');
			
			/*
				Hiển thị các trường trong đề , 
				Từ bẳng cusomters 
				và thỏa điều kiện state thuộc các giá trị trên , ở đây ta có thể sử dụng nhiều cách để làm . Nhưng đơn giản là Dùng IN là bên trong .
			*/




		 End Đào Duy Phương


		 Trương Tiến Dũng (Câu 3, 9, 15, 19)
		 3.Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter "S".
		 9.How many people are in each unique state in the customers table? Select the state and display the number of people in each. Hint:
		 count is used to count rows in a column, sum works on numeric data only.
		 15.Select the lastname, firstname, and city for all customers in the customers table. Display the results in Ascending Order based on the lastname.
		 19.Select the item and price of all items that start with the letters 'S', 'P', or 'F'.
		 Start Trương Tiến Dũng 







		 End Trương Tiến Dũng 
		
		 Lê Hoàng Luật (Câu 4, 7, 10, 20)
		 4.Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.
		 7.What are the total number of rows in the items_ordered table?
		 10.From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Hint: The items will need to be broken up into separate groups.
		 20.Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.
		*/		
		--Start Lê Hoàng Luật
		SELECT DISTINCT item			-- Chọn giá trị DISTINCT từ cột item
		FROM items_ordered;				-- trong bảng items_ordered
		--câu 7
		SELECT COUNT(*)					--COUNT(*) trả về số dòng
		FROM items_ordered;				-- trong bảng items_ordered
		--câu 10
		SELECT item, max(price) MaxPrice, min(price) MinPrice --Chọn mặt hàng, giá tối đa và giá tối thiểu cho từng mặt hàng cụ thể
		FROM items_ordered				-- trong bảng items_ordered
		GROUP BY item;					-- sắp xếp dữ liệu giống nhau thành	các nhóm	
		--câu 20
		SELECT order_date, item, price   -- Chọn giá trị của order_date, item,price
		FROM items_ordered				--  Trong bảng items_ordered	
		WHERE price BETWEEN 10.00 AND 80.00;-- điều kiện là giá trị price trong khoảng 10.000 đến 80.000

	 --End Lê Hoàng Luật




























