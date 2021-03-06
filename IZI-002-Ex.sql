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

		  -- Nguyễn Phước Lê Hiếu (Tạo Database, câu 1, và 16)
		  -- Start Nguyễn Phước Lê Hiếu
		 
		 -- Câu 1 
				select customerid,item,price --truy xuat cac field trong bảng items_ordered
				from items_ordered
				where customerid = 10449; -- với điều kiện là customerid = 10449
		 -- Câu 16
				SELECT customerid,item,price -- truy xuat cac field trong bảng items_ordered
				FROM items_ordered
				where customerid = 10449 -- với điều kiện là customerid = 10449
				ORDER BY item , price  DESC; -- và nếu set hàm này theo giá trị giảm dần thì chúng ta dùng desc

		 -- End Nguyễn Phước Lê Hiếu

		

		 --Nguyễn Phi Nhật (Câu 2, 8, 13, 14)
		 -- Start Nguyễn Phi Nhật
		 
		 -- Câu 2 
				 select * from items_ordered -- hiển thị tất cả các cột của bảng items_ordered
				 where item ='Tent' -- với điều kiện item='Tent'

		 -- Câu 8
				 select item,Min(price) as MinPrice from items_ordered -- truy vấn, hiển thị giá thấp nhất trong bảng items_ordered
				 where item='Tent' group by item -- với điều kiện item = 'Tent'
		 
		 -- Câu 13 
				 select item, MAX(price) as MaxPrice, MIN(price) as Minprice from items_ordered  -- truy vấn và hiển thị item, giá tối đa, tối thiểu trong bảng items_ordered
				 group by item having MAX(price) > 190 -- nhóm các giá trị trên vào cột item và sử dụng câu lệnh having để lọc các giá trị price lớn hơn 190 và hiển thị ra
		
		 -- Câu 14 
				 select customerid, COUNT(quantity) as Soluongdondathang, SUM(price) as Tonggiadondathang from items_ordered -- truy vấn và hiển thị customerid, soluongdondathang , tonggiadondathang 
				 group by customerid having COUNT(quantity) > 1 -- nhóm các giá trị ở trên vào customerid và sử dụng câu lệnh having count để lọc số lượng(quanlity) lớn hơn 1 và hiển thị ra
		 
		 -- End Nguyễn Phi Nhật
		 


		 -- Phan Văn Tin (Câu 5, 11, 17)
		 --Start Phan Văn Tin


		--câu5 
				SELECT item, max(price) as Max_Price FROM items_ordered GROUP BY item ORDER BY item
				-- Đầu tiên dựa vào keyword max(price) để lấy ra giá trị price max
				-- dựa vào keyword GROUP BY thì sẽ show ra mỗi giá trị max price tương ứng với mỗi item

		--câu11
				SELECT DISTINCT CustomerId, Count(*) as count, SUM(price) as sum FROM items_ordered GROUP BY CustomerId;
				-- Sử dụng keyword Count và Sum để tính số lần orders và tổng giá tiền của mỗi customer đã được GROUP

		 --câu17 
				SELECT item, price FROM items_ordered WHERE price > 10.00;
				-- xuất ra item và price tương ứng và lọc ra những item nào có giá lớn hơn 10 trong bảng items_ordered

		 -- End Phan Văn Tin



		 -- Đào Duy Phương (Câu 6, 12, 18, 21)
		 -- Start Đào Duy Phương


		-- Câu 6 
				SELECT AVG(price) as TongTienTB
				FROM items_ordered
				WHERE  MONTH(order_date) = 12
			
			/*
			Ex : Sử dụng hàm AVG để tính tổng trung bình (Price) , Đặt tên (TongTienTB) 
			của bảng items_ordered trong tháng 12 */
		
		-- Câu 12 
				SELECT state, COUNT(customerid)as TongSo
				FROM cusomters
				GROUP BY state
				HAVING COUNT(customerid) > 1

			/*
				Hiển thị stata và tông số Khách hàng thỏa điều kiện khách hàng nhiều hơn 1 state 
				Vì ta nhóm bằng Group by nên Having để tạo điền kiện cho nó .Chớ không thể dùng where ở trên 
			*/
			
		-- Câu 18  : 
				SELECT customerid, order_date, item
				FROM items_ordered
				WHERE (item <> 'Snow shoes') AND (item <> 'Ear muffs');
			/*
				Hiển thị các trường trong đề , 
				Từ bẳng items_ordered 
				và thỏa điều kiện item khác 'Snow shoes' or 'Ear muffs' .Dấu  "<>" phủ định (ko có cái này )
			*/
			
			
		-- Câu 21  : 
				SELECT fisrtname, city, state
				FROM cusomters
				WHERE state IN ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');
			
			/*
				Hiển thị các trường trong đề , 
				Từ bẳng cusomters 
				và thỏa điều kiện state thuộc các giá trị trên , ở đây ta có thể sử dụng nhiều cách để làm . Nhưng đơn giản là Dùng IN là bên trong .
			*/
		 -- End Đào Duy Phương


		 -- Trương Tiến Dũng (Câu 3, 9, 15, 19)
		 --Start Trương Tiến Dũng 
		 --Câu 3  : 
				SELECT customerid, order_date, item   --lấy giá trị của 3 cột customerid, order_date, item và hiển thị
				FROM items_ordered					  --Từ bảng items_ordered
				WHERE item LIKE 'S%'				  -- với câu điều kiện lấy chữ cái đầu tiên bắt đầu bằng chữ S trong cột item
			;

		 --Câu 9  : 
				SELECT state, COUNT(state) as tong    -- Dùng count để lấy giá trị duy nhất của cột state và gán cho tên trường là tổng
				FROM cusomters group by state		  -- Từ bảng cusomters là gộp các state trùng nhau lại thành 1 nhóm để biết state có bao nhiêu người

		 --Câu 15 : 
				SELECT lastname,fisrtname,city		-- Lấy giá trị và hiển trị là cột lastname,fisrtname,city 
				FROM cusomters order by lastname ASC --Từ bảng cusomters và sắp xếp theo thứ tự từ A -> Z

		 --Câu 19 : 
				SELECT item, price												-- Lấy giá trị và hiển thị 2 cột item, price 
				FROM items_ordered												-- của bảng items_ordered
				WHERE item LIKE'S%' OR item LIKE'P%' OR item LIKE'F%';			-- Với điều kiện lấy chữ cài đầu tiên bắt đầu bằng chứ S ,P hoặc F trong cột item

		 --End Trương Tiến Dũng 
		
		
		-- Lê Hoàng Luật (Câu 4, 7, 10, 20)	
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




























