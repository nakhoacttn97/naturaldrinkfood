-- phpMyAdmin SQL Dump
-- version ...
-- https://www.phpmyadmin.net/
--
-- Host: ...
-- Generation Time: Jan 20, 2024 at 19:00 AM
-- Server version: ...
-- PHP Version: ...

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- CREATE DATABASE frinkfood;

-- USE frinkfood;

CREATE TABLE Images(
    ImageId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ImageUrl CHAR(32) NOT NULL,
    OriginalName VARCHAR(64) NOT NULL,
    Size BIGINT NOT NULL Type VARCHAR(16) NOT NULL
) ENGINE = INNODB;

CREATE TABLE Role(
    name VARCHAR(16) NOT NULL PRIMARY KEY,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL
) ENGINE = INNODB;

CREATE TABLE User(
    id BIGINT NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    role VARCHAR(16) NOT NULL,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    remember_token VARCHAR(64),
    email_verified_at DATETIME
) ENGINE = INNODB;

CREATE TABLE `Customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int(11) DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`)
) ENGINE=InnoDB;

-- id Cart Ko su dung tu dong tang AUTO_INCREMENT bao mat tot hon
CREATE TABLE  Cart(
    id INT NOT NULL PRIMARY KEY,
    token CHAR(32) NOT NULL,
    product_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NULL,
)ENGINE = INNODB;

ALTER TABLE Cart ADD CONSTRAINT fk_Cart_product_id FOREIGN KEY (product_id) REFERENCES Product(id);

CREATE TABLE Category(
	id TINYINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	image VARCHAR(16) NOT NULL,
	filter VARCHAR(64) NOT NULL
)ENGINE = INNODB;

CREATE TABLE SubCategory(
	id SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64) NOT NULL,
	category_id int NOT NULL
)ENGINE = INNODB;

CREATE TABLE Product(
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(128) NOT NULL,
	price float NOT NULL,
	price_origin float NOT NULL,
	image VARCHAR(128) NOT NULL,
	content TEXT NOT NULL,
	filter VARCHAR(64) NOT NULL,
	featured bit NULL,
	selling INT NULL,
	view INT NULL,
	public VARCHAR(64) NOT NULL,
	subcategory_id INT NOT NULL
)ENGINE = INNODB;


INSERT INTO Category (id, name, image, filter) VALUES
    (1, 'Thức ăn nhanh', 'cat-1.jpg', 'thuc-an-nhanh'),
    (2, 'Trái cây, hạt', 'cat-2.jpg', 'trai-cay-hat '),
    (3, 'Nguyên liệu', 'cat-3.jpg', 'nguyen-lieu  '),
    (4, 'Thức uống', 'cat-4.jpg', 'thuc-uong '),
    (5, 'Đồ tươi sống', 'cat-5.jpg', 'thit-tuoi-song');
	
	--

INSERT INTO SubCategory(id, name, category_id) VALUES
    (1, 'Thịt tươi sống', 5),
    (2, 'Rau củ', 3),
    (3, 'Hạt sấy khô', 2),
    (4, 'Quả mọng nước', 2),
    (5, 'Hải sả', 5),
    (6, 'Bơ, trứng', 3),
    (7, 'Nước ép trái cây', 4),
    (8, 'Hành tỏi, gia vị', 3),
    (9, 'Ngũ cốc dinh dưỡng', 1),
    (10, 'Bánh kẹo', 1),
    (11, 'Sữa tươi', 4);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (1, 'Đùi bò nhập khẩu 500g', 109000, 127500, 'store/images/thit-cac-loai/dui-bo-nhap-khau-dong-lanh-500gr-202304131025325876_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-bo/dui-bo-nhap-khau-dong-lanh-500g">Thịt đ&ugrave;i</a> c&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ <a href="https://www.bachhoaxanh.com/thit-bo">thịt b&ograve;</a>&nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua đ&ugrave;i b&ograve; nhập khẩu tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt đ&ugrave;i b&ograve; nhập khẩu (ở một số nơi gọi l&agrave; thịt m&ocirc;ng ngo&agrave;i) l&agrave; phần thịt m&ocirc;ng hay đ&ugrave;i sau của b&ograve;, ưu điểm của phần thịt n&agrave;y l&agrave; <strong>nhiều nạc, &iacute;t mỡ, thịt mềm</strong>.</li>
	<li>Thịt đ&ugrave;i b&ograve; đ&ocirc;ng lạnh với phương ph&aacute;p l&agrave;m đ&ocirc;ng lạnh cấp tốc từ những miếng thịt b&ograve; nhập khẩu từ<strong> &Uacute;c, Argentina, Canada, Nga</strong> (tuỳ theo từng l&ocirc; nhập h&agrave;ng)... tươi ngon trong thời gian nhanh nhất, điều n&agrave;y gi&uacute;p c&aacute;c dinh dưỡng thất tho&aacute;t sẽ &iacute;t hơn, chất lượng sẽ được giữ kh&ocirc;ng k&eacute;m g&igrave; so với thịt b&ograve; tươi.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của đ&ugrave;i b&ograve; nhập khẩu</strong></h3>

<ul style="margin-left:40px">
	<li>Trong thịt đ&ugrave;i b&ograve; chứa nhiều vitamin B2, vitamin B5, vitamin B6, c&aacute;c kho&aacute;ng chất như sắt, kẽm, đồng,... rất dinh dưỡng.</li>
	<li>Trong 100g thịt đ&ugrave;i b&ograve; c&oacute; <strong>250 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của đ&ugrave;i b&ograve; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường sức khỏe xương khớp</li>
	<li>Cung cấp dinh dưỡng cho cơ thể</li>
	<li>Tăng cường sức đề kh&aacute;ng cho cơ thể</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Gi&uacute;p người đau bổ sung dưỡng chất</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế thịt đ&ugrave;i b&ograve;</strong></h3>
Thịt đ&ugrave;i b&ograve; cơ bản đ&atilde; được l&agrave;m sạch, đ&oacute;ng khay, bạn chỉ cần rửa sạch lại v&agrave; th&aacute;i th&agrave;nh miếng vừa ăn, sau đ&oacute; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch.

<h3><img alt="Đùi bò nhập khẩu đông lạnh 500gr 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8139/248985/bhx/dui-bo-nhap-khau-dong-lanh-khay-500g-202203121756412182.jpg" /><br />
<strong>C&aacute;c m&oacute;n ăn ngon từ thịt đ&ugrave;i b&ograve;</strong></h3>
Đ&ugrave;i b&ograve; l&agrave; phần thịt rất chắc, v&igrave; thể để m&oacute;n ăn c&oacute; độ ngon nhất định v&agrave; phần thịt mềm dễ ăn th&igrave; n&ecirc;n nấu trong nồi hầm hoặc nồi &aacute;p suất.

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-bo-sot-vang-cuc-mem-va-thom-nuc-mui-1151735">B&ograve; sốt vang</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/thit-bo-ham-rau-cu-thit-bo-mem-thom-ngon-kho-cuong-tai-nha-1337343">Thịt b&ograve; hầm rau củ</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cong-thuc-lam-lau-bo-thap-cam-sieu-ngon-an-la-ghien-1174565">Lẩu b&ograve;</a></li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản thịt đ&ugrave;i b&ograve; tươi ngon</strong></h3>
Thịt đ&ugrave;i b&ograve; n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh. Nếu đ&atilde; r&atilde; đ&ocirc;ng th&igrave; kh&ocirc;ng n&ecirc;n trữ đ&ocirc;ng lại.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 1, 0, 0, '2023-05-03 16:30:01', 1);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (2, 'Nạm bò Fohla 250g', 84200, 89000, 'store/images/thit-cac-loai/nam-bo-fohla-250g-202303220909251570_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-bo/nam-bo-fohla-250g">Thịt nạm b&ograve;</a> tươi ngon, chất lượng, thịt mềm ngọt. <a href="https://www.bachhoaxanh.com/thit-bo">Thịt b&ograve;</a> c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, an t&acirc;m cho người d&ugrave;ng lựa chọn. Thịt b&ograve; l&agrave; thực phẩm gi&agrave;u chất dinh dưỡng, chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Fohla</div>
	</li>
	<li>Khối lượng
	<div>250g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản từ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua nạm b&ograve; Fohla tại B&aacute;ch h&oacute;a XANH&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nạm b&ograve; Fohla tại B&aacute;ch h&oacute;a XANH lu&ocirc;n tươi ngon v&agrave; chất lượng, đảm bảo đầy đủ dưỡng chất cho bữa ăn của bạn. Nạm b&ograve; được đ&oacute;ng g&oacute;i v&agrave; v&agrave;o bảo quản trong m&ocirc;i trường tốt n&ecirc;n an&nbsp;to&agrave;n cho người sử dụng.</p>
	</li>
	<li>
	<p>Sản phẩm c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, đảm bảo vệ sinh an to&agrave;n thực phẩm</p>
	</li>
	<li>
	<p>Giao h&agrave;ng tận nơi nhanh ch&oacute;ng nhưng vẫn đảm bảo sản phẩm tươi ngon</p>
	</li>
</ul>

<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>

<p>Fohla l&agrave; thương hiệu c&oacute; hơn 10 năm trong việc cung cấp c&aacute;c sản phẩm h&agrave;ng đ&ocirc;ng lạnh chất lượng, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng an to&agrave;n cho người sử dụng. C&aacute;c sản phẩm của thương hiệu&nbsp;Fohla được đ&oacute;ng g&oacute;i v&agrave; bảo quản ở nhiệt độ th&iacute;ch hợp vừa giữ được độ tươi ngon của sản phẩm vừa đảm bảo dưỡng chất tốt cho cơ thể</p>

<h3><strong>Gi&aacute; trị dinh dưỡng c&oacute; trong nạm b&ograve;&nbsp;Fohla</strong></h3>
<img alt="Nạm bò Fohla 250g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8139/304175/bhx/nam-bo-fohla-250g-202303140902064180.jpg" />
<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Nạm b&ograve; Fohla chứa c&aacute;c dưỡng chất như:&nbsp;Protein, chất xơ, glucid, Vitamin A, B, B6,&nbsp; B12, sắt, magie, kẽm, đồng, canxi,.. tốt cho sức khỏe</p>
	</li>
	<li>
	<p>Trong 100g nạm b&ograve; chứa khoảng 155kcal</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của nạm b&ograve; đối với sức khỏe&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Tăng cường v&agrave; ph&aacute;t triển cơ bắp</p>
	</li>
	<li>
	<p>Tăng cường khả năng miễn dịch cho cơ thể</p>
	</li>
	<li>
	<p>Chống t&igrave;nh trạng oxy h&oacute;a ở c&aacute;c m&ocirc; bị tổn thương</p>
	</li>
	<li>
	<p>Giảm b&eacute;o hiệu quả</p>
	</li>
	<li>
	<p>Bổ sung m&aacute;u cho cơ thể</p>
	</li>
	<li>
	<p>&nbsp;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch sơ chế nạm b&ograve;&nbsp;Fohla</strong></h3>

<p>Thịt b&ograve; đ&atilde; được đ&oacute;ng khay tiện lợi, sạch sẽ, bạn chỉ cần rửa sạch lại với nước muối, sau đ&oacute; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch.</p>

<h3><strong>C&aacute;c m&oacute;n ngon từ nạm b&ograve;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nạm b&ograve; kho</p>
	</li>
	<li>
	<p>B&uacute;n nạm b&ograve;</p>
	</li>
	<li>
	<p>Nạm b&ograve; nướng</p>
	</li>
	<li>
	<p>Nạm b&ograve; l&aacute; lốt</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản thịt b&ograve; t&aacute;i &Uacute;c Pacow tươi ngon</strong></h3>

<p>Bảo quản thịt b&ograve; t&aacute;i ở nhiệt độ từ 0 - 2 độ C.<br />
<br />
<strong>Lưu &yacute;:&nbsp;</strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (3, 'Thịt ba rọi bò Mỹ đông lạnh Thảo Tiến 300g', 108000, 0, 'store/images/thit-cac-loai/thit-ba-roi-bo-thao-tien-foods-khay-300g-202210121449043843_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/hai-san-dong-lanh-thao-tien-foods" target="_blank">Thịt b&ograve; Mỹ Thảo Tiến Foods</a>&nbsp;l&agrave; loại <a href="https://www.bachhoaxanh.com/hai-san-dong-lanh" target="_blank">thịt b&ograve; đ&ocirc;ng lạnh</a>&nbsp;được th&aacute;i bằng m&aacute;y tự động trong m&ocirc;i trường lạnh, tạo n&ecirc;n những khoanh thịt đỏ hồng.&nbsp;<a href="https://www.bachhoaxanh.com/hai-san-dong-lanh/thit-ba-roi-bo-my-thao-tien-foods-khay-300g" target="_blank">Thịt ba rọi b&ograve; Mỹ Thảo Tiến Foods khay 300g</a> l&agrave; phần thịt b&ograve; nằm ở phần bụng, c&oacute; lớp nạc mỡ&nbsp;xen kẽ nhau, tạo n&ecirc;n độ mềm ngọt, thơm ngậy nhưng kh&ocirc;ng ngấy.</div>

<ul style="margin-left:40px">
	<li>C&aacute;ch d&ugrave;ng
	<div>Nấu ch&iacute;n trước khi d&ugrave;ng. Kh&ocirc;ng t&aacute;i cấp đ&ocirc;ng sau khi r&atilde; đ&ocirc;ng. D&ugrave;ng nấu lẩu hoặc l&agrave;m thịt nướng</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Thịt b&ograve; Mỹ 100% nhập khẩu từ Mỹ</div>
	</li>
	<li>Nhiệt độ bảo quản
	<div>-18 độ C hoặc ngăn đ&aacute; tủ lạnh</div>
	</li>
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Thương hiệu
	<div>Thảo Tiến Foods (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<div style="text-align:justify">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu</h3>

<p>Thảo Tiến Foods, thương hiệu thực phẩm nổi tiếng, với đa dạng c&aacute;c d&ograve;ng sản phẩm đang được rất nhiều người ti&ecirc;u d&ugrave;ng ưa chuộng hiện nay. Thuộc sở hữu của C&ocirc;ng ty TNHH Thảo Tiến, được th&agrave;nh lập v&agrave;o năm 2007, t&iacute;nh đến thời điểm hiện nay, c&ocirc;ng ty Thảo Tiến đ&atilde; v&agrave; đang ph&acirc;n phối thực phẩm cho thị trường b&aacute;n lẻ, sỉ v&agrave; c&aacute;c nh&agrave; h&agrave;ng, kh&aacute;ch sạn tr&ecirc;n to&agrave;n quốc với 4 chi nh&aacute;nh tại c&aacute;c th&agrave;nh phố lớn của nước ta.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong sản phẩm</h3>

<p>Sản phẩm thịt ba rọi b&ograve; Thảo Tiến Foods khay 300g c&oacute; chứa những th&agrave;nh phần dinh dưỡng như: Năng lượng, chất b&eacute;o, chất đạm, v&agrave; c&aacute;c Vitamin B, B12, B6 c&ugrave;ng c&aacute;c kho&aacute;ng chất như kẽm, sắt, kali, omega 3,... Trong 100g thịt ba rọi b&ograve; c&oacute; chứa khoảng 295 kcal.</p>

<h3>T&aacute;c dụng của sản phẩm với sức khỏe</h3>

<p>Thịt ba rọi b&ograve; Thảo Tiến Foods sử dụng nguồn nguy&ecirc;n liệu ba rọi b&ograve; Mỹ 100% đạt chuẩn chất lượng đầu v&agrave;o, đảm bảo an to&agrave;n vệ sinh thực phẩm. Kh&ocirc;ng những thế, thịt ba rọi b&ograve; Mỹ c&ograve;n c&oacute; nhiều c&ocirc;ng dụng tốt cho sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Gi&agrave;u đạm c&ugrave;ng nhiều axit amin tốt cho cơ thể.</p>
	</li>
	<li>
	<p>Cung cấp năng lượng cho cơ thể hoạt động.</p>
	</li>
	<li>
	<p>Dồi d&agrave;o h&agrave;m lượng chất sắt, gi&uacute;p t&aacute;i tạo m&aacute;u trong cơ thể, ph&ograve;ng ngừa c&aacute;c bệnh thiếu m&aacute;u.</p>
	</li>
	<li>
	<p>Tăng cơ bắp.</p>
	</li>
	<li>
	<p>Tốt cho sự ph&aacute;t triển của tr&iacute; n&atilde;o.<br />
	<img alt="Thịt ba rọi bò Thảo Tiến Foods khay 300g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//7172/213845/bhx/files/bachibomy.gif" style="height:555px; width:600px" /></p>
	</li>
</ul>

<h3>Hướng dẫn sử dụng v&agrave; c&aacute;ch bảo quản</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản thịt ba rọi b&ograve; Mỹ ở nhiệt độ dưới -18 độ C.</p>
	</li>
	<li>
	<p>Lưu &yacute;, n&ecirc;n r&atilde; đ&ocirc;ng trước khi d&ugrave;ng.</p>
	</li>
</ul>

<h3>C&aacute;c m&oacute;n ngon từ sản phẩm</h3>

<p>Thịt ba rọi b&ograve; l&agrave; phần thịt được rất nhiều người ưa chuộng, bởi kh&ocirc;ng chỉ c&oacute; h&agrave;m lượng dinh dưỡng cao, m&agrave; thịt ba rọi b&ograve; c&ograve;n c&oacute; độ mềm, khi chế biến kh&ocirc;ng bị kh&ocirc; như c&aacute;c loại thịt kh&aacute;c. Những m&oacute;n ăn ngon chế biến từ thịt ba chỉ b&ograve; c&oacute; thể kể đến như: Ba chỉ b&ograve; cuộn ph&ocirc; mai, lẩu ba chỉ b&ograve;, salad ba chỉ b&ograve;, canh kim chi ba chỉ b&ograve;,...<br />
<img alt="Thịt ba rọi bò Thảo Tiến Foods khay 300g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//7172/213845/bhx/files/nhung-lau.jpg" style="height:411px; width:600px" /></p>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>C&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của Thảo Tiến Foods c&oacute; thể dễ d&agrave;ng t&igrave;m mua tại c&aacute;c cửa h&agrave;ng B&aacute;ch h&oacute;a XANH tr&ecirc;n to&agrave;n quốc. B&aacute;ch h&oacute;a XANH chỉ kinh doanh h&agrave;ng h&oacute;a c&oacute; nguồn gốc r&otilde; r&agrave;ng, n&ecirc;n bạn c&oacute; thể an t&acirc;m mua h&agrave;ng tại đ&acirc;y.<br />
Ngo&agrave;i ra, bạn c&oacute; thể đặt h&agrave;ng tại www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n điện thoại để được giao h&agrave;ng nhanh ch&oacute;ng tận nh&agrave; c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meo-phan-biet-thit-ba-chi-bo-my-that-chi-bang-mot-chi-tiet-nho-nay-1253001">Mẹo ph&acirc;n biệt thịt ba chỉ b&ograve; Mỹ thật chỉ bằng một chi tiết nhỏ n&agrave;y</a></div>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (4, 'Bò xay Fohla 250g', 61700, 65000, 'store/images/thit-cac-loai/bo-xay-fohla-250g-202303251519193175_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-bo/bo-xay-fohla-250g">Thịt b&ograve; xay</a> tiện lợi, tươi ngon, chất lượng, thịt mềm ngọt. <a href="https://www.bachhoaxanh.com/thit-bo">Thịt b&ograve;</a> được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, tiết kiệm thời gian chế biến. Thịt b&ograve; xay chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Fohla</div>
	</li>
	<li>Loại sản phẩm
	<div>thịt b&ograve; xay</div>
	</li>
	<li>Khối lượng
	<div>250g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản từ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua b&ograve; xay Fohla tại B&aacute;ch h&oacute;a XANH&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>B&ograve; xay Fohla tại B&aacute;ch h&oacute;a XANH tươi ngon v&agrave; cung cấp đầy đủ dưỡng chất tốt cho cơ thể. B&ograve; được xay v&agrave; đ&oacute;ng khay tiện lợi cho việc chế biến c&aacute;c m&oacute;n ăn một c&aacute;ch nhanh ch&oacute;ng nhất.</p>
	</li>
	<li>
	<p>B&ograve; xay đảm bảo chất lượng, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng n&ecirc;n an to&agrave;n cho người sử dụng</p>
	</li>
	<li>
	<p>Giao h&agrave;ng tận nơi, nhanh ch&oacute;ng</p>
	</li>
	<li>
	<p>Gi&aacute; cả hợp l&yacute;</p>
	</li>
</ul>

<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Thịt b&ograve;&nbsp;Fohla l&agrave; thương hiệu thịt b&ograve; chất lượng đảm bảo được độ tươi ngon v&agrave; đầy đủ dưỡng chất tốt cho cơ thể. Thịt b&ograve; được đ&oacute;ng g&oacute;i v&agrave; bảo quản theo quy tr&igrave;nh c&ocirc;ng nghệ hiện đại an to&agrave;n cho người sử dụng</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng c&oacute; trong sản phẩm</strong></h3>
<img alt="Bò xay Fohla 250g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8139/304177/bhx/bo-xay-fohla-250g-202303140908011021.jpg" />
<p>B&ograve; xay Fohla c&oacute; chứa c&aacute;c th&agrave;nh phần dinh dưỡng như sau: chất xơ, Protein, Vitamin B6, B12, kẽm, sắt, canxi, magie,..tốt cho sức khỏe</p>

<h3><strong>T&aacute;c dụng của thịt b&ograve;&nbsp;Fohla đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bổ sung canxi tốt cho xương</p>
	</li>
	<li>
	<p>Hạn chế t&igrave;nh trạng thiếu m&aacute;u</p>
	</li>
	<li>
	<p>Tăng cường hệ miễn dịch tốt cho cơ thể</p>
	</li>
	<li>
	<p>Cung cấp năng lượng cần thiết cho cơ thể</p>
	</li>
	<li>
	<p>Giảm c&acirc;n hiệu quả</p>
	</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ngon từ thịt b&ograve;&nbsp;Fohla</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Canh thịt b&ograve; bằm</p>
	</li>
	<li>
	<p>Thịt b&ograve; nấu canh l&aacute; lốt</p>
	</li>
	<li>
	<p>Thịt bằm x&agrave;o h&agrave;nh t&acirc;y</p>
	</li>
	<li>
	<p>Thịt b&ograve; bằm dồn khổ qua</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản thịt b&ograve; t&aacute;i &Uacute;c Pacow tươi ngon</strong></h3>

<p>Bảo quản thịt b&ograve; t&aacute;i ở nhiệt độ từ 0 - 2 độ C.<br />
<strong>Lưu &yacute;:&nbsp;</strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (5, 'Bò viên tươi PTV gói 200g', 34900, 0, 'store/images/thit-cac-loai/bo-vien-tuoi-ptv-goi-200g-202303210955480024_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-vien-bo-vien-ptv" target="_blank">B&ograve; vi&ecirc;n Ph&uacute;c Thịnh Vượng</a> được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, mang đến những sản phẩm tươi ngon, an to&agrave;n cho sức khoẻ.&nbsp;<a href="https://www.bachhoaxanh.com/ca-vien-bo-vien/bo-vien-tuoi-ptv-goi-200g" target="_blank">B&ograve; vi&ecirc;n tươi PTV g&oacute;i 200g</a> được chế biến, tẩm ướp vừa miệng, l&agrave; loại <a href="https://www.bachhoaxanh.com/ca-vien-bo-vien" target="_blank">b&ograve; vi&ecirc;n</a> th&iacute;ch hợp để chế biến cho c&aacute;c m&oacute;n chi&ecirc;n, nấu lẩu,... mang đến phần b&ograve; vi&ecirc;n dai gi&ograve;n.</div>

<ul style="margin-left:40px">
	<li>Th&agrave;nh phần
	<div>Thịt b&ograve;, thịt g&agrave;, c&aacute;c th&agrave;nh phần kh&aacute;c như tỏi, bột ti&ecirc;u, bột ngọt, đường c&aacute;t trắng, muối tinh khiết, phụ gia,...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Sử dụng trực tiếp, d&ugrave;ng chế biến với c&aacute;c thực phẩm kh&aacute;c. N&ecirc;n d&ugrave;ng hết sau 1-2 ng&agrave;y mở bao b&igrave;</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 10 độ C</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Thương hiệu
	<div>PTV (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (6, 'Thịt ba chỉ bò Mỹ cuộn Orifood 300g', 89000, 99000, 'store/images/thit-cac-loai/thit-ba-chi-bo-my-cat-cuon-orifood-khay-300g-202304031522089647_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-hai-san-dong-lanh-orifood">Thịt đ&ocirc;ng lạnh Orifood</a> l&agrave; thương hiệu chuy&ecirc;n cung cấp <a href="https://www.bachhoaxanh.com/ca-hai-san-dong-lanh-thit-dong-lanh">thịt b&ograve; đ&ocirc;ng lạnh</a> v&ocirc; c&ugrave;ng chất lượng, được nhiều kh&aacute;ch h&agrave;ng quan t&acirc;m v&agrave; tin d&ugrave;ng, với chất lượng rất đ&aacute;ng tin cậy.&nbsp;<a href="https://www.bachhoaxanh.com/ca-hai-san-dong-lanh/thit-ba-chi-bo-my-cat-cuon-orifood-khay-300g">Thịt ba chỉ b&ograve; Mỹ cuộn Orifood 300g</a> với thị đạt chuẩn từ Mỹ, cho vị ngon kh&oacute; cưỡng, gi&agrave;u chất dinh dưỡng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thịt ba chỉ b&ograve; Mỹ cắt cuộn</div>
	</li>
	<li>Đ&oacute;ng g&oacute;i
	<div>khay</div>
	</li>
	<li>Trọng lượng
	<div>300g</div>
	</li>
	<li>C&aacute;ch chế biến
	<div>R&atilde; đ&ocirc;ng trước khi d&ugrave;ng. D&ugrave;ng để nấu hoặc chế biến m&oacute;n ăn.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản từ -18 độ C hoặc ngăn đ&aacute; tủ lạnh</div>
	</li>
	<li>Thương hiệu
	<div>Orifood</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thit-tuoi-song', 0, 12, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (7, 'Nạc bò Fohla 250g', 94500, 99000, 'store/images/thit-cac-loai/nac-bo-fohla-250g-202303220908354941_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-bo/nac-bo-fohla-250g">Thịt nạc b&ograve;</a> tươi ngon, chất lượng, thịt mềm, ngọt. <a href="https://www.bachhoaxanh.com/thit-bo">Thịt b&ograve;</a> được đ&oacute;ng g&oacute;i cẩn thận, nguồn gốc xuất xứ r&otilde; r&agrave;ng, chế biến th&agrave;nh nhiều m&oacute;n ăn ngon hấp dẫn, được nhiều người ưa chuộng.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Fohla</div>
	</li>
	<li>Loại sản phẩm
	<div>Nạc b&ograve;</div>
	</li>
	<li>Khối lượng
	<div>250g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản từ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua&nbsp;Nạc b&ograve; Fohla tại B&aacute;ch h&oacute;a XANH&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nạc&nbsp;b&ograve; tại B&aacute;ch h&oacute;a XANH tươi ngon, chất lượng v&agrave; bổ sung đầy đủ dưỡng chất tốt cho sức khỏe.</p>
	</li>
	<li>
	<p>Nguồn gốc xuất xứ r&otilde; r&agrave;ng đảm bảo an to&agrave;n cho người sử dụng</p>
	</li>
	<li>
	<p>Giao h&agrave;ng nhanh ch&oacute;ng</p>
	</li>
	<li>
	<p>Gi&aacute; cả hợp l&yacute;</p>
	</li>
</ul>

<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>

<p>Fohla l&agrave; thương thương hiệu chuy&ecirc;n cung cấp c&aacute;c sản phẩm đ&ocirc;ng m&aacute;t chất lượng được nhiều người y&ecirc;u th&iacute;ch. Thịt b&ograve; được đ&oacute;ng g&oacute;i v&agrave; bảo quản ở nhiệt độ th&iacute;ch hợp gi&uacute;p thịt lu&ocirc;n tươi ngon nhưng đảm bảo được đầy đủ dưỡng chất.</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng c&oacute; trong sản phẩm&nbsp;</strong></h3>
<img alt="Nạc bò Fohla 250g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8139/304176/bhx/nac-bo-fohla-250g-202303140904487676.jpg" />
<ul style="margin-left:40px">
	<li>
	<p>Nạc b&ograve; Fohla c&oacute; chứa c&aacute;c th&agrave;nh phần dinh dưỡng như sau: Protein, Lipid, chất xơ, Vitamin A, B6, B12, sắt, kẽm, canxi, magie,.. tốt cho sức khỏe</p>
	</li>
	<li>
	<p>Trong 100g nạt b&ograve; c&oacute; chứa khoảng: 250kcalhacsd du</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của nạc b&ograve; Fohla đối với sức khỏe&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bổ sung năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Bổ sung canxi tốt cho xương</p>
	</li>
	<li>
	<p>Hạn chế t&igrave;nh trạng thiếu m&aacute;u</p>
	</li>
	<li>
	<p>Tăng cường hệ miễn dịch</p>
	</li>
	<li>
	<p>Chống oxy h&oacute;a</p>
	</li>
</ul>

<h3><strong>C&aacute;ch sơ chế nạc b&ograve; Fohla&nbsp;&nbsp;</strong></h3>

<p>Thịt b&ograve; đ&atilde; được đ&oacute;ng khay tiện lợi, sạch sẽ, bạn chỉ cần rửa sạch lại với nước muối, sau đ&oacute; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch.</p>

<h3><strong>C&aacute;c m&oacute;n ngon từ nạc b&ograve;&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>B&uacute;n b&ograve;</p>
	</li>
	<li>
	<p>B&ograve; kho</p>
	</li>
	<li>
	<p>B&ograve; kh&ocirc;</p>
	</li>
	<li>
	<p>B&ograve; nướng</p>
	</li>
	<li>
	<p>B&ograve; x&agrave;o h&agrave;nh t&acirc;y</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản thịt b&ograve; t&aacute;i &Uacute;c Pacow tươi ngon</strong></h3>

<p>Bảo quản thịt b&ograve; t&aacute;i ở nhiệt độ từ 0 - 2 độ C.<br />
<strong>Lưu &yacute;:&nbsp;</strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (8, 'Thịt bò Úc xay Pacow 250g', 85900, 0, 'store/images/thit-cac-loai/thit-bo-uc-xay-khay-250g-202111161731525774_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Rất thuận tiện chế biến nhiều m&oacute;n ngon. <a href="https://www.bachhoaxanh.com/thit-bo">Thịt b&ograve;</a> xay c&oacute; cả nạc v&agrave; mỡ xen lẫn cho hương vị b&eacute;o ngậy tăng th&ecirc;m phần hấp dẫn cho c&aacute;c m&oacute;n ăn. th&iacute;ch hợp để l&agrave;m c&aacute;c m&oacute;n như hamburger, ch&aacute;o, s&uacute;p, b&ograve; vi&ecirc;n.&nbsp;<a href="https://www.bachhoaxanh.com/thit-bo/thit-bo-uc-xay-pacow-khay-250g">Thịt b&ograve; &Uacute;c xay khay 250g</a> tươi ngon&nbsp;được sản xuất ở &Uacute;c bởi <a href="https://www.bachhoaxanh.com/thit-bo-pacow">Pacow</a>, đ&atilde; được kiểm duyệt chặt chẽ.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Pacow</div>
	</li>
	<li>Khối lượng
	<div>250g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Bảo quản
	<div>0-4 độ C trong 21 ng&agrave;y kể từ ng&agrave;y sản xuất</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua thịt b&ograve; xay Pacow tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt b&ograve; &Uacute;c xay Pacow l&agrave; hỗn hợp phần thịt nạc vai, nạc m&ocirc;ng được xay nhỏ c&ugrave;ng với c&ocirc;ng nghệ thịt m&aacute;t gi&uacute;p thịt b&ograve; xay của Pacow giữ được hương thơm, dinh dưỡng, sẵn s&agrave;ng mang đến những m&oacute;n ngon cho gia đ&igrave;nh.</li>
	<li>Thịt b&ograve; xay được đ&oacute;ng khay tiện lợi, sạch sẽ, <strong>khay 250g,</strong> được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Thịt bò Úc xay Pacow 250g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8139/239160/bhx/thit-bo-uc-xay-pacow-khay-250g-202105121346550484.jpg" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu thịt b&ograve; Pacow</strong></h3>
Thịt b&ograve; Pacow được chăn nu&ocirc;i, vỗ b&eacute;o v&agrave; c&ocirc;ng nghệ giết mổ b&ograve; tại Australia. C&aacute;c sản phẩm thịt b&ograve; Pacow được nu&ocirc;i từ c&ocirc;ng nghệ hiện đại, nguồn thức ăn đảm bảo chất lượng cho ra những miếng thịt tươi ngon, thơm ngọt.

<h3><strong>Gi&aacute; trị dinh dưỡng của thịt b&ograve; xay&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt b&ograve; xay chứa nhiều kho&aacute;ng chất vitamin B6, vitamin B12, c&aacute;c kho&aacute;ng chất như đồng, sắt, kẽm,...</li>
	<li>Trong 100g thịt b&ograve; xay c&oacute; khoảng <strong>332 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của thịt b&ograve; xay đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường sức đề kh&aacute;ng</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Tăng cường qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Thịt bò Úc xay Pacow 250g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8139/239160/bhx/thit-bo-uc-xay-pacow-khay-250g-202105121346571403.jpg" /><br />
<strong>C&aacute;ch sơ chế thịt b&ograve; xay&nbsp;</strong></h3>
Thịt b&ograve; xay đ&atilde; được xay sẵn, đ&oacute;ng khay, bạn c&oacute; thể sử dụng trực tiếp.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ thịt b&ograve; xay&nbsp;</strong></h3>
Thịt b&ograve; xay c&oacute; thể chế biến th&agrave;nh c&aacute;c m&oacute;n ăn ngon như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-bo-vien-trang-thom-va-dai-tai-nha-khong-dung-han-the-1304699">b&ograve; vi&ecirc;n</a>, <a href="https://www.bachhoaxanh.com/thit-bo/thit-bo-uc-xay-pacow-khay-250g">ch&aacute;o b&ograve;</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mi-spaghetti-3-phut-nhanh-nhu-chop-1160777">m&igrave; &Yacute; b&ograve; bằm</a>,...

<h3><strong>C&aacute;ch bảo quản thịt b&ograve; xay tươi ngon</strong></h3>
Bảo quản thịt b&ograve; xay ở nhiệt độ từ 0 - 4 độ C.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (9, 'Thịt xay sẵn C.P 300g', 45000, 0, 'store/images/thit-cac-loai/thit-heo-xay-cp-khay-300g-202205161734379811_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<div><a href="https://www.bachhoaxanh.com/thit-heo/thit-heo-xay-cp-khay-300g">Thịt heo xay khay 300g</a> được xay sẵn sạch sẽ v&agrave; tiện d&ugrave;ng v&ocirc; c&ugrave;ng. <a href="https://www.bachhoaxanh.com/thit-heo">Thịt heo</a> xay l&agrave; nguy&ecirc;n liệu kh&ocirc;ng thể thiếu để nấu được nhiều m&oacute;n ăn thơm ngon, đầy đủ dưỡng chất cho cả nh&agrave;. <a href="https://www.bachhoaxanh.com/thit-heo-cp-thit-xay">Thịt xay CP</a> c&oacute; thể tham khảo m&oacute;n thịt xay nhồi c&agrave; chua, đậu hũ nhồi thịt,....</div>
</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thịt heo xay</div>
	</li>
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua thịt heo xay tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt heo xay chất lượng, tươi ngon, được đ&oacute;ng khay 300g vệ sinh, sạch sẽ.</li>
	<li>Thịt heo xay được nhập từ nh&agrave; cung cấp uy t&iacute;n C.P, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Thịt heo xay C.P 300g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/242937/bhx/thit-heo-xay-cp-khay-300g-202111262041452210.jpg" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
Thương hiệu C.P v&agrave;o Việt Nam từ năm 1993, chuy&ecirc;n cung cấp c&aacute;c sản phẩm thịt heo, thịt g&agrave; chất lượng, đạt chuẩn vệ sinh an to&agrave;n thực phẩm. C&aacute;c sản phẩm thịt heo của C.P được người d&ugrave;ng tin tưởng lựa chọn.

<h3><strong>Gi&aacute; trị dinh dưỡng của thịt heo xay</strong></h3>

<ul style="margin-left:40px">
	<li>Trong thịt heo xay c&oacute; chứa nhiều kho&aacute;ng chất như canxi, sắt, đồng, c&aacute;c vitamin A, vitamin B, chất đạm, chất b&eacute;o cần thiết cho cơ thể.</li>
	<li>Trong 100g thịt heo xay c&oacute; khoảng <strong>297 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của thịt heo xay đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường hệ miễn dịch</li>
	<li>Hỗ trợ qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>T&aacute;i tạo qu&aacute; tr&igrave;nh t&aacute;i tạo m&aacute;u</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế thịt heo xay</strong></h3>
Thịt heo đ&atilde; được l&agrave;m sạch, xay sắn, bạn chỉ cần ướp v&agrave; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn t&ugrave;y &yacute;.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ thịt heo xay</strong></h3>
Thịt heo xay d&ugrave;ng để chế biến những m&oacute;n ngon như: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-chao-thit-bam-voi-gung-tuoi-giai-cam-cuc-hieu-qua-973631">ch&aacute;o thịt băm với gừng tươi</a>, canh b&iacute; đao thịt băm, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-chao-trung-bac-thao-va-thit-bam-boi-bo-cho-nguoi-om-985316">ch&aacute;o trứng bắc thảo thịt băm</a>,...

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng thịt heo xay tươi ngon</strong></h3>
Thịt heo xay tươi CP khi mua về c&oacute; thể bảo quản ngăn m&aacute;t từ 0 - 4 độ C, tối đa từ 3 - 5 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng được tối đa 2 - 3 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc thịt heo xay từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt heo của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1:</strong> Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Thịt heo xay C.P 300g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/b%C6%B0%E1%BB%9Bc-1.jpg" /><br />
<strong>Bước 2:</strong> Xem th&ocirc;ng tin sản phẩm bao gồm nguồn gốc, c&ocirc;ng ty sản xuất, t&ecirc;n sản phẩm, trung t&acirc;m chăm s&oacute;c kh&aacute;ch h&agrave;ng,...<br />
<img alt="Thịt heo xay C.P 300g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/h2.jpg" /><br />
<img alt="Thịt heo xay C.P 300g 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/h3.jpg" /><br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (10, 'Thịt xay sẵn C.P 500g', 71500, 0, 'store/images/thit-cac-loai/thit-heo-xay-cp-khay-500g-202205161734555050_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-heo/thit-heo-xay-cp-khay-500g">Thịt heo xay sẵn C.P khay 500g</a> được c&aacute;c chị em nội trợ ưa chuộng v&ocirc; c&ugrave;ng. <a href="https://www.bachhoaxanh.com/thit-heo">Thịt heo</a> được xay sẵn tươi ngon v&ocirc; c&ugrave;ng, chỉ cần mua về l&agrave; c&oacute; thể chế biến được nhiều m&oacute;n ăn thơm ngon v&ocirc; c&ugrave;ng như nấu canh rau củ thịt bằm, l&agrave;m thịt bằm chi&ecirc;n trứng,... thơm ngon v&ocirc; c&ugrave;ng</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thịt heo xay</div>
	</li>
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Khối lượng
	<div>500g</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua thịt heo xay tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt heo xay chất lượng, tươi ngon, được đ&oacute;ng khay 500g vệ sinh, sạch sẽ.</li>
	<li>Thịt heo xay được nhập từ nh&agrave; cung cấp uy t&iacute;n <a href="https://www.bachhoaxanh.com/thit-heo-cp">thịt heo C.P</a>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Thịt heo xay C.P 500g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/242942/bhx/thit-heo-xay-khay-500g-202111262115500241.jpg" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
Thương hiệu C.P v&agrave;o Việt Nam từ <strong>năm 1993</strong>, chuy&ecirc;n cung cấp c&aacute;c sản phẩm thịt heo, thịt g&agrave; chất lượng, đạt chuẩn vệ sinh an to&agrave;n thực phẩm. C&aacute;c sản phẩm thịt heo của C.P được người d&ugrave;ng tin tưởng lựa chọn.

<h3><strong>Gi&aacute; trị dinh dưỡng của thịt heo xay</strong></h3>

<ul style="margin-left:40px">
	<li>Trong thịt heo xay c&oacute; chứa nhiều kho&aacute;ng chất như canxi, sắt, đồng, c&aacute;c vitamin A, vitamin B, chất đạm, chất b&eacute;o cần thiết cho cơ thể.</li>
	<li>Trong 100g thịt heo xay c&oacute; khoảng <strong>297 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của thịt heo xay đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường hệ miễn dịch</li>
	<li>Hỗ trợ qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>T&aacute;i tạo qu&aacute; tr&igrave;nh t&aacute;i tạo m&aacute;u</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế thịt heo xay</strong></h3>
Thịt heo đ&atilde; được l&agrave;m sạch, xay sắn, bạn chỉ cần ướp v&agrave; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn t&ugrave;y &yacute;.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ thịt heo xay</strong></h3>
Thịt heo xay d&ugrave;ng để chế biến những m&oacute;n ngon như: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-chao-thit-bam-voi-gung-tuoi-giai-cam-cuc-hieu-qua-973631">ch&aacute;o thịt băm với gừng tươi</a>, canh b&iacute; đao thịt băm, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-chao-trung-bac-thao-va-thit-bam-boi-bo-cho-nguoi-om-985316">ch&aacute;o trứng bắc thảo thịt băm</a>,...

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng thịt heo xay tươi ngon</strong></h3>
Thịt heo xay CP khi mua về c&oacute; thể bảo quản ngăn m&aacute;t từ 0 - 4 độ C, tối đa từ 3 - 5 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng được tối đa 2 - 3 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc thịt heo xay từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt heo của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1:</strong> Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Thịt heo xay C.P 500g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/b%C6%B0%E1%BB%9Bc-1.jpg" /><br />
<strong>Bước 2:</strong> Xem th&ocirc;ng tin sản phẩm bao gồm nguồn gốc, c&ocirc;ng ty sản xuất, t&ecirc;n sản phẩm, trung t&acirc;m chăm s&oacute;c kh&aacute;ch h&agrave;ng,...<br />
<img alt="Thịt heo xay C.P 500g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/h2.jpg" /><br />
<img alt="Thịt heo xay C.P 500g 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/h3.jpg" /><br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 1, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (11, 'Cốt lết heo C.P 500g', 72000, 0, 'store/images/thit-cac-loai/cot-let-heo-cp-khay-500g-4-6-mieng-202301031119327135_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-heo/suon-cot-let-khay-500g">Sườn cốt lết&nbsp;CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n to&agrave;n thực phẩm, đảm bảo chất lượng, độ tươi ngon. Bản sườn to, d&agrave;y v&agrave; <a href="https://www.bachhoaxanh.com/thit-heo">thịt heo</a> mềm th&iacute;ch hợp để nướng hoặc l&agrave;m sườn ram mặn ăn với cơm trắng. <a href="https://www.bachhoaxanh.com/thit-heo-cp">Thịt heo CP</a> c&oacute; thể d&ugrave;ng điện thoại qu&eacute;t m&atilde; QR tr&ecirc;n tem sản phẩm để kiểm tra nguồn gốc.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sườn cốt lết</div>
	</li>
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Khối lượng
	<div>500g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua sườn cốt lết tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Sườn cốt lết đ&oacute;ng khay, tiện lợi, chất lượng, <strong>khay 500g từ 4-6 miếng</strong>. Thịt cốt lết tươi ngon, dai.</li>
	<li>Sườn cốt lết được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, nhập từ nh&agrave; cung cấp C.P, bạn c&oacute; thể kiểm tra tr&ecirc;n m&atilde; code tr&ecirc;n bao b&igrave;.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cốt lết heo C.P 500g (4-6 miếng ) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/228332/bhx/suon-cot-let-khay-500g-4-6-mieng-202111262103154234.jpg" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
Thịt heo C.P l&agrave; thương hiệu lớn, v&agrave;o Việt Nam từ năm 1993 đ&atilde; x&acirc;y dựng được uy t&iacute;n, niềm tin từ người ti&ecirc;u d&ugrave;ng qua c&aacute;c sản phẩm chất lượng c&ugrave;ng những cam kết như

<ul style="margin-left:40px">
	<li>Kh&ocirc;ng chất tăng trọng.</li>
	<li>Hệ thống chăn nu&ocirc;i kh&eacute;p k&iacute;n.</li>
	<li>Sử dụng thức ăn chất lượng cao.</li>
	<li>Truy xuất được nguồn gốc.</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của sườn cốt lết</strong></h3>

<ul style="margin-left:40px">
	<li>Sườn cốt lết heo chứa chất đạm, chất b&eacute;o, c&aacute;c kho&aacute;ng chất như kali, canxi, đồng, sắt,... c&ugrave;ng c&aacute;c vitamin cần thiết cho cơ thể.</li>
	<li>Trong 100g sườn cốt lết c&oacute; khoảng<strong> 231 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của sườn cốt lết đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Hỗ trợ qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Gi&uacute;p chắc khỏe xương khớp</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế sườn cốt lết</strong></h3>
Sườn cốt lết đ&atilde; được l&agrave;m sạch, đ&oacute;ng hộp sẵn, bạn chỉ cần rửa lại với nước muối l&agrave; c&oacute; thể chế biến th&agrave;nh những m&oacute;n ăn y&ecirc;u th&iacute;ch.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ sườn cốt lết</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-suon-cot-let-rim-thit-mem-vi-dam-da-cuc-dua-com-1334393">Sườn cốt lết rim&nbsp;</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-uop-thit-cot-let-chien-tham-vi-mem-ngon-1209797">Sườn cốt lết chi&ecirc;n&nbsp;đậm đ&agrave;</a></li>
	<li>Sườn cốt lết &aacute;p chảo với bơ</li>
	<li>Cốt lết rim dầu h&agrave;o</li>
	<li>Thịt cốt lết rim mật ong</li>
	<li>Cốt lết ch&aacute;y tỏi bắt vị</li>
	<li>Cốt lết rim me</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng sườn cốt lết tươi ngon</strong></h3>
Sườn cốt lết tươi CP khi mua về c&oacute; thể bảo quản ngăn m&aacute;t từ 0 - 4 độ C, tối đa từ 3 - 5 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng được tối đa 2 - 3 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc sườn cốt lết từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt heo của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1:</strong> Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Cốt lết heo C.P 500g (4-6 miếng ) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/b%C6%B0%E1%BB%9Bc-1.jpg" /><br />
Bước 2: Xem th&ocirc;ng tin sản phẩm bao gồm nguồn gốc, c&ocirc;ng ty sản xuất, t&ecirc;n sản phẩm, trung t&acirc;m chăm s&oacute;c kh&aacute;ch h&agrave;ng,...<br />
<img alt="Cốt lết heo C.P 500g (4-6 miếng ) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/h2.jpg" /><br />
<img alt="Cốt lết heo C.P 500g (4-6 miếng ) 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228332/bhx/files/h3.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (12, 'Thịt đùi C.P 300g', 41500, 0, 'store/images/thit-cac-loai/thit-dui-heo-cp-khay-300g-202208090850530579_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-heo-cp">Thịt đ&ugrave;i heo CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n to&agrave;n thực phẩm, đảm bảo chất lượng, độ tươi ngon. <a href="https://www.bachhoaxanh.com/thit-heo/thit-dui-heo-vi-300g">Thịt đ&ugrave;i heo</a> chủ y&ecirc;u l&agrave; phần nạc n&ecirc;n rất ph&ugrave; hợp cho người c&oacute; chế độ ăn ki&ecirc;ng, giảm c&acirc;n giữ d&aacute;ng. <a href="https://www.bachhoaxanh.com/thit-heo">Thịt heo</a> c&oacute; thể d&ugrave;ng điện thoại qu&eacute;t m&atilde; QR tr&ecirc;n tem sản phẩm để kiểm tra nguồn gốc.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thịt đ&ugrave;i heo</div>
	</li>
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua thịt đ&ugrave;i heo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt đ&ugrave;i heo chất lượng, tươi ngon, nạc nhiều, được đ&oacute;ng khay vệ sinh, tiện lợi.</li>
	<li>Thịt heo được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, nhập từ nh&agrave; cung cấp thịt C.P uy t&iacute;n.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
Thịt heo C.P l&agrave; thương hiệu uy t&iacute;n, chất lượng, chuy&ecirc;n cung cấp c&aacute;c sản phẩm thịt heo đạt chuẩn vệ sinh an to&agrave;n thực phẩm, C.P cam kết

<ul style="margin-left:40px">
	<li>Kh&ocirc;ng chất tăng trọng.</li>
	<li>Hệ thống chăn nu&ocirc;i kh&eacute;p k&iacute;n.</li>
	<li>Sử dụng thức ăn chất lượng cao.</li>
	<li>Truy xuất được nguồn gốc.</li>
</ul>

<h3><img alt="Thịt đùi heo C.P 300g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/226860/bhx/thit-dui-heo-cp-khay-300g-202106261025554317.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của thịt đ&ugrave;i heo</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt đ&ugrave;i heo chứa nhiều chất đạm, chất b&eacute;o, c&aacute;c kho&aacute;ng chất như sắt, đồng, kẽm, kali, canxi,... c&ugrave;ng những vitamin cần thiết cho cơ thể như vitamin A, vitamin B,...</li>
	<li>Trong 100g thịt đ&ugrave;i heo c&oacute; khoảng<strong> 271 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của thịt đ&ugrave;i heo đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Bổ sung dưỡng chất cho cơ thể</li>
	<li>Tăng cường qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế thịt đ&ugrave;i heo</strong></h3>
Thịt đ&ugrave;i heo được l&agrave;m sạch, đ&oacute;ng khay tiện lợi, sạch sẽ. Khi mua về bạn chỉ cần rửa sạch lại với nước muối, sau đ&oacute; th&aacute;i, ướp v&agrave; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ thịt đ&ugrave;i heo</strong></h3>
Một số m&oacute;n ăn ngon từ thịt đ&ugrave;i heo như bạn c&oacute; thể tham khảo l&agrave; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-heo-chien-nuoc-mam-kieu-thai-1109503">thịt heo chi&ecirc;n nước mắm kiểu Th&aacute;i</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-thit-heo-sot-ca-chua-964444">thịt heo sốt c&agrave;</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cuc-ky-ton-com-voi-mon-thit-heo-kho-nghe-vang-uom-dep-mat-1183039">thịt heo kho nghệ</a>, thịt chi&ecirc;n sả ớt,...

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng thịt đ&ugrave;i heo tươi ngon</strong></h3>
Thịt đ&ugrave;i heo tươi CP khi mua về c&oacute; thể bảo quản ngăn m&aacute;t từ 0 - 4 độ C, tối đa từ 3 - 5 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng được tối đa 2 - 3 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc thịt đ&ugrave;i heo từ QR Code</strong></h3>
<img alt="Thịt đùi heo C.P 300g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/226860/bhx/thit-dui-heo-khay-300g-202111262017472747.jpg" /><br />
Tr&ecirc;n mỗi sản phẩm thịt heo của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1: </strong>Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Thịt đùi heo C.P 300g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/226860/bhx/files/b%C6%B0%E1%BB%9Bc-1.jpg" /><br />
<strong>Bước 2: </strong>Xem th&ocirc;ng tin sản phẩm bao gồm nguồn gốc, c&ocirc;ng ty sản xuất, t&ecirc;n sản phẩm, trung t&acirc;m chăm s&oacute;c kh&aacute;ch h&agrave;ng,...<br />
<img alt="Thịt đùi heo C.P 300g 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/226860/bhx/files/h2.jpg" /><br />
<img alt="Thịt đùi heo C.P 300g 4" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/226860/bhx/files/h3.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (13, 'Cốt lết heo G 300g', 38500, 0, 'store/images/thit-cac-loai/cot-let-heo-co-xuong-g-khay-300g-4-6-mieng-202210251612321543_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-heo/cot-let-heo-co-xuong-g-khay-300g">Cốt lết heo c&oacute; xương</a>&nbsp;G được đ&oacute;ng g&oacute;i v&agrave; bảo quản đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n to&agrave;n thực phẩm. Bản <a href="https://www.bachhoaxanh.com/thit-heo">thịt heo</a> to, v&acirc;n mỡ mỏng tạo độ b&eacute;o nhẹ cho miếng thịt n&ecirc;n thường d&ugrave;ng để nướng, ram, chi&ecirc;n &aacute;p chảo.... <a href="https://www.bachhoaxanh.com/thit-heo-g">Thịt heo G</a> c&oacute; thể d&ugrave;ng điện thoại qu&eacute;t m&atilde; QR tr&ecirc;n tem sản phẩm để kiểm tra nguồn gốc.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Cốt lết heo c&oacute; xương</div>
	</li>
	<li>Thương hiệu
	<div>G</div>
	</li>
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi d&ugrave;ng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ từ 0-4 độ C trong 3 ng&agrave;y kế từ ng&agrave;y sản xuất</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua cốt lết heo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Cốt lết c&oacute; xương G (c&ograve;n gọi l&agrave; sườn cốt lết) l&agrave; phần thịt được chặt vu&ocirc;ng g&oacute;c với xương sống của heo. Thịt cốt lết được đ&oacute;ng khay tiện lợi, sạch sẽ, khay <strong>300g từ 4-6 miếng.</strong></li>
	<li>Cốt lết heo được nhập từ thương hiệu thịt heo G, được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu thịt heo G</strong></h3>
Được th&agrave;nh lập năm 2016, G l&agrave; thương hiệu thực phẩm thịt heo chế biến sạch nằm trong chuỗi kh&eacute;p k&iacute;n 3F Plus của c&ocirc;ng ty thực phẩm Feddy trực thuộc C&ocirc;ng ty Cổ phần GreenFeed Việt Nam, gi&uacute;p mang đến những sản phẩm kh&ocirc;ng chỉ sạch m&agrave; c&ograve;n đảm bảo t&iacute;nh an to&agrave;n cao, c&oacute; thể truy xuất nguồn gốc r&otilde; r&agrave;ng cho từng giai đoạn.

<h3><img alt="Cốt lết heo G 300g (4-6 miếng ) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/241213/bhx/thit-vai-heo-g-kitchen-khay-300g-202106021400541576.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của cốt lết heo</strong></h3>

<ul style="margin-left:40px">
	<li>Trong cốt lết heo chứa nhiều chất b&eacute;o, chất đạm, natri, kali, canxi v&agrave; c&aacute;c vitamin A, vitamin B,... cần thiết cho cơ thể.</li>
	<li>Trong 100g thịt cốt lết heo c&oacute; khoảng <strong>231 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của cốt lết heo đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>T&aacute;i tạo cơ bắp</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Tăng cường qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế cốt lết heo</strong></h3>
Sườn cốt lết heo đ&atilde; được sơ chế cơ bản, do đỏ chỉ cần rửa sạch lại với nước muối l&agrave; c&oacute; thể chế biến th&agrave;nh c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ cốt lết heo</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-suon-cot-let-rim-thit-mem-vi-dam-da-cuc-dua-com-1334393">Sườn cốt lết rim mặn</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-uop-thit-cot-let-chien-tham-vi-mem-ngon-1209797">Sườn cốt lết chi&ecirc;n</a></li>
	<li>Cơm tấm sườn cốt lết</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch bảo quản cốt lết heo tươi ngon</strong></h3>
Bảo quản ở nhiệt độ từ 0-4 độ C trong 3 ng&agrave;y kế từ ng&agrave;y sản xuất

<h3><strong>C&aacute;ch tra cứu nguồn gốc cốt lết heo từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt heo G đểu sẽ c&oacute; 1 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.&nbsp;<br />
<img alt="Cốt lết heo G 300g (4-6 miếng ) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/241213/bhx/thit-vai-heo-g-kitchen-khay-300g-202106021400527298.jpg" /><br />
<strong>Bước 1</strong>: Tải ứng dụng G Kitchen tr&ecirc;n App Store hoặc CH Play&nbsp;<br />
<strong>Bước 2</strong>: Mở ứng dụng G Kitchen vừa tải. Bấm v&agrave;o k&iacute; hiệu qu&eacute;t m&atilde; nằm ở g&oacute;c tr&aacute;i như h&igrave;nh b&ecirc;n dưới v&agrave; hướng camera của điện thoại v&agrave;o m&atilde; QR tr&ecirc;n sản phẩm cần qu&eacute;t.<br />
<img alt="Cốt lết heo G 300g (4-6 miếng ) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/241235/bhx/files/ca%CC%81ch%20que%CC%81t%20ma%CC%83%20copy.jpg" /><br />
<strong>Bước 3</strong>: Khi m&atilde; QR được x&aacute;c nhận th&igrave; th&ocirc;ng tin sản phẩm sẽ xuất hiện như h&igrave;nh b&ecirc;n dưới.<br />
<img alt="Cốt lết heo G 300g (4-6 miếng ) 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/241235/bhx/files/tho%CC%82ng%20tin.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (14, 'Ba rọi heo nhập khẩu 500g', 55000, 60500, 'store/images/thit-cac-loai/ba-roi-heo-nhap-khau-dong-lanh-tui-500g-202212191316005640_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Ba rọi heo nhập khẩu c&oacute; da với tỉ lệ nạc mỡ tuyệt vời, <a href="https://www.bachhoaxanh.com/thit-heo">thịt heo</a> săn chắc ngọt n&ecirc;n lu&ocirc;n được c&aacute;c b&agrave; nội trợ ưa chuộng v&agrave; tin d&ugrave;ng. <a href="https://www.bachhoaxanh.com/thit-heo/ba-roi-heo-nhap-khau-dong-lanh-tui-500g">Ba rọi heo nhập khẩu đ&ocirc;ng lạnh</a>&nbsp;với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua ba rọi heo nhập khẩu tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li><strong>Thịt ba rọi heo (ba chỉ heo) nhập khẩu Đức, Brazil, Nga</strong>,... đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, l&agrave; phần thịt heo ngon nhất, bắt mắt nhất được kết hợp bởi da, mỡ v&agrave; thịt. C&aacute;c lớp nạc v&agrave; mỡ được xếp tầng xen kẽ, ho&agrave; c&ugrave;ng với phần da heo dai gi&ograve;n tr&ecirc;n bề mặt,</li>
	<li>Thịt ba rọi chất lượng, ngon, thịt dai, mềm.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Ba rọi heo nhập khẩu đông lạnh 500gr 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/275806/bhx/ba-roi-heo-nhap-khau-tui-500g-202204011304390975.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của ba rọi heo</strong></h3>

<ul style="margin-left:40px">
	<li>Trong thịt ba rọi chứa nhiều đạm, chất b&eacute;o, c&aacute;c kho&aacute;ng chất như canxi, sắt, phốt pho,...Ngo&agrave;i ra, trong thị ba rọi c&ograve;n chứa nhiều vitamin cần thiết cho cơ thể.</li>
	<li>Trong 100g thịt ba rọi c&oacute; khoảng <strong>518 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của ba rọi heo đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường hệ miễn dịch</li>
	<li>Gi&uacute;p n&atilde;o ph&aacute;t triển khỏe mạnh</li>
	<li>Tốt cho qu&aacute; tr&igrave;nh phục hồi cơ bắp</li>
	<li>&hellip;</li>
</ul>
<img alt="Ba rọi heo nhập khẩu đông lạnh 500gr 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/275806/bhx/ba-roi-heo-nhap-khau-tui-500g-202204011304401247.jpeg" /><br />
<strong>C&aacute;ch sơ chế ba rọi heo</strong><br />
Thịt ba rọi heo n&ecirc;n được rửa sạch bằng nước muối, sau đ&oacute; rửa lại với nước sạch. Th&aacute;i th&agrave;nh miếng vừa ăn v&agrave; chế biến th&agrave;nh m&oacute;n t&ugrave;y &yacute;.
<h3><strong>C&aacute;c m&oacute;n ăn ngon từ ba rọi heo</strong></h3>

<ul style="margin-left:40px">
	<li>Ba rọi heo x&agrave;o dưa chua</li>
	<li>Thịt rọi heo ram</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-ba-roi-chien-muoi-da-gion-rum-va-bi-quyet-chien-thit-khong-bi-vang-1239550">Thịt ba rọi heo chi&ecirc;n muối</a></li>
	<li>Thịt ba rọi heo nướng</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-ba-roi-khia-nuoc-mia-thom-ngon-dam-da-chuan-vi-1389676">Ba rọi kh&igrave;a nước m&iacute;a</a></li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản ba rọi heo tươi ngon</strong></h3>

<ul style="margin-left:40px">
	<li>Trước khi cho v&agrave;o tủ lạnh, thịt heo phải được rửa sạch nhằm loại bỏ c&aacute;c bụi bẩn v&agrave; vi khuẩn bị b&aacute;m trong qu&aacute; tr&igrave;nh mua.</li>
	<li>Cho thịt v&agrave;o hộp hoặc t&uacute;i sạch đậy k&iacute;n để tr&aacute;nh t&igrave;nh trạng l&acirc;y lan vi khuẩn v&agrave; &aacute;m m&ugrave;i tủ lạnh.</li>
</ul>
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (15, 'Chân giò heo nhập khẩu 500g', 20000, 35000, 'store/images/thit-cac-loai/chan-gio-heo-nhap-khau-dong-lanh-500g-3-5-mieng-202304131028593482_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Ch&acirc;n gi&ograve; heo nhập khẩu l&agrave; phần <a href="https://www.bachhoaxanh.com/thit-heo">thịt heo</a> gi&ograve;n gi&ograve;n, dai dai, cực kỳ bổ dưỡng m&agrave; c&aacute;c b&agrave; nội trợ ưa chuộng. <a href="https://www.bachhoaxanh.com/thit-heo/chan-gio-heo-nhap-khau-dong-lanh-tui-500g-3-5-mieng">Ch&acirc;n gi&ograve; heo nhập khẩu</a> đ&ocirc;ng lạnh&nbsp;với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua ch&acirc;n gi&ograve; heo nhập khẩu tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li><strong>Ch&acirc;n gi&ograve; heo nhập khẩu Đức, Brazil,</strong>...được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, bao gồm ch&acirc;n gi&ograve; trước v&agrave; ch&acirc;n gi&ograve; sau của con heo.</li>
	<li>Ch&acirc;n gi&ograve; heo h&uacute;t ch&acirc;n kh&ocirc;ng tiện lợi, sạch sẽ.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Chân giò heo nhập khẩu đông lạnh 500g (3 - 5 miếng) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/281542/bhx/chan-gio-heo-nhap-khau-dong-lanh-khay-300g-202205271003567392.jpeg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của ch&acirc;n gi&ograve; heo nhập khẩu</strong></h3>

<ul style="margin-left:40px">
	<li>Ch&acirc;n gi&ograve; heo chứa nhiều vitamin A, vitamin B, vitamin C,...c&aacute;c kho&aacute;ng chất canxi, phốt pho, sắt,...</li>
	<li>Trong 100g ch&acirc;n gi&ograve; heo c&oacute; khoảng <strong>220 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của ch&acirc;n gi&ograve; heo nhập khẩu đối với sức khỏe</strong></h3>
Trong thịt ch&acirc;n gi&ograve; heo chứa rất nhiều kho&aacute;ng chất gi&uacute;p cung cấp chất dinh dưỡng cho cơ thể, chống l&atilde;o h&oacute;a, điều trị c&aacute;c chứng bệnh mất ngủ,... hiệu quả.

<h3><strong>C&aacute;ch sơ chế ch&acirc;n gi&ograve; heo nhập khẩu</strong></h3>
Ch&acirc;n gi&ograve; heo mua về n&ecirc;n được rửa sạch với nước muối, sau đ&oacute; xả với sạch, ướp gia vị v&agrave; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn t&ugrave;y &yacute;.

<h3><img alt="Chân giò heo nhập khẩu đông lạnh 500g (3 - 5 miếng) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/281542/bhx/chan-gio-heo-nhap-khau-dong-lanh-khay-300g-202205271003558656.jpeg" /><br />
<strong>C&aacute;c m&oacute;n ăn ngon từ ch&acirc;n gi&ograve; heo nhập khẩu</strong></h3>

<ul style="margin-left:40px">
	<li>Ch&acirc;n gi&ograve; hầm nấm đ&ocirc;ng c&ocirc;</li>
	<li>Ch&acirc;n gi&ograve; kho ti&ecirc;u</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bien-tau-voi-mon-chan-gio-heo-ngam-chua-ngot-ca-nha-ai-cung-thich-me-1302624">Ch&acirc;n gi&ograve; ng&acirc;m chua ngọt</a>,...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản ch&acirc;n gi&ograve; heo nhập khẩu tươi ngon</strong></h3>

<ul style="margin-left:40px">
	<li>Trước khi cho v&agrave;o tủ lạnh, ch&acirc;n gi&ograve; heo phải được rửa sạch nhằm loại bỏ c&aacute;c bụi bẩn v&agrave; vi khuẩn bị b&aacute;m trong qu&aacute; tr&igrave;nh mua</li>
	<li>Cho thịt v&agrave;o hộp hoặc t&uacute;i sạch đậy k&iacute;n để tr&aacute;nh t&igrave;nh trạng l&acirc;y lan vi khuẩn v&agrave; &aacute;m m&ugrave;i tủ lạnh.</li>
</ul>
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (16, 'Thịt ba rọi C.P 500g', 94000, 0, 'store/images/thit-cac-loai/ba-roi-heo-cp-khay-500g-202205161737201496_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-heo-cp">Ba rọi heo&nbsp;của thương hiệu CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n to&agrave;n thực phẩm, đảm bảo chất lượng, độ tươi ngon. <a href="https://www.bachhoaxanh.com/thit-heo">Thịt heo</a> mềm, v&acirc;n nạc, mỡ r&otilde; r&agrave;ng n&ecirc;n rất ph&ugrave; hợp l&agrave;m nguy&ecirc;n liệu để nấu thịt kho hột vịt. <a href="https://www.bachhoaxanh.com/thit-heo/ba-roi-heo-khay-500g">Thịt heo ba rọi </a>c&oacute; thể d&ugrave;ng điện thoại qu&eacute;t m&atilde; QR tr&ecirc;n tem sản phẩm để kiểm tra nguồn gốc.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Ba rọi heo</div>
	</li>
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Khối lượng
	<div>500g</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua ba rọi heo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Thịt ba rọi heo tươi ngon, chất lượng, đ&oacute;ng khay 500g. Thịt heo dai ngon, mềm thịt.</li>
	<li>Thịt ba rọi được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, được nhập từ nh&agrave; cung cấp thịt heo C.P uy t&iacute;n</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Ba rọi heo C.P 500g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8781/228329/bhx/ba-roi-heo-khay-500g-202111262049102381.jpg" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
V&agrave;o Việt Nam từ năm 1993, thương hiệu C.P chuy&ecirc;n cung cấp c&aacute;c sản phẩm thịt heo uy t&iacute;n, chất lượng cao, đạt chuẩn vệ sinh an to&agrave;n thực phẩm. Cam kết kh&ocirc;ng sử dụng chất tăng trọng, quy tr&igrave;nh chăn nu&ocirc;i kh&eacute;p k&iacute;n v&agrave; truy xuất được nguồn gốc thực phẩm.

<h3><strong>Gi&aacute; trị dinh dưỡng của ba rọi heo</strong></h3>

<ul style="margin-left:40px">
	<li>Trong thịt heo ba rọi chứa chất đạm, chất b&eacute;o, c&aacute;c kho&aacute;ng chất canxi, kẽm, đống, sắt,...</li>
	<li>Trong 100g thịt ba rọi c&oacute; khoảng <strong>517 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của ba rọi heo đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Hỗ trợ qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Duy tr&igrave; cơ bắp</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế ba rọi heo</strong></h3>
Thịt ba rọi heo được đ&oacute;ng khay tiện lợi, sạch sẽ, bạn chỉ cần mang về, rửa sạch lại với nước muối lo&atilde;ng. Sau đ&oacute; th&aacute;i th&agrave;nh miếng vừa ăn v&agrave; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ ba rọi heo</strong></h3>
Bạn c&oacute; thể chế biến ba rọi heo th&agrave;nh nhiều m&oacute;n ăn ngon như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-ba-roi-kho-mang-mem-ngon-len-mau-bat-mat-1181973">ba rọi kho măng</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-ba-roi-chien-sa-don-gian-ma-dua-com-cua-chi-phuc-1227086">ba rọi chi&ecirc;n sả</a>, ba rọi kho dừa, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-ba-roi-chien-sa-ot-thom-nuc-mui-ca-nha-thich-me-1292699">ba rọi chi&ecirc;n sả ớt</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-ba-roi-chien-muoi-da-gion-rum-va-bi-quyet-chien-thit-khong-bi-vang-1239550">ba rọi chi&ecirc;n muối</a>,...

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng ba rọi heo tươi ngon</strong></h3>
Thịt ba rọi tươi CP khi mua về c&oacute; thể bảo quản ngăn m&aacute;t từ 0 - 4 độ C, tối đa từ 3 - 5 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng được tối đa 2 - 3 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc ba rọi heo từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt heo của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1:</strong> Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Ba rọi heo C.P 500g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228329/bhx/files/h1.jpg" /><br />
<strong>Bước 2: </strong>Xem th&ocirc;ng tin sản phẩm bao gồm nguồn gốc, c&ocirc;ng ty sản xuất, t&ecirc;n sản phẩm, trung t&acirc;m chăm s&oacute;c kh&aacute;ch h&agrave;ng,...<br />
<img alt="Ba rọi heo C.P 500g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228329/bhx/files/h2.jpg" /><br />
<img alt="Ba rọi heo C.P 500g 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8781/228329/bhx/files/h3.jpg" /><br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (17, 'Ức gà tươi phi lê C.P 500g', 53000, 0, 'store/images/thit-cac-loai/uc-ga-tuoi-phi-le-cp-khay-500g-1-3-mieng-202210251637088087_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-ga/uc-ga-tuoi-phi-le-khay-500g">Ức g&agrave; tươi phi l&ecirc; CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon. <a href="https://www.bachhoaxanh.com/thit-ga-cp">Thịt g&agrave; C.P</a> xuất xứ r&otilde; r&agrave;ng, được d&ugrave;ng nhiều trong chế độ ăn uống khoa học như giảm c&acirc;n, tăng cơ bắp. Ức <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt, v&ocirc; c&ugrave;ng an t&acirc;m.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>CP</div>
	</li>
	<li>Loại sản phẩm
	<div>Ức g&agrave; tươi phi l&ecirc;</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua ức g&agrave; tươi phi l&ecirc; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Ức g&agrave; phi l&ecirc; tươi, ngon thịt dai, nhiều nạc, &iacute;t da được rất nhiều người lựa chọn. Đ&oacute;ng khay 500g từ 1-3 miếng</li>
	<li>Thịt ức g&agrave; phi l&ecirc; được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&oacute;ng khay vệ sinh sạch sẽ.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Ức gà tươi phi lê C.P 500g (1-3 miếng) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/239600/bhx/uc-ga-tuoi-phi-le-khay-500g-1-3-mieng-202111261945014020.jpg" style="height:500px; width:800px" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
C.P l&agrave; thương hiệu lớn, chuy&ecirc;n cung cấp những loại thịt chất lượng như thịt g&agrave;, thịt heo đạt chuẩn an to&agrave;n vệ sinh thực phẩm với cam kết:

<ul style="margin-left:40px">
	<li>Kh&ocirc;ng chất tăng trọng.</li>
	<li>Hệ thống chăn nu&ocirc;i kh&eacute;p k&iacute;n.</li>
	<li>Sử dụng thức ăn chất lượng cao.</li>
	<li>Truy xuất được nguồn gốc.</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của ức g&agrave; tươi phi l&ecirc;</strong></h3>

<ul style="margin-left:40px">
	<li>Trong ức g&agrave; c&oacute; chứa nhiều chất đạm, c&aacute;c vitamin A, vitamin B, vitamin PP v&agrave; nhiều kho&aacute;ng chất quan trọng cho cơ thể.</li>
	<li>Trong 100g thịt ức g&agrave; c&oacute; khoảng <strong>165 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của ức g&agrave; tươi phi l&ecirc; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Hỗ trợ giảm c&acirc;n, th&iacute;ch hợp cho người ăn ki&ecirc;ng</li>
	<li>Tăng qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Hỗ trợ duy tr&igrave; sức khỏe cơ bắp</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế ức g&agrave; tươi phi l&ecirc;</strong></h3>
Ức g&agrave; phi l&ecirc; đ&atilde; được l&agrave;m sẵn, đ&oacute;ng khay, bạn chỉ cần rửa lại với nước muối v&agrave; xả lại với nước sạch l&agrave; c&oacute; thể mang đi chế biến.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ ức g&agrave; tươi phi l&ecirc;</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-uc-ga-chien-nuoc-mam-cay-cay-man-man-sieu-ngon-1206942">Ức g&agrave; chi&ecirc;n nước mắm</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-uc-ga-ap-chao-giam-can-ngon-me-ly-an-mai-chang-ngan-1264271">Ức g&agrave; &aacute;p chảo</a></li>
	<li>Ức g&agrave; x&agrave;o ớt chu&ocirc;ng</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng ức g&agrave; tươi phi l&ecirc; tươi ngon</strong></h3>
Ức g&agrave; tươi phi l&ecirc; CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc ức g&agrave; tươi phi l&ecirc; từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt g&agrave; của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
Bước 1: Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Ức gà tươi phi lê C.P 500g (1-3 miếng) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/ma%cc%83%20qr.jpg" /><br />
Bước 2: Xem th&ocirc;ng tin sản phẩm bao gồm: cơ sở chế biến, trại giống, trại chăn nu&ocirc;i.<br />
<img alt="Ức gà tươi phi lê C.P 500g (1-3 miếng) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/Untitled-4.jpg" /><br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (18, 'Má đùi gà C.P 500g', 37000, 0, 'store/images/thit-cac-loai/ma-dui-ga-cp-khay-500g-3-5-cai-202210251635580170_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-ga-cp">M&aacute; đ&ugrave;i g&agrave;&nbsp;CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng. Th&iacute;ch hợp để nấu m&oacute;n <a href="https://www.bachhoaxanh.com/thit-ga/ma-dui-ga-vi-500g">m&aacute; đ&ugrave;i g&agrave;</a> nướng sa tế, <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> r&aacute;n, m&aacute; đ&ugrave;i g&agrave; rim ti&ecirc;u,...&nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Loại sản phẩm
	<div>M&aacute; đ&ugrave;i g&agrave;</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua m&aacute; đ&ugrave;i g&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>M&aacute; đ&ugrave;i g&agrave; C.P chất lượng, được đ&oacute;ng khay sạch sẽ, tiện lợi. Đ&oacute;ng khay 500g từ 3-5 c&aacute;i. Thịt dai, ngon.</li>
	<li>M&aacute; đ&ugrave;i g&agrave; được nhập từ nh&agrave; cung cấp C.P, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Má đùi gà C.P 500g (3-5 cái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/226883/bhx/ma-dui-ga-khay-500g-2-4-cai-202112021509056066.jpg" style="height:500px; width:667px" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
Thịt g&agrave; CP được nhiều người tin d&ugrave;ng, được sản xuất từ hệ thống được kiểm so&aacute;t chặt chẽ theo nguy&ecirc;n tắc chuỗi kh&eacute;p k&iacute;n &ldquo;Thức ăn chăn nu&ocirc;i - Trang trại chăn nu&ocirc;i &ndash; Nh&agrave; m&aacute;y chế biến thực phẩm&rdquo;. C&aacute;c sản phẩm của thương hiệu C.P rất được người d&ugrave;ng tin tưởng.

<h3><strong>Gi&aacute; trị dinh dưỡng của m&aacute; đ&ugrave;i g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>M&aacute; đ&ugrave;i chứa nhiều dưỡng chất như chất đạm, chất b&eacute;o, c&aacute;c kho&aacute;ng chất kẽm, sắt, đồng, canxi,... cần thiết cho cơ thể.</li>
	<li>Trong 100g m&aacute; đ&ugrave;i g&agrave; c&oacute; khoảng <strong>177 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của m&aacute; đ&ugrave;i g&agrave; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>M&aacute; đ&ugrave;i g&agrave; gi&uacute;p bổ sung dưỡng chất cho cơ thể</li>
	<li>Tăng cường qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Tăng cường hệ miễn dịch</li>
</ul>

<h3><strong>C&aacute;ch sơ chế m&aacute; đ&ugrave;i g&agrave;</strong></h3>
M&aacute; đ&ugrave;i g&agrave; được đ&oacute;ng khay vệ sinh sạch sẽ, bạn chỉ cần rửa sạch m&aacute; đ&ugrave;i với muối v&agrave; rửa sạch lại, chặt th&agrave;nh từng miếng vừa ăn, sau đ&oacute; ướp v&agrave; chế biến th&agrave;nh nhiều m&oacute;n ăn ngon.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ m&aacute; đ&ugrave;i g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dui-ga-sot-mat-ong-hap-dan-ngon-mieng-1117189">Đ&ugrave;i g&agrave; sốt mật ong</a></li>
	<li>M&aacute; đ&ugrave;i kho sả</li>
	<li>M&aacute; đ&ugrave;i g&agrave; kho gừng</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mon-dui-ga-nuong-sieu-cay-sieu-ngon-nhu-ba-tan-vlog-1168955">M&aacute; đ&ugrave;i g&agrave; nướng</a></li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng m&aacute; đ&ugrave;i g&agrave; tươi ngon</strong></h3>
M&aacute; đ&ugrave;i g&agrave; CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc m&aacute; đ&ugrave;i g&agrave; từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt g&agrave; của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1:</strong> Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Má đùi gà C.P 500g (3-5 cái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/ma%cc%83%20qr.jpg" /><br />
<strong>Bước 2: </strong>Xem th&ocirc;ng tin sản phẩm bao gồm: cơ sở chế biến, trại giống, trại chăn nu&ocirc;i.<br />
<img alt="Má đùi gà C.P 500g (3-5 cái) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/Untitled-4.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (19, 'Cánh gà giữa nhập khẩu 500g', 49500, 65500, 'store/images/thit-cac-loai/canh-ga-giua-nhap-khau-dong-lanh-500g-12-17-mieng-202304131042416934_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&aacute;nh giữa <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> nhập khẩu tươi ngon, nhiều thịt, gi&agrave;u dinh dưỡng thường d&ugrave;ng để chi&ecirc;n với nước mắm hoặc hấp h&agrave;nh.&nbsp;<a href="https://www.bachhoaxanh.com/thit-ga/canh-ga-giua-nhap-khau-dong-lanh-tui-500g-9-11-mieng">C&aacute;nh g&agrave; giữa nhập khẩu</a> đ&ocirc;ng lạnh&nbsp;với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua c&aacute;nh g&agrave; giữa tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; giữa nhập khẩu chất lượng, thịt dai ngon. C&aacute;nh g&agrave; được đ&oacute;ng vỉ, h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản tốt hơn.</li>
	<li>C&aacute;nh giữa g&agrave; nhập khẩu đ&ocirc;ng lạnh từ <strong>Brazil, Hungary</strong> với phương ph&aacute;p l&agrave;m đ&ocirc;ng lạnh cấp tốc từ thịt g&agrave; tươi trong thời gian nhanh nhất, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cánh gà giữa nhập khẩu đông lạnh 500g (12 - 17 miếng) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/249010/bhx/canh-ga-giua-nhap-khau-dong-lanh-khay-500g-9-11-mieng-202203121749225011.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của c&aacute;nh g&agrave; giữa</strong></h3>
C&aacute;nh g&agrave; chứa nhiều vitamin A, vitamin B, c&aacute;c kho&aacute;ng chất như canxi, kali, magie,...<br />
Trong 100g c&aacute;nh g&agrave; giữa c&oacute; khoảng <strong>203 Kcal.</strong>

<h3><strong>T&aacute;c dụng của c&aacute;nh g&agrave; giữa đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Cải thiện hệ miễn dịch</li>
	<li>Gi&uacute;p th&uacute;c đẩy qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Ngăn ngừa lo&atilde;ng xương</li>
	<li>Tốt cho tim mạch</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế c&aacute;nh g&agrave; giữa</strong></h3>
C&aacute;nh g&agrave; giữa đ&atilde; được l&agrave;m sạch, bạn mua về chỉ cần b&oacute;p lại với muối, sau đ&oacute; mang đi rửa sạch lại với nước l&agrave; c&oacute; thể mang đi chế biến.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute;nh g&agrave; giữa</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/canh-ga-chien-nuoc-mam-bang-noi-chien-khong-dau-1242423">C&aacute;nh g&agrave; chi&ecirc;n nước mắm</a> đậm đ&agrave;</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-ga-chien-bot-gion-tan-voi-bot-chien-gion-aji-quick-1170182">C&aacute;nh g&agrave; chi&ecirc;n gi&ograve;n rụm</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-ga-chien-gion-rum-vang-ngon-nhu-kfc-1205030">C&aacute;nh g&agrave; chi&ecirc;n bơ</a> ngon như mơ</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-chuan-bi-va-nuong-canh-ga-ngon-1089655">C&aacute;nh g&agrave; nướng</a> si&ecirc;u ngon</li>
	<li>C&aacute;nh g&agrave; sốt chua cay kiểu Th&aacute;i</li>
	<li>Lạ miệng với c&aacute;nh g&agrave; chi&ecirc;n coca</li>
</ul>

<h3><strong>C&aacute;ch bảo quản c&aacute;nh g&agrave; giữa tươi ngon</strong></h3>

<ul style="margin-left:40px">
	<li>Trước khi cho v&agrave;o tủ lạnh, thịt phải được rửa sạch nhằm loại bỏ c&aacute;c bụi bẩn v&agrave; vi khuẩn bị b&aacute;m trong qu&aacute; tr&igrave;nh mua</li>
	<li>Cho thịt v&agrave;o hộp hoặc t&uacute;i sạch đậy k&iacute;n để tr&aacute;nh t&igrave;nh trạng l&acirc;y lan vi khuẩn v&agrave; &aacute;m m&ugrave;i tủ lạnh.</li>
	<li>N&ecirc;n bảo quản thịt ở ngăn đ&ocirc;ng đ&aacute; l&agrave; -18&deg;C đến 25&deg;C v&agrave; ngăn m&aacute;t l&agrave; 1 &ndash; 4&deg;C.</li>
	<li>Thời gian bảo quản tối đa của thịt g&agrave; l&agrave; 3 th&aacute;ng ở mức -12&deg;C</li>
	<li>Thịt sau khi đ&atilde; r&atilde; đ&ocirc;ng n&ecirc;n d&ugrave;ng hết, kh&ocirc;ng trữ đ&ocirc;ng lại. Nếu khối lượng thịt qu&aacute; lớn th&igrave; chia th&agrave;nh nhiều phần ri&ecirc;ng để bảo quản</li>
</ul>

<h3><strong>Giấy chứng nhận nguồn gốc c&aacute;nh giữa g&agrave; nhập khẩu tại B&aacute;ch ho&aacute; XANH</strong></h3>
<img alt="Cánh gà giữa nhập khẩu đông lạnh 500g (12 - 17 miếng) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/223083/bhx/files/233955.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (20, 'Đùi tỏi gà C.P 500g', 58000, 0, 'store/images/thit-cac-loai/dui-toi-ga-cp-khay-500g-4-6-dui-202210251635290407_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-ga-cp">Đ&ugrave;i tỏi g&agrave; CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng. <a href="https://www.bachhoaxanh.com/thit-ga/dui-toi-ga-vi-500g">Đ&ugrave;i tỏi g&agrave;</a> l&agrave; một một nguy&ecirc;n liệu th&iacute;ch hợp để nấu m&oacute;n g&agrave; r&aacute;n, cơm đ&ugrave;i <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> quay ti&ecirc;u hay g&agrave; chi&ecirc;n nước mắm,... C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Loại sản phẩm
	<div>Đ&ugrave;i tỏi g&agrave;</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua đ&ugrave;i tỏi g&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Đ&ugrave;i tỏi g&agrave; C.P chất lượng, tươi ngon, được đ&oacute;ng khay tiện lợi, sạch sẽ. <strong>Mỗi khay 500g từ 4-6 đ&ugrave;i.</strong></li>
	<li>Đ&ugrave;i g&agrave; được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, c&oacute; thể tra m&atilde; QR tr&ecirc;n bao b&igrave; sản phẩm.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Đùi tỏi gà C.P 500g (4-6 đùi) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/226876/bhx/dui-toi-ga-khay-500g-4-6-dui-202111261915313915.jpg" style="height:500px; width:800px" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
C.P l&agrave; một thương hiệu lớn, uy t&iacute;n chuy&ecirc;n cung cấp về những sản phẩm thịt heo, thịt g&agrave; với đảm bảo v&agrave; cam kết về chất lượng. Thịt C.P đạt chuẩn về an to&agrave;n vệ sinh.

<h3><strong>Gi&aacute; trị dinh dưỡng của đ&ugrave;i tỏi g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>Trong đ&ugrave;i g&agrave; c&oacute; chứa nhiều vitamin A, vitamin B v&agrave; vitamin PP, c&aacute;c kho&aacute;ng chất như sắt, canxi, kali, magie,... tốt cho cơ thể.</li>
	<li>Trong 100g đ&ugrave;i tỏi g&agrave; c&oacute; khoảng <strong>209 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của đ&ugrave;i tỏi g&agrave; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Hỗ trợ qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Bổ sung dinh dưỡng cho cơ thể</li>
	<li>Gi&uacute;p xương chắc khỏe</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế đ&ugrave;i tỏi g&agrave;</strong></h3>
Đ&ugrave;i g&agrave; mua về n&ecirc;n b&oacute;p lại với muối, sau đ&oacute; rửa sạch lại với nước v&agrave; mang đi chế biến th&agrave;nh c&aacute;c m&oacute;n ăn ngon.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ đ&ugrave;i tỏi g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>Đ&ugrave;i tỏi chi&ecirc;n nước mắm</li>
	<li>Đ&ugrave;i tỏi chi&ecirc;n coca</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dui-ga-nuong-mat-ong-thom-lung-ca-gian-bep-tre-nho-va-nguoi-lon-deu-me-1265231">Đ&ugrave;i g&agrave; nướng mật ong</a></li>
	<li>Đ&ugrave;i tỏi kho gừng</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dui-ga-sot-mat-ong-hap-dan-ngon-mieng-1117189">Đ&ugrave;i g&agrave; sốt mật ong</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/am-nong-ngay-mua-voi-ga-kho-gung-1176554">Đ&ugrave;i tỏi g&agrave; kho gừng</a></li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng đ&ugrave;i tỏi g&agrave; tươi ngon</strong></h3>
Đ&ugrave;i g&agrave; tỏi CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc đ&ugrave;i tỏi g&agrave; từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt g&agrave; của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1:</strong> Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Đùi tỏi gà C.P 500g (4-6 đùi) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/ma%cc%83%20qr.jpg" /><br />
<strong>Bước 2:</strong> Xem th&ocirc;ng tin sản phẩm bao gồm: cơ sở chế biến, trại giống, trại chăn nu&ocirc;i.<br />
<img alt="Đùi tỏi gà C.P 500g (4-6 đùi) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/Untitled-4.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (21, 'Đùi gà góc tư C.P 500g', 44000, 0, 'store/images/thit-cac-loai/dui-ga-goc-tu-cp-khay-500g-1-3-mieng-202210251636143728_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-ga-cp">Đ&ugrave;i g&agrave; g&oacute;c tư&nbsp;CP</a> đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng. <a href="https://www.bachhoaxanh.com/thit-ga/dui-ga-goc-tu-vi-500g">Đ&ugrave;i g&agrave;</a> l&agrave; một một nguy&ecirc;n liệu th&iacute;ch hợp để nấu m&oacute;n g&agrave; r&aacute;n, cơm đ&ugrave;i <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> quay ti&ecirc;u hay g&agrave; chi&ecirc;n nước mắm,...&nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Loại sản phẩm
	<div>Đ&ugrave;i g&agrave; g&oacute;c tư</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua đ&ugrave;i g&agrave; g&oacute;c tư tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Đ&ugrave;i g&agrave; g&oacute;c tư tươi ngon, chất lượng, đ&ugrave;i to, thịt dai ngon. Được đ&oacute;ng khay tiện lợi <strong>500g từ 1-3 đ&ugrave;i.</strong></li>
	<li>Đ&ugrave;i g&agrave; g&oacute;c tư được nhập từ c&ocirc;ng ty C.P đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Đùi gà góc tư C.P 500g (1-3 miếng) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/226948/bhx/dui-ga-goc-tu-khay-500g-1-3-mieng-202111261902182658.jpg" style="height:500px; width:800px" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
C.P l&agrave; thương hiệu lớn, uy t&iacute;n chuy&ecirc;n cung cấp c&aacute;c sản phẩm chất lượng về thịt g&agrave;, thịt heo. <strong>C.P được th&agrave;nh lập từ năm 1993</strong> ph&aacute;t triển mạnh đến nay, cung cấp cho nhiều nh&agrave; ph&acirc;n phối lớn trong đ&oacute; c&oacute; B&aacute;ch h&oacute;a XANH.

<h3><strong>Gi&aacute; trị dinh dưỡng của đ&ugrave;i g&agrave; g&oacute;c tư</strong></h3>

<ul style="margin-left:40px">
	<li>Đ&ugrave;i g&agrave; g&oacute;c tư chứa nhiều dưỡng chất c&oacute; lợi cho sức khỏe như chất đạm, chất b&eacute;o, canxi, kali, magie,...</li>
	<li>Trong 100g đ&ugrave;i g&agrave; g&oacute;c tư c&oacute; khoảng <strong>177 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của đ&ugrave;i g&agrave; g&oacute;c tư đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Dinh dưỡng trong đ&ugrave;i g&agrave; gi&uacute;p tăng cường qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Gi&uacute;p xương chắc khỏe</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế đ&ugrave;i g&agrave; g&oacute;c tư</strong></h3>
Đ&ugrave;i g&agrave; g&oacute;c tư mua về, đem b&oacute;p với muối v&agrave; rửa sạch lại bằng nước sạch. Sau đ&oacute;, chặt g&agrave; th&agrave;nh miếng vừa ăn v&agrave; tẩm ướp.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ đ&ugrave;i g&agrave; g&oacute;c tư</strong></h3>
Đ&ugrave;i g&agrave; g&oacute;c tư c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dui-ga-sot-mat-ong-hap-dan-ngon-mieng-1117189">đ&ugrave;i g&agrave; sốt mật ong</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/am-nong-ngay-mua-voi-ga-kho-gung-1176554">đ&ugrave;i g&agrave; kho gừng</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dui-ga-nuong-mat-ong-thom-lung-ca-gian-bep-tre-nho-va-nguoi-lon-deu-me-1265231">đ&ugrave;i g&agrave; nướng cay</a>, &hellip;

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng đ&ugrave;i g&agrave; g&oacute;c tư tươi ngon</strong></h3>
Đ&ugrave;i g&agrave; g&oacute;c tư CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc đ&ugrave;i g&agrave; g&oacute;c tư từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt g&agrave; của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1: </strong>Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Đùi gà góc tư C.P 500g (1-3 miếng) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/ma%cc%83%20qr.jpg" /><br />
<strong>Bước 2: </strong>Xem th&ocirc;ng tin sản phẩm bao gồm: cơ sở chế biến, trại giống, trại chăn nu&ocirc;i.<br />
<img alt="Đùi gà góc tư C.P 500g (1-3 miếng) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/Untitled-4.jpg" /><br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (22, 'Cánh gà C.P 500g', 57000, 0, 'store/images/thit-cac-loai/canh-ga-cp-khay-500g-3-5-canh-202210251635126963_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-ga-cp">C&aacute;nh g&agrave; CP </a>đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng.. Th&iacute;ch hợp để nấu m&oacute;n <a href="https://www.bachhoaxanh.com/thit-ga/canh-ga-vi-500g">c&aacute;nh g&agrave;</a> chi&ecirc;n nước mắm, <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> r&aacute;n, c&aacute;nh g&agrave; kho,...&nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Loại sản phẩm
	<div>C&aacute;nh g&agrave;</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua c&aacute;nh g&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; chất lượng, thịt dai ngon, được đ&oacute;ng khay vệ sinh, tiện lợi. C&aacute;nh g&agrave; được đ&oacute;ng <strong>khay 500g từ 3-5 c&aacute;nh.</strong></li>
	<li>C&aacute;nh g&agrave; C.P được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, c&oacute; thể kiểm tra bằng m&atilde; QR.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cánh gà C.P 500g (3-5 cánh) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/226870/bhx/canh-ga-khay-500g-202009290928295942.jpg" style="height:500px; width:800px" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
C.P l&agrave; thương hiệu lớn, chuy&ecirc;n cung cấp những loại thịt chất lượng như thịt g&agrave;, thịt heo đạt chuẩn an to&agrave;n vệ sinh thực phẩm với cam kết:

<ul style="margin-left:40px">
	<li>Kh&ocirc;ng sử dụng chất tăng trọng.</li>
	<li>Truy xuất nguồn gốc dễ</li>
	<li>Sử dụng thức ăn chất lượng cao.</li>
	<li>Hệ thống chăn nu&ocirc;i đạt chuẩn</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của c&aacute;nh g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; cung cấp protein, chất b&eacute;o v&agrave; nhiều vitamin v&agrave; c&aacute;c kho&aacute;ng chất kh&aacute;c c&oacute; lợi cho sức khỏe.</li>
	<li>Trong 100g c&aacute;nh g&agrave; c&oacute; khoảng <strong>203 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của c&aacute;nh g&agrave; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; gi&uacute;p cung cấp nhiều dưỡng chất cho cơ thể</li>
	<li>Hỗ trợ ph&ograve;ng chống lo&atilde;ng xương</li>
	<li>Gi&uacute;p qu&aacute; tr&igrave;nh trao đổi chất diễn ra tốt hơn</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế c&aacute;nh g&agrave;</strong></h3>
C&aacute;nh g&agrave; được đ&oacute;ng khay l&agrave;m sẵn, bạn chỉ cần rửa sạch lại với muối v&agrave; xả lại với nước sạch. Sau đ&oacute; l&agrave; c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute;nh g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; chi&ecirc;n nước mắm</li>
	<li>C&aacute;nh g&agrave; sả tắc</li>
	<li>C&aacute;nh g&agrave; nướng</li>
	<li>C&aacute;nh g&agrave; kho gừng</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng c&aacute;nh&nbsp;g&agrave; tươi ngon</strong></h3>
C&aacute;nh g&agrave; CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.

<h3><strong>C&aacute;ch tra cứu nguồn gốc c&aacute;nh g&agrave; từ QR Code</strong></h3>
Tr&ecirc;n mỗi sản phẩm thịt g&agrave; của CP đều c&oacute; 2 m&atilde; QR để kh&aacute;ch h&agrave;ng c&oacute; thể truy xuất nguồn gốc thịt.<br />
<strong>Bước 1: </strong>Mở camera tr&ecirc;n điện thoại v&agrave; qu&eacute;t m&atilde; QR v&agrave; nhấn v&agrave;o tr&igrave;nh duyệt hiện ra tr&ecirc;n m&agrave;n h&igrave;nh để xem th&ocirc;ng tin.<br />
<img alt="Cánh gà C.P 500g (3-5 cánh) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/ma%cc%83%20qr.jpg" /><br />
<strong>Bước 2:</strong> Xem th&ocirc;ng tin sản phẩm bao gồm: cơ sở chế biến, trại giống, trại chăn nu&ocirc;i.<br />
<img alt="Cánh gà C.P 500g (3-5 cánh) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images//8790/226870/bhx/files/Untitled-4.jpg" /><br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (23, 'Cánh gà đông lạnh C.P 1kg', 100000, 0, 'store/images/thit-cac-loai/canh-ga-dong-lanh-cp-1kg-6-10-canh-202303200932309598_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/thit-ga-cp">C&aacute;nh g&agrave; CP </a>đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng.. Th&iacute;ch hợp để nấu m&oacute;n <a href="https://www.bachhoaxanh.com/thit-ga/canh-ga-dong-lanh-cp-tui-1kg-6-10-canh">c&aacute;nh g&agrave;</a> chi&ecirc;n nước mắm, <a href="https://www.bachhoaxanh.com/thit-ga">g&agrave;</a> r&aacute;n, c&aacute;nh g&agrave; kho,... C&aacute;nh g&agrave; tươi sạch, an to&agrave;n.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Loại sản phẩm
	<div>C&aacute;nh g&agrave; đ&ocirc;ng lạnh</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Nấu ch&iacute;n trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua c&aacute;nh g&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; chất lượng, thịt dai ngon, đ&oacute;ng t&uacute;i vệ sinh</li>
	<li>C&aacute;nh g&agrave; C.P được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/302949/bhx/canh-ga-dong-lanh-cp-tui-1kg-6-10-canh-202302181347409680.jpg" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong></h3>
C.P l&agrave; thương hiệu lớn, chuy&ecirc;n cung cấp những loại thịt chất lượng như thịt g&agrave;, thịt heo đạt chuẩn an to&agrave;n vệ sinh thực phẩm với cam kết:

<ul style="margin-left:40px">
	<li>Kh&ocirc;ng sử dụng chất tăng trọng.</li>
	<li>Truy xuất nguồn gốc dễ</li>
	<li>Sử dụng thức ăn chất lượng cao.</li>
	<li>Hệ thống chăn nu&ocirc;i đạt chuẩn</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của c&aacute;nh g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; cung cấp protein, chất b&eacute;o v&agrave; nhiều vitamin v&agrave; c&aacute;c kho&aacute;ng chất kh&aacute;c c&oacute; lợi cho sức khỏe.</li>
	<li>Trong 100g c&aacute;nh g&agrave; c&oacute; khoảng <strong>203 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của c&aacute;nh g&agrave; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; gi&uacute;p cung cấp nhiều dưỡng chất cho cơ thể</li>
	<li>Hỗ trợ ph&ograve;ng chống lo&atilde;ng xương</li>
	<li>Gi&uacute;p qu&aacute; tr&igrave;nh trao đổi chất diễn ra tốt hơn</li>
	<li>&hellip;</li>
</ul>

<h3><img class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/302949/bhx/canh-ga-dong-lanh-cp-tui-1kg-6-10-canh-202302181347402130.jpg" /><br />
<strong>C&aacute;ch sơ chế c&aacute;nh g&agrave;</strong></h3>
C&aacute;nh g&agrave; được l&agrave;m sẵn, bạn chỉ cần rửa sạch lại với muối v&agrave; xả lại với nước sạch. Sau đ&oacute; l&agrave; c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute;nh g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;nh g&agrave; chi&ecirc;n nước mắm</li>
	<li>C&aacute;nh g&agrave; sả tắc</li>
	<li>C&aacute;nh g&agrave; nướng</li>
	<li>C&aacute;nh g&agrave; kho gừng</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng c&aacute;nh&nbsp;g&agrave; tươi ngon</strong></h3>
C&aacute;nh g&agrave; CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (24, 'Xương gà C.P 1kg', 31000, 0, 'store/images/thit-cac-loai/xuong-ga-cp-goi-1kg-202209130803387101_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Xương g&agrave; l&agrave;m sạch, đ&oacute;ng g&oacute;i k&iacute;n, đảm bảo an to&agrave;n vệ sinh, dễ d&agrave;ng sử dụng c&oacute; thể d&ugrave;ng hầm canh, nấu nước s&uacute;p, nước d&ugrave;ng rất ngon, ngọt nước v&agrave; c&ograve;n phần thịt ăn k&egrave;m.&nbsp;<a href="https://www.bachhoaxanh.com/thit-ga/xuong-ga-cp-goi-1kg">Xương g&agrave; C.P g&oacute;i 1kg</a> ch&iacute;nh h&atilde;ng đảm bảo giao h&agrave;ng tươi ngon tận nh&agrave; nhanh ch&oacute;ng</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>C.P</div>
	</li>
	<li>Loại sản phẩm
	<div>Xương g&agrave;</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ 0 - 4 độ C</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua xương g&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Xương g&agrave; chất lượng, được l&agrave;m sạch sẽ, đ&oacute;ng th&agrave;nh t&uacute;i 1kg.</li>
	<li>Xương g&agrave; được nhập từ nh&agrave; cung cấp C.P, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>
<img alt="Xương gà C.P 1kg 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/270860/bhx/xuong-ga-cp-goi-1kg-202201271017491903.jpg" style="height:500px; width:800px" /><br />
<strong>Đ&ocirc;i n&eacute;t về thương hiệu C.P</strong><br />
C.P l&agrave; một trong những thương hiệu chuy&ecirc;n sản xuất về c&aacute;c sản phẩm thịt heo, <a href="https://www.bachhoaxanh.com/thit-ga">thịt g&agrave;</a> chất lượng, vệ sinh v&agrave; an to&agrave;n. C&aacute;c sản phẩm <a href="https://www.bachhoaxanh.com/thit-ga-cp">thịt g&agrave; của C.P</a> được đảm bảo chất lượng vệ sinh an to&agrave;n thực phẩm.

<h3><img alt="Xương gà C.P 1kg 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8790/270860/bhx/xuong-ga-cp-goi-1kg-202201271017501198.jpg" style="height:500px; width:800px" /><br />
<strong>Gi&aacute; trị dinh dưỡng của xương g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>Trong xương g&agrave; chứa nhiều kho&aacute;ng chất như kali, canxi, phốt pho,...c&aacute;c axit amin tốt cho sức khỏe.</li>
	<li>Trong 100g xương g&agrave; c&oacute; khoảng <strong>109 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của xương g&agrave; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường hệ miễn dịch</li>
	<li>Tốt cho xương khớp</li>
	<li>Hỗ trợ ti&ecirc;u h&oacute;a hiệu quả</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế xương g&agrave;</strong></h3>
Xương g&agrave; được đ&oacute;ng b&igrave; sạch sẽ, bạn chỉ cần rửa sạch lại xương g&agrave; với muối, trụng xơ xương g&agrave; qua nước s&ocirc;i, sau đ&oacute; c&oacute; thể d&ugrave;ng l&agrave;m nguy&ecirc;n liệu hầm cho c&aacute;c m&oacute;n hầm.<br />
<img alt="Xương gà C.P 1kg 2" class="lazy" src="https://cdn.tgdd.vn/Files/2019/09/03/1194404/canh-bi-do-ham-xuong-ga-giai-nhiet-cho-ngay-nang-nong-201909030930146556.jpg" style="height:500px; width:800px" />
<h3><strong>C&aacute;c m&oacute;n ăn ngon từ xương g&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/canh-bi-do-ham-xuong-ga-giai-nhiet-cho-ngay-nang-nong-1194404">Canh b&iacute; đỏ hầm xương g&agrave;</a> bổ dưỡng</li>
	<li>Xương g&agrave; hầm rau củ</li>
	<li>Canh miến rong xương g&agrave;</li>
	<li>Ch&aacute;o xương g&agrave;</li>
	<li>Xương g&agrave; nấu măng</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; sử dụng xương g&agrave; tươi ngon</strong></h3>
Xương g&agrave; CP khi mua về c&oacute; thể n&ecirc;n bảo quản trong ngăn m&aacute;t từ 0 - 4 độ C, tối đa 2 - 3 ng&agrave;y, bảo quản trong ngăn đ&ocirc;ng tối đa 3 - 4 th&aacute;ng m&agrave; vẫn đảm bảo thịt tươi ngon, kh&ocirc;ng l&agrave;m giảm đi nhiều về chất lượng. Khi ăn chỉ cần lấy ra, r&atilde; đ&ocirc;ng (nếu bảo quản ngăn đ&ocirc;ng), rửa sạch v&agrave; mang đi chế biến.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 1);


INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (25, 'Bắp cải trắng túi 500g - 600g', 9900, 0, 'store/images/rau-cu/bap-cai-trang-tui-500g-600g-202211240949505337_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Bắp cải trắng l&agrave; loại <a href="https://www.bachhoaxanh.com/cu">rau</a> được trồng tại L&acirc;m Đồng rất dễ mua v&agrave; chế biến th&agrave;nh nhiều m&oacute;n ăn đa dạng kh&aacute;c nhau trong bữa cơm hằng ng&agrave;y. <a href="https://www.bachhoaxanh.com/cu/bap-cai-trang-tui-500gr">Bắp cải trắng</a> đặc biệt mang đến lợi &iacute;ch trong việc hỗ trợ ph&ograve;ng chống ung thư, gi&uacute;p cơ thể khỏe mạnh to&agrave;n diện.</div>

<div class="description nospeci">
<h3><img class="lazy" src="//cdn.tgdd.vn/Products/Images//8785/275316/bhx/files/ksp%204.jpg" style="height:500px; width:800px" /><br />
<strong>Ưu điểm khi mua bắp cải trắng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Bắp cải trắng (bắp s&uacute;) lu&ocirc;n l&agrave; nguy&ecirc;n liệu quen thuộc trong căn bếp của mọi gia đ&igrave;nh Việt. <strong>Bắp cải c&oacute; vị ngọt thanh </strong>đặc trưng v&agrave; độ gi&ograve;n nhất định. Bắp cải trắng tươi ngon, chất lượng, kh&ocirc;ng bị hư, dập.</li>
	<li><strong>Bắp cải trắng được trồng tại L&acirc;m Đồng</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Bắp cải trắng 500g - 600g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/275316/bhx/bap-cai-trang-tui-500gr-1-bap-202205201654554145.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của bắp cải trắng</strong></h3>

<ul style="margin-left:40px">
	<li>Bắp cải l&agrave; loại củ gi&agrave;u h&agrave;m lượng vitamin A, C, chất chống ung thư gi&uacute;p gia tăng c&aacute;c tế b&agrave;o hồng cầu, giải độc cơ thể,.. Ngo&agrave;i ra, bắp cải c&ograve;n chứa nhiều chất xơ, c&aacute;c kho&aacute;ng chất kh&aacute;c tốt cho cơ thể.</li>
	<li>Trong 100g bắp cải trắng c&oacute; khoảng <strong>24 Kcal.</strong></li>
</ul>

<h3 style="text-align:center"><img alt="Bắp cải trắng 500g - 600g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/275316/bhx/bap-cai-trang-tui-500gr-1-bap-202205201652556601.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>T&aacute;c dụng của bắp cải trắng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Cải thiện hệ ti&ecirc;u h&oacute;a</li>
	<li>Cải thiện chức năng n&atilde;o</li>
	<li>Bảo vệ cơ thể chống lại c&aacute;c rối loạn về tim</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ bắp cải trắng</strong></h3>
V&agrave;o bếp chế biến c&aacute;c m&oacute;n ăn thơm ngon từ bắp cải c&ugrave;ng B&aacute;ch H&oacute;a Xanh

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cung-an-sang-voi-mon-trung-chien-bap-cai-la-mieng-nhung-ngon-toi-khong-ngo-1300356">Trứng chi&ecirc;n bắp cải</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mi-tom-xao-bap-cai-trung-don-gian-ngon-mieng-957875">M&igrave; t&ocirc;m x&agrave;o bắp cải</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-chay-cung-bap-cai-cuon-rau-cu-thanh-dam-1114680">Bắp cải cuộn rau củ</a></li>
	<li>G&agrave; x&agrave;o bắp cải ph&ocirc; mai kiểu H&agrave;n Quốc</li>
	<li>Canh bắp cải thanh m&aacute;t</li>
</ul>

<h3><strong>C&aacute;ch bảo quản bắp cải trắng tươi ngon</strong></h3>
Bắp cải trắng n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh để giữ được rau tươi ngon, chất lượng.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (26, 'Nấm bào ngư trắng 300g', 20000, 0, 'store/images/rau-cu/nam-bao-ngu-trang-goi-300g-202212021422397712_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach">Nấm</a> b&agrave;o ngư trắng g&oacute;i 300g l&agrave; một lọai nấm thơm ngon, dễ ăn, được rất nhiều người ưa chuộng. <a href="https://www.bachhoaxanh.com/rau-sach/nam-bao-ngu-trang-bich-300g">Nấm b&agrave;o ngư trắng</a> l&agrave; một nguy&ecirc;n liệu quen thuộc cho c&aacute;c bữa cơm trong gia đ&igrave;nh với nhiều m&oacute;n ăn ngon như nấm b&agrave;o ngư x&agrave;o sả ớt, nấm b&agrave;o ngư x&agrave;o thịt,...</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Rửa muối pha lo&atilde;ng d&ugrave;ng để chế biến m&oacute;n ăn</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ dưới 20 độ C, sử dụng trong 5 ng&agrave;y kể từ ng&agrave;y sản xuất</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua nấm b&agrave;o ngư trắng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm b&agrave;o ngư c&oacute; dạng phễu lệch, phiến nấm mang b&agrave;o tử k&eacute;o d&agrave;i xuống đến ch&acirc;n, cuống nấm gần gốc c&oacute; lớp l&ocirc;ng nhỏ mịn, nấm b&agrave;o ngư trắng c&ograve;n c&oacute; những t&ecirc;n gọi kh&aacute;c l&agrave; nấm s&ograve;, nấm hương trắng, nấm dai. <strong>Nấm tươi ngon, dai, ngọt, chất lượng, kh&ocirc;ng bị dập.</strong></li>
	<li>Nấm được đảm bảo nguồn gốc, g&oacute;i 300g</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Nấm bào ngư trắng 300g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/226955/bhx/nam-bao-ngu-trang-bich-300g-202009300010069597.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của nấm b&agrave;o ngư trắng</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm b&agrave;o ngư trắng chứa nhiều vitamin B1, chất xơ, vitamin B3, vitamin B5, vitamin B6,... c&ugrave;ng c&aacute;c chất kho&aacute;ng như kali, đồng, sắt,...</li>
	<li>Trong 100g nấm b&agrave;o ngư trắng c&oacute; khoảng <strong>33 Kcal.</strong></li>
</ul>

<h3 style="text-align:center"><img alt="Nấm bào ngư trắng 300g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/226955/bhx/nam-bao-ngu-trang-goi-300g-202205201507450580.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>T&aacute;c dụng của nấm b&agrave;o ngư trắng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm b&agrave;o ngư trắng gi&uacute;p hệ ti&ecirc;u h&oacute;a hoạt động hiệu quả</li>
	<li>Hỗ trợ sức khỏe tim mạch</li>
	<li>Giảm lượng đường trong m&aacute;u</li>
	<li>Tăng cường chức năng n&atilde;o</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ nấm b&agrave;o ngư trắng</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-nam-bao-ngu-hap-sa-sieu-ngon-1293965">Nấm b&agrave;o ngư hấp sả</a>.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/chi-huong-chia-se-cach-lam-thit-xao-nam-bao-ngu-ngon-ngot-ca-nha-me-tit-1230913">Thịt heo, b&ograve; x&agrave;o nấm b&agrave;o ngư</a>.</li>
	<li>Nấm b&agrave;o ngư x&agrave;o sả ớt.</li>
	<li>Nấm b&agrave;o ngư nấu <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bo-duong-voi-mon-canh-bi-do-thit-bam-thom-mat-1167123">canh b&iacute; đỏ thịt băm</a>.</li>
</ul>

<h3><strong>C&aacute;ch bảo quản nấm b&agrave;o ngư trắng tươi ngon</strong></h3>
Để đảm bảo nấm gi&ograve;n, ngọt nhất khi ăn th&igrave; tốt nhất n&ecirc;n chế biến ngay sau khi mua về nhưng nếu bạn kh&ocirc;ng c&oacute; điều kiện để chế biến ngay th&igrave; c&oacute; thể bảo quản ở nhiệt độ 5&deg;C &ndash; 8&deg;C sẽ giữ được độ tươi của nấm từ 5 &ndash; 7 ng&agrave;y. Khi bảo quản trong tủ lạnh, nấm b&agrave;o ngư n&ecirc;n được để giữ lạnh ở ngăn rau trong tủ. Nếu bạn bảo quản nấm theo c&aacute;ch th&ocirc;ng thường như tr&ecirc;n nhưng nếu th&ecirc;m 1 bước nhỏ theo c&aacute;c <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meo-bao-quan-cac-loai-nam-dung-lau-ngay-1037029">mẹo bảo quản nấm</a> l&agrave; nh&uacute;ng nấm v&agrave;o nồi nước s&ocirc;i c&oacute; ch&uacute;t muối trong khoảng 15 gi&acirc;y rồi vớt ra để r&aacute;o nước th&igrave; c&oacute; thể giữ độ tươi của nấm l&ecirc;n tới 30 ng&agrave;y.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (27, 'Bắp cải thảo 500g - 600g', 14000, 0, 'store/images/rau-cu/bap-cai-thao-tui-500g-600g-202211290923049796_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Bắp cải thảo l&agrave; <a href="https://www.bachhoaxanh.com/rau-sach">loại rau</a> c&oacute; bẹ l&aacute; to, gi&ograve;n, ngọt thường được d&ugrave;ng để nấu canh, x&agrave;o chung với rau củ hoặc để muối kim chi. <a href="https://www.bachhoaxanh.com/rau-sach/bap-cai-thao-tui-500gr">Bắp cải thảo</a>&nbsp;của B&aacute;ch h&oacute;a Xanh được trồng tại L&acirc;m Đồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng.</div>

<div class="description nospeci">
<h3><img class="lazy" src="//cdn.tgdd.vn/Products/Images//8820/275312/bhx/files/ksp%201.jpg" style="height:500px; width:800px" /><br />
<strong>Ưu điểm khi mua bắp cải thảo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Bắp cải thảo c&ograve;n c&oacute; nhiều t&ecirc;n gọi kh&aacute;c như: cải bao, cải cuốn, bắp cải t&acirc;y,...Cải thảo c&oacute; k&iacute;ch thước kh&aacute; d&agrave;i khoảng 20 - 30cm, l&aacute; mọc cuộn v&agrave;o nhau th&agrave;nh một kết cấu chặt chẽ v&agrave; chụm lại ở gốc kh&aacute; giống với bắp cải (bắp s&uacute;) Kết cấu của một c&acirc;y cải thảo h&igrave;nh trụ d&agrave;i, hơi thu&ocirc;n nhọn ở phần đầu. <strong>Bắp cải thảo tươi ngon, chất lượng kh&ocirc;ng bị hư, dập.</strong></li>
	<li>Bắp cải thảo được trồng tại <strong>L&acirc;m Đồng</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Bắp cải thảo 500g - 600g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/275312/bhx/bap-cai-thao-tui-500gr-202203251322562267.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của bắp cải thảo</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute;c nghi&ecirc;n cứu khoa học cho thấy, trong cải thảo l&agrave; loại rau gi&agrave;u vitamin như: vitamin &nbsp;A, vitamin B, &nbsp;vitamin C, vitamin E. Ngo&agrave;i ra, trong cải thảo c&ograve;n chứa một số kho&aacute;ng chất tốt cho cơ thể như: calcium, sắt, mangan, natri, kali , lipit,&hellip;.</li>
	<li>Trong 100g bắp cải thảo c&oacute; khoảng 24.6 Kcal.</li>
</ul>

<h3><strong>T&aacute;c dụng của bắp cải thảo đối với sức khỏe</strong></h3>
Cải thảo l&agrave; một loại rau tốt cho sức khoẻ, một số lợi &iacute;ch c&oacute; thể kể đến như: gi&uacute;p lợi tiểu, ngăn ngừa ung thư, chữa vi&ecirc;m họng, giảm chứng giảm tr&iacute; nhớ,....

<h3 style="text-align:center"><img alt="Bắp cải thảo 500g - 600g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/275312/bhx/bap-cai-thao-tui-500gr-1-bap-202206041514344487.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ bắp cải thảo</strong></h3>
Cải thảo cũng giống với c&aacute;c loại rau kh&aacute;c, c&oacute; thể sử dụng phổ biến trong bữa ăn h&agrave;ng ng&agrave;y, c&oacute; thể kể đến một số m&oacute;n ăn chế biến từ cải thảo như: canh cải thảo, cải thảo cuốn thịt, cải thảo x&agrave;o,... Ngo&agrave;i ra, khi nhắc đến cải thảo th&igrave; bạn sẽ nhớ ngay đến m&oacute;n ăn đặc sản của H&agrave;n Quốc đ&oacute; ch&iacute;nh l&agrave; kim chi, cay cay, chua chua k&iacute;ch th&iacute;ch vị gi&aacute;c v&ocirc; c&ugrave;ng.

<h3><strong>C&aacute;ch bảo quản bắp cải thảo tươi ngon</strong></h3>
Bắp cải thảo mua về n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh để rau được đảm bảo tươi ngon, chất lượng.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (28, 'Rau mồng tơi 4KFarm 500g', 14000, 0, 'store/images/rau-cu/rau-mong-toi-4kfarm-goi-500g-202301031344293415_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Rau an to&agrave;n 4KFarm với ti&ecirc;u ch&iacute; 4 KH&Ocirc;NG, lu&ocirc;n ưu ti&ecirc;n bảo vệ sức khỏe người ti&ecirc;u d&ugrave;ng. T&iacute;nh h&agrave;n đặc trưng của&nbsp;Rau M&ugrave;ng Tơi 4KFarm khiến nhiều gia đ&igrave;nh ưa chuộng để chế biến c&aacute;c m&oacute;n ăn thanh m&aacute;t, ph&ugrave; hợp với những ng&agrave;y h&egrave; n&oacute;ng bức. H&agrave;m lượng dinh dưỡng cao cũng l&agrave; một trong c&aacute;c đặc điểm nổi bật.</div>

<div class="description hasvideo nospeci">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank">4KFarm</a></strong> l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.</p>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-mong-toi-4kfarm-goi-500g" target="_blank">Rau mồng tơi&nbsp;4KFarm</a></strong>&nbsp;l&agrave; một trong những loại <a href="https://www.bachhoaxanh.com/rau-sach" target="_blank">rau</a> được ưa chuộng trong nhiều gia đ&igrave;nh bởi t&iacute;nh h&agrave;n v&agrave; dễ chế biến th&agrave;nh nhiều m&oacute;n ăn. Ngo&agrave;i ra, những&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/loi-ich-vang-tu-rau-mong-toi-khong-an-se-phai-hoi-tiec-1162971" target="_blank">lợi &iacute;ch</a><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/loi-ich-vang-tu-rau-mong-toi-khong-an-se-phai-hoi-tiec-1162971" target="_blank">&nbsp;tuyệt vời của mồng tơi</a>&nbsp;đối với sức khỏe như giải nhiệt cơ thể, ngăn ngừa lo&atilde;ng xương, trị t&aacute;o b&oacute;n, kh&oacute; ti&ecirc;u,....</p>

<h2><strong>Quy tr&igrave;nh canh t&aacute;c</strong></h2>

<div class="videoyt"><img alt="" class="videomax" src="https://i.ytimg.com/vi/yrfVw77oBvo/sddefault.jpg" style="height:304px; width:540px" />
<div class="videobhx">&nbsp;</div>
</div>

<h2><strong>Điểm kh&aacute;c biệt rau 4KFarm</strong></h2>

<p><img alt="Rau mồng tơi 4KFarm 500g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/227419/bhx/files/khacbiet4kfarm1.jpg" /></p>

<h2><strong>H&igrave;nh ảnh canh t&aacute;c tại nh&agrave; m&agrave;ng</strong></h2>

<p><strong><img alt="Rau mồng tơi 4KFarm 500g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/1.jpg" /><br />
<img alt="Rau mồng tơi 4KFarm 500g 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/11.jpg" /><br />
<img alt="Rau mồng tơi 4KFarm 500g 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/3.jpg" /><br />
<img alt="Rau mồng tơi 4KFarm 500g 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/02.jpg" /></strong><br />
<img alt="Rau mồng tơi 4KFarm 500g 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/232048/bhx/files/ra%CC%83uk.jpg" /><br />
Xem th&ecirc;m th&ocirc;ng tin<a href="https://4kfarm.com/"> tại đ&acirc;y</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (29, 'Cải bẹ xanh 4KFarm 500g', 14000, 0, 'store/images/rau-cu/cai-be-xanh-4kfarm-goi-500g-202301031328254660_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Rau an to&agrave;n 4KFarm với ti&ecirc;u ch&iacute; 4 KH&Ocirc;NG, lu&ocirc;n ưu ti&ecirc;n bảo vệ sức khỏe người ti&ecirc;u d&ugrave;ng. Cải bẹ xanh&nbsp;4KFarm&nbsp;chứa h&agrave;m lượng calories rất thấp nhưng lại c&oacute; nhiều chất dinh dưỡng cần thiết cho cơ thể như&nbsp;Vitamin, Abumin, Catot,&hellip; gi&uacute;p&nbsp;ngăn ngừa c&aacute;c biểu hiện ung thư,gi&uacute;p da ngăn ngừa l&atilde;o h&oacute;a, l&agrave;m đẹp.</div>

<div class="description hasvideo nospeci">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank">4KFarm</a></strong> l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.</p>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-cai-be-xanh-4kfarm-goi-500g" target="_blank">Cải bẹ xanh&nbsp;4KFarm</a>&nbsp;</strong>(c&ograve;n gọi l&agrave; cải cay, cải canh),... l&agrave; loại <a href="https://www.bachhoaxanh.com/rau-sach" target="_blank">rau</a> chứa h&agrave;m lượng calories rất thấp nhưng lại c&oacute; nhiều chất dinh dưỡng cần thiết cho cơ thể như&nbsp;<strong>Vitamin A, B, C, K, Axit nicotic, Abumin, Catoten,&hellip;&nbsp;</strong><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cai-be-xanh-chua-benh-mua-lanh-ban-da-biet-1061437" target="_blank">Cải bẹ xanh&nbsp;c&oacute; c&aacute;c t&aacute;c dụng chữa bệnh tuyệt vời</a>&nbsp;như&nbsp;ngăn ngừa c&aacute;c biểu hiện ung thư, ăn cải xanh nhiều c&ograve;n gi&uacute;p mắt s&aacute;ng khỏe, gi&uacute;p da ngăn ngừa l&atilde;o h&oacute;a, chắc khỏe hỗ trợ chị em phụ nữ trong việc chăm s&oacute;c sắc đẹp.</p>

<h2><strong>Quy tr&igrave;nh canh t&aacute;c</strong></h2>

<div class="videoyt"><img alt="" class="videomax" src="https://i.ytimg.com/vi/yrfVw77oBvo/sddefault.jpg" style="height:304px; width:540px" />
<div class="videobhx">&nbsp;</div>
</div>

<h2><strong>Điểm kh&aacute;c biệt rau 4KFarm</strong></h2>

<p><img alt="Cải bẹ xanh 4KFarm 500gr 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/khacbiet4kfarm1.jpg" /></p>

<h2><strong>H&igrave;nh ảnh canh t&aacute;c tại nh&agrave; m&agrave;ng</strong></h2>

<p><strong><img alt="Cải bẹ xanh 4KFarm 500gr 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223838/bhx/files/1.jpg" /><br />
<img alt="Cải bẹ xanh 4KFarm 500gr 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223838/bhx/files/2.jpg" /><br />
<img alt="Cải bẹ xanh 4KFarm 500gr 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223838/bhx/files/3.jpg" /><br />
<img alt="Cải bẹ xanh 4KFarm 500gr 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223838/bhx/files/4.jpg" /></strong><br />
<img alt="Cải bẹ xanh 4KFarm 500gr 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/232048/bhx/files/ra%CC%83uk.jpg" /><br />
Xem th&ecirc;m th&ocirc;ng tin<a href="https://4kfarm.com/"> tại đ&acirc;y</a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>

<div class="nospeci viewmoreinfo">Xem th&ecirc;m</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (30, 'Cải ngọt 4KFarm 500g', 14000, 0, 'store/images/rau-cu/cai-ngot-4kfarm-goi-500g-202301031316112146_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Rau an to&agrave;n 4KFarm với ti&ecirc;u ch&iacute; 4 KH&Ocirc;NG, lu&ocirc;n ưu ti&ecirc;n bảo vệ sức khỏe người ti&ecirc;u d&ugrave;ng. H&agrave;m lượng chất xơ cao, chứa nhiều chất dinh dưỡng,Cải Ngọt 4KFarm l&agrave; một trong những loại rau được ưa th&iacute;ch để chế biến những m&oacute;n canh rau ngon bổ dưỡng ph&ugrave; hợp với mọi lứa tuổi.</div>

<div class="description hasvideo nospeci">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank">4KFarm</a></strong> l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.</p>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-cai-ngot-4kfarm-goi-500g" target="_blank">Cải ngọt&nbsp;4K Farm</a></strong> l&agrave; một trong những loại rau cải kh&ocirc;ng thể thiếu trong bữa ăn của mỗi gia đ&igrave;nh Việt. Kh&ocirc;ng chỉ c&oacute; vị ngọt thanh, khi gi&agrave; th&igrave; c&oacute; vị cay v&agrave; nồng, rất ph&ugrave; hợp trong việc chế biến nhiều m&oacute;n ăn kh&aacute;c nhau m&agrave;&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/loi-ich-cua-cai-ngot-doi-voi-suc-khoe-1266434">cải ngọt c&ograve;n mang đến nhiều lợi &iacute;ch cho sức khỏe</a> như ph&ograve;ng ngừa ung thư, hỗ trợ trị bệnh gout, trĩ, xơ gan, tăng sức đề kh&aacute;ng v&agrave; thanh lọc cơ thể.</p>

<h2><strong>Quy tr&igrave;nh canh t&aacute;c</strong></h2>

<div class="videoyt"><img alt="" class="videomax" src="https://i.ytimg.com/vi/yrfVw77oBvo/sddefault.jpg" style="height:304px; width:540px" />
<div class="videobhx">&nbsp;</div>
</div>

<h2><strong>Điểm kh&aacute;c biệt rau 4KFarm</strong></h2>

<p><img alt="Cải ngọt 4KFarm 500gr 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223838/bhx/files/khacbiet4kfarm1.jpg" /></p>

<h2><strong>H&igrave;nh ảnh canh t&aacute;c tại nh&agrave; m&agrave;ng</strong></h2>

<p><strong><img alt="Cải ngọt 4KFarm 500gr 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/1.jpg" /><br />
<img alt="Cải ngọt 4KFarm 500gr 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/11.jpg" /><br />
<img alt="Cải ngọt 4KFarm 500gr 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/3.jpg" /><br />
<img alt="Cải ngọt 4KFarm 500gr 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223837/bhx/files/02.jpg" /></strong><br />
<img alt="Cải ngọt 4KFarm 500gr 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/231574/bhx/files/ra%CC%83uk.jpg" /></p>

<p>Xem th&ecirc;m th&ocirc;ng tin về rau 4K Farm<a href="https://4kfarm.com/">&nbsp;tại đ&acirc;y</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (31, 'Rau muống 4KFarm 500g', 14000, 0, 'store/images/rau-cu/rau-muong-4kfarm-goi-500g-202301031329355453_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Rau an to&agrave;n 4KFarm với ti&ecirc;u ch&iacute; 4 KH&Ocirc;NG, lu&ocirc;n ưu ti&ecirc;n bảo vệ sức khỏe người ti&ecirc;u d&ugrave;ng. Với vị ngọt, t&iacute;nh m&aacute;t, h&agrave;m lượng dinh dưỡng cao đặc biệt l&agrave; sắt, vitamin A,c, Rau muống 4KFarm lu&ocirc;n l&agrave; loại rau được ưa chuộng chọn lựa cho bữa cơm ngon mỗi ng&agrave;y.</div>

<div class="description hasvideo nospeci">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank">4KFarm</a></strong> l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.</p>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-muong-tuoi-xanh-4kfarm-goi-500g" target="_blank">Rau muống&nbsp;4KFarm</a></strong>&nbsp;l&agrave;&nbsp;loại&nbsp;<a href="https://www.bachhoaxanh.com/rau-sach" target="_blank" title="Rau sạch tại Bách Hóa XANH">rau</a>&nbsp;phổ biến v&agrave; ưa chuộng trong bữa ăn gia đ&igrave;nh v&igrave; c&oacute;&nbsp;<strong>vị ngọt, t&iacute;nh m&aacute;t v&agrave; chứa một lượng lớn vitamin A, C, c&aacute;c chất dinh dưỡng v&agrave; đặc biệt l&agrave; h&agrave;m lượng chất sắt dồi d&agrave;o</strong>.</p>

<h2><strong>Quy tr&igrave;nh canh t&aacute;c</strong></h2>

<div class="videoyt"><img alt="" class="videomax" src="https://i.ytimg.com/vi/yrfVw77oBvo/sddefault.jpg" style="height:304px; width:540px" />
<div class="videobhx">&nbsp;</div>
</div>

<h2><strong>Điểm kh&aacute;c biệt rau 4KFarm</strong></h2>

<p><img alt="Rau muống 4KFarm 500gr 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267916/bhx/files/bv1.jpg" style="height:682px; width:800px" /></p>

<h2><strong>H&igrave;nh ảnh canh t&aacute;c tại nh&agrave; m&agrave;ng</strong></h2>

<p><strong><img alt="Rau muống 4KFarm 500gr 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267916/bhx/files/bv2.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau muống 4KFarm 500gr 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267916/bhx/files/bv3.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau muống 4KFarm 500gr 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267916/bhx/files/bv4.jpg" style="height:450px; width:800px" /></strong><br />
<img alt="Rau muống 4KFarm 500gr 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267916/bhx/files/bv5.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau muống 4KFarm 500gr 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267916/bhx/files/bv6.jpg" style="height:768px; width:1024px" />Xem th&ecirc;m th&ocirc;ng tin<a href="https://4kfarm.com/"> tại đ&acirc;y</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (32, 'Cải thìa 4KFarm 500g', 14000, 0, 'store/images/rau-cu/cai-thia-4kfarm-goi-500g-202301031315128356_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Cải th&igrave;a 4KFarm g&oacute;i 500g l&agrave; sản phẩm rau sạch, với ưu điểm 4 KH&Ocirc;NG được c&aacute;c chị em nội trợ ưa chuộng v&agrave; tin d&ugrave;ng như kh&ocirc;ng thuốc trừ s&acirc;u, kh&ocirc;ng chất tăng trưởng, kh&ocirc;ng chất bảo quản v&agrave; kh&ocirc;ng biến đổi gen, mang tới giống rau sạch, rau chất lượng</div>

<div class="description hasvideo nospeci">
<h2 style="text-align:justify"><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>

<p style="text-align:justify"><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank">4KFarm</a></strong> l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.<br />
<strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-cai-thia-4kfarm-goi-500g" target="_blank">Cải th&igrave;a&nbsp;4KFarm</a></strong>&nbsp;(hay cải bẹ trắng) c&ograve;n c&oacute; t&ecirc;n l&agrave; bạch giới tử&nbsp;thuộc&nbsp;họ cải&nbsp;c&ugrave;ng họ với cải thảo, cải bẹ xanh. Đ&acirc;y l&agrave; loại&nbsp;<a href="https://www.bachhoaxanh.com/rau-sach" target="_blank" title="Rau sạch bán tại Bách Hóa XANH">rau</a>&nbsp;<strong>chứa nhiều th&agrave;nh phần dinh dưỡng</strong>&nbsp;dễ chế biến, ăn ngon miệng. Đặc biệt,&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/loi-ich-cua-cai-thia-doi-voi-suc-khoe-1266662" target="_blank">rau cải th&igrave;a cũng mang đến nhiều<strong>&nbsp;</strong>lợi cho sức khỏe</a>&nbsp;như&nbsp;ph&ograve;ng ngừa bệnh đục nh&acirc;n mắt,&nbsp;ngăn ngừa ung thư,...</p>

<h2 style="text-align:justify"><strong>Quy tr&igrave;nh canh t&aacute;c</strong></h2>

<div style="text-align:justify">
<div class="videoyt"><img alt="" class="videomax" src="https://i.ytimg.com/vi/yrfVw77oBvo/sddefault.jpg" style="height:304px; width:540px" />
<div class="videobhx">&nbsp;</div>
</div>
</div>

<h2 style="text-align:justify"><strong>Điểm kh&aacute;c biệt rau 4KFarm</strong></h2>

<p style="text-align:justify"><img alt="Cải thìa 4KFarm 500gr 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/226023/bhx/files/khacbiet4kfarm1.jpg" /></p>

<h2 style="text-align:justify"><strong>H&igrave;nh ảnh canh t&aacute;c tại nh&agrave; m&agrave;ng</strong></h2>

<p style="text-align:justify"><strong><img alt="Cải thìa 4KFarm 500gr 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223839/bhx/files/1.jpg" /><br />
<img alt="Cải thìa 4KFarm 500gr 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223839/bhx/files/2.jpg" /><br />
<img alt="Cải thìa 4KFarm 500gr 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223839/bhx/files/3.jpg" /><br />
<img alt="Cải thìa 4KFarm 500gr 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/223839/bhx/files/4.jpg" /></strong><br />
<img alt="Cải thìa 4KFarm 500gr 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/232048/bhx/files/ra%CC%83uk.jpg" /><br />
Xem th&ecirc;m th&ocirc;ng tin<a href="https://4kfarm.com/"> tại đ&acirc;y</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (33, 'Rau dền 4KFarm 500g', 14000, 0, 'store/images/rau-cu/rau-den-4kfarm-goi-500g-202302010820584623_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Rau an to&agrave;n 4KFarm với ti&ecirc;u ch&iacute; 4 KH&Ocirc;NG, lu&ocirc;n ưu ti&ecirc;n bảo vệ sức khỏe người ti&ecirc;u d&ugrave;ng. Vị ngọt m&aacute;t, th&agrave;nh phần dinh dưỡng cao đặc biệt l&agrave; h&agrave;m lượng sắt dồi d&agrave;o,&nbsp;Rau Dền 4KFarm sẽ l&agrave; m&oacute;n canh bổ dưỡng hỗ trợ điều trị nhiều loại bệnh như t&aacute;o b&oacute;n, tiểu đường, thiếu m&aacute;u...</div>

<div class="description hasvideo nospeci">
<h2><strong>4KFarm l&agrave;&nbsp;ai?</strong></h2>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm" target="_blank">4KFarm</a> </strong>l&agrave; TH&Agrave;NH VI&Ecirc;N MỚI của tập đo&agrave;n Thế Giới Di Động, tiền th&acirc;n l&agrave; Vifarm. Đội ngũ chuy&ecirc;n gia về n&ocirc;ng nghiệp của 4KFarm chuyển giao c&ocirc;ng nghệ v&agrave; hỗ trợ n&ocirc;ng d&acirc;n trồng rau an to&agrave;n 4 KH&Ocirc;NG v&agrave; thu mua 100% sản lượng rau an to&agrave;n n&agrave;y cung cấp độc quyền cho chuỗi B&aacute;ch H&oacute;a Xanh.</p>

<p><strong><a href="https://www.bachhoaxanh.com/rau-4kfarm/rau-den-tuoi-4kfarm-goi-500g" target="_blank">Rau dền 4KFarm</a></strong> l&agrave; một loại&nbsp;<a href="https://www.bachhoaxanh.com/rau-sach" target="_blank" title="Rau sạch tại Bách Hóa XANH">rau xanh</a>&nbsp;được c&aacute;c b&agrave; nội trợ bổ sung trong thực đơn mỗi ng&agrave;y. Ngo&agrave;i&nbsp;<strong>vị ngọt m&aacute;t v&agrave; th&agrave;nh phần dinh dưỡng cao</strong>,&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/rau-den-loai-rau-gia-re-ma-loi-ich-khong-ngo-1165573" target="_blank">rau dền&nbsp;c&ograve;n mang đến nhiều&nbsp;lợi &iacute;ch</a>&nbsp;như: Chống t&aacute;o b&oacute;n, điều trị tăng huyết &aacute;p, tốt cho bệnh nh&acirc;n tiểu đường, ngừa ung thư...</p>

<h2><strong>Quy tr&igrave;nh canh t&aacute;c</strong></h2>

<div class="videoyt"><img alt="" class="videomax" src="https://i.ytimg.com/vi/yrfVw77oBvo/sddefault.jpg" style="height:304px; width:540px" />
<div class="videobhx">&nbsp;</div>
</div>

<h2><strong>Điểm kh&aacute;c biệt rau 4KFarm</strong></h2>

<p><img alt="Rau dền 4KFarm 500gr 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267911/bhx/files/bv1.jpg" style="height:682px; width:800px" /></p>

<h2><strong>H&igrave;nh ảnh canh t&aacute;c tại nh&agrave; m&agrave;ng</strong></h2>

<p><strong><img alt="Rau dền 4KFarm 500gr 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267911/bhx/files/bv2.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau dền 4KFarm 500gr 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267911/bhx/files/bv3.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau dền 4KFarm 500gr 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267911/bhx/files/bv4.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau dền 4KFarm 500gr 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267911/bhx/files/bv5.jpg" style="height:450px; width:800px" /><br />
<img alt="Rau dền 4KFarm 500gr 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//8784/267911/bhx/files/bv6.jpg" style="height:768px; width:1024px" /></strong><br />
Xem th&ecirc;m th&ocirc;ng tin<a href="https://4kfarm.com/"> tại đ&acirc;y</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (34, 'Cà rốt Đà Lạt 500g (2 - 5 củ)', 10000, 16900, 'store/images/rau-cu/ca-rot-da-lat-tui-500g-2-5-cu-202210211653200197_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&agrave; rốt Đ&agrave; Lạt l&agrave; một loại <a href="https://www.bachhoaxanh.com/cu">củ</a> rất quen thuộc trong c&aacute;c m&oacute;n ăn của người Việt. <a href="https://www.bachhoaxanh.com/cu/ca-rot-da-lat-tui-500g-4-6-cu">C&agrave; rốt</a> c&oacute; h&agrave;m lượng chất dinh dưỡng v&agrave; vitamin A cao, được xem l&agrave; nguy&ecirc;n liệu cần thiết cho c&aacute;c m&oacute;n ăn dặm của trẻ nhỏ, gi&uacute;p trẻ s&aacute;ng mắt v&agrave; cung cấp nguồn chất xơ dồi d&agrave;o.</div>

<div class="description nospeci">
<h3><img class="lazy" src="//cdn.tgdd.vn/Products/Images//8785/271572/bhx/files/sl%203.jpg" style="height:500px; width:800px" /><br />
<strong>Ưu điểm khi mua c&agrave; rốt tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&agrave; rốt tươi ngon, m&agrave;u cam tươi, vỏ trơn l&aacute;ng, c&oacute; m&agrave;u s&aacute;ng. C&agrave; rốt kh&ocirc;ng bị mềm, dập hay bị h&eacute;o. <strong>C&agrave; rốt gi&ograve;n ngọt</strong>, được lựa chọn cho nhiều m&oacute;n ngon.</li>
	<li><strong>C&agrave; rốt được trồng tại Đ&agrave; Lạt</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, <strong>b&aacute;n t&uacute;i 500g từ 2-5 củ.</strong></li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cà rốt Đà Lạt 500g (2 - 5 củ) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271572/bhx/ca-rot-da-lat-tui-500g-2-5-cu-202205201603299392.jpg" style="height:500px; width:667px" /><br />
<strong>Gi&aacute; trị dinh dưỡng của c&agrave; rốt</strong></h3>

<ul style="margin-left:40px">
	<li>Trong c&agrave; rốt chứa nhiều chất xơ, đặc biệt l&agrave; vitamin A, vitamin K, vitamin C,... ngo&agrave;i ra c&ograve;n chứa những kho&aacute;ng chất tốt cho cơ thể như canxi, sắt, kali,...</li>
	<li>Trong 100g c&agrave; rốt c&oacute; <strong>41.3 kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của c&agrave; rốt đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Cải thiện sức khỏe mắt</li>
	<li>Giảm nguy cơ ung thư</li>
	<li>Giảm cholesterol trong m&aacute;u</li>
	<li>Hỗ trợ giảm c&acirc;n</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Cà rốt Đà Lạt 500g (2 - 5 củ) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271572/bhx/ca-rot-da-lat-tui-500g-2-5-cu-202205201603295625.jpg" style="height:500px; width:800px" /><br />
<strong>C&aacute;c m&oacute;n ăn ngon từ c&agrave; rốt</strong></h3>
C&agrave; rốt c&oacute; thể chế biến th&agrave;nh <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nuoc-ep-cam-den-ca-rot-thanh-nhiet-1109554">nước &eacute;p c&agrave; rốt cam</a> v&agrave; củ dền, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-nuoc-ep-ca-rot-ca-chua-giup-dep-da-sang-mat-1201716">nước &eacute;p c&agrave; rốt v&agrave; c&agrave; chua</a>, sinh tố c&agrave; rốt. Ngo&agrave;i ra, c&agrave; rốt cũng c&oacute; thể l&agrave;m c&agrave; rốt, củ cải chua ăn k&egrave;m với thịt nguội, chả lụa cho c&aacute;c bữa tiệc. Một số m&oacute;n ăn từ c&agrave; rốt như sau:

<ul style="margin-left:40px">
	<li>C&aacute;c loại ch&aacute;o bổ dưỡng cho trẻ như ch&aacute;o tim heo c&agrave; rốt, ch&aacute;o lươn c&agrave; rốt, ch&aacute;o thịt b&ograve; c&agrave; rốt,...</li>
	<li>C&agrave; rốt d&ugrave;ng cho c&aacute;c m&oacute;n nộm gỏi như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-nom-su-hao-ca-rot-gion-gion-san-sat-an-mai-chang-ngan-1265735">nộm su h&agrave;o c&agrave; rốt</a> hoặc l&agrave;m ra m&oacute;n kim chi cải thảo truyền thống của H&agrave;n Quốc,...</li>
	<li>C&agrave; rốt x&agrave;o với m&igrave;, nui,... c&ugrave;ng với c&aacute;c nguy&ecirc;n liệu thịt heo, thịt b&ograve;, trứng,...</li>
	<li>Đặc biệt, c&agrave; rốt c&ograve;n được xem l&agrave; m&oacute;n ăn vặt an to&agrave;n khi được chế biến th&agrave;nh mứt c&agrave; rốt, th&iacute;ch hợp cho việc nh&acirc;m nhi của cả gia đ&igrave;nh.</li>
</ul>

<h3><strong>C&aacute;ch bảo quản c&agrave; rốt tươi ngon</strong></h3>
C&aacute;c bước bảo quản c&agrave; rốt để giữ được độ tươi, gi&ograve;n nhất định

<ul style="margin-left:40px">
	<li>Cắt bỏ phần ngọn củ c&agrave; rốt, sau đ&oacute; bọc củ c&agrave; rốt trong m&agrave;ng xốp hơi (bọc bong b&oacute;ng) rồi cho v&agrave;o ngăn m&aacute;t tủ lạnh trong khoảng 2 tuần.</li>
	<li>Khi bảo quản lưu &yacute; kh&ocirc;ng rửa qua nước v&agrave; cắt nhỏ c&agrave; rốt trước khi bỏ v&agrave;o tủ lạnh.</li>
	<li>Bảo quản c&agrave; rốt ở nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời c&oacute; thể giữ trong 3 tuần.</li>
</ul>
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (35, 'Đậu bắp 250g (12 - 18 trái)', 11000, 0, 'store/images/rau-cu/dau-bap-khay-250g-12-18-trai-202209060850073674_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Đậu bắp l&agrave; loại quả chứa nhiều chất xơ, gi&agrave;u dinh dưỡng, nhiều vitamin,&hellip;Đậu bắp lu&ocirc;n rất được ưa chuộng để chế biến những m&oacute;n ăn h&agrave;ng ng&agrave;y. Những th&agrave;nh phần dưỡng chất trong đậu bắp rất hữu &iacute;ch cho hệ ti&ecirc;u h&oacute;a, tim mạch, chống ung thư, tốt cho da v&agrave; mắt,...</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua đậu bắp tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Đậu bắp tươi, ngon, tr&aacute;i vừa kh&ocirc;ng qu&aacute; non, kh&ocirc;ng qu&aacute; gi&agrave;. Đậu bắp gi&ograve;n, ngọt, kh&ocirc;ng bị hư, s&acirc;u.</li>
	<li>Đậu bắp được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, khay <strong>250g khoảng 12 - 18 tr&aacute;i</strong>.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Đậu bắp 250g (12 - 18 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271743/bhx/dau-bap-khay-250g-12-18-trai-202205201719355505.jpg" style="height:500px; width:800px" /><br />
<strong>Gi&aacute; trị dinh dưỡng của đậu bắp</strong></h3>

<ul style="margin-left:40px">
	<li>Trong đậu bắp c&oacute; chứa nhiều chất xơ, chất b&eacute;o, đường, c&aacute;c kho&aacute;ng chất như magie, sắt,... c&ugrave;ng nhiều vitamin như vitamin A, vitamin C,... tốt cho cơ thể.</li>
	<li>Trong 100g đậu bắp c&oacute; chứa<strong> 33 Kcal.</strong></li>
</ul>

<h3><img alt="Đậu bắp 250g (12 - 18 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271743/bhx/dau-bap-khay-250g-12-18-trai-202205201719361145.jpg" style="height:500px; width:800px" /><br />
<strong>T&aacute;c dụng của đậu bắp đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tốt cho hệ ti&ecirc;u h&oacute;a</li>
	<li>Giảm cholesterol trong m&aacute;u</li>
	<li>Chống ung thư</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Tốt cho hoạt động của thận</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ đậu bắp</strong></h3>
Ngo&agrave;i m&oacute;n luộc th&igrave; đậu bắp c&ograve;n được chế biến nhiều m&oacute;n ngon đa dạng như:

<ul style="margin-left:40px">
	<li>Giải nhiệt m&aacute;t người với <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-canh-chua-dau-bap-giai-nhiet-cho-ngay-he-nong-buc-1170922">canh chua đậu bắp</a>.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dau-bap-muoi-chua-cuc-ngon-1115130">Đậu bắp muối chua</a>.</li>
	<li>Ngon bổ dưỡng với <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dau-bap-xao-thit-bo-mon-ngon-bo-duong-de-lam-de-an-1243256">đậu bắp x&agrave;o thịt b&ograve;</a>.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/mach-ban-mon-chay-don-gian-thanh-tinh-va-ngon-tuyet-cu-meo-voi-dau-bap-va-bun-kho-1245476">Đậu bắp x&agrave;o b&uacute;n kh&ocirc;</a> đơn giản, thanh tịnh.</li>
</ul>

<h3><strong>C&aacute;ch bảo quản đậu bắp tươi ngon</strong></h3>

<p style="text-align:justify">Đậu bắp mua về n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh để gi&uacute;p đậu bắp tươi l&acirc;u, ngọt v&agrave; ngon.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'nguyen-lieu', 1, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (36, 'Dưa leo 500g (3 -5 trái)', 13000, 0, 'store/images/rau-cu/dua-leo-vi-500g-3-5-trai-202209060856444189_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cu/dua-leo-vi-500gr">Dưa leo</a> tr&aacute;i lớn tươi ngon, được trồng v&agrave; thu hoạch đảm bảo chất lượng, an to&agrave;n cho sức khỏe người sử dụng. Trong dưa leo chứa nhiều chất xơ, vitamin C, E, K, magie,...dễ ăn, dễ phối trộn với c&aacute;c m&oacute;n ăn kh&aacute;c, tốt sức khỏe vừa mang lại hiệu quả l&agrave;m đẹp rất tốt</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua dưa leo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Dưa leo tươi, ngon, căng, mập mạp. Dưa leo gi&ograve;n, ngọt cực kỳ ngon v&agrave; chất lượng.</li>
	<li><strong>Dưa leo được trồng tại L&acirc;m Đồng</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&oacute;ng khay<strong> 500g khoảng 3-5 tr&aacute;i.</strong></li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Dưa leo 500g (3 -5 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271512/bhx/dua-leo-vi-500g-3-5-trai-202205201559349490.jpg" style="height:500px; width:800px" /><br />
<strong>Gi&aacute; trị dinh dưỡng của dưa leo</strong></h3>

<ul style="margin-left:40px">
	<li>Trong dưa leo chứa nhiều nước, c&aacute;c vitamin C, vitamin K, &hellip; c&ugrave;ng những kho&aacute;ng chất như magie, mangan, kali,...tốt cho sức khỏe.</li>
	<li>Trong 100g dưa leo c&oacute; khoảng <strong>15 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của dưa leo đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Cung cấp chất oxy h&oacute;a</li>
	<li>L&agrave;m giảm huyết &aacute;p</li>
	<li>Ngăn ngừa ung thư</li>
	<li>Gi&uacute;p xương chắc khỏe</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Dưa leo 500g (3 -5 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271512/bhx/dua-leo-vi-500g-3-5-trai-202205201559346755.jpg" style="height:500px; width:800px" /><br />
<strong>C&aacute;c m&oacute;n ăn ngon từ dưa leo</strong></h3>

<ul style="margin-left:40px">
	<li>Kim chi dưa leo</li>
	<li>Dưa leo x&agrave;o trứng</li>
	<li>Salad dưa leo c&agrave; chua</li>
	<li>Canh dưa leo sườn non</li>
	<li>&hellip;</li>
</ul>
<strong>C&aacute;ch bảo quản dưa leo tươi ngon</strong><br />
Dưa leo n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh để gi&uacute;p dưa gi&ograve;n, ngon, tươi v&agrave; mọng nước.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (37, 'Xà lách búp mỡ 500g', 24000, 0, 'store/images/rau-cu/xa-lach-bup-mo-goi-500g-202301031306115056_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach">Rau</a> x&agrave; l&aacute;ch b&uacute;p mỡ&nbsp;của B&aacute;ch h&oacute;a Xanh được nu&ocirc;i trồng tại L&acirc;m Đồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sach, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng.<a href="https://www.bachhoaxanh.com/rau-sach/xa-lach-bup-mo-goi-500g"> X&agrave; l&aacute;ch mỡ</a> gi&ograve;n, thơm, tươi m&aacute;t n&ecirc;n rất th&iacute;ch hợp l&agrave;m rau ăn k&egrave;m cho c&aacute;c m&oacute;n cuốn.</div>

<div class="description nospeci">
<h3><img class="lazy" src="//cdn.tgdd.vn/Products/Images//8820/271482/bhx/files/t2.jpg" style="height:500px; width:800px" /><br />
<strong>Ưu điểm khi mua x&agrave; l&aacute;ch mỡ tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Rau x&agrave; l&aacute;ch mỡ tươi ngon, xanh tươi. L&aacute; rau mềm, gi&ograve;n c&oacute; vị ngọt thanh. Rau được đảm bảo kh&ocirc;ng bị dập, hư, &uacute;ng.</li>
	<li>Rau được trồng tại <strong>L&acirc;m Đồng</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng. Rau đ&oacute;ng t&uacute;i kh&iacute; gi&uacute;p vận chuyển kh&ocirc;ng bị hư, dập rau.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>
<img alt="Xà lách búp mỡ 500gr 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/271482/bhx/xa-lach-bup-mo-goi-500g-202205181604086388.jpg" style="height:500px; width:800px" />
<h3><strong>Gi&aacute; trị dinh dưỡng của x&agrave; l&aacute;ch mỡ</strong></h3>

<ul style="margin-left:40px">
	<li>Trong rau x&agrave; l&aacute;ch mỡ chứa nhiều chất xơ, c&aacute;c vitamin A, vitamin B9, vitamin C, vitamin K,... c&ugrave;ng nhiều kho&aacute;ng chất như kẽm, canxi, sắt,....</li>
	<li>Trong 100g x&agrave; l&aacute;ch mỡ c&oacute; khoảng <strong>14.8 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của x&agrave; l&aacute;ch mỡ đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường động mạch v&agrave; ngăn ngừa cơn đau tim</li>
	<li>Gi&uacute;p hạ huyết &aacute;p</li>
	<li>Tốt cho hệ ti&ecirc;u h&oacute;a</li>
	<li>Bảo vệ v&otilde;ng mạc</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Xà lách búp mỡ 500gr 2" class="lazy" src="https://cdn.tgdd.vn/Files/2019/07/04/1177219/chong-ngay-bua-an-voi-salad-tron-thit-bo-de-lam-tai-nha-202205251541126548.jpg" style="height:500px; width:800px" /><br />
<strong>C&aacute;c m&oacute;n ăn ngon từ x&agrave; l&aacute;ch mỡ</strong></h3>
X&agrave; l&aacute;ch mỡ c&oacute; thể d&ugrave;ng để chế biến nhiều m&oacute;n ăn ngon như

<ul style="margin-left:40px">
	<li>L&agrave;m rau sống, d&ugrave;ng để cuốn v&agrave; ăn k&egrave;m với c&aacute;, thịt,....</li>
	<li>X&agrave; l&aacute;ch trộn dầu giấm, trứng.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/chong-ngay-bua-an-voi-mon-xa-lach-tron-thit-bo-1177219">X&agrave; l&aacute;ch trộn thịt b&ograve;</a>.</li>
	<li>X&agrave; l&aacute;ch chấm nước sốt c&agrave;.</li>
	<li>Ăn k&egrave;m chung với c&aacute;c m&oacute;n nh&uacute;ng giấm.</li>
</ul>

<h3><strong>C&aacute;ch bảo quản x&agrave; l&aacute;ch mỡ tươi ngon</strong></h3>
Rau x&agrave; l&aacute;ch mỡ n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh để gi&uacute;p rau tươi v&agrave; xanh l&acirc;u hơn.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (38, 'Nấm kim châm Hàn Quốc 150g', 16000, 0, 'store/images/rau-cu/nam-kim-cham-han-quoc-goi-150g-202205210953222432_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach/nam-kim-cham-goi-150g">Nấm kim ch&acirc;m</a> H&agrave;n Quốc được nu&ocirc;i trồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng. Sợi <a href="https://www.bachhoaxanh.com/rau-sach-nam">nấm</a> dai, gi&ograve;n v&agrave; ngọt, khi nấu ch&iacute;n rất thơm n&ecirc;n thường được lăn bột chi&ecirc;n gi&ograve;n, nấu s&uacute;p hoặc để nướng ăn k&egrave;m.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Nấm kim ch&acirc;m H&agrave;n Quốc</div>
	</li>
	<li>Khối lượng
	<div>150g</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Ng&acirc;m nước muối pha lo&atilde;ng khoảng 5-10 ph&uacute;t sau đ&oacute; rửa lại sạch với nước. D&ugrave;ng để nấu lẩu, x&agrave;o, nấu canh,...</div>
	</li>
	<li>Bảo quản
	<div>Ở nhiệt độ 5 - 10 độ C, sử dụng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y sản xuất</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua nấm kim ch&acirc;m tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm kim ch&acirc;m tươi ngon, chất lượng, sợi nấm nhỏ, d&agrave;i nhỏ m&agrave;u trắng. <strong>Nấm dai ngon, gi&ograve;n v&agrave; kh&aacute; ngọt</strong>. Nấm được đ&oacute;ng g&oacute;i cẩn thận, tiện lợi.</li>
	<li>Nấm được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&oacute;ng g&oacute;i 150g, kh&ocirc;ng bị dập</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Nấm kim châm Hàn Quốc 150g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/226959/bhx/nam-kim-cham-han-quoc-goi-150g-202205181701287870.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của nấm kim ch&acirc;m</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm kim ch&acirc;m chứa nhiều chất xơ tốt cơ hệ ti&ecirc;u h&oacute;a, c&ugrave;ng những dưỡng chất như protein, lipid, canxi, c&aacute;c axit amin tốt cho cơ thể.</li>
	<li>Trong 100g nấm kim ch&acirc;m c&oacute; khoảng <strong>37 Kcal.</strong></li>
</ul>

<h3><img alt="Nấm kim châm Hàn Quốc 150g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/226959/bhx/nam-kim-cham-han-quoc-goi-150g-202205181701291485.jpg" /></h3>

<h3><strong>T&aacute;c dụng của nấm kim ch&acirc;m đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm hỗ trợ giảm cholesterol trong m&aacute;u</li>
	<li>Gi&uacute;p hỗ trợ ph&aacute;t triển tr&iacute; n&atilde;o</li>
	<li>Cải thiện hệ ti&ecirc;u h&oacute;a hiệu quả</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ nấm kim ch&acirc;m</strong></h3>

<ul style="margin-left:40px">
	<li>Canh nấm kim ch&acirc;m nấu thịt bằm.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nau-canh-thit-bo-nam-kim-cham-nong-hoi-bo-duong-1241649">Canh thịt b&ograve; nấm kim ch&acirc;m.</a></li>
	<li>Ba chỉ b&ograve; cuộn nấm kim ch&acirc;m.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-cai-bo-xoi-sot-nam-kim-cham-chuan-vi-nha-lam-1244460">Cải b&oacute; x&ocirc;i sốt nấm kim ch&acirc;m.</a></li>
</ul>

<h3><strong>C&aacute;ch bảo quản nấm kim ch&acirc;m tươi ngon</strong></h3>
Nấm kim ch&acirc;m mua về n&ecirc;n sử dụng ngay để cảm nhận được vị ngọt v&agrave; tươi ngon của nấm. Nếu kh&ocirc;ng sử dụng kịp th&igrave; n&ecirc;n bảo quản ở nhiệt độ 5 - 10 độ C, sử dụng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y sản xuất. Hoặc bảo quản trong ngăn m&aacute;t tủ lạnh từ 2-3 ng&agrave;y<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (39, 'Đậu cove Lâm Đồng 500g', 14000, 0, 'store/images/rau-cu/dau-cove-lam-dong-tui-500g-202209060838028496_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cu/dau-cove-tui-500g">Đậu cove</a> được sản xuất tại L&acirc;m Đồng v&agrave; đ&oacute;ng g&oacute;i theo ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n khi đến tay người d&ugrave;ng. Với vị m&aacute;t, gi&ograve;n v&agrave; ngọt n&ecirc;n đậu cove đ&atilde; trở th&agrave;nh một trong những m&oacute;n ăn ưa chuộng của bữa cơm Việt. C&oacute; thể d&ugrave;ng để luộc, x&agrave;o c&ugrave;ng c&aacute;c loại thịt hoặc để nấu s&uacute;p.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua đậu cove tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Đậu cove hay đậu que tươi, c&acirc;y thon d&agrave;i, xanh nhạt. Đậu cove gi&ograve;n, ngọt cực kỳ chất lượng.</li>
	<li><strong>Đậu cove được trồng ở L&acirc;m Đồng</strong>, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Đậu cove Lâm Đồng 500g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271491/bhx/dau-cove-lam-dong-tui-500g-202205201441226078.jpg" style="height:500px; width:800px" /><br />
<strong>Gi&aacute; trị dinh dưỡng của đậu cove</strong></h3>

<ul style="margin-left:40px">
	<li>Đậu cove chứa vitamin K, vitamin C, vitamin A, vitamin B1, vitamin B2, vitamin B3, vitamin B6, vitamin E v&agrave; c&aacute;c kho&aacute;ng chất như canxi, sắt, magie, phốt pho, kali, natri, kẽm, đồng, mangan,...</li>
	<li>Trong 100g c&oacute; khoảng <strong>30.8 Kcal.</strong></li>
</ul>

<h3><img alt="Đậu cove Lâm Đồng 500g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8785/271491/bhx/dau-cove-lam-dong-tui-500g-202205201438350781.jpg" style="height:500px; width:800px" /><br />
<strong>T&aacute;c dụng của đậu cove đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Ăn nhiều đậu c&ocirc; ve sức khỏe bạn sẽ được hỗ trợ đ&aacute;ng kể, cụ thể gi&uacute;p bạn kiểm so&aacute;t được lường đường rất tốt, tăng cường hệ ti&ecirc;u h&oacute;a, l&agrave;m tan sỏi thận, bảo vệ tim mạch cũng như giảm c&acirc;n do lọc được c&aacute;c Cholesterol xấu khi nạp v&agrave;o cơ thể.</li>
	<li>Ăn đậu c&ocirc; ve c&ograve;n tăng khả năng thụ thai, gi&uacute;p ngăn ngừa dị tật thai nhi, tốt cho thị lực kh&ocirc;ng chỉ mẹ bầu m&agrave; c&ograve;n cho thai nhi trong bụng</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ đậu cove</strong></h3>
Đậu c&ocirc; ve c&oacute; thể d&ugrave;ng để chế biến nhiều m&oacute;n ăn ngon, ph&ugrave; hợp với tất cả c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh:

<ul style="margin-left:40px">
	<li>Đậu c&ocirc; ve x&agrave;o thịt heo.</li>
	<li>Đậu c&ocirc; ve x&agrave;o l&ograve;ng g&agrave;.</li>
	<li>Đậu c&ocirc; ve x&agrave;o b&ograve;.</li>
	<li>Đậu c&ocirc; ve luộc.</li>
	<li>Salad đậu c&ocirc; ve.</li>
	<li>Mực trứng x&agrave;o đậu c&ocirc; ve.</li>
	<li>Đậu que x&agrave;o nấm chay</li>
</ul>

<h3><strong>C&aacute;ch bảo quản đậu cove tươi ngon</strong></h3>
Đậu que mua về n&ecirc;n được bảo quản trong ngăn m&aacute;t tủ lạnh để gi&uacute;p đậu que tươi, xanh v&agrave; ngọt nh&eacute;!<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (40, 'Nấm đông trùng hạ thảo 150g', 59000, 0, 'store/images/rau-cu/nam-dong-trung-ha-thao-hop-150g-202301110829199066_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach/nam-dong-trung-ha-thao-hop-150g">Nấm đ&ocirc;ng tr&ugrave;ng hạ thảo</a> l&agrave; một loại nấm qu&yacute;, c&oacute; gi&aacute; trị dinh dưỡng cao, được nhiều người lựa chọn bồi bổ sức khỏe. <a href="https://www.bachhoaxanh.com/rau-sach-nam-cac-loai">Nấm</a> đ&ocirc;ng tr&ugrave;ng hạ thảo c&oacute; nhiều c&ocirc;ng dụng, nguồn gốc r&otilde; r&agrave;ng.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua nấm đ&ocirc;ng tr&ugrave;ng hạ thảo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nấm tươi ngon, chất lượng, kh&ocirc;ng bị dập, hư hỏng, &uacute;ng thối</p>
	</li>
	<li>
	<p>Nấm được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Nấm đông trùng hạ thảo 150g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/301605/bhx/nam-dong-trung-ha-thao-hop-150g-202301110830062269.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của nấm đ&ocirc;ng tr&ugrave;ng hạ thảo</strong></h3>

<p>Trong nấm đ&ocirc;ng tr&ugrave;ng hạ thảo c&oacute; chứa nhiều axit amin tốt cho cơ thể, c&aacute;c vitamin B1, vitamin A, vitamin C,vitamin K, vitamin PP,... c&ugrave;ng nhiều kho&aacute;ng chất tốt cho sức khỏe.</p>

<h3><strong>T&aacute;c dụng của nấm đ&ocirc;ng tr&ugrave;ng hạ thảo đối với sức khỏe</strong></h3>

<p>Nấm đ&ocirc;ng tr&ugrave;ng hạ thảo gi&uacute;p l&agrave;m đ&ocirc;ng m&aacute;u, giảm tai biến mạch m&aacute;u n&atilde;o, gi&uacute;p m&aacute;u lo&atilde;ng ở mức độ ph&ugrave; hợp, giảm căng thẳng v&agrave; suy nhược, tăng cường sức đề kh&aacute;ng, ức chế c&aacute;c tế b&agrave;o ung thư,...</p>

<h3><img alt="Nấm đông trùng hạ thảo 150g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/301605/bhx/nam-dong-trung-ha-thao-hop-150g-202301110829566557.jpg" /><br />
<strong>C&aacute;ch chọn nấm đ&ocirc;ng tr&ugrave;ng hạ thảo tươi ngon</strong></h3>

<p>Đặc điểm của nấm đ&ocirc;ng tr&ugrave;ng hạ thảo c&oacute; m&ugrave;i tanh nhẹ,ngửi kỹ sẽ thấy th&ecirc;m m&ugrave;i thơm nhẹ của nấm rơm, nấm c&oacute; m&agrave;u đỏ cam bắt mắt.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ nấm đ&ocirc;ng tr&ugrave;ng hạ thảo</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nấm đ&ocirc;ng tr&ugrave;ng hạ thảo chưng nước yến</p>
	</li>
	<li>
	<p>Nấm đ&ocirc;ng tr&ugrave;ng hạ thảo nấu ch&aacute;o</p>
	</li>
	<li>
	<p>Nấm đ&ocirc;ng tr&ugrave;ng hạ thảo x&agrave;o thịt b&ograve;</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản nấm đ&ocirc;ng tr&ugrave;ng hạ thảo tươi ngon</strong></h3>

<p>N&ecirc;n bảo quản nấm trong hũ thủy tinh hoặc t&uacute;i nhựa đậy k&iacute;n v&agrave; bảo quản trong tủ lạnh.</p>

<p><strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (41, 'Nấm mỡ nâu 150g', 55000, 0, 'store/images/rau-cu/nam-mo-nau-hop-150g-202205210949361158_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach/nam-mo-nau-hop-150g">Nấm mỡ n&acirc;u</a> được nu&ocirc;i trồng tại L&acirc;m Đồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng. Chứa h&agrave;m lượng dinh dưỡng dồi d&agrave;o, vị <a href="https://www.bachhoaxanh.com/rau-sach-nam">nấm</a> ngọt dịu, thịt nấm gi&ograve;n chắc th&iacute;ch hợp để nấu lẩu, x&agrave;o c&ugrave;ng rau củ hoặc nấu c&aacute;c loại s&uacute;p.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Nấm mỡ n&acirc;u</div>
	</li>
	<li>Khối lượng
	<div>150g</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Rửa sơ bằng nước trước khi sử dụng, chế biến nhanh trong khoảng 3 ph&uacute;t. Th&iacute;ch hợp x&agrave;o, nấu lẩu, nướng, s&uacute;p, pizza,...</div>
	</li>
	<li>Bảo quản
	<div>Sử dụng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y đ&oacute;ng g&oacute;i</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Ưu điểm khi mua nấm mỡ n&acirc;u tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify"><strong>Nấm mỡ n&acirc;u c&oacute; vị ngọt, b&eacute;o v&agrave; gi&ograve;n</strong>, chứa nhiều protein th&iacute;ch hợp cho những người ăn chay, b&agrave; bầu v&agrave; trẻ nhỏ. Nấm tươi ăn ngon, gi&ograve;n cực kỳ chất lượng.</li>
	<li style="text-align:justify">Nấm được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&oacute;ng hộp gi&uacute;p bảo quản nấm kh&ocirc;ng bị dập, hư v&agrave; vận chuyển dễ d&agrave;ng hơn.</li>
	<li style="text-align:justify">Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Nấm mỡ nâu 150g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/233786/bhx/nam-mo-nau-hop-150g-202205181705593869.jpg" style="height:500px; width:800px" /></h3>

<h3 style="text-align:justify"><strong>Gi&aacute; trị dinh dưỡng của nấm mỡ n&acirc;u</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify">Gi&agrave;u vitamin v&agrave; c&aacute;c kho&aacute;ng chất quan trọng cho hoạt động của cơ thể.</li>
	<li style="text-align:justify">Trong 100g nấm mỡ c&oacute; khoảng<strong> 23 Kcal.</strong></li>
</ul>

<h3 style="text-align:center"><img alt="Nấm mỡ nâu 150g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/233786/bhx/nam-mo-nau-hop-150g-202205181706000001.jpg" style="height:500px; width:800px" /></h3>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của nấm mỡ n&acirc;u đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify">Nấm mỡ c&oacute; chứa hoạt chất ergothioneine, lectin gi&uacute;p chống oxy ho&aacute;, cải thiện sự sống cho tế b&agrave;o, c&oacute; lợi cho hệ thống miễn dịch. Nấm mỡ gi&uacute;p ngừa ung thư v&uacute; ở ph&aacute;i nữ v&agrave; ung thư tuyến tiền liệt ở nam. Selen trong nấm gi&uacute;p tăng hệ vi sinh tốt v&agrave; ti&ecirc;u diệt vi khuẩn xấu c&oacute; hại cho đường ti&ecirc;u ho&aacute;.</li>
	<li style="text-align:justify">Nấm mỡ chứa &beta;-glucan v&agrave; protein gi&uacute;p ngăn ngừa t&igrave;nh trạng gan nhiễm mỡ, tổn thương gan. Giảm lượng đường trong m&aacute;u, cải thiện t&igrave;nh trạng rối loạn dung nạp glucose. Ngo&agrave;i ra, nấm mỡ c&ograve;n l&agrave; một nguy&ecirc;n liệu hiệu quả gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng, cải thiện tr&iacute; nhớ v&agrave; điều trị rối loạn nhận thức</li>
</ul>

<h3 style="text-align:justify"><strong>C&aacute;c m&oacute;n ăn ngon từ nấm mỡ n&acirc;u</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-bo-xao-nam-mem-thom-bo-duong-1306455">Nấm mỡ x&agrave;o thịt b&ograve;</a></li>
	<li style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-chao-thit-bo-nam-mo-bang-chao-an-lien-938437">Ch&aacute;o thịt b&ograve; nấm mỡ bổ dưỡng</a></li>
	<li style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/hoc-cach-lam-mon-nam-mo-khia-nuoc-dua-gion-ngon-tham-vi-1276555">Nấm mỡ kh&igrave;a nước dừa,...</a></li>
</ul>

<h3 style="text-align:justify"><strong>C&aacute;ch bảo quản nấm mỡ n&acirc;u tươi ngon</strong></h3>

<div style="text-align:justify">Nấm mỡ mua về n&ecirc;n để nguy&ecirc;n trong hộp, bảo quản trong ngăn m&aacute;t tủ lạnh để giữ độ tươi ngon v&agrave; ngọt của nấm<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (42, 'Nấm mỡ trắng 150g', 45000, 0, 'store/images/rau-cu/nam-mo-trang-hop-150g-202205210951225917_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach/nam-mo-trang-hop-150g">Nấm mỡ trắng</a> được nu&ocirc;i trồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng. <a href="https://www.bachhoaxanh.com/rau-sach-nam-cac-loai">Nấm</a> mỡ chứa h&agrave;m lượng chất dinh dưỡng cao, nhiều vitamin v&agrave; protein quan trọng n&ecirc;n thường được chế biến bằng c&aacute;ch x&agrave;o hoặc nướng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Nấm mỡ trắng</div>
	</li>
	<li>Khối lượng
	<div>150g</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Rửa sơ bằng nước trước khi sử dụng, chế biến nhanh trong khoảng 3 ph&uacute;t. Th&iacute;ch hợp x&agrave;o, nấu lẩu, nướng, s&uacute;p,...</div>
	</li>
	<li>Bảo quản
	<div>Sử dụng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y đ&oacute;ng g&oacute;i</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua nấm mỡ trắng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li><strong>Nấm mỡ trắng c&oacute; vị ngọt, b&eacute;o v&agrave; gi&ograve;n</strong>, chứa nhiều protein th&iacute;ch hợp cho những người ăn chay, b&agrave; bầu v&agrave; trẻ nhỏ. Nấm tươi ăn ngon, gi&ograve;n cực kỳ chất lượng.</li>
	<li>Nấm được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&oacute;ng hộp gi&uacute;p bảo quản nấm kh&ocirc;ng bị dập, hư v&agrave; vận chuyển dễ d&agrave;ng hơn.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Nấm mỡ trắng 150g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/233788/bhx/nam-mo-trang-hop-150g-202101292221391979.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của nấm mỡ trắng</strong></h3>

<ul style="margin-left:40px">
	<li>Gi&agrave;u vitamin v&agrave; c&aacute;c kho&aacute;ng chất quan trọng cho hoạt động của cơ thể.</li>
	<li>Trong 100g nấm mỡ c&oacute; khoảng <strong>23 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của nấm mỡ trắng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Nấm mỡ c&oacute; chứa hoạt chất ergothioneine, lectin gi&uacute;p chống oxy ho&aacute;, cải thiện sự sống cho tế b&agrave;o, c&oacute; lợi cho hệ thống miễn dịch. Nấm mỡ gi&uacute;p ngừa ung thư v&uacute; ở ph&aacute;i nữ v&agrave; ung thư tuyến tiền liệt ở nam. Selen trong nấm gi&uacute;p tăng hệ vi sinh tốt v&agrave; ti&ecirc;u diệt vi khuẩn xấu c&oacute; hại cho đường ti&ecirc;u ho&aacute;.</li>
	<li>Nấm mỡ chứa &beta;-glucan v&agrave; protein gi&uacute;p ngăn ngừa t&igrave;nh trạng gan nhiễm mỡ, tổn thương gan. Giảm lượng đường trong m&aacute;u, cải thiện t&igrave;nh trạng rối loạn dung nạp glucose. Ngo&agrave;i ra, nấm mỡ c&ograve;n l&agrave; một nguy&ecirc;n liệu hiệu quả gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng, cải thiện tr&iacute; nhớ v&agrave; điều trị rối loạn nhận thức.</li>
</ul>

<div style="text-align:center"><img alt="Nấm mỡ trắng 150g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/233788/bhx/nam-mo-trang-hop-150g-202205181707033990.jpg" style="height:500px; width:800px" /></div>
<strong>C&aacute;c m&oacute;n ăn ngon từ nấm mỡ trắng</strong>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-thit-bo-xao-nam-mem-thom-bo-duong-1306455">Nấm mỡ x&agrave;o thịt b&ograve;</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-chao-thit-bo-nam-mo-bang-chao-an-lien-938437">Ch&aacute;o thịt b&ograve; nấm mỡ bổ dưỡng</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/hoc-cach-lam-mon-nam-mo-khia-nuoc-dua-gion-ngon-tham-vi-1276555">Nấm mỡ kh&igrave;a nước dừa</a>,...</li>
</ul>
<strong>C&aacute;ch bảo quản nấm mỡ trắng tươi ngon</strong><br />
Nấm mỡ mua về n&ecirc;n để nguy&ecirc;n trong hộp, bảo quản trong ngăn m&aacute;t tủ lạnh để giữ độ tươi ngon v&agrave; ngọt của nấm<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 2, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (43, 'Lẩu nấm thiên nhiên 300g', 34000, 0, 'store/images/rau-cu/lau-nam-thien-nhien-khay-300g-202205210957218949_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach/lau-nam-thien-nhien-vi-300g">Lẩu nấm thi&ecirc;n nhi&ecirc;n</a>&nbsp;gồm nhiều th&agrave;nh phần: nấm b&agrave;o ngư, nấm kim&nbsp;ch&acirc;m, nấm hương, ớt,... D&ugrave;ng nấu lẩu ngọt thơm, thanh m&aacute;t nhờ&nbsp;c&aacute;c loại <a href="https://www.bachhoaxanh.com/rau-sach-nam">nấm</a> <strong>c&oacute; gi&aacute; trị dinh dưỡng cao</strong>. Sản phẩm được l&agrave;m sẵn, đơn giản tiện lợi th&iacute;ch hợp cho gia đ&igrave;nh bận rộn kh&ocirc;ng c&oacute; thời gian</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Lẩu nấm thi&ecirc;n nhi&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nấm b&agrave;o ngư trắng, nấm b&agrave;o ngư x&aacute;m, nấm hương, nấm kim ch&acirc;m</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Ng&acirc;m nước muối, rửa sạch. D&ugrave;ng nấu lẩu, x&agrave;o, nấu canh</div>
	</li>
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Bảo quản
	<div>Sử dụng trong v&ograve;ng 5 ng&agrave;y kể từ ng&agrave;y sản xuất</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua khay lẩu nấm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Lẩu nấm thi&ecirc;n nhi&ecirc;n gồm nhiều th&agrave;nh phần: <strong>nấm b&agrave;o ngư, nấm kim ch&acirc;m, nấm hương, ớt,</strong>... D&ugrave;ng nấu lẩu ngọt thơm, thanh m&aacute;t nhờ c&aacute;c loại nấm c&oacute; gi&aacute; trị dinh dưỡng cao. Nấm tươi ngon, chất lượng, dai ngon v&agrave; ngọt, kh&ocirc;ng bị hư, dập hay thối.</li>
	<li>Nấm được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Lẩu nấm thiên nhiên 300g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/226963/bhx/lau-nam-thien-nhien-khay-300g-202205181652543508.jpg" style="height:500px; width:800px" /><br />
<strong>Gi&aacute; trị dinh dưỡng của khay lẩu nấm</strong></h3>

<ul style="margin-left:40px">
	<li>Trong c&aacute;c loại nấm chứa nhiều vitamin nh&oacute;m B như vitamin B5, vitamin B12, vitamin B3,... c&ugrave;ng nhiều kho&aacute;ng chất kh&aacute;c như selen, đồng,...</li>
	<li>Trong 100g nấm c&oacute; khoảng 22.2 Kcal.</li>
</ul>
<strong>T&aacute;c dụng của khay lẩu nấm đối với sức khỏe</strong>

<ul style="margin-left:40px">
	<li>Tăng cường khả năng miễn dịch</li>
	<li>Chống l&atilde;o h&oacute;a</li>
	<li>Ph&ograve;ng ngừa ung thư</li>
	<li>Chống vi&ecirc;m</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Lẩu nấm thiên nhiên 300g 1" class="lazy" src="https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/lau-nam-chay-thumbnail.jpg" style="height:500px; width:800px" /><br />
<strong>C&aacute;c m&oacute;n ăn ngon từ khay lẩu nấm</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-lau-nam-chay-thom-ngon-thanh-dam-1166737">Lẩu nấm chay</a></li>
	<li>Nấm x&agrave;o tỏi</li>
	<li>S&uacute;p nấm</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch bảo quản khay lẩu nấm tươi ngon</strong></h3>
Nấm n&ecirc;n sử dụng ngay để tươi ngon nhất. Nếu kh&ocirc;ng sử dụng được liền h&atilde;y bảo quản trong ngăn m&aacute;t tủ lạnh để gi&uacute;p nấm tươi ngon.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (44, 'Nấm rơm từ 180g - 220g', 30000, 0, 'store/images/rau-cu/nam-rom-tui-200g-202212280921344194_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/rau-sach/nam-rom-tui-200g">Nấm rơm</a> tươi ngon v&ocirc; c&ugrave;ng, nấm to, tươi, nh&igrave;n rất ngon mắt. <a href="https://www.bachhoaxanh.com/rau-sach-nam-cac-loai">Nấm</a> rơm c&oacute; thể d&ugrave;ng l&agrave;m nguy&ecirc;n liệu để chế biến ra nhiều m&oacute;n ăn thơm ngon như nấm rơm kho, lẩu nấm, canh nấm rơm,.. thơm ngon m&agrave; ai cũng c&oacute; thể ăn được</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua nấm rơm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nấm rơm tươi ngon, chất lượng, kh&ocirc;ng bị dập, nấm tươi ngon, hấp dẫn.</p>
	</li>
	<li>
	<p>Nấm được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Nấm rơm từ 180g - 220g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8820/299261/bhx/nam-rom-tui-200g-202212051122556434.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của nấm rơm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Nấm rơm l&agrave; một trong những thực phẩm dinh dưỡng, chứa nhiều vitamin A, vitamin PP, vitamin B, vitamin C, vitamin D, c&aacute;c kho&aacute;ng chất như canxi, sắt, photpho,...</p>
	</li>
	<li>
	<p>Trong 100g nấm rơm c&oacute; khoảng <strong>22 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của nấm rơm đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Hỗ trợ gan v&agrave; dạ d&agrave;y khỏe mạnh</p>
	</li>
	<li>
	<p>Gi&uacute;p tăng cường sức đề kh&aacute;ng cho cơ thể</p>
	</li>
	<li>
	<p>Cải thiện hệ miễn dịch</p>
	</li>
	<li>
	<p>Gi&uacute;p hấp thu dưỡng chất tốt hơn</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch chọn nấm rơm tươi ngon</strong></h3>

<p>N&ecirc;n chọn những c&acirc;y nấm rơm tr&ograve;n, nguy&ecirc;n vẹn, c&ograve;n b&uacute;p, kh&ocirc;ng bị dập, n&aacute;t v&agrave; c&oacute; m&ugrave;i thơm đặc trưng của nấm. Kh&ocirc;ng n&ecirc;n chọn những sản phẩm bị dập, c&oacute; m&ugrave;i th&uacute;i.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ nấm rơm</strong></h3>

<ul>
	<li>
	<p><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/vao-bep-tro-tai-nau-sup-ga-nam-rom-bo-duong-cho-ca-nha-cung-thuong-thuc-1169549">S&uacute;p g&agrave; nấm rơm</a></p>
	</li>
	<li>
	<p><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-canh-nam-rom-ngon-ngot-thuc-hien-cuc-nhanh-1207530">Canh nấm rơm</a></p>
	</li>
	<li>
	<p><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-nam-rom-xao-chua-ngot-don-gian-nhung-sieu-bat-com-1319751">Nấm rơm x&agrave;o chua ngọt</a>,...</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản nấm rơm tươi ngon</strong></h3>

<p>Nấm rơm mua về n&ecirc;n nấu ngay để cảm nhận được vị ngọt v&agrave; dinh dưỡng của sản phẩm. Nếu sử dụng kh&ocirc;ng kịp c&oacute; thể bảo quản trong tủ lạnh.</p>

<p>Lưu &yacute;: Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 2);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (45, 'Hạt hướng dương vị dừa Chacheer gói 130g', 25000, 0, 'store/images/hat-say-kho/hat-huong-duong-vi-dua-chacheer-goi-130g-202205181540318388_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat">Hạt kh&ocirc;</a> thơm ngon, với lớp vỏ ngo&agrave;i được gia vị đậm đ&agrave;, mặn mặn k&iacute;ch th&iacute;ch vị gi&aacute;c. Hương dừa khi ăn cũng kh&aacute; l&agrave; thơm. <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-huong-duong-vi-dua-chacheer-goi-130g">Hạt hướng dương vị dừa Chacheer g&oacute;i 130g</a> kh&ocirc;ng bị h&ocirc;i dầu, ăn vặt, giải tr&iacute; rất ph&ugrave; hợp. <a href="https://www.bachhoaxanh.com/cac-loai-hat-chacheer">Hạt kh&ocirc; Chacheer</a> được sản xuất tại Th&aacute;i Lan an to&agrave;n, chất lượng</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt hướng dương</div>
	</li>
	<li>Khối lượng
	<div>130g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Hạt hướng dương (93,7%), muối, chất tạo ngọt tổng hợp, hương dừa tổng hợp</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>B&oacute;c vỏ ăn liền sau khi mở bao b&igrave;</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời, kh&ocirc;ng được đ&egrave; n&eacute;n v&agrave; kh&ocirc;ng t&aacute;c động lực mạnh</div>
	</li>
	<li>Thương hiệu
	<div>Chacheer</div>
	</li>
	<li>Sản xuất
	<div>Th&aacute;i Lan</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Chacheer&nbsp;</strong></h3>

<p>Chacheer l&agrave; một thương hiệu l&acirc;u đời, chuy&ecirc;n sản xuất c&aacute;c sản phẩm hạt kh&ocirc;, đặc biệt l&agrave; hạt hướng dương cung cấp thị trường. C&aacute;c sản phẩm của Chacheer thơm ngon, nhiều hương vị, tiện lợi v&agrave; được chọn lựa nhiều nhất l&agrave; trong c&aacute;c dịp tết.</p>

<h3><img alt="Hạt hướng dương vị dừa Chacheer gói 130g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/234674/bhx/hat-huong-duong-vi-dua-chacheer-goi-130g-202102051533461550.jpg" /><br />
<strong>Th&agrave;nh phần dinh dưỡng trong Hạt hướng dương vị dừa Chacheer g&oacute;i 130g</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Hạt hướng dương l&agrave; một trong những loại hạt chứa nhiều dưỡng chất như vitamin E, vitamin B1, vitamin B2, vitamin B6, vitamin C, c&aacute;c kho&aacute;ng chất như canxi, kẽm, sắt, đồng, magie,...</p>
	</li>
	<li>
	<p>Trong 100g hạt hướng dương c&oacute; khoảng<strong> 584 Kcal.</strong></p>
	</li>
</ul>

<h3><img alt="Hạt hướng dương vị dừa Chacheer gói 130g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/234674/bhx/hat-huong-duong-vi-dua-chacheer-goi-130g-202102051533483974.jpg" /><br />
<strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Hạt hướng dương tốt cho sức khỏe tim mạch</p>
	</li>
	<li>
	<p>Hỗ trợ điều trị bệnh tiểu đường</p>
	</li>
	<li>
	<p>Hỗ trợ giảm vi&ecirc;m hiệu quả</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản hạt hướng dương vị dừa</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản sản phẩm nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng sản phẩm hết hạn hoặc c&oacute; dấu hiệu hư hỏng</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Khi mua hạt hướng dương tại B&aacute;ch h&oacute;a XANH được đảm bảo nguồn gốc r&otilde; r&agrave;ng, tiện lợi v&agrave; chất lượng. Mua online nhận được nhiều ưu đ&atilde;i khuyến m&atilde;i hấp dẫn, giao h&agrave;ng tận nh&agrave;.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (46, 'Đậu phộng nước cốt dừa Tân Tân gói 75g', 12000, 0, 'store/images/hat-say-kho/dau-phong-nuoc-cot-dua-tan-tan-goi-75g-202205181422497552_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-phong">Đậu phộng</a> b&eacute;o b&eacute;o, b&ugrave;i b&ugrave;i thơm ngon được bao bọc cẩn thận vởi lớp bột nước cốt dừa thơm ngon v&agrave; đậm đ&agrave; gia vị b&ecirc;n ngo&agrave;i. <a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-phong-tan-tan-nuoc-cot-dua-75g">Đậu phộng nước cốt dừa T&acirc;n T&acirc;n g&oacute;i 75g</a>&nbsp;tiện lợi, thơm ngon, th&iacute;ch hợp ăn vặt v&agrave; xem phim, đọc s&aacute;ch. <a href="https://www.bachhoaxanh.com/cac-loai-hat-tan-tan-dau-phong">Đậu phộng T&acirc;n T&acirc;n</a> l&agrave; thương hiệu nổi tiếng được nhiều người tin d&ugrave;ng chọn mua.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu phộng da c&aacute; nước cốt dừa</div>
	</li>
	<li>Khối lượng
	<div>75g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng (45%), bột m&igrave;, đường tinh luyện, dầu thực vật, nước cốt dừa nguy&ecirc;n chất (7%), muối tinh luyện, hương dừa tổng hợp</div>
	</li>
	<li>Năng lượng
	<div>160 Calories/28g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>T&acirc;n T&acirc;n (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>

<p>T&acirc;n T&acirc;n l&agrave; thương hiệu chuy&ecirc;n cung cấp c&aacute;c loại hạt chất lượng được h&agrave;ng triệu người lựa chọn tin d&ugrave;ng. Hầu hết c&aacute;c sản phẩm của T&acirc;n T&acirc;n được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ ti&ecirc;n tiến v&agrave; hiện đại c&ugrave;ng với c&aacute;c nguy&ecirc;n liệu được chọn lọc&nbsp; nghi&ecirc;m ngặt tạo ra c&aacute;c sản phẩm thơm ngon an to&agrave;n v&agrave; tốt cho sức khỏe.</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng cso trong sản phẩm&nbsp;</strong></h3>
<img alt="Đậu phộng nước cốt dừa Tân Tân gói 75g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3487/193322/bhx/files/dau-phong-tan-tan-nuoc-cot-dua-75g-2.jpg" style="height:768px; width:1024px" />
<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Đậu phộng nước cốt dừa T&acirc;n T&acirc;n 75g c&oacute; chứa c&aacute;c th&agrave;nh phần như sau:&nbsp;Đậu phộng (45%), bột m&igrave;, đường tinh luyện, dầu thực vật, nước cốt dừa nguy&ecirc;n chất (7%), muối tinh luyện,.. chất lượng v&agrave; tố cho sức khỏe</p>
	</li>
	<li>
	<p>Trong b&aacute;nh c&oacute; chứa khoảng&nbsp;160 Calo/28g</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng đối với sức khỏe&nbsp;</strong></h3>
<img alt="Đậu phộng nước cốt dừa Tân Tân gói 75g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3487/193322/bhx/files/dau-phong-tan-tan-nuoc-cot-dua-75g-4.jpg" style="height:768px; width:1024px" />
<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>L&agrave; m&oacute;n ăn vặt tuyệt vời vừa ngon vừa bổ dưỡng</p>
	</li>
	<li>
	<p>Cung cấp năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Bổ sung c&aacute;c dưỡng chất cho cơ thể</p>
	</li>
	<li>
	<p>Tốt cho tim mạch v&agrave; giảm nguy cơ bị tiểu đường</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản sản phẩm ở những nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t tr&aacute;nh tiếp x&uacute;c trực tiếp với &aacute;nh nắng hoặc ở những nơi c&oacute; nhiệt độ cao</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng sản phẩm khi đ&atilde; hết hạn sử dụng</p>
	</li>
	<li>
	<p>Sử dụng một lần khi đ&atilde; x&eacute; bao b&igrave; sản phẩm</p>
	</li>
	<li>
	<p>&nbsp;</p>
	</li>
</ul>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (47, 'Đậu Hà Lan muối Tài Tài gói 140g', 16500, 22000, 'store/images/hat-say-kho/dau-ha-lan-muoi-tai-tai-goi-140g-202205181552249836_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-tai-tai">Hạt kh&ocirc; T&agrave;i T&agrave;i</a> chất lượng, đậu to, chắc hạt c&ugrave;ng lớp muối mặn mặn k&iacute;ch th&iacute;ch vị gi&aacute;c. <a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-ha-lan-muoi-tai-tai-goi-140g">Đậu H&agrave; Lan muối T&agrave;i t&agrave;i g&oacute;i 140g</a> ngon, thơm, ăn vặt c&ugrave;ng gia đ&igrave;nh v&agrave; bạn b&egrave;, tận hưởng niềm vui. <a href="https://www.bachhoaxanh.com/cac-loai-hat">Hạt kh&ocirc;</a> gi&ograve;n ngon, tiện lợi, được rất nhiều người chọn mua</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu h&agrave; lan</div>
	</li>
	<li>Khối lượng
	<div>140g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu H&ograve;a Lan, muối tinh luyện, dầu thực vật, m&agrave;u thực phẩm tổng hợp&hellip;</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng ăn trực tiếp. Giữ lạnh ăn sẽ ngon hơn. Sau khi sử dụng buộc k&iacute;n miệng bao b&igrave;, sử dụng tốt nhất trong v&ograve;ng 15 ng&agrave;y sau khi mở bao b&igrave;</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</div>
	</li>
	<li>Thương hiệu
	<div>T&agrave;i t&agrave;i (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (48, 'Snack đậu phộng hải sản siêu cay Pinattsu Oishi gói 85g', 12000, 0, 'store/images/hat-say-kho/snack-nhan-dau-phong-vi-hai-san-sieu-cay-pinattsu-oishi-goi-95g-202303280859065251_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-phong">Đậu phộng</a> thơm, b&eacute;o b&ugrave;i của đậu phộng được bọc trong lớp bột với hương vị hải sản si&ecirc;u cay, b&eacute;o b&eacute;o hấp dẫn. <a href="https://Snack nhân đậu phộng vị hải sản siêu cay Pinattsu Oishi gói 95g">Snack nh&acirc;n đậu phộng vị hải sản si&ecirc;u cay Pinattsu Oishi g&oacute;i 85g</a> ph&ugrave; hợp ăn vặt, vừa ăn vừa xem phim, nghe nhạc, đọc s&aacute;ch kh&aacute; th&uacute; vị. <a href="https://www.bachhoaxanh.com/cac-loai-hat-oishi-dau-phong">Đậu phộng Oishi</a> thơm ngon, chất lượng v&agrave; an to&agrave;n.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Snack nh&acirc;n đậu phộng vị hải sản si&ecirc;u cay</div>
	</li>
	<li>Khối lượng
	<div>85g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng 40%, bột m&igrave;, tinh bột biến t&iacute;nh, đường, mạch nha, dầu ăn, mực, gia vị hải sản, bột ớt, hương thịt, chất tạo xốp, muối i-ốt, bột ngọt v&agrave; chất chống oxy ho&aacute;</div>
	</li>
	<li>Năng lượng
	<div>146 kcal/ 30g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Thương hiệu
	<div>Oishi (Philippines)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (49, 'Hạt điều Original Vinamit hũ 170g', 86000, 0, 'store/images/hat-say-kho/hat-dieu-original-vinamit-hu-170g-202210281001221947_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-hat-dieu-oc-cho">Hạt điều</a> b&eacute;o b&eacute;o thơm thơm ăn rất ngon v&agrave; c&ograve;n cung cấp nhiều dưỡng chất cần thiết cho cơ thể. <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-dieu-vinamit-tach-vo-170g">Hạt điều Original Vinamit hũ 170g</a> được t&aacute;ch vỏ sẵn tiện lợi, thơm ngon ph&ugrave; hợp vừa nh&acirc;m nhi vừa xem phim hay nghe nhạc. <a href="https://www.bachhoaxanh.com/cac-loai-hat-vinamit-hat-dieu-oc-cho">Hạt&nbsp;điều Vinamit</a> chất lượng, dinh dưỡng v&agrave; vệ sinh</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt điều</div>
	</li>
	<li>Khối lượng
	<div>170g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Hạt điều 100%</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp hoặc l&agrave;m nguy&ecirc;n liệu chế biến c&aacute;c m&oacute;n ăn</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời</div>
	</li>
	<li>Thương hiệu
	<div>Vinamit (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (50, 'Hạt hạnh nhân tẩm bơ mật ong Tom''s Farm gói 30g', 26000, 0, 'store/images/hat-say-kho/hat-hanh-nhan-tam-bo-mat-ong-toms-farm-goi-30g-202205181453052497_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-hat-hanh-nhan">Hạt hạnh nh&acirc;n</a> được tẩm bơ cũng với mật ong thơm ngon, hấp dẫn. <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-hanh-nhan-tam-bo-mat-ong-toms-farm-goi-30g">Hạt hạnh nh&acirc;n tẩm bơ mật ong Tom&#39;s Farm g&oacute;i 30g</a> khi ăn c&oacute; vị b&eacute;o b&eacute;o cũng với độ ngọt của mật ong v&agrave; thơm bơ, k&iacute;ch th&iacute;ch vị gi&aacute;c. <a href="https://www.bachhoaxanh.com/cac-loai-hat-tom-s-farm-hat-hanh-nhan">Hạt hạnh nh&acirc;n Tom&#39;s Farm</a> được sản xuất tại H&agrave;n Quốc, ph&ugrave; hợp cho ăn vặt, thưởng tr&agrave;</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt hạnh nh&acirc;n tẩm bơ mật ong</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Hạt hạnh nh&acirc;n (73.316%), tinh bột bắp (12.689%), đường (7.498%), vị bơ mật ong (3.8%), mật ong (0.97%), dầu bắp (0.905%), dầu đậu n&agrave;nh (0.808%), tinh chất mầm đậu n&agrave;nh, chiết xuất thảo mộc</div>
	</li>
	<li>Khối lượng
	<div>30g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Tom&#39;s Farm (H&agrave;n Quốc)</div>
	</li>
	<li>Sản xuất
	<div>H&agrave;n Quốc</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (51, 'Đậu phộng vị nước cốt dừa Poca nutz gói 90g', 12500, 0, 'store/images/hat-say-kho/dau-phong-vi-nuoc-cot-dua-poca-nutz-goi-90g-202206302203270596_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-poca">Đậu phộng Poca</a> thơm ngon, gi&ograve;n rụm lớp vỏ b&ecirc;n ngo&agrave;i c&ugrave;ng đậu phộng b&ecirc;n trong b&eacute;o ngậy. <a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-phong-vi-nuoc-cot-dua-poca-nutz-goi-90g">Đậu phộng vị nước cốt dừa Poca nutz g&oacute;i 90g</a> chất lượng, thơm vị nước dừa v&ocirc; c&ugrave;ng hấp dẫn. <a href="https://www.bachhoaxanh.com/cac-loai-hat">Đậu phộng</a> thơm ngon, tiện lợi, c&oacute; thể mang theo b&ecirc;n người cho những cuộc vui chơi</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu phộng vị nước cốt dừa</div>
	</li>
	<li>Khối lượng
	<div>90g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng, dầu thực vật, bột nếp, đường, tinh bột bắp, bột m&igrave;, tinh bột sẵn biến t&iacute;nh, hương cốt dừa giống tự nhi&ecirc;n, muối iot</div>
	</li>
	<li>Năng lượng
	<div>170kcal/30g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp, kh&ocirc;ng cần qua chế biến v&agrave; xử l&yacute; th&ecirc;m</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</div>
	</li>
	<li>Thương hiệu
	<div>Poca (Mỹ)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Poca l&agrave; thương hiệu nổi tiếng được ưa chuộng được th&agrave;nh lập v&agrave; ph&aacute;t triển bởi tập đo&agrave;n PepsiCo. Đ&acirc;y l&agrave; thương hiệu nổi tiếng với c&aacute;c sản phẩm hạt kh&ocirc; như đậu phộng, đậu h&agrave; lan,... thơm ngon, chất lượng kết hợp c&ugrave;ng nhiều loại gia vị với gi&aacute; cả phải chăng.<br />
<img alt="Đậu phộng vị nước cốt dừa Poca Nutz gói 90g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/272257/bhx/dau-phong-vi-nuoc-cot-dua-poca-nutz-goi-90g-202203021908070581.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Hạt đậu phộng l&agrave; loại hạt thơm ngon, tốt cho sức khỏe, kết hợp c&ugrave;ng cốt dừa b&eacute;o ngậy hấp dẫn . Sản phẩm sẽ cung cấp cho cơ thể năng lượng, chất b&eacute;o, chất đạm, &hellip; Theo th&ocirc;ng tin được in tr&ecirc;n bao b&igrave; sản phẩm, 30g sản phẩm cung cấp khoảng 170 kcal cho cơ thể.<br />
<img alt="Đậu phộng vị nước cốt dừa Poca Nutz gói 90g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/272257/bhx/dau-phong-vi-nuoc-cot-dua-poca-nutz-goi-90g-202203021908078342.jpg" /></p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng của sản phẩm đối với sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Bổ sung c&aacute;c chất đạm, b&eacute;o,...</p>
	</li>
	<li>
	<p>L&agrave;m dịu cơn đ&oacute;i</p>
	</li>
	<li>
	<p>Cải thiện t&acirc;m trạng</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<p>Đậu phộng cốt dừa l&agrave; sản phẩm th&iacute;ch hợp sử dụng khi uống bia, d&ugrave;ng trước khi bắt đầu buổi tiệc,... rất th&iacute;ch hợp.</p>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Sản phẩm c&oacute; độ gi&ograve;n v&agrave; vị ngọt mặn b&eacute;o h&agrave;i h&ograve;a, khi mở g&oacute;i bao b&igrave; bạn n&ecirc;n sớm sử dụng, tr&aacute;nh để sản phẩm tiếp x&uacute;c l&acirc;u với kh&ocirc;ng kh&iacute; l&agrave;m ảnh hưởng đến hương vị v&agrave; độ gi&ograve;n của sản phẩm. Bảo quản sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh đặt ở nơi c&oacute; nhiệt độ cao v&agrave; &aacute;nh nắng trực tiếp từ mặt trời.<br />
Lưu &yacute;: Kh&ocirc;ng d&ugrave;ng khi đậu đ&atilde; bị hỏng hoặc hết hạn sử dụng. Kh&ocirc;ng d&ugrave;ng khi bạn dị ứng th&agrave;nh phần sản phẩm.<br />
<img alt="Đậu phộng vị nước cốt dừa Poca Nutz gói 90g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/272257/bhx/dau-phong-vi-nuoc-cot-dua-poca-nutz-goi-90g-202203021908083868.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Hiện tại, B&aacute;ch h&oacute;a XANH l&agrave; một trong những nơi cung cấp nhiều sản phẩm b&aacute;nh kẹo thơm ngon, được kiểm tra về chất lượng, đảm bảo đ&uacute;ng nguồn gốc xuất xứ. Khi mua sắm tại đ&acirc;y, bạn sẽ được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng, tận nơi c&ugrave;ng nhiều ưu đ&atilde;i, khuyến m&atilde;i hấp dẫn.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (52, 'Hạt điều tỏi ớt Vinahe gói 70g', 33000, 0, 'store/images/hat-say-kho/hat-dieu-toi-ot-vinahe-goi-70g-202205181551402124_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Vị tỏi ớt thơm ngon, k&iacute;ch th&iacute;ch vị gi&aacute;c khiến người ăn th&iacute;ch th&uacute; tr&ecirc;n mỗi <a href="https://www.bachhoaxanh.com/cac-loai-hat-hat-dieu-oc-cho">hạt điều</a> rang.&nbsp;Hạt điều tỏi ớt Vinahe g&oacute;i 70g&nbsp;b&eacute;o ngậy, thơm ngon đ&oacute;ng g&oacute;i theo dạng t&uacute;i zip, dễ mở, dễ b&agrave;o quản sau sử dụng. Khối lượng kh&ocirc;ng qu&aacute; nhiều vưới 70g, lu&ocirc;n đảm bảo độ gi&ograve;n ngon&nbsp; khi sử dụng trong thời gian hợp l&yacute;.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt điều tỏi ớt</div>
	</li>
	<li>Khối lượng
	<div>70g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nh&acirc;n điều (80%), tỏi v&agrave; ớt.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Lắc đều trước khi ăn, n&ecirc;n d&ugrave;ng ngay sau khi mở bao b&igrave;. Đậy nắp nếu kh&ocirc;ng sử dụng.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng.</div>
	</li>
	<li>Thương hiệu
	<div>Vinahe</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><a href="https://www.bachhoaxanh.com/cac-loai-hat-vinahe-hat-dieu-oc-cho">Hạt điều Vinahe</a> l&agrave; một trong những loại hạt được nhiều người ưa th&iacute;ch v&igrave; sự b&eacute;o ngậy, thơm ngon của n&oacute;. Thấy hiểu điều n&agrave;y, Vinahe đ&atilde; cho ra sản phẩm <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-dieu-toi-ot-vinahe-goi-70g">Hạt điều tỏi ớt Vinahe g&oacute;i 70g</a> thươm ngon chất lượng.</p>

<p style="text-align:center"><img alt="Hạt điều tỏi ớt Vinahe gói 70g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/239126/bhx/hat-dieu-toi-ot-vinahe-goi-70g-202105120918427428.jpg" style="height:500px; width:800px" /></p>

<p>Đặc biệt của sản phẩm điều rang n&agrave;y l&agrave; vị tỏi ớt thơm ngon, k&iacute;ch th&iacute;ch vị gi&aacute;c khiến người ăn th&iacute;ch th&uacute; tr&ecirc;n mỗi hạt điều rang.&nbsp;<br />
Sản phẩm đ&oacute;ng g&oacute;i theo dạng t&uacute;i zip, dễ mở, dễ b&agrave;o quản sau sử dụng. Khối lượng kh&ocirc;ng qu&aacute; nhiều vưới 70g, lu&ocirc;n đảm bảo độ gi&ograve;n ngon khi sử dụng trong thời gian hợp l&yacute;.<br />
Ngo&agrave;i ra <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/hat-dieu-va-nhung-loi-ich-doi-voi-suc-khoe-1008597">điều c&ograve;n chứa nhiều chất dinh dưỡng</a> như:&nbsp;Lipid: 46.3 gam.&nbsp;<strong>Chất</strong>&nbsp;xơ: 0.6 gam. Vitamin: vitamin E (0.9 mg), vitamin K (34.1 mg), vitamin B6 (0.417 mg)&nbsp;<strong>Chất</strong>&nbsp;kho&aacute;ng: Canxi (28 mg), Natri (12 mg), Kali (660 mg), Magie (292 mg), Folate (25 mcg),.. rất tốt cho sức khỏe.<br />
Sản phẩm c&oacute; thể sử dụng trực tiếp hoặc ăn k&egrave;m t&ugrave;y th&iacute;ch.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (53, 'Hạt hạnh nhân Mỹ Your Superfood gói 200g', 100000, 0, 'store/images/hat-say-kho/hat-hanh-nhan-my-your-superfood-goi-200g-202205181605271210_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Thương hiệu <a href="https://www.bachhoaxanh.com/cac-loai-hat-your-superfood">hạt kh&ocirc; Your Superfood</a>&nbsp;mang đến <a href="https://www.bachhoaxanh.com/cac-loai-hat">c&aacute;c loại hạt</a> c&oacute; nhiều dinh dưỡng tốt cho sức khỏe v&agrave; có ngu&ocirc;̀n g&ocirc;́c từ tự nhi&ecirc;n.&nbsp;<a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-hanh-nhan-my-your-superfood-goi-200g">Hạt hạnh nh&acirc;n Mỹ Your Superfood g&oacute;i 200g</a>&nbsp;nhỏ gọn, tiện lợi,&nbsp;gi&agrave;u dĩnh dưỡng, gi&uacute;p bổ sung nhiều vtamin v&agrave; đem đến hương vị quy&ecirc;́n rũ từ lớp nh&acirc;n giòn tan.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạnh nh&acirc;n Mỹ</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>100% hạt hạnh nh&acirc;n Mỹ</div>
	</li>
	<li>Năng lượng
	<div>629 kcal/ 100g hạnh nh&acirc;n</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ăn trực tiếp hoặc kết hợp để l&agrave;m b&aacute;nh, ngũ cốc ăn s&aacute;ng.</div>
	</li>
	<li>Bảo quản
	<div>H&agrave;n k&iacute;n sau khi mở bao. Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</div>
	</li>
	<li>Thương hiệu
	<div>Your Superfood (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (54, 'Hạt điều vỏ lụa rang muối Vinahe hũ 170g', 65000, 0, 'store/images/hat-say-kho/hat-dieu-vo-lua-rang-muoi-vinahe-hu-170g-202205181540467878_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-vinahe-hat-dieu-oc-cho">Hạt điều Vinahe</a> c&ograve;n chứa nhiều dưỡng chất tốt cho cơ thể như:&nbsp;Lipid: 46.3 gam.&nbsp;Chất&nbsp;xơ: 0.6 gam. Vitamin: vitamin E (0.9 mg), vitamin K (34.1 mg), vitamin B6 (0.417 mg)&nbsp;Chất&nbsp;kho&aacute;ng,...Hạt điều vỏ lụa rang muối Vinahe hũ 170g&nbsp;&nbsp;n&agrave;y c&oacute; thể sử dụng trực tiếp hoặc ăn k&egrave;m t&ugrave;y th&iacute;ch.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt điều vỏ lụa rang muối</div>
	</li>
	<li>Khối lượng
	<div>170g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nh&acirc;n điều (90%), muối</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Lắc đều trước khi ăn, n&ecirc;n d&ugrave;ng ngay sau khi mở bao b&igrave;. Đậy nắp nếu kh&ocirc;ng sử dụng.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng.</div>
	</li>
	<li>Thương hiệu
	<div>Vinahe</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-hat-dieu-oc-cho">Hạt điều</a> l&agrave; một trong những loại hạt được nhiều người ưa th&iacute;ch v&igrave; c&oacute; vị thơm ngon, b&eacute;o ngậy. Thấu hiểu điều n&agrave;y, Vinahe đ&atilde; cho ra sản phẩm <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-dieu-vo-lua-rang-muoi-vinahe-hu-170g">Hạt điều vỏ lụa rang muối Vinahe hũ 170g</a> ph&ugrave; hợp cho nhiều người hoặc v&agrave;o c&aacute;c dịp lễ.

<div style="text-align:center"><img alt="Hạt điều vỏ lụa rang muối Vinahe hũ 170g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3487/239128/bhx/hat-dieu-vo-lua-rang-muoi-vinahe-hu-170g-202105120916336118.jpg" style="height:500px; width:800px" /></div>
Sản phẩm c&oacute; khối lượng 170g, nhiều hơn so với sản phẩm c&ugrave;ng loại g&oacute;i. Ph&ugrave; hợp sử dụng cho gia đ&igrave;nh, văn ph&ograve;ng. Sản phẩm đ&oacute;ng g&oacute;i dạng hũ, dễ sử dụng v&agrave; bảo quản.&nbsp;<br />
Ngo&agrave;i ra, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/hat-dieu-va-nhung-loi-ich-doi-voi-suc-khoe-1008597">hạt điều c&ograve;n chứa nhiều dưỡng chất</a> tốt cho cơ thể như:&nbsp;Lipid: 46.3 gam.&nbsp;<strong>Chất</strong>&nbsp;xơ: 0.6 gam. Vitamin: vitamin E (0.9 mg), vitamin K (34.1 mg), vitamin B6 (0.417 mg)&nbsp;<strong>Chất</strong> kho&aacute;ng: Canxi (28 mg), Natri (12 mg), Kali (660 mg), Magie (292 mg), Folate (25 mcg)

<div style="text-align:center"><img alt="Hạt điều vỏ lụa rang muối Vinahe hũ 170g 1" class="lazy" src="https://traicayviet.net/wp-content/uploads/2020/11/hat-dieu-21.jpg" style="height:500px; width:800px" /></div>
Sản phẩm điều rang vỏ lụa muối n&agrave;y c&oacute; thể sử dụng trực tiếp hoặc ăn k&egrave;m t&ugrave;y th&iacute;ch.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (55, 'Đậu phộng vị phô mai Poca nutz gói 90g', 12500, 0, 'store/images/hat-say-kho/dau-phong-vi-pho-mai-poca-nutz-goi-90g-202206302205253202_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-poca">Đậu phộng Poca</a> thơm ngon, gi&ograve;n rụm lớp vỏ b&ecirc;n ngo&agrave;i c&ugrave;ng đậu phộng b&ecirc;n trong b&eacute;o ngậy. <a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-phong-vi-pho-mai-poca-nutz-goi-90g">Đậu phộng vị ph&ocirc; mai Poca nutz g&oacute;i 90g</a> chất lượng, thơm vị ph&ocirc; mai v&ocirc; c&ugrave;ng hấp dẫn. <a href="https://www.bachhoaxanh.com/cac-loai-hat">Đậu phộng</a> thơm ngon, tiện lợi, c&oacute; thể mang theo b&ecirc;n người cho những cuộc vui chơi</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu phộng vị ph&ocirc; mai</div>
	</li>
	<li>Khối lượng
	<div>90g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng, dầu thực vật, bột nếp, đường, tinh bột bắp, bột m&igrave;, tinh bột sẵn biến t&iacute;nh, bột gia vị ph&ocirc; mai, muối iot,...</div>
	</li>
	<li>Năng lượng
	<div>170kcal/30g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp, kh&ocirc;ng cần qua chế biến v&agrave; xử l&yacute; th&ecirc;m</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</div>
	</li>
	<li>Thương hiệu
	<div>Poca (Mỹ)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (56, 'Đậu phộng sả ớt Tài Tài hũ 250g', 43000, 57500, 'store/images/hat-say-kho/dau-phong-sa-ot-tai-tai-hu-250g-202205181531404327_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Đậu phộng được ẩn m&igrave;nh b&ecirc;n trong lớp bột gi&ograve;n, thơm ngon v&agrave; đậm vị sả ớt. Đậu phộng sả ớt T&agrave;i t&agrave;i hũ 250g ngo&agrave;i độ gi&ograve;n c&ograve;n c&oacute; sự mặn mặn, ch&uacute;t ngọt k&iacute;ch th&iacute;ch vị gi&aacute;c. Đậu phộng b&eacute;o b&ugrave;i của T&acirc;n T&acirc;n, thương hiệu nổi tiếng chất lượng của Việt Nam ta từ c&aacute;c sản phẩm từ đậu phộng.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu phộng sả ớt</div>
	</li>
	<li>Khối lượng
	<div>250g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng 60%, bột m&igrave;, bột bắp, bột biến t&iacute;nh, dầu thực vật, muối, sả, ớt,...</div>
	</li>
	<li>Năng lượng
	<div>490 kcal/100g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Sử dụng ngay sau khi mở bao b&igrave;</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>T&agrave;i t&agrave;i (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-phong-sa-ot-tai-tai-hu-250g">Đậu phộng sả ớt T&agrave;i T&agrave;i hủ 250g</a> l&agrave; sự kết hợp tuyệt hảo giữa <a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-phong">đậu phộng</a> nguy&ecirc;n chất rang gi&ograve;n c&ugrave;ng bột m&igrave;, bột bắp được tẩm ướp gia vị đậm đ&agrave; c&ugrave;ng với vị sả ớt thơm cay hấp dẫn tạo n&ecirc;n sự h&agrave;i h&ograve;a giữa c&aacute;c vị b&ugrave;i - mặn - ngọt - cay đảm bảo k&iacute;ch th&iacute;ch vị gi&aacute;c, khiến bạn ăn kh&ocirc;ng ngừng tay.<br />
Loại hạt n&agrave;y chứa rất nhiều dưỡng chất tốt như protein thực vật, chất xơ, chất b&eacute;o, c&aacute;c loại vitamin v&agrave; kho&aacute;ng chất như vitamin E, photpho, đồng,... do l&agrave;m từ đậu phộng nguy&ecirc;n chất. V&igrave; vậy, <a href="https://www.bachhoaxanh.com/cac-loai-hat-tai-tai-dau-phong">đậu phộng T&agrave;i T&agrave;i</a> lu&ocirc;n mang lại c&aacute;c lợi &iacute;ch tốt cho sức khỏe như hạn chế bệnh tim mạch, kiểm so&aacute;t lượng cholesterol, tăng cường tr&iacute; nhớ v&agrave; ngăn ngừa l&atilde;o h&oacute;a v&agrave; ho&agrave;n to&agrave;n c&oacute; thể thay thế c&aacute;c bữa ăn nhẹ để cung cấp năng lượng cho một ng&agrave;y d&agrave;i hoạt động.</p>

<p><img class="lazy" src="https://lh6.googleusercontent.com/R_KwH3Xg7rNR3A5S7cLQHqAGw-UD45EliAPHSM-owC18ZOLLV0rTdqpalPV1FQQqEadHHk_53Y5AUlRXjj7iPSaao-x4cYXELH8j5QSn74LDKZqjcduIYjCL87xBoparPfKsc9QI" style="height:451px; width:602px" /></p>

<p>Đậu phộng sả ớt T&agrave;i T&agrave;i hủ 250g chắc chắn sẽ g&acirc;y ấn tượng mạnh với người ti&ecirc;u d&ugrave;ng ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n bởi những h&igrave;nh ảnh độc đ&aacute;o, vui nhộn được in tr&ecirc;n bao b&igrave;. Ngo&agrave;i ra, sản phẩm c&ograve;n được đ&oacute;ng g&oacute;i dạng hủ chắc chắn, nhỏ gọn với khối lượng l&ecirc;n đến 250g gi&uacute;p bạn c&oacute; thể thoải m&aacute;i thưởng thức ở bất kỳ nơi n&agrave;o hoặc d&ugrave;ng l&agrave;m qu&agrave; cho bạn b&egrave;, người th&acirc;n trong gia đ&igrave;nh.<br />
<img class="lazy" src="https://lh5.googleusercontent.com/DIHTAS3cPVt_srGU97kFus4QTKnWQH4LHq6dyzH-wV6pt3nMwIvMfuCQXC-zZcvhU7kcDMJGL9C2XX9qK3LTmEQIdoc05UHPk5Fp_B_ujBGrmoo6fMioT8SR7advgAK1uxxEnV_h" style="height:451px; width:602px" /><br />
D&ugrave; l&agrave; một thương hiệu Việt Nam nhưng T&agrave;i T&agrave;i đ&atilde; chứng minh được chất lượng v&agrave; gi&aacute; trị của m&igrave;nh khi đ&atilde; x&acirc;m nhập thị trường quốc tế kh&oacute; t&iacute;nh như : H&agrave;n Quốc, Nhật Bản, Trung Quốc ,&Uacute;c, Mỹ, Ph&aacute;p, Singapore&hellip;. với nhiều sản phẩm mang gi&aacute; trị dinh dưỡng cao, chất lượng tốt v&agrave; an to&agrave;n cho sức khoẻ qua đ&oacute; g&oacute;p phần n&acirc;ng cao gi&aacute; trị của hạt n&ocirc;ng sản Việt Nam.<br />
Tham khảo th&ecirc;m: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-dau-phong-rang-muoi-duong-chuan-nhu-ngoai-hang-1001282">C&aacute;ch l&agrave;m đậu phộng rang muối đường chuẩn như ngo&agrave;i h&agrave;ng</a></p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (57, '2 gói đậu phộng phủ socola Koh-Kae 22g', 10000, 20000, 'store/images/hat-say-kho/2-goi-dau-phong-phu-socola-koh-kae-22g-202304251039319424_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-koh-kae-dau-phong">Đậu phộng Koh-kae</a> thơm ngon, b&eacute;o ngọt v&agrave; c&oacute; thương socola bọc lấy những hạt đậu tạo hương vị v&ocirc; c&ugrave;ng hấp dẫn. <a href="https://www.bachhoaxanh.com/cac-loai-hat/2-goi-dau-phong-phu-socola-koh-kae-goi-22g">2 g&oacute;i đậu phộng phủ socola Koh-Kae 22g</a> thơm ngon, th&iacute;ch hợp để ăn vặt c&ugrave;ng gia đ&igrave;nh v&agrave; bạn b&egrave;. <a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-phong">Đậu phộng</a> ăn liền ph&ugrave; hợp cho cả trẻ em v&agrave; người lớn c&ugrave;ng thưởng thức</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu phộng phủ socola</div>
	</li>
	<li>Khối lượng
	<div>22g/ g&oacute;i</div>
	</li>
	<li>Số lượng
	<div>2 g&oacute;i</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng, đường, m&igrave;, tinh bột chế biến sẵn, chất b&eacute;o thực vật, kem sữa, bột whey, bột sữa t&aacute;ch b&eacute;o, bột tạo ngọt, chất nhũ h&oacute;a, hương liệu giống tự nhi&ecirc;n, chất kh&iacute; bao b&igrave;</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Sản phẩm d&ugrave;ng trực tiếp</div>
	</li>
	<li>Bảo quản
	<div>Để nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</div>
	</li>
	<li>Thương hiệu
	<div>Koh-Kae (Th&aacute;i Lan)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (58, 'Đậu phộng tỏi ớt Tài Tài hũ 250g', 43000, 57500, 'store/images/hat-say-kho/dau-phong-toi-ot-tai-tai-hu-250g-202205181524333823_300x300.jpg', '<div class="details"><h2 class="textinfpro" id="specification">Thông tin sản phẩm</h2><div class="short-description">Đậu phộng một nguồn chứa nhiều dưỡng chất tốt như protein thực vật, chất xơ, chất béo, các loại vitamin và khoáng chất như vitamin E, photpho, đồng,... Đậu phộng tỏi ớt Tài tài hũ 250g hương vị thơm ngon, cay the của tỏi ớt thơm thơm được hòa quyện trong từng hạt đậu phộng được tẩm ướp gia vị đậm đà</div><ul class="infoproduct nospeci"><li><span>Loại hạt</span><div>Đậu phộng tỏi ớt</div><li><span>Khối lượng</span><div>250g</div><li><span>Thành phần</span><div>Đậu phộng (60%), bột mì, bột bắp, bột biến tính, tỏi, muối, ớt, dầu thực vật, dầu olein tinh luyện,...</div><li><span>Năng lượng</span><div>491 kcal/100g</div><li><span>Cách dùng</span><div>Sử dụng ngay sau khi mở bao bì</div><li><span>Bảo quản</span><div>Bảo quản nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp</div><li><span>Thương hiệu</span><div>Tài tài (Việt Nam)</div><li><span>Sản xuất</span><div>Việt Nam</div></li></li></li></li></li></li></li></li></ul><div class="description"><p><a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-phong-toi-ot-tai-tai-hu-250g">Đậu phộng tỏi ớt Tài Tài hủ 250g</a> chắc chắn là một món ăn vặt mà bạn không thể bỏ qua bởi vị béo của đậu phộng được tẩm ướp gia vị đậm đà kết hợp với tỏi ớt cay cay thơm ngon tạo nên sự kết hợp tuyệt hảo giữa ngọt-mặn-cay gây kích thích vị giác mạnh mẽ, khiến bạn không thể cưỡng lại được sức hấp dẫn từ món ăn này.<br/> <img class="lazy" src="https://lh4.googleusercontent.com/OxBidOQEYqdQ_tHs-S8FUB3xot9L--NVxwcIXePOZ67JZENYWxEuqt28NGGfXxLQ_VU7o9-EOoiU4ST12pVZfauN5WGybQfByrGvsS2TICKUTVWtJ9M5CHfhe3nFbN6QcnGMgdPy" style="height:451px;width:602px"/><br/> Về chất lượng thì bạn hoàn toàn có thể yên tâm vì dù là một thương hiệu Việt Nam nhưng các <a href="https://www.bachhoaxanh.com/cac-loai-hat-tai-tai-dau-phong">đậu phộng Tài Tài</a> bởi hãng đã sản xuất nhiều sản phẩm chất lượng cao, mang lại nhiều giá trị dinh dưỡng tốt cho cơ thể và đã được xuất khẩu sang các thị trường quốc tế khó tính như Hàn Quốc, Nhật Bản, Trung Quốc ,Úc, Mỹ, Pháp, Singapore….<br/> Đậu phộng tỏi ớt Tài Tài với nguyên liệu chủ đạo là <a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-phong">hạt đậu phộng</a> nguyên chất - một loại nguyên liệu chứa rất nhiều dưỡng chất tốt như protein thực vật, chất xơ, chất béo, các loại vitamin và khoáng chất như vitamin E, photpho, đồng,.. <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dau-phong-co-cong-dung-gi-doi-voi-suc-khoe-con-nguoi-1008886">đậu phộng mang lại nhiều lợi ích tốt cho sức khỏe </a>như hạn chế bệnh tim mạch, kiểm soát lượng cholesterol, tăng cường trí nhớ và ngăn ngừa lão hóa và hoàn toàn có thể thay thế các bữa ăn nhẹ để cung cấp năng lượng cho một ngày dài hoạt động.<br/> <img class="lazy" src="https://lh5.googleusercontent.com/4mJP9nz-JAGJIfiIwHbG8jMyK03acNcZ8rXXNxPxqUNIcw9nG8E3t9o6ZH5s90BrTxGiuVn0nWxWiDqwEJ5G-mkc2Zqh2dYqNxNyxcCMb4KWoTtqDhfQVGIWthiq1oyGpU83T8Bp" style="height:451px;width:602px"/><br/> Thiết kế của sản phẩm còn gây ấn tượng mạnh với mọi người đặc biệt là giới trẻ bởi những hình ảnh vui nhộn, độc đáo được in trên bao bì kết hợp với màu sắc bắt mắt. Ngoài ra, đậu phộng tỏi ớt Tài Tài nay còn được đóng gói dạng hủ chắc chắn với khối lượng lên đến 250g giúp bạn thoải mái thưởng thức và dễ dàng bảo quản khi không dùng nữa.<br/> Với hương vị thơm ngon kèm chất lượng tuyệt vời được đóng gói chắc chắc, tiện lợi thì đậu phộng tỏi ớt Tài Tài hủ 250g xứng đáng là một món ăn vặt không thể bỏ qua trong danh sách yêu thích của bạn.</p></div><div class="viewmoreinfo">Xem thêm</div></div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01.932150', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (59, 'Đậu hà lan wasabi Tài Tài hũ 195g', 39000, 52000, 'store/images/hat-say-kho/dau-ha-lan-wasabi-tai-tai-hu-195g-202205181531436304_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Cung cấp dồi d&agrave;o protein, chất xơ, acid folic, c&aacute;c vitamin nh&oacute;m B, C, K, v&agrave; nhiều kho&aacute;ng chất như mangan, kali v&agrave; sắt.... Đậu h&agrave; lan wasabi T&agrave;i t&agrave;i hũ 195g&nbsp;được tẩm ướp gia vị đậm đ&agrave; kết hợp c&ugrave;ng vị m&ugrave; tạt wasabi thơm cay đặc trưng th&aacute;ch thức vị gi&aacute;c, tạo cảm gi&aacute;c muốn ăn m&atilde;i kh&ocirc;ng ngừng.</div>

<ul>
	<li>Loại hạt
	<div>Đậu h&agrave; lan vị wasabi</div>
	</li>
	<li>Khối lượng
	<div>195g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu h&agrave; lan (72%), bột biến t&iacute;nh, bột wasabi, muối, dầu thực vật, đường, bột biến t&iacute;nh, dầu olein tinh luyện,....</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Sử dụng ngay sau khi mở bao b&igrave;</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>T&agrave;i t&agrave;i (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-ha-lan-wasabi-tai-tai-hu-195g">Đậu H&agrave; Lan wasabi T&agrave;i T&agrave;i hủ 195g</a> l&agrave; một m&oacute;n ăn vặt kh&ocirc;ng thể cưỡng lại bởi những hạt đậu H&agrave; Lan được kết hợp với c&aacute;c nguy&ecirc;n liệu như <a href="https://www.bachhoaxanh.com/bot-da-dung-bot-mi">bột m&igrave;</a>, bột bắp được tẩm ướp gia vị đậm đ&agrave; kết hợp c&ugrave;ng vị m&ugrave; tạt wasabi thơm cay đặc trưng th&aacute;ch thức vị gi&aacute;c, tạo cảm gi&aacute;c muốn ăn m&atilde;i kh&ocirc;ng ngừng.<br />
Đậu H&agrave; Lan wasabi T&agrave;i T&agrave;i với th&agrave;nh phần ch&iacute;nh l&agrave; <a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-ha-lan">đậu h&agrave; lan</a> nguy&ecirc;n chất - nguồn cung cấp dồi d&agrave;o protein, chất xơ, acid folic, c&aacute;c <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cong-dung-cua-cac-loai-vitamin-voi-suc-khoe-995233">vitamin</a> nh&oacute;m B, C, K, v&agrave; nhiều kho&aacute;ng chất như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/mangan-hay-manganesia-la-gi-1001091">mangan</a>, kali v&agrave; sắt th&igrave; sản phẩm mang lại nhiều <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cong-dung-tuyet-voi-cua-dau-ha-lan-1024541">c&ocirc;ng dụng tốt cho sức khỏe của đậu H&agrave; Lan</a> như trị chứng kh&oacute; ti&ecirc;u, giảm vi&ecirc;m khớp, gi&uacute;p cho xương chắc khỏe,&hellip;</p>

<p><img class="lazy" src="https://lh5.googleusercontent.com/L82TjM0cNv5rS_zrrxOsWsOawkeSZItrWF2DHq7kBOkb6cyP524hTn53UDB1ZiC9vW4btVC63AODQASKBNQIJuoYnwEAFl1UcSF3sKbxuN4e7ekI7WZsCIl4MJacfv3xbTAUQvu5" style="height:451px; width:602px" /></p>

<p>Đậu H&agrave; Lan wasabi T&agrave;i T&agrave;i được đ&oacute;ng g&oacute;i dạng hủ chắc chắn, tiện lợi gi&uacute;p người d&ugrave;ng dễ d&agrave;ng bảo quản v&agrave; mang theo bất k&igrave; nơi n&agrave;o để sử dụng hoặc l&agrave;m qu&agrave; tặng cho bạn b&egrave; người th&acirc;n. Nay sản phẩm c&ograve;n được đ&oacute;ng g&oacute;i với khối lượng l&ecirc;n đến 195g gi&uacute;p thỏa m&atilde;n cơn th&egrave;m cho những ai y&ecirc;u th&iacute;ch m&oacute;n ăn n&agrave;y.<br />
Ngo&agrave;i ra, thiết kế của của đậu H&agrave; Lan wasabi T&agrave;i T&agrave;i g&acirc;y ấn tượng mạnh ngay từ lần đầu ti&ecirc;n nh&igrave;n thấy bởi h&igrave;nh ảnh độc lạ, vui nhộn được in tr&ecirc;n sản phẩm.</p>

<p><img class="lazy" src="https://lh4.googleusercontent.com/5wCOXJFwhBfwaPFQEl_vHSuDp7awNXa1zgsZxoth7BgkugJUoiMQK6zdBQGKtbNLiHPNPZNPDNicz_FEL9zF8K6vXXn3S50vcZx7KUSN8tyzCXeDtDnCB8AxJFoMwbC-Sjd0Jm_I" style="height:451px; width:602px" /></p>
Về chất lượng sản phẩm th&igrave; người d&ugrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m bởi T&agrave;i T&agrave;i xứng đ&aacute;ng l&agrave; một thương hiệu Việt Nam uy t&iacute;n chất lượng cao với nhiều sản phẩm mang gi&aacute; trị dinh dưỡng cao, chất lượng tốt v&agrave; an to&agrave;n cho sức khoẻ. <a href="https://www.bachhoaxanh.com/cac-loai-hat-tai-tai-dau-ha-lan">Đậu H&agrave; Lan&nbsp;T&agrave;i T&agrave;i</a> gắn liền m&igrave;nh với h&agrave;nh tr&igrave;nh n&acirc;ng cao gi&aacute; trị của hạt n&ocirc;ng sản Việt. Kh&ocirc;ng những ph&aacute;t triển thị trường trong nước, sản phẩm T&agrave;i T&agrave;i đ&atilde; x&acirc;m nhập thị trường quốc tế kh&oacute; t&iacute;nh như: H&agrave;n Quốc, Nhật Bản, Trung Quốc , &Uacute;c, Mỹ, Ph&aacute;p, Singapore&hellip;</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (60, 'Hạt hạnh nhân Mỹ Your Superfood hũ 450g', 225000, 0, 'store/images/hat-say-kho/hat-hanh-nhan-my-your-superfood-hu-450g-202205181605237513_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Thương hiệu <a href="https://www.bachhoaxanh.com/cac-loai-hat-your-superfood">hạt kh&ocirc; Your Superfood</a>&nbsp;mang đến <a href="https://www.bachhoaxanh.com/cac-loai-hat">c&aacute;c loại hạt</a> c&oacute; nhiều dinh dưỡng tốt cho sức khỏe v&agrave; có ngu&ocirc;̀n g&ocirc;́c từ tự nhi&ecirc;n.&nbsp;<a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-hanh-nhan-my-your-superfood-hu-450g">Hạt hạnh nh&acirc;n Mỹ Your Superfood hũ 450g</a>&nbsp;ch&iacute;nh h&atilde;ng, gi&agrave;u h&agrave;m lượng dĩnh dưỡng, gi&uacute;p bổ sung nhiều vtamin v&agrave; dưỡng chất, mang đến hương vị quyến rũ kh&oacute; cưỡng.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạnh nh&acirc;n Mỹ</div>
	</li>
	<li>Khối lượng
	<div>450g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>100% hạt hạnh nh&acirc;n Mỹ</div>
	</li>
	<li>Năng lượng
	<div>629 kcal/ 100g hạnh nh&acirc;n</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ăn trực tiếp hoặc kết hợp để l&agrave;m b&aacute;nh, ngũ cốc ăn s&aacute;ng.</div>
	</li>
	<li>Bảo quản
	<div>H&agrave;n k&iacute;n sau khi mở bao. Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</div>
	</li>
	<li>Thương hiệu
	<div>Your Superfood (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (61, 'Hạt hạnh nhân tẩm bơ mật ong Tom''s Farm gói 210g', 147000, 0, 'store/images/hat-say-kho/hat-hanh-nhan-tam-bo-mat-ong-toms-farm-tui-210g-202205181452594693_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat">Hạt kh&ocirc; c&aacute;c loại</a> bổ sung dinh dưỡng thơm ngon, hấp dẫn. <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-hanh-nhan-tam-bo-mat-ong-toms-farm-tui-210g">Hạt hạnh nh&acirc;n tẩm bơ mật ong Tom&#39;s Farm t&uacute;i 210g</a>&nbsp;khi ăn c&oacute; vị b&eacute;o b&eacute;o cũng với độ ngọt của mật ong v&agrave; thơm bơ, k&iacute;ch th&iacute;ch vị gi&aacute;c. <a href="https://www.bachhoaxanh.com/cac-loai-hat">Hạt kh&ocirc;</a>&nbsp;<a href="https://www.bachhoaxanh.com/cac-loai-hat-tom-s-farm">Tom&#39;s Farm</a> được sản xuất tại H&agrave;n Quốc, ph&ugrave; hợp cho ăn vặt, thưởng tr&agrave;.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt hạnh nh&acirc;n tẩm bơ mật ong</div>
	</li>
	<li>Khối lượng
	<div>210g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Hạt hạnh nh&acirc;n (73.316%), tinh bột bắp (12.689%), đường (7.498%), vị bơ mật ong (3.8%), mật ong (0.97%), dầu bắp (0.905%), dầu đậu n&agrave;nh (0.808%), tinh chất mầm đậu n&agrave;nh, chiết xuất thảo mộc</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp. Đ&oacute;ng k&iacute;n t&uacute;i zip sau mỗi lần sử dụng nếu chưa d&ugrave;ng hết</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Tom&#39;s Farm (H&agrave;n Quốc)</div>
	</li>
	<li>Sản xuất
	<div>H&agrave;n Quốc</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (62, 'Hạt hạnh nhân tẩm wasabi Tom''s Farm gói 210g', 142000, 0, 'store/images/hat-say-kho/hat-hanh-nhan-tam-wasabi-toms-farm-tui-210g-202205181453113580_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-hat-hanh-nhan">Hạt hạnh nh&acirc;n</a> được tẩm wasabi lạ miệng, thơm thơm hấp dẫn. <a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-hanh-nhan-tam-wasabi-toms-farm-goi-210g">Hạt hạnh nh&acirc;n tẩm wasabi Tom&#39;s Farm g&oacute;i 210g&nbsp;</a> khi ăn c&oacute; vị b&eacute;o b&eacute;o của hạnh nh&acirc;n cũng như ch&uacute;t the the của wasabi, k&iacute;ch th&iacute;ch vị gi&aacute;c.&nbsp;<a href="https://www.bachhoaxanh.com/cac-loai-hat-tom-s-farm-hat-hanh-nhan">Hạt hạnh nh&acirc;n Tom&#39;s Farm</a> được sản xuất tại H&agrave;n Quốc, ph&ugrave; hợp cho ăn vặt, thưởng tr&agrave;</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạt hạnh nh&acirc;n tẩm wasabi</div>
	</li>
	<li>Khối lượng
	<div>210g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Hạt hạnh nh&acirc;n (72.031%), tinh bột bắp (12.677%), đường (7.682%), xi-r&ocirc; ((8.178%), gia vị wasabi tổng hợp, mật ong (0.954%), dầu bắp (0.857%), dầu đậu n&agrave;nh (0.600%), chất chống oxy h&oacute;a (0.012%), chiết xuất thảo mộc (0.001%)</div>
	</li>
	<li>Lưu &yacute;
	<div>Sản phẩm c&oacute; chứa sữa. đậu n&agrave;nh</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp. Đ&oacute;ng k&iacute;n t&uacute;i zip nếu kh&ocirc;ng sử dụng hết</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Tom&#39;s Farm (H&agrave;n Quốc)</div>
	</li>
	<li>Sản xuất
	<div>H&agrave;n Quốc</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Thương hiệu Tom&rsquo;s Farm thuộc sở hữu của c&ocirc;ng ty Gilim với c&aacute;c sản phẩm hạnh nh&acirc;n hạt thơm ngon, hấp dẫn được sản xuất từ nguy&ecirc;n liệu chọn lọc. Đ&acirc;y được xem l&agrave; thương hiệu snack hạt H&agrave;n Quốc nổi bật tại Việt Nam bởi chất lượng sản phẩm tốt, mẫu m&atilde; bao b&igrave; đẹp mắt, hương vị thơm ngon, đa dạng.<br />
<img alt="Hạt hạnh nhân tẩm wasabi Tom''s Farm gói 210g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3487/212846/bhx/files/hat-hanh-nhan-tam-wasabi-toms-farm-tui-210g-201910191135432378.jpg" style="height:500px; width:800px" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Hạt hạnh nh&acirc;n l&agrave; nguồn cung cấp c&aacute;c chất dinh dưỡng dồi d&agrave;o cho cơ thể như: chất xơ, chất đạm, chất b&eacute;o, c&aacute;c vitamin E, A, canxi, magie,... Theo th&ocirc;ng tin nghi&ecirc;n cứu, hạt hạnh nh&acirc;n tươi sẽ cung cấp khoảng 597 kcal v&agrave; lượng calo n&agrave;y sẽ thay đổi t&ugrave;y thuộc v&agrave;o c&aacute;c th&agrave;nh phần k&egrave;m theo hạt, c&aacute;ch chế biến, loại sản phẩm,...</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng cho sức khỏe m&agrave; sản phẩm mang đến l&agrave;:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Bổ sung chất chống oxy h&oacute;a</p>
	</li>
	<li>
	<p>L&agrave;m đẹp da</p>
	</li>
	<li>
	<p>Kiểm so&aacute;t lượng đường trong m&aacute;u</p>
	</li>
	<li>
	<p>Điều h&ograve;a huyết &aacute;p v&agrave; cholesterol</p>
	</li>
	<li>
	<p>Giảm nguy cơ mắc bệnh tim mạch, ung thư</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Sản phẩm c&oacute; thể d&ugrave;ng trực tiếp sau khi mở g&oacute;i v&agrave; khi kh&ocirc;ng d&ugrave;ng n&ecirc;n đ&oacute;ng k&iacute;n miệng t&uacute;i để tr&aacute;nh sản phẩm mất vị thơm ngon do tiếp x&uacute;c nhiều với kh&ocirc;ng kh&iacute;. Bảo quản ở nơi kh&ocirc; m&aacute;t nhiệt độ kh&ocirc;ng qu&aacute; 28 độ C v&agrave; tr&aacute;nh &aacute;nh nắng trực tiếp từ mặt trời.<br />
Lưu &yacute;: Khi thấy sản phẩm c&oacute; dấu hiệu ẩm mốc, m&ugrave;i kh&aacute;c lạ hoặc hết hạn sử dụng bạn n&ecirc;n ngừng ngay để tr&aacute;nh l&agrave;m ảnh hưởng đến chất lượng của sản phẩm.<br />
<img alt="Hạt hạnh nhân tẩm wasabi Tom''s Farm gói 210g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3487/212846/bhx/files/hat-hanh-nhan-tam-wasabi-toms-farm-tui-210g-201910191135443258.jpg" style="height:500px; width:800px" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Một trong những địa chỉ uy t&iacute;n cung cấp c&aacute;c sản phẩm hạnh nh&acirc;n Tom&rsquo;s Farm thơm ngon, được đảm bảo nguồn gốc, xuất xứ r&otilde; r&agrave;ng l&agrave; B&aacute;ch h&oacute;a XANH. Tại đ&acirc;y c&aacute;c sản phẩm sẽ được kiểm tra kỹ về chất lượng, th&ocirc;ng tin trước khi đến tay kh&aacute;ch h&agrave;ng. Ngo&agrave;i ra khi đặt h&agrave;ng bạn sẽ nhanh ch&oacute;ng được giao h&agrave;ng tận nơi nhanh ch&oacute;ng.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (63, 'Hạt hạnh nhân Mỹ Your Superfood hũ 240g', 125000, 0, 'store/images/hat-say-kho/hat-hanh-nhan-my-your-superfood-hu-240g-202205181605202177_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Thương hiệu <a href="https://www.bachhoaxanh.com/cac-loai-hat-your-superfood">hạt kh&ocirc; Your Superfood</a>&nbsp;mang đến <a href="https://www.bachhoaxanh.com/cac-loai-hat">c&aacute;c loại hạt</a> c&oacute; nhiều dinh dưỡng tốt cho sức khỏe v&agrave; có ngu&ocirc;̀n g&ocirc;́c từ tự nhi&ecirc;n.&nbsp;<a href="https://www.bachhoaxanh.com/cac-loai-hat/hat-hanh-nhan-my-your-superfood-hu-240g">Hạt hạnh nh&acirc;n Mỹ Your Superfood hũ 240g</a>&nbsp;nhỏ gọn,&nbsp;ch&iacute;nh h&atilde;ng, thơm ngon, chứa h&agrave;m lượng dĩnh dưỡng cao, gi&uacute;p bổ sung nhiều vtamin v&agrave; dưỡng chất.</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Hạnh nh&acirc;n Mỹ</div>
	</li>
	<li>Khối lượng
	<div>240g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>100% hạt hạnh nh&acirc;n Mỹ</div>
	</li>
	<li>Năng lượng
	<div>629 kcal/ 100g hạnh nh&acirc;n</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ăn trực tiếp hoặc kết hợp để l&agrave;m b&aacute;nh, ngũ cốc ăn s&aacute;ng.</div>
	</li>
	<li>Bảo quản
	<div>H&agrave;n k&iacute;n sau khi mở bao. Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</div>
	</li>
	<li>Thương hiệu
	<div>Your Superfood (Việt Nam)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (64, 'Đậu phộng tỏi ớt Tân Tân hũ 260g', 68000, 0, 'store/images/hat-say-kho/dau-phong-toi-ot-tan-tan-hu-260g-202304152116482229_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/cac-loai-hat-dau-phong">Đậu phộng</a> c&oacute;&nbsp; vị mặn mặn, b&ecirc;n ngo&agrave;i hột đậu phộng &aacute;o th&ecirc;m một lớp tỏi ớt thơm, cay cay v&agrave; c&oacute; cả m&egrave; phủ b&ecirc;n ngo&agrave;i rất k&iacute;ch th&iacute;ch vị gi&aacute;c v&agrave; thơm ngon.&nbsp;<a href="https://www.bachhoaxanh.com/cac-loai-hat/dau-phong-toi-ot-tan-tan-hu-275g">Đậu phộng tỏi ớt T&acirc;n T&acirc;n hũ 260g</a> hấp dẫn ph&ugrave; hợp ăn vặt xem phim,đọc s&aacute;ch. <a href="https://www.bachhoaxanh.com/cac-loai-hat-tan-tan-dau-phong">Đậu phộng T&acirc;n T&acirc;n</a> được nhiều người tin d&ugrave;ng v&agrave; chọn mua</div>

<ul style="margin-left:40px">
	<li>Loại hạt
	<div>Đậu phộng tỏi ớt</div>
	</li>
	<li>Khối lượng
	<div>260g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng (65%), đường tinh luyện, muối i-ốt, tỏi (12.5%), ớt (3.5%), dinatri 5&#39;-guanylat (E627), dinatri 5&#39;-inosinat (E631), m&egrave;, dầu thực vật</div>
	</li>
	<li>Năng lượng
	<div>607 kcal/100g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ăn trực tiếp. Đậy k&iacute;n nắp sau mỗi lần sử dụng, sử dụng tốt nhất sau 15 ng&agrave;y kể từ khi mở nắp. C&oacute; thể d&ugrave;ng cho cả chay v&agrave; mặn.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</div>
	</li>
	<li>Thương hiệu
	<div>T&acirc;n T&acirc;n (New Zealand)</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 3);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (65, 'Quýt giống Úc 1kg', 45000, 64000, 'store/images/qua-mong-nuoc/quyt-giong-uc-1kg-5-9-trai-202304211028324525_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/quyt-giong-uc-tui-1kg-5-8-trai">Qu&yacute;t &Uacute;c</a>&nbsp;l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> c&oacute; m&agrave;u v&agrave;ng ươm, quả hơi dẹp, tr&ecirc;n vỏ qu&yacute;t c&oacute; c&aacute;c đốm tinh dầu to b&oacute;ng. <strong>Qu&yacute;t ngon, ngọt nhất khi tr&aacute;i hơi dẹt, cuống c&ograve;n tươi, m&agrave;u s&aacute;ng đều</strong>. Qu&yacute;t &Uacute;c tại B&aacute;ch h&oacute;a XANH được <strong>trồng tại Trung Quốc</strong> chất lượng, tươi ngon</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua qu&yacute;t &Uacute;c tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Qu&yacute;t &Uacute;c tươi ngon, chất lượng, ngọt thanh. Qu&yacute;t &Uacute;c được xem như l&agrave; loại qu&yacute;t ngon nhất thế giới. Qu&yacute;t &Uacute;c c&oacute; m&agrave;u v&agrave;ng ươm, quả hơi đẹp, tr&ecirc;n vỏ qu&yacute;t c&oacute; c&aacute;c đốm tinh dầu to b&oacute;ng. C&aacute;c t&eacute;p qu&yacute;t mọng nước, c&oacute; vị ngọt.</p>
	</li>
	<li>
	<p>Qu&yacute;t &Uacute;c được trồng tại Trung Quốc, đảm bảo nguồn gốc r&otilde; r&agrave;ng.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Quýt giống Úc 1kg (5 - 9 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/275711/bhx/quyt-giong-uc-tui-1kg-5-8-trai-202204021517160254.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của qu&yacute;t &Uacute;c&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Qu&yacute;t &Uacute;c l&agrave; một trong những loại tr&aacute;i c&acirc;y c&oacute; gi&aacute; trị dinh dưỡng cao được nhiều người chọn mua. Qu&yacute;t &Uacute;c c&oacute; chứa nhiều vitamin B1, vitamin B2 v&agrave; lượng vitamin C cao gấp nhiều lần so với những loại tr&aacute;i c&acirc;y kh&aacute;c như l&ecirc;. Ngo&agrave;i ra, qu&yacute;t giống &Uacute;c c&ograve;n c&oacute; h&agrave;m lượng protein v&agrave; canxi kh&aacute; cao.</p>
	</li>
	<li>
	<p>Trong 100g qu&yacute;t c&oacute; khoảng 53 Kcal.</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của qu&yacute;t &Uacute;c&nbsp; đối với sức khỏe</strong></h3>

<p>Qu&yacute;t l&agrave; loại tr&aacute;i c&acirc;y.mang đến những c&ocirc;ng dụng to lớn cho sức khỏe con người</p>

<ul style="margin-left:40px">
	<li>
	<p>Tăng cường sức đề kh&aacute;ng, hỗ trợ điều trị cảm v&agrave; ho khan</p>
	</li>
	<li>
	<p>Ngăn ngừa b&eacute;o ph&igrave;, tiểu đường, đột quỵ,...</p>
	</li>
	<li>
	<p>Chống oxy h&oacute;a v&agrave; cải thiện, duy tr&igrave; l&agrave;n da lu&ocirc;n săn chắc</p>
	</li>
	<li>
	<p>Cải thiện thị lực</p>
	</li>
	<li>
	<p>Giảm rụng t&oacute;c nhờ h&agrave;m lượng vitamin B12 cao</p>
	</li>
	<li>
	<p>Gi&uacute;p xương săn chắc</p>
	</li>
</ul>

<h3><strong>C&aacute;ch chọn qu&yacute;t &Uacute;c&nbsp; tươi ngon</strong></h3>

<p>Để chọn qu&yacute;t ngon, n&ecirc;n chọn những quả c&oacute; cuống c&ograve;n tươi, hơi dẹt, kh&ocirc;ng bị dập, &uacute;ng.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ qu&yacute;t &Uacute;c&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Mứt qu&yacute;t</p>
	</li>
	<li>
	<p>B&aacute;nh b&ocirc;ng lan qu&yacute;t</p>
	</li>
	<li>
	<p>Thạch qu&yacute;t</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản qu&yacute;t &Uacute;c tươi ngon</strong></h3>

<p>Qu&yacute;t c&oacute; thể bảo quản trong tủ lạnh để được l&acirc;u hơn v&agrave; tươi ngon hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (66, 'Táo Gala mini New Zealand 1kg', 39000, 49000, 'store/images/qua-mong-nuoc/tao-gala-mini-nhap-khau-new-zealand-1kg-8-11-trai-202304211039480310_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/tao-gala-mini-nhap-khau-tui-500g">T&aacute;o gala mini</a> l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> nhập khẩu New Zealand, chất lượng an to&agrave;n c&ugrave;ng lượng dưỡng chất dồi d&agrave;o, c&oacute; vị gi&ograve;n ngọt v&agrave; thanh m&aacute;t. Ngo&agrave;i ra, nhiều nghi&ecirc;n cứu cho rằng ăn 2 quả t&aacute;o mỗi ng&agrave;y c&oacute; thể giảm nguy cơ đột quỵ hoặc đau tim nếu nguy&ecirc;n nh&acirc;n xuất ph&aacute;t từ cholesterol l&agrave;m cứng động mạch.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua t&aacute;o gala tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>T&aacute;o gala c&oacute; lượng dưỡng ch&acirc;́t d&ocirc;̀i dào,<strong> vị giòn ngọt, thanh mát, trái nhỏ.</strong> T&aacute;o Gala mini <strong>nhập khẩu New Zealand</strong> l&agrave; tr&aacute;i c&acirc;y nhập khẩu chất lượng an to&agrave;n, vừa ti&ecirc;́t ki&ecirc;̣m v&ecirc;̀ giá, lại vừa vặn cho m&ocirc;̣t l&acirc;̀n ăn mà kh&ocirc;ng g&acirc;y ngán, kh&ocirc;ng phải dự trữ lại.</li>
	<li>T&aacute;o tươi ngon, kh&ocirc;ng bị dập, 1kg khoảng <strong>8-11 tr&aacute;i.&nbsp;</strong>T&aacute;o được đ&oacute;ng g&oacute;i bằng hộp nhựa trong gi&uacute;p bảo vệ quả kh&ocirc;ng bị dập.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Táo Gala mini nhập khẩu New Zealand 1kg (8-11 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/233534/bhx/tao-gala-mini-nhap-khau-new-zealand-hop-1kg-8-11-trai-202205111944153314.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của t&aacute;o gala</strong></h3>

<ul style="margin-left:40px">
	<li>T&aacute;o gala c&oacute; <strong>lớp vỏ gi&agrave;u chất xơ</strong>, thịt t&aacute;o gi&agrave;u <strong>vitamin A, vitamin C, vitamin B1, vitamin B2,</strong>...tốt cho sức khỏe.</li>
	<li>Trong 100g t&aacute;o gala c&oacute; khoảng <strong>52 calo.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của t&aacute;o gala đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Chứa chất chống oxy h&oacute;a gi&uacute;p đẹp da, đẹp d&aacute;ng</li>
	<li>Chứa nhiều kho&aacute;ng chất thiết yếu tốt cho tr&iacute; n&atilde;o v&agrave; hệ miễn dịch</li>
	<li>Kh&ocirc;ng cholesterol gi&uacute;p tăng cường tuần ho&agrave;n m&aacute;u</li>
	<li>Gi&agrave;u chất xơ c&oacute; lợi cho hệ ti&ecirc;u h&oacute;a</li>
	<li>&Iacute;t chất b&eacute;o hỗ trợ giảm c&acirc;n hiệu quả</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ t&aacute;o gala</strong></h3>

<p>T&aacute;o gala c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn, thức uống hấp dẫn như salad t&aacute;o, nước &eacute;p t&aacute;o, b&aacute;nh ngọt, thạch t&aacute;o,...</p>

<p style="text-align:center"><img alt="Táo Gala mini nhập khẩu New Zealand 1kg (8-11 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/233534/bhx/tao-gala-mini-nhap-khau-new-zealand-hop-1kg-8-11-trai-202205111944159724.jpg" style="height:500px; width:800px" /></p>

<h3><strong>C&aacute;ch bảo quản t&aacute;o gala tươi ngon</strong></h3>

<ul style="margin-left:40px">
	<li>N&ecirc;n bảo quản t&aacute;o trong ngăn m&aacute;t tủ lạnh</li>
	<li>Tr&aacute;nh để t&aacute;o bị va đập hoặc cấn dập do t&aacute;c dụng lực</li>
	<li>T&aacute;o gọt sẵn n&ecirc;n bọc k&iacute;n v&agrave; cho v&agrave;o ngăn m&aacute;t, để t&aacute;o <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-tao-lau-nay-nhung-ban-da-that-su-biet-cach-got-tao-trang-gion-khong-bi-tham-hay-chua-1331682">giữ được m&agrave;u sắc tươi ngon</a>, kh&ocirc;ng th&acirc;m sau khi cắt ra v&agrave; tr&aacute;nh để gần c&aacute;c loại thức ăn c&oacute; m&ugrave;i nồng</li>
	<li>N&ecirc;n ng&acirc;m t&aacute;o bằng nước muối v&agrave; rửa thật kỹ</li>
</ul>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (67, 'Bơ 034 1kg', 62000, 79000, 'store/images/qua-mong-nuoc/bo-034-1kg-2-4-trai-202304101547149550_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/bo-034-1kg-2-4-trai">Bơ 034</a> l&agrave; một trong những loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> thuộc h&agrave;ng ngon v&agrave; chất lượng cao nhất.&nbsp;Bơ s&aacute;p 034 cho quả to d&agrave;i, <strong>ngon nhất khi tr&aacute;i m&agrave;u xanh đậm, vỏ hơi sần, nhiều v&acirc;n, hạt hơi lắc nhẹ</strong>. Ngo&agrave;i ăn trực tiếp bơ cũng c&oacute; thể d&ugrave;ng l&agrave;m nguy&ecirc;n liệu chế biến ra nhiều m&oacute;n ăn ngon hấp dẫn</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua bơ 034 tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Bơ s&aacute;p 034 được đảm bảo tươi, ngon, <strong>cơm d&agrave;y, dẻo </strong>v&ocirc; c&ugrave;ng hấp dẫn. Bơ giao đến cho kh&aacute;ch h&agrave;ng nguy&ecirc;n tr&aacute;i, <strong>kh&ocirc;ng bị dập, hư.</strong></li>
	<li>Bơ 034 l&agrave; loại tr&aacute;i c&acirc;y nội địa, được đảm bảo về nguồn gốc xuất xứ từ <strong>L&acirc;m Đồng, Đăk Lăk</strong>, c&acirc;n đủ khối lượng v&agrave; số lượng cho kh&aacute;ch h&agrave;ng.</li>
	<li>Đặt h&agrave;ng đảm bảo giao h&agrave;ng nhanh, đ&uacute;ng giờ.</li>
</ul>

<h3><img alt="Bơ 034 1kg (2 - 4 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/277604/bhx/bo-034-tui-900g-2-3-trai-202205111921024857.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của bơ 034</strong></h3>

<ul style="margin-left:40px">
	<li>Bơ 034 ngon, dẻo, b&ugrave;i v&ocirc; c&ugrave;ng, lại c&ograve;n chứa nhiều chất dinh dưỡng như <strong>vitamin C, vitamin E, vitamin K, vitamin B6</strong>,... c&ugrave;ng c&aacute;c dưỡng chất kh&aacute;c như <strong>chất xơ, kho&aacute;ng chất kali, omega 3,...</strong></li>
	<li>Trong 100g bơ 034 c&oacute; lượng calo khoảng <strong>160kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của bơ 034 đối với sức khỏe</strong></h3>
L&agrave; loại tr&aacute;i c&acirc;y chứa nhiều chất dinh dưỡng, bơ 034 cũng c&oacute; nhiều t&aacute;c dụng đối với sức khỏe như tăng cường sức khỏe v&agrave; t&acirc;m trạng, tốt cho mắt, cung cấp chất xơ tốt cho hệ ti&ecirc;u h&oacute;a, giảm lượng cholesterol trong m&aacute;u,...

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ bơ 034</strong></h3>

<ul style="margin-left:40px">
	<li>L&agrave;m <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-che-bien-cac-mon-an-dam-tu-qua-bo-cho-be-1095704">m&oacute;n ăn dặm với bơ</a> cho b&eacute;.</li>
	<li>Đổi vị bữa s&aacute;ng với b&aacute;nh m&igrave; nướng sốt bơ v&agrave; sa tế t&ocirc;m.</li>
	<li>Đầy đủ dưỡng chất với <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-salad-bo-ca-hoi-mon-an-ngon-trong-mua-bo-nam-nay-1253974">salad bơ c&aacute; hồi</a>.</li>
	<li>Salad bơ thơm ngon, th&iacute;ch hợp cho người giảm c&acirc;n</li>
</ul>

<h3><strong>C&aacute;c thức uống dinh dưỡng từ bơ 034</strong></h3>
Những thức uống từ bơ m&agrave; bạn c&oacute; thể dễ d&agrave;ng chế biến như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dang-xinh-da-dep-voi-sinh-to-bo-thom-ngon-1162314">sinh tố bơ</a>, kem bơ, tr&agrave; sữa bơ,...rất hấp dẫn<br />
<img alt="Bơ 034 1kg (2 - 4 trái) 1" class="lazy" src="https://cdn.tgdd.vn/2020/08/CookRecipe/Avatar/salad-bo-voi-xoai-hoac-tao-thumbnail.jpg" />
<h3><strong>C&aacute;ch bảo quản bơ 034 tươi ngon</strong></h3>
Để <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bo-034-la-bo-gi-cach-chon-va-bao-quan-bo-034-ngon-1254508">bảo quản bơ 034</a> được tươi ngon, chất lượng như bơ ch&iacute;n tự nhi&ecirc;n, bạn c&oacute; thể qu&eacute;t một lớp chanh l&ecirc;n tr&ecirc;n bề mặt, đ&oacute;ng t&uacute;i zip hoặc ch&acirc;n kh&ocirc;ng v&agrave; cho v&agrave;o ngăn đ&ocirc;ng của tủ lạnh. L&agrave;m như vậy sẽ gi&uacute;p giữ được hương vị thơm ngon, b&eacute;o của bơ.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (68, 'Xoài cát chu 1kg', 24000, 30000, 'store/images/qua-mong-nuoc/xoai-cat-chu-hop-1kg-2-3-trai-giao-ngau-nhien-song-hoac-chin-202301311127449985_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Xo&agrave;i c&aacute;t chu với hương thơm nồng n&agrave;n quyến rũ, l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> c&oacute; vị ngọt đậm đ&agrave; hấp dẫn kh&oacute; chối từ.&nbsp;<a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/xoai-cat-chu-tui-1kg-2-4-trai">Xo&agrave;i c&aacute;t chu</a>&nbsp;<strong>ngọt nhất khi ch&iacute;n v&agrave;ng, ấn nhẹ tay mềm nhưng chắc. </strong>Xo&agrave;i chứa&nbsp;vitamin dồi d&agrave;o cung cấp năng lượng, tăng cường đề kh&aacute;ng cho cơ thể khỏe mạnh.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua xo&agrave;i c&aacute;t chu tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i c&aacute;t chu tươi ngon, chất lượng, tr&aacute;i to, da trơn. Xo&agrave;i thoảng m&ugrave;i hương thơm nồng n&agrave;n, nhẹ, khi ăn cảm nhận được vị ngọt thanh rất đậm đ&agrave;. <strong>Xo&agrave;i c&aacute;t chu thường được ăn khi ch&iacute;n</strong> - khi tr&aacute;i chuyển m&agrave;u v&agrave;ng tươi c&oacute; m&ugrave;i thơm đặc trưng. Khi c&ograve;n sống, xo&agrave;i c&aacute;t chu ăn kh&aacute; chua nhưng khi ch&iacute;n&nbsp;thịt lại mềm thơm, &iacute;t xơ, vị ngọt đậm v&agrave; hương thơm đặc trưng<br />
	Xo&agrave;i được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, kh&ocirc;ng bị dập, b&aacute;n hộp 1kg chất lượng, gi&uacute;p bảo quản tiện lợi v&agrave; tinh tế hơn.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Xoài cát chu 1kg (2-3 trái) (Giao ngẫu nhiên sống hoặc chín) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/270311/bhx/xoai-cat-chu-tui-1kg-2-3-trai-202203232155028853.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của xo&agrave;i c&aacute;t chu</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i c&oacute; t&aacute;c dụng v&agrave;ng cho cơ thể c&oacute; thể kế đến như chứa h&agrave;m lượng dinh dưỡng v&agrave; vitamin dồi d&agrave;o như l&agrave;: vitamin A,vitamin B, vitamin C, vitamin K v&agrave; chứa h&agrave;m lượng sắt, canxi, đồng,... cần thiết cho cơ thể hoạt động.</p>
	</li>
	<li>
	<p>Trong 100g xo&agrave;i c&aacute;t chu c&oacute; khoảng <strong>60 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của xo&agrave;i c&aacute;t chu đối với sức khỏe</strong></h3>

<p>Kh&ocirc;ng những thế, lượng oxy ho&aacute; c&oacute; trong xo&agrave;i c&ograve;n gi&uacute;p tăng sức đề kh&aacute;ng, gi&uacute;p cơ thể khoẻ mạnh hơn. Xo&agrave;i c&ograve;n gi&uacute;p ti&ecirc;u h&oacute;a tốt hơn, đẹp da v&agrave; tốt cho cơ thể. Xo&agrave;i c&aacute;t chu c&ograve;n gi&uacute;p bổ sung dưỡng chất, tăng cường sức đề kh&aacute;ng cho cơ thể.</p>

<h3><strong>C&aacute;ch chọn xo&agrave;i c&aacute;t chu tươi ngon</strong></h3>

<p>Khi lựa xo&agrave;i, bạn c&oacute; thể kiểm tra qua độ mềm của xo&agrave;i. Nhấn nhẹ tay v&agrave;o xo&agrave;i, nếu thấy c&oacute; độ chắc d&ugrave; xo&agrave;i đ&atilde; ch&iacute;n, th&igrave; đ&oacute; l&agrave; xo&agrave;i ngon, c&ograve;n nếu mềm, nhũn th&igrave; đ&oacute; l&agrave; xo&agrave;i ch&iacute;n &eacute;p hoặc bị &uacute;ng. N&ecirc;n chọn những quả xo&agrave;i c&oacute; cuống cứng, da trơn kh&ocirc;ng bị n&aacute;m hoặc s&acirc;u. Cũng kh&ocirc;ng n&ecirc;n chọn những quả xo&agrave;i ch&iacute;n qu&aacute; ăn sẽ kh&ocirc;ng ngon.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ xo&agrave;i c&aacute;t chu</strong></h3>

<p>Khi mua về th&igrave; bạn c&oacute; thể gọt vỏ v&agrave; ăn ngay hoặc chế biến th&agrave;nh một số m&oacute;n ngon kh&aacute;c như: , xo&agrave;i dầm sữa chua, ch&egrave; xo&agrave;i bột b&aacute;ng, panna cotta xo&agrave;i, sinh tố xo&agrave;i, ch&egrave; xo&agrave;i Singapore,...</p>

<h3><strong>C&aacute;ch bảo quản xo&agrave;i c&aacute;t chu tươi ngon</strong></h3>

<p>Bạn n&ecirc;n bảo quản xo&agrave;i c&aacute;t chu trong tủ lạnh để trong bao nilon hoặc hộp đựng thực phẩm để gi&uacute;p xo&agrave;i được tươi v&agrave; ngọt l&acirc;u hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (69, 'Mâm trái cây cúng Lê + Táo + Quýt', 180000, 199000, 'store/images/qua-mong-nuoc/combo-le-duong-tao-gala-quyt-giong-uc-202305031059030502_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/combo-trai-cay-3">Combo l&ecirc; đường, t&aacute;o gala v&agrave; qu&yacute;t giống &Uacute;c</a> tươi ngon, chất lượng, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">Tr&aacute;i c&acirc;y</a> th&iacute;ch hợp để l&agrave;m qu&agrave; biếu cho bạn b&egrave;, người th&acirc;n hoặc d&ugrave;ng để chưng trong c&aacute;c dịp lễ.</div>

<ul style="margin-left:40px">
	<li>Combo gồm
	<div>L&ecirc; đường 1kg, t&aacute;o gala nhập khẩu 1kg v&agrave; qu&yacute;t giống &Uacute;c 1kg</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (70, 'Mâm trái cây cúng Bưởi + Xoài + Quýt', 128000, 153000, 'store/images/qua-mong-nuoc/combo-buoi-duong-la-cam-xoai-cat-chu-quyt-giong-uc-202305031057304155_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/combo-trai-cay-1">Combo xo&agrave;i c&aacute;t chu, qu&yacute;t giống &Uacute;c v&agrave; bưởi đường l&aacute; cam</a> tươi ngon với nhiều loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> đa dạng, tươi ngon, th&iacute;ch hợp để l&agrave;m qu&agrave; tặng hoặc chưng, c&uacute;ng trong c&aacute;c dịp lễ lớn. C&aacute;c loại tr&aacute;i c&acirc;y đều thơm ngon, chất lượng.</div>

<ul style="margin-left:40px">
	<li>Combo gồm
	<div>Bưởi đường l&aacute; cam tr&aacute;i 0.9kg - 1.1kg, xo&agrave;i c&aacute;t chu 1kg, qu&yacute;t giống &Uacute;c 1kg</div>
	</li>
</ul>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (71, 'Chuối già giống Nam Mỹ 1kg', 34000, 0, 'store/images/qua-mong-nuoc/chuoi-gia-giong-nam-my-hop-1kg-6-7-trai-202212021514114455_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/chuoi-gia-giong-nam-my-tui-1kg">chuối gi&agrave;</a> được nhiều kh&aacute;ch h&agrave;ng ưa chuộng.&nbsp;Chuối chứa nhiều chất dinh dưỡng như kali, chất xơ, vitamin,... <strong>Chuối ăn ngon nhất khi ch&iacute;n v&agrave;ng, tr&ecirc;n vỏ bắt đầu c&oacute; đốm n&acirc;u, khi đ&oacute; chuối sẽ rất ngọt</strong>...Cam kết đ&uacute;ng khối lượng, bao b&igrave; k&iacute;n đ&aacute;o, an to&agrave;n v&agrave; bảo đảm hợp vệ sinh.</div>

<div class="description nospeci">
<h3><img class="lazy" src="//cdn.tgdd.vn/Products/Images//8788/272140/bhx/files/image.png" style="height:678px; width:468px" /><br />
<strong>Ưu điểm khi mua chuối gi&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Chuối gi&agrave; Nam Mỹ l&agrave; giống chuối cấy m&ocirc;, <strong>c&oacute; nguồn gốc từ Nam Mỹ </strong>n&ecirc;n c&oacute; chất lượng tốt v&agrave; hương vị ngon, ngọt hơn hẳn so với c&aacute;c sản phẩm chuối kh&aacute;c. Chuối gi&agrave; to tr&aacute;i, mướt, ngon v&agrave; chất lượng. Chuối kh&ocirc;ng bị dập khi giao</li>
	<li>Chuối được đảm bảo nguồn gốc r&otilde; r&agrave;ng, giao th&ugrave;ng giấy&nbsp;<strong>1kg từ 6-7 tr&aacute;i</strong>, được đ&oacute;ng th&ugrave;ng giấy&nbsp;bảo quản chuối tốt hơn lại tinh tế v&agrave; sang trọng hơn</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Chuối già giống Nam Mỹ 1kg (6-7 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/272140/bhx/chuoi-gia-giong-nam-my-hop-1kg-6-7-trai-202212021509521853.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của chuối gi&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>Chuối chứa nhiều chất dinh dưỡng như kali, chất xơ, vitamin,... n&ecirc;n chuối c&oacute; t&aacute;c dụng tốt cho sức khoẻ như: hỗ trợ giảm c&acirc;n, hỗ trợ sức khỏe tim mạch, cải thiện sức khỏe của thận,...</li>
	<li>Trong 100gr chuối gi&agrave; c&oacute; khoảng <strong>88 Kcal</strong></li>
</ul>

<h3 style="text-align:center"><img alt="Chuối già giống Nam Mỹ 1kg (6-7 trái) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/272140/bhx/chuoi-gia-giong-nam-my-hop-1kg-6-7-trai-202212021509528386.jpg" /></h3>

<h3><strong>T&aacute;c dụng của chuối gi&agrave; đối với sức khỏe</strong></h3>
Ăn chuối trước khi ngủ sẽ mang đến những lợi &iacute;ch v&ocirc; c&ugrave;ng tốt cho sức khoẻ, chẳng hạn như:

<ul style="margin-left:40px">
	<li>Dễ d&agrave;ng v&agrave;o giấc ngủ hơn</li>
	<li>Kiểm so&aacute;t axit dạ d&agrave;y</li>
	<li>Kiềm chế cơn th&egrave;m ngọt</li>
	<li>Tăng cường chất xơ</li>
	<li>B&ecirc;n cạnh đ&oacute;, vỏ chuối c&ograve;n c&oacute; nhiều c&ocirc;ng dụng l&agrave;m đẹp được nhiều chị em phụ nữ &aacute;p dụng</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ chuối gi&agrave;</strong></h3>
Ngo&agrave;i những lợi &iacute;ch tr&ecirc;n chuối c&ograve;n được d&ugrave;ng để chế biến th&agrave;nh nhiều m&oacute;n ăn hấp dẫn kh&aacute;c nhau như: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tu-lam-banh-chuoi-hap-nham-nhi-ngay-cuoi-tuan-1153549">b&aacute;nh chuối</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-che-chuoi-bot-bang-ngon-mieng-998601">ch&egrave; chuối</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mon-banh-nam-nhan-chuoi-ngon-khong-tuong-1116359">b&aacute;nh nậm nh&acirc;n chuối</a>,...

<h3><strong>C&aacute;ch bảo quản chuối gi&agrave; tươi ngon</strong></h3>
Chuối mua về bảo quản trong ngăn m&aacute;t tủ lạnh để giữ được chuối tươi ngon hơn.&nbsp;<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (72, 'Chuối già giống Nam Mỹ thùng 5kg', 99000, 170000, 'store/images/qua-mong-nuoc/chuoi-gia-giong-nam-my-thung-5kg-202303150845458540_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Loại chuối gi&agrave; được nhiều kh&aacute;ch h&agrave;ng ưa chuộng.&nbsp;Chuối chứa nhiều chất dinh dưỡng như kali, chất xơ, vitamin,... <strong>Chuối ăn ngon nhất khi ch&iacute;n v&agrave;ng, tr&ecirc;n vỏ bắt đầu c&oacute; đốm n&acirc;u, khi đ&oacute; chuối sẽ rất ngọt</strong>...Cam kết đ&uacute;ng khối lượng, bao b&igrave; k&iacute;n đ&aacute;o, an to&agrave;n v&agrave; bảo đảm hợp vệ sinh.</div>

<div class="description nospeci">
<h3><img class="lazy" src="//cdn.tgdd.vn/Products/Images//8788/303827/bhx/files/image.png" style="height:678px; width:468px" /><br />
<strong>Ưu điểm khi mua chuối gi&agrave; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Chuối gi&agrave; Nam Mỹ l&agrave; giống chuối cấy m&ocirc;, <strong>c&oacute; nguồn gốc từ Nam Mỹ </strong>n&ecirc;n c&oacute; chất lượng tốt v&agrave; hương vị ngon, ngọt hơn hẳn so với c&aacute;c sản phẩm chuối kh&aacute;c. Chuối gi&agrave; to tr&aacute;i, mướt, ngon v&agrave; chất lượng. Chuối kh&ocirc;ng bị dập khi giao</li>
	<li>Chuối được đảm bảo nguồn gốc r&otilde; r&agrave;ng, giao th&ugrave;ng giấy&nbsp;<strong>1kg từ 6-7 tr&aacute;i</strong>, được đ&oacute;ng th&ugrave;ng giấy&nbsp;bảo quản chuối tốt hơn lại tinh tế v&agrave; sang trọng hơn</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/303827/bhx/chuoi-gia-giong-nam-my-thung-5kg-202303150845302130.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của chuối gi&agrave;</strong></h3>

<ul style="margin-left:40px">
	<li>Chuối chứa nhiều chất dinh dưỡng như kali, chất xơ, vitamin,... n&ecirc;n chuối c&oacute; t&aacute;c dụng tốt cho sức khoẻ như: hỗ trợ giảm c&acirc;n, hỗ trợ sức khỏe tim mạch, cải thiện sức khỏe của thận,...</li>
	<li>Trong 100gr chuối gi&agrave; c&oacute; khoảng <strong>88 Kcal</strong></li>
</ul>

<h3><img alt="Chuối già giống Nam Mỹ thùng 5kg 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/272140/bhx/chuoi-gia-giong-nam-my-hop-1kg-6-7-trai-202212021509528386.jpg" /></h3>

<h3><strong>T&aacute;c dụng của chuối gi&agrave; đối với sức khỏe</strong></h3>
Ăn chuối trước khi ngủ sẽ mang đến những lợi &iacute;ch v&ocirc; c&ugrave;ng tốt cho sức khoẻ, chẳng hạn như:

<ul style="margin-left:40px">
	<li>Dễ d&agrave;ng v&agrave;o giấc ngủ hơn</li>
	<li>Kiểm so&aacute;t axit dạ d&agrave;y</li>
	<li>Kiềm chế cơn th&egrave;m ngọt</li>
	<li>Tăng cường chất xơ</li>
	<li>B&ecirc;n cạnh đ&oacute;, vỏ chuối c&ograve;n c&oacute; nhiều c&ocirc;ng dụng l&agrave;m đẹp được nhiều chị em phụ nữ &aacute;p dụng</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ chuối gi&agrave;</strong></h3>
Ngo&agrave;i những lợi &iacute;ch tr&ecirc;n chuối c&ograve;n được d&ugrave;ng để chế biến th&agrave;nh nhiều m&oacute;n ăn hấp dẫn kh&aacute;c nhau như: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tu-lam-banh-chuoi-hap-nham-nhi-ngay-cuoi-tuan-1153549">b&aacute;nh chuối</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-che-chuoi-bot-bang-ngon-mieng-998601">ch&egrave; chuối</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mon-banh-nam-nhan-chuoi-ngon-khong-tuong-1116359">b&aacute;nh nậm nh&acirc;n chuối</a>,...

<h3><strong>C&aacute;ch bảo quản chuối gi&agrave; tươi ngon</strong></h3>
Chuối mua về bảo quản trong ngăn m&aacute;t tủ lạnh để giữ được chuối tươi ngon hơn.&nbsp;<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (73, 'Chuối cau nải 800g trở lê', 25000, 0, 'store/images/qua-mong-nuoc/chuoi-cau-nai-tu-1kg-tro-len-giao-ngau-nhien-song-hoac-chin-202301311043290407_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Chuối cau l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> th&acirc;n thuộc, được trồng nhiều tại Việt Nam. Tr&aacute;i nhỏ, tr&ograve;n khi ch&iacute;n c&oacute; m&agrave;u v&agrave;ng ươm đẹp mắt, hương thơm nhẹ đặc trưng, vị ngọi thanh. <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/chuoi-cau-1-nai">Chuối cau</a>&nbsp;chứa nhiều chất xơ, vitamin, kho&aacute;ng chất v&agrave; &iacute;t tinh bột c&oacute; t&aacute;c dụng l&agrave;m đẹp da, chống l&atilde;o h&oacute;a, tốt cho tim mạch, đường huyết, giảm c&acirc;n</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua chuối cau tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Chuối cau,&nbsp;chất lượng, tươi ngon, tr&aacute;i nhỏ. Chuối khi ch&iacute;n&nbsp;<strong>ngọt, thơm</strong>, tr&aacute;i nhỏ gi&uacute;p bạn kh&ocirc;ng bị ng&aacute;n khi ăn.</li>
	<li>Đảm bảo nguồn gốc xuất xứ (Miền T&acirc;y: Hậu Giang, Tiền Giang, Cần Thơ, S&oacute;c Trăng,...Miền Đ&ocirc;ng:&nbsp;Đồng Nai, B&igrave;nh Dương, c&aacute;c tỉnh T&acirc;y Nguy&ecirc;n), <strong>mỗi nải chuối c&oacute; khối lượng tr&ecirc;n 800g.</strong></li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của chuối cau</strong></h3>

<ul style="margin-left:40px">
	<li>Gi&aacute; trị dinh dưỡng của chuối cau đem đến nhiều lợi &iacute;ch cho sức khỏe, chứa nhiều chất xơ, vitamin, kho&aacute;ng chất v&agrave; một ch&uacute;t tinh bột.</li>
	<li>Trong 100g chuối cau c&oacute; chứa khoảng <strong>88 kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của chuối cau đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Chuối gi&uacute;p cải thiện tr&iacute; nhớ v&agrave; tinh thần</li>
	<li>Hỗ trợ giảm c&acirc;n hiệu quả</li>
	<li>Giảm lượng đường trong m&aacute;u</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ chuối cau</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mon-banh-nam-nhan-chuoi-ngon-khong-tuong-1116359">B&aacute;nh nậm nh&acirc;n chuối</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/chuoi-dung-khong-het-thi-hay-lam-ngay-mon-banh-mi-chuoi-an-sang-cuc-ngon-va-bo-duong-1269731">B&aacute;nh m&igrave; chuối</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-che-chuoi-bot-bang-ngon-mieng-998601">Ch&egrave; chuối bột b&aacute;ng</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dang-xinh-da-dep-voi-sinh-to-bo-thom-ngon-1162314">Sinh tố bơ chuối</a> cực ngon</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-banh-chuoi-nuong-nuoc-cot-dua-beo-ngon-ngot-1012540">B&aacute;nh chuối nướng nước dừa</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-kem-chuoi-don-gian-cuc-ngon-tai-nha-988750">Kem chuối</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-sua-chuoi-khien-bao-nhieu-sao-han-me-man-1146416">Sữa chuối&nbsp;</a></li>
</ul>

<h3 style="text-align:center"><img alt="Chuối cau nải 800g trở lên (Giao ngẫu nhiên sống hoặc chín) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/270354/bhx/chuoi-cau-nai-tu-1kg-tro-len-giao-ngau-nhien-song-hoac-chin-202205111959300761.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>C&aacute;ch bảo quản chuối cau tươi ngon</strong></h3>
Chuối l&agrave; loại tr&aacute;i c&acirc;y nội địa được nhiều người ưa th&iacute;ch. Tuy nhi&ecirc;n, nếu chuối kh&ocirc;ng được bảo quản đ&uacute;ng c&aacute;ch th&igrave; sẽ rất nhanh hỏng. B&aacute;ch h&oacute;a XANH chỉ bạn <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meo-giu-chuoi-chin-lau-1095181">mẹo giữ chuối ch&iacute;n được l&acirc;u</a> ng&agrave;y nh&eacute;.

<ul style="margin-left:40px">
	<li>Bảo quản chuối ở nhiệt độ ph&ograve;ng đến khi ch&iacute;n</li>
	<li>Treo chuối tr&ecirc;n m&oacute;c</li>
	<li>Kh&ocirc;ng để chuối c&ugrave;ng c&aacute;c rau quả kh&aacute;c</li>
	<li>Để chuối trong tủ lạnh sau khi ch&iacute;n</li>
	<li>Phết nước chanh l&ecirc;n chuối</li>
</ul>
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</div>
</div>', 'trai-cay-hat', 1, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (74, 'Xoài tươi gọt sẵn 350g', 29000, 0, 'store/images/qua-mong-nuoc/xoai-tuoi-got-san-350g-202303181625025859_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/xoai-tuoi-got-san-350g">Xo&agrave;i cắt sẵn</a> tiện lợi, gi&ograve;n, thơm ngon, tiết kiệm thời gian. Xo&agrave;i cắt sẵn tươi ngon, bắt vị, th&iacute;ch hợp mang đi chơi, d&atilde; ngoại, picnic,... Xo&agrave;i l&agrave; một loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> được nhiều người y&ecirc;u th&iacute;ch, chứa nhiều dưỡng chất</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua xo&agrave;i cắt sẵn tại B&aacute;ch h&oacute;a XANH&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i cắt sẵn tại B&aacute;ch h&oacute;a XANH lu&ocirc;n tươi ngon, mọng nước gi&ograve;n m&agrave; kh&ocirc;ng bị mềm. Xo&agrave;i cắt sẵn v&ocirc; c&ugrave;ng tiện lợi, tiết kiệm thời gian</p>
	</li>
	<li>
	<p>Xo&agrave;i cắt sẵn c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng v&agrave; đảm bảo vệ sinh trong qu&aacute; tr&igrave;nh cắt, gọt</p>
	</li>
	<li>
	<p>Giao h&agrave;ng nhanh ch&oacute;ng, tận nơi</p>
	</li>
	<li>
	<p>Gi&aacute; cả hợp l&yacute;</p>
	</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng c&oacute; trong xo&agrave;i</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Trong xo&agrave;i c&oacute; chứa c&aacute;c th&agrave;nh phần dinh dưỡng như sau: Chất xơ, Vitamin A, C, E,.. kho&aacute;ng chất như Kali, đồng&nbsp; v&agrave; chất chống oxy h&oacute;a tốt cho sức khỏe.</p>
	</li>
	<li>
	<p>Theo&nbsp;c&aacute;c chuy&ecirc;n gia trong 100g xo&agrave;i c&oacute; chứa khoảng 60kcal</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của xo&agrave;i đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Tăng cường sức đề kh&aacute;ng</p>
	</li>
	<li>
	<p>Tốt cho hệ ti&ecirc;u h&oacute;a</p>
	</li>
	<li>
	<p>L&agrave;m đẹp da</p>
	</li>
	<li>
	<p>Chứa c&aacute;c chất chống oxy h&oacute;a ngăn ngừa ung thư</p>
	</li>
	<li>
	<p>Tốt cho mắt</p>
	</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ngon từ xo&agrave;i cắt sẵn</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i chấm muối ớt</p>
	</li>
	<li>
	<p>Gỏi xo&agrave;i</p>
	</li>
	<li>
	<p>Xo&agrave;i lắc</p>
	</li>
	<li>
	<p>Xo&agrave;i sốt th&aacute;i</p>
	</li>
	<li>
	<p>Ch&egrave; xo&agrave;i</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản xo&agrave;i cắt</strong></h3>

<p>Sau khi mua xo&agrave;i về bạn n&ecirc;n để xo&agrave;i ở ngăn m&aacute;t tủ lạnh để giữ được độ tươi ngon, mọng nước từ xo&agrave;i.<br />
<br />
<strong>Lưu &yacute;:</strong>&nbsp;Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượn</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (75, 'Xoài cát Hoà Lộc 1kg', 54000, 0, 'store/images/qua-mong-nuoc/xoai-cat-hoa-loc-tui-1kg-1-3-trai-202212271258134975_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Xo&agrave;i c&aacute;t Ho&agrave; Lộc l&agrave; loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> gi&agrave;u chất xơ, vitamin, kho&aacute;ng chất. <strong>Xo&agrave;i mua về n&ecirc;n để ăn ch&iacute;n sẽ c&oacute; vị ngọt đậm đ&agrave;</strong>, xo&agrave;i cũng mang lại nhiều lợi &iacute;ch tuyệt vời cho hệ ti&ecirc;u h&oacute;a, tim mạch, gi&uacute;p mắt s&aacute;ng, l&agrave;m đẹp da.&nbsp;<a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/xoai-cat-hoa-loc-tui-1kg-1-3-trai">Xo&agrave;i c&aacute;t H&ograve;a Lộc</a> c&oacute; vị ngọt thanh dễ chịu, thịt d&agrave;y, &iacute;t xơ.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua xo&agrave;i c&aacute;t Ho&agrave; Lộc tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i tươi ngon, chất lượng, kh&ocirc;ng bị dập, &uacute;ng. <strong>Xo&agrave;i c&aacute;t H&ograve;a Lộc thường được ăn ch&iacute;n </strong>- khi tr&aacute;i chuyển m&agrave;u v&agrave;ng tươi, c&oacute; m&ugrave;i thơm nhẹ. Khi xo&agrave;i ch&iacute;n, m&ugrave;i vị thơm ngon, kh&ocirc;ng c&oacute; xơ, thịt xo&agrave;i rất chắc , vị ngọt đậm đ&agrave;.</p>
	</li>
	<li>
	<p>Xo&agrave;i c&aacute;t H&ograve;a Lộc được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng. Đ&oacute;ng g&oacute;i cẩn thận cho người d&ugrave;ng.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Xoài cát Hoà Lộc 1kg (1 - 3 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/270312/bhx/xoai-cat-hoa-loc-tui-1kg-1-3-trai-202211081635079817.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của xo&agrave;i c&aacute;t Ho&agrave; Lộc</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Trong xo&agrave;i c&aacute;t H&ograve;a Lộc chứa nhiều vitamin nh&oacute;m B như vitamin B6, vitamin B12, vitamin A, vitamin C,... c&aacute;c kho&aacute;ng chất như magie, canxi, sắt, kẽm,... v&agrave; nhiều dưỡng chất kh&aacute;c.</p>
	</li>
	<li>
	<p>Trong 100g xo&agrave;i c&aacute;t c&oacute; khoảng<strong> 60 Kcal.</strong></p>
	</li>
</ul>

<h3><img alt="Xoài cát Hoà Lộc 1kg (1 - 3 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/270312/bhx/xoai-cat-hoa-loc-tui-1kg-1-3-trai-202211081635088606.jpg" /><br />
<strong>T&aacute;c dụng của xo&agrave;i c&aacute;t Ho&agrave; Lộc đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Gi&uacute;p cho qu&aacute; tr&igrave;nh ti&ecirc;u h&oacute;a dễ d&agrave;ng hơn</p>
	</li>
	<li>
	<p>Hỗ trợ ngăn ngừa t&aacute;o b&oacute;n</p>
	</li>
	<li>
	<p>Gi&uacute;p tăng sức đề kh&aacute;ng cho cơ thể</p>
	</li>
	<li>
	<p>Tăng cường miễn dịch</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch chọn xo&agrave;i c&aacute;t Ho&agrave; Lộc tươi ngon</strong></h3>

<p>Để chọn được những tr&aacute;i xo&agrave;i ngon, hấp dẫn, bạn n&ecirc;n chọn những quả xo&agrave;i c&oacute; lớp vỏ s&aacute;ng, b&oacute;ng, tươi ngon, cuống c&ograve;n tươi, khi cầm thấy chắc tay.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ xo&agrave;i c&aacute;t H&ograve;a Lộc</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i lắc muối t&ocirc;m t&acirc;y ninh</p>
	</li>
	<li>
	<p>Xo&agrave;i chấm mắm ruốc</p>
	</li>
	<li>
	<p>Kem xo&agrave;i</p>
	</li>
	<li>
	<p>Tr&agrave; xo&agrave;i</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản xo&agrave;i c&aacute;t Ho&agrave; Lộc tươi ngon</strong></h3>

<p>Bạn c&oacute; thể bảo quản xo&agrave;i nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, hoặc bảo quản trong tủ lạnh để gi&uacute;p xo&agrave;i được tươi ngon l&acirc;u hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (76, 'Xoài Đài Loan trái từ 600g', 9000, 0, 'store/images/qua-mong-nuoc/xoai-dai-loan-trai-tu-600g-202301090852104466_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Nguồn gốc nhập khẩu, chất lượng, uy t&iacute;n. Xo&agrave;i Đ&agrave;i Loan b&aacute;n tại B&aacute;ch H&oacute;a XANH c&oacute; ngoại h&igrave;nh đẹp, b&oacute;ng bẩy, thịt quả chứa nhiều vitamin. <strong>Xo&agrave;i Đ&agrave;i Loan ngon khi ch&iacute;n m&agrave;u hồng đỏ, mềm nhưng kh&ocirc;ng nhũn</strong>. Cam kết đ&uacute;ng khối lượng v&agrave; chất lượng, bao b&igrave; k&iacute;n đ&aacute;o hợp vệ sinh</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua xo&agrave;i Đ&agrave;i Loan tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Xo&agrave;i Đ&agrave;i Loan xanh l&agrave; giống xo&agrave;i c&oacute; <strong>nguồn gốc từ Đ&agrave;i Loan</strong>, kể từ khi du nhập v&agrave;o Việt Nam, loại tr&aacute;i c&acirc;y n&agrave;y được rất nhiều người y&ecirc;u th&iacute;ch bởi vị ngọt dịu, gi&ograve;n xốp khi ăn. <strong>Xo&agrave;i Đ&agrave;i Loan thường được ăn sống</strong>, mua về c&oacute; thể sử dụng ngay.&nbsp;Khi c&ograve;n xanh, xo&agrave;i c&oacute;&nbsp;vị chua,&nbsp;ngọt nhẹ v&agrave; gi&ograve;n. Khi ch&iacute;n&nbsp;xo&agrave;i sẽ ngọt đậm.</li>
	<li>Xo&agrave;i đảm bảo tươi ngon, kh&ocirc;ng bị dập</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Xoài Đài Loan trái 600g trở lên 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/275291/bhx/xoai-dai-loan-tui-15kg-2-trai-202211041017282162.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của xo&agrave;i Đ&agrave;i Loan</strong></h3>

<ul style="margin-left:40px">
	<li>Xo&agrave;i c&oacute; t&aacute;c dụng v&agrave;ng cho cơ thể c&oacute; thể kế đến như chứa h&agrave;m lượng dinh dưỡng v&agrave; vitamin dồi d&agrave;o như: Kali, Carbohydrate, chất xơ, Đường, Protein, Vitamin A, Canxi, Sắt, Vitamin B1, Vitamin B6, Magie,...</li>
	<li>Trong 100g xo&agrave;i Đ&agrave;i Loan c&oacute; khoảng <strong>59 Kcal</strong></li>
</ul>

<h3><img alt="Xoài Đài Loan trái 600g trở lên 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/275291/bhx/xoai-dai-loan-tui-15kg-2-trai-202211041017287020.jpg" /></h3>

<h3><strong>T&aacute;c dụng của xo&agrave;i Đ&agrave;i Loan đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Xo&agrave;i c&oacute; chứa nhiều chất xơ, tốt cho hệ ti&ecirc;u h&oacute;a của ch&uacute;ng ta.</li>
	<li>Xo&agrave;i c&ograve;n chứa c&aacute;c vitamin gi&uacute;p cơ thể ph&ograve;ng ngừa v&agrave; chống lại bệnh tim</li>
	<li>C&aacute;c enzyme c&oacute; trong Xo&agrave;i d&ugrave;ng chữa kiết ly hay ngăn ngừa nhiễm tr&ugrave;ng đường tiết niệu</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ xo&agrave;i Đ&agrave;i Loan</strong></h3>
Khi mua về th&igrave; bạn c&oacute; thể gọt vỏ v&agrave; ăn ngay hoặc chế biến th&agrave;nh một số m&oacute;n ngon kh&aacute;c như: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-xoai-dam-sua-chua-mat-lanh-1029785">xo&agrave;i dầm sữa chua</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-panna-cotta-xoai-thom-ngon-mat-lanh-1089514">panna cotta xo&agrave;i</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nuoc-ep-xoai-co-tac-dung-gi-cho-be-va-cach-che-bien-1002175">nước &eacute;p xo&agrave;i</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-che-xoai-bot-bang-cuc-beo-va-thom-ngon-1138754">ch&egrave; xo&agrave;i bột b&aacute;ng</a>,...

<h3><strong>C&aacute;ch bảo quản xo&agrave;i Đ&agrave;i Loan tươi ngon</strong></h3>
Xo&agrave;i mua về rửa sạch, lau kh&ocirc; nước v&agrave; cho v&agrave;o t&uacute;i nilon hoặc hộp đựng thực phẩm, bảo quản trong ngăn m&aacute;t tủ lạnh.&nbsp;<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (77, 'Xoài Úc trái từ 600g', 27000, 0, 'store/images/qua-mong-nuoc/xoai-uc-trai-tu-600g-202301090858130921_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Xo&agrave;i &Uacute;c l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> c&oacute; nguồn gốc nhập khẩu chất lượng cao.&nbsp;Xo&agrave;i &Uacute;c l&agrave; loại tr&aacute;i c&acirc;y phổ biến v&agrave; được ưa chuộng tại Việt Nam với vị thanh ngọt v&agrave; ng&aacute;t hương thơm dễ chịu chịu hấp. Cam kết b&aacute;n đ&uacute;ng khối lượng, bao b&igrave; sạch sẽ, an to&agrave;n.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua xo&agrave;i &Uacute;c tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i &Uacute;c tươi ngon, chất lượng, tr&aacute;i to.<strong> Xo&agrave;i &Uacute;c thường được ăn khi sống hoặc khi vừa ch&iacute;n tới</strong>. Tr&aacute;i ch&iacute;n chuyển m&agrave;u v&agrave;ng hoặc điểm đỏ s&aacute;ng, m&ugrave;i rất thơm, tr&aacute;i bắt đầu mềm. Xo&agrave;i khi ăn sống c&oacute; vị chua, ngọt nhẹ pha lẫn. Xo&agrave;i khi ch&iacute;n c&oacute; vị ngọt nhẹ, m&ugrave;i hương rất thơm.</p>
	</li>
	<li>
	<p>Xo&agrave;i được đảm bảo xuất xứ, nguồn gốc, đ&oacute;ng g&oacute;i cẩn thận.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Xoài Úc trái 600g trở lên 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/274393/bhx/xoai-uc-tui-12kg-1-2-trai-202211071653234007.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của xo&agrave;i &Uacute;c</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Trong xo&agrave;i &Uacute;c chứa nhiều dưỡng chất như vitamin A, vitamin C, vitamin K, vitamin B1, c&aacute;c kho&aacute;ng chất như sắt, kẽm, đồng, mangan,...</p>
	</li>
	<li>
	<p>Trong 100g xo&agrave;i &Uacute;c c&oacute; khoảng <strong>59 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của xo&agrave;i &Uacute;c đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i gi&uacute;p l&agrave;m s&aacute;ng mắt, tốt cho mắt</p>
	</li>
	<li>
	<p>Hỗ trợ tốt cho hệ ti&ecirc;u h&oacute;a</p>
	</li>
	<li>
	<p>Gi&uacute;p cung cấp dưỡng chất cho cơ thể</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch chọn xo&agrave;i &Uacute;c tươi ngon</strong></h3>

<p>Để chọn được những tr&aacute;i xo&agrave;i &Uacute;c chất lượng, thơm ngon, n&ecirc;n chọn những tr&aacute;i da căng, mịn, kh&ocirc;ng bị sần s&ugrave;i. Chọn xo&agrave;i c&ograve;n cuống tươi v&agrave; gắn tr&ecirc;n quả.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ xo&agrave;i &Uacute;c</strong></h3>

<p>Ngo&agrave;i ra, xo&agrave;i c&oacute; thể chế biến th&agrave;nh một số m&oacute;n ngon kh&aacute;c như: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-xoai-dam-sua-chua-mat-lanh-1029785">xo&agrave;i dầm sữa chua</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-panna-cotta-xoai-thom-ngon-mat-lanh-1089514">panna cotta xo&agrave;i</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nuoc-ep-xoai-co-tac-dung-gi-cho-be-va-cach-che-bien-1002175">nước &eacute;p xo&agrave;i</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-che-xoai-bot-bang-cuc-beo-va-thom-ngon-1138754">ch&egrave; xo&agrave;i bột b&aacute;ng</a>,...</p>

<h3><strong>C&aacute;ch bảo quản xo&agrave;i &Uacute;c tươi ngon</strong></h3>

<p>Bạn c&oacute; thể bảo quản xo&agrave;i trong m&ocirc;i trường ngo&agrave;i hoặc bảo quản trong tủ lạnh để gi&uacute;p xo&agrave;i tươi l&acirc;u v&agrave; ăn ngon hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (78, 'Cơm sầu riêng Ri 6 đông lạnh 400g', 169000, 0, 'store/images/qua-mong-nuoc/com-sau-rieng-dong-lanh-hop-400g-202209141632033984_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sầu ri&ecirc;ng l&agrave; loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> thơm ngon, vị ngọt, thơm v&agrave; b&eacute;o ngậy được rất nhiều người y&ecirc;u th&iacute;ch. <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/com-sau-rieng-dong-lanh-hop-400g">Cơm sầu ri&ecirc;ng đ&ocirc;ng lạnh hộp 400g</a> đ&oacute;ng hộp sẵn tiện lợi, m&uacute;i sầu ri&ecirc;ng to, v&agrave;ng, l&agrave; loại sầu ri&ecirc;ng Ri 6. Sầu ri&ecirc;ng đạt chuẩn, kh&ocirc;ng tồn dư kim loại, kh&ocirc;ng nhiễm khuẩn vi sinh.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua sầu ri&ecirc;ng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Sầu ri&ecirc;ng ngon, thơm, chất lượng, đ&ocirc;ng lạnh v&agrave; được đ&oacute;ng hộp h&uacute;t ch&acirc;n kh&ocirc;ng. Sầu ri&ecirc;ng thơm, b&eacute;o v&agrave; ngọt b&ugrave;i.</p>
	</li>
	<li>
	<p>Sầu ri&ecirc;ng được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&uacute;ng khối lượng.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Cơm sầu riêng Ri 6 đông lạnh 400g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/290852/bhx/com-sau-rieng-dong-lanh-hop-400g-202209141632235326.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của sầu ri&ecirc;ng</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Sầu ri&ecirc;ng l&agrave; loại tr&aacute;i c&acirc;y chứa nhiều vitamin như vitamin A, vitamin B, vitamin C, chất b&eacute;o, chất xơ, sắt, đồng, kẽm v&agrave; nhiều dưỡng chất kh&aacute;c.</p>
	</li>
	<li>
	<p>Trong 100g sầu ri&ecirc;ng c&oacute; khoảng <strong>180 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của sầu ri&ecirc;ng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Gi&uacute;p giảm huyết &aacute;p</p>
	</li>
	<li>
	<p>Hỗ trợ bảo vệ tim mạch</p>
	</li>
	<li>
	<p>Điều trị chứng mất ngủ</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe xương khớp hiệu quả</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><img alt="Cơm sầu riêng Ri 6 đông lạnh 400g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/290852/bhx/com-sau-rieng-dong-lanh-hop-400g-202209141632240878.jpg" /><br />
<strong>C&aacute;ch chọn m&uacute;i sầu ri&ecirc;ng tươi ngon</strong></h3>

<p>Chọn những m&uacute;i sầu ri&ecirc;ng c&oacute; m&agrave;u v&agrave;ng tươi, căng, kh&ocirc;ng bị eo v&agrave; c&oacute; m&ugrave;i thơm tự nhi&ecirc;n. Kh&ocirc;ng n&ecirc;n chọn những m&uacute;i sầu ri&ecirc;ng c&oacute; m&agrave;u trắng hoặc v&agrave;ng nhạt v&igrave; c&oacute; thể bị ch&iacute;n &eacute;p hoặc non.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ sầu ri&ecirc;ng</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Sinh tố sầu ri&ecirc;ng</p>
	</li>
	<li>
	<p>Kem bơ sầu ri&ecirc;ng</p>
	</li>
	<li>
	<p>Ch&egrave; sầu ri&ecirc;ng v&agrave; bắp thơm ngon</p>
	</li>
	<li>
	<p>X&ocirc;i sầu ri&ecirc;ng</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản sầu ri&ecirc;ng tươi ngon</strong></h3>

<p>Bảo quản ở -18 độ C. R&atilde; đ&ocirc;ng sản phẩm ở nhiệt độ kh&ocirc;ng kh&iacute; xung quanh 15 ph&uacute;t trước khi sử dụng hoặc l&ograve; vi s&oacute;ng trong thời gian 5 ph&uacute;t.</p>

<p><strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (79, 'Xoài keo 1kg', 18400, 23000, 'store/images/qua-mong-nuoc/xoai-keo-tui-1kg-2-3-trai-202211020905272442_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/xoai-keo-tui-1kg-2-4-trai">Xo&agrave;i keo</a> c&oacute; nguồn gốc từ Campuchia, l&agrave; loại <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> được ưa chuộng gi&agrave;u chất xơ, vitamin, kho&aacute;ng chất thiết yếu v&agrave; mang lại nhiều lợi &iacute;ch tuyệt vời cho hệ ti&ecirc;u h&oacute;a, tim mạch, gi&uacute;p mắt s&aacute;ng, l&agrave;m đẹp da.&nbsp;Xo&agrave;i keo c&oacute; quả chắc gi&ograve;n gi&ograve;n, chua nhẹ thơm ngon được nhiều người ưa th&iacute;ch.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua xo&agrave;i keo tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i keo chất lượng, tươi ngon, tr&aacute;i to, xanh, căng tr&aacute;i, khi ăn kh&aacute; gi&ograve;n.&nbsp;<strong>Xo&agrave;i keo thường được ăn sống</strong>, khi mua về c&oacute; thể sử dụng ngay. Khi c&ograve;n xanh, xo&agrave;i&nbsp;c&oacute; vị chua nhẹ v&agrave; gi&ograve;n. Khi&nbsp;ch&iacute;n th&igrave; xo&agrave;i keo lại c&oacute; vị ngọt v&agrave; thơm nhẹ.&nbsp;<strong>Giao ngẫu nhi&ecirc;n xo&agrave;i keo xanh hoặc xo&agrave;i keo v&agrave;ng.</strong></p>
	</li>
	<li>
	<p>Xo&agrave;i keo c&oacute; nguồn gốc từ<strong> Campuchia</strong>, đảm bảo xuất xứ r&otilde; r&agrave;ng, đ&oacute;ng g&oacute;i đảm bảo cho người d&ugrave;ng.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Xoài keo 1kg (2 - 3 trái) (Giao ngẫu nhiên xoài xanh hoặc vàng) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/270320/bhx/xoai-keo-tui-1kg-3-trai-202210220910409772.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của xo&agrave;i keo</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Trong xo&agrave;i keo chứa nhiều dưỡng chất như vitamin B, vitamin C, c&aacute;c kho&aacute;ng chất như magie, natri, canxi, chất đạm, chất xơ, chất b&eacute;o, đường,... cần thiết cho cơ thể</p>
	</li>
	<li>
	<p>Trong 100g xo&agrave;i keo c&oacute; khoảng <strong>82 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của xo&agrave;i keo đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i keo c&oacute; t&aacute;c dụng ngăn ngừa mỏi mắt, kh&ocirc; mắt</p>
	</li>
	<li>
	<p>Hỗ trợ qu&aacute; tr&igrave;nh ti&ecirc;u h&oacute;a diễn ra hiệu quả hơn</p>
	</li>
	<li>
	<p>Hỗ trợ tăng c&acirc;n hiệu quả</p>
	</li>
	<li>
	<p>Cung cấp dưỡng chất cho cơ thể</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><img alt="Xoài keo 1kg (2 - 3 trái) (Giao ngẫu nhiên xoài xanh hoặc vàng) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/270320/bhx/xoai-keo-tui-1kg-3-trai-202210220910415865.jpg" /><br />
<strong>C&aacute;ch chọn xo&agrave;i keo tươi ngon</strong></h3>

<p>N&ecirc;n chọn những quả xo&agrave;i keo c&oacute; m&agrave;u s&aacute;ng, xanh đậm, phần cuống hơi ửng v&agrave;ng, cuống xo&agrave;i c&ograve;n tươi, tr&aacute;i xo&agrave;i chắc, thơm.</p>

<p>Kh&ocirc;ng n&ecirc;n chọn những tr&aacute;i dập, mềm nhũn, sần da hoặc bị s&acirc;u</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ xo&agrave;i keo</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Xo&agrave;i keo lắc muối t&ocirc;m ngon hấp dẫn</p>
	</li>
	<li>
	<p>Gỏi xo&agrave;i t&ocirc;m kh&ocirc;</p>
	</li>
	<li>
	<p>B&aacute;nh tr&aacute;ng trộn với xo&agrave;i</p>
	</li>
	<li>
	<p>Gỏi xo&agrave;i với sứa</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản xo&agrave;i keo tươi ngon</strong></h3>

<p>Xo&agrave;i mua về, n&ecirc;n được bảo quản trong tủ lạnh để gi&uacute;p xo&agrave;i được gi&ograve;n, ngon v&agrave; tươi l&acirc;u hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (80, 'Sầu riêng Ri 6 trái 2.6kg - 3kg', 390600, 434000, 'store/images/qua-mong-nuoc/sau-rieng-ri-6-trai-26kg-3kg-202303131511129970_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sầu ri&ecirc;ng l&agrave; loại<a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon"> tr&aacute;i c&acirc;y</a> c&oacute; m&ugrave;i thơm nức mũi, k&iacute;ch th&iacute;ch khứu gi&aacute;c. Sầu ri&ecirc;ng c&oacute; vỏ mỏng, hạt l&eacute;p, cơm v&agrave;ng... <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/sau-rieng-ri-6-trai-26kg-3kg">Sầu ri&ecirc;ng</a>&nbsp;l&agrave; loại Ri 6, chất lượng, tại B&aacute;ch h&oacute;a XANH được đảm bảo chất lượng, thơm ngon. Ngo&agrave;i ra, sầu ri&ecirc;ng c&ograve;n chứa h&agrave;m lượng vitamin, kho&aacute;ng chất tốt cho cơ thể</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua sầu ri&ecirc;ng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Sầu ri&ecirc;ng Ri 6 đảm bảo thơm&nbsp;ngon v&agrave;&nbsp;chất lượng, được lựa chọn kỹ c&agrave;ng. Sầu ri&ecirc;ng c&oacute;&nbsp;<strong>vỏ mỏng, hạt l&eacute;p, cơm d&agrave;y,&nbsp;</strong>m&agrave;u&nbsp;v&agrave;ng &oacute;ng cực kỳ bắt mắt v&agrave; kh&ocirc;ng bị sượng.&nbsp;Sầu ri&ecirc;ng bảo quản ở nhiệt độ thường, sẽ ch&iacute;n sau 3-4 ng&agrave;y</li>
	<li>Sầu ri&ecirc;ng được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng. Mỗi tr&aacute;i c&oacute; khối lượng khoảng <strong>2.6kg - 3kg.</strong></li>
</ul>

<h3><img alt="Sầu riêng Ri 6 2.6kg - 3kg (Giao ngẫu nhiên sống hoặc chín) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/281524/bhx/sau-rieng-trai-22kg-25kg-202205241959588987.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của sầu ri&ecirc;ng</strong></h3>

<ul style="margin-left:40px">
	<li>Sầu ri&ecirc;ng được nhiều người y&ecirc;u th&iacute;ch bởi hương&nbsp;thơm đặc trưng,&nbsp;ngo&agrave;i ra đ&acirc;y c&ograve;n l&agrave; loại tr&aacute;i c&acirc;y&nbsp;bổ dưỡng, chứa nhiều loại vitamin như vitamin C, vitamin B,... chất xơ v&agrave; nhiều kho&aacute;ng chất kh&aacute;c c&oacute; lợi cho sức khỏe.</li>
	<li>Trong 100g sầu ri&ecirc;ng chứa khoảng 135 - 180 calo.</li>
</ul>

<p>Tham khảo: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/sau-rieng-bao-nhieu-calo-an-co-tot-khong-1369635">Ăn sầu ri&ecirc;ng c&oacute; b&eacute;o kh&ocirc;ng?</a></p>

<h3><img alt="Sầu riêng Ri 6 2.6kg - 3kg (Giao ngẫu nhiên sống hoặc chín) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/281524/bhx/sau-rieng-trai-22kg-25kg-202205241959579255.jpg" /></h3>

<h3><strong>T&aacute;c dụng của sầu ri&ecirc;ng đối với sức khoẻ</strong></h3>
Kh&ocirc;ng chỉ l&agrave; loại tr&aacute;i c&acirc;y thơm ngon, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-sau-rieng-quanh-nam-nhung-it-nguoi-biet-cong-dung-cua-loai-qua-nay-1117357">sầu ri&ecirc;ng c&oacute; nhiều c&ocirc;ng dụng</a> tốt cho sức khỏe như hỗ trợ hệ ti&ecirc;u h&oacute;a, chống l&atilde;o h&oacute;a, điều trị chứng mất ngủ, cải thiện xương khớp,...

<h3><strong>C&aacute;ch chọn sầu ri&ecirc;ng ngon&nbsp;</strong></h3>
Để <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/chon-mua-sau-rieng-ngon-khong-thuoc-ep-chin-934714">chọn quả sầu ri&ecirc;ng ngon nhất</a>, bạn c&oacute; thể quan s&aacute;t những đặc điểm sau:

<ul style="margin-left:40px">
	<li>Lựa tr&aacute;i sầu ri&ecirc;ng tr&ograve;n, đều v&agrave;&nbsp;c&oacute; nhiều m&uacute;i</li>
	<li>Gai sầu ri&ecirc;ng nở to, cứng v&agrave; đều</li>
	<li>Khi g&otilde; nhẹ vỏ sẽ nghe tiếng bồm bộp ph&aacute;t ra</li>
	<li>Chọn những quả c&oacute; m&ugrave;i&nbsp;thơm nồng</li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch ăn sầu ri&ecirc;ng ngon đ&uacute;ng chuẩn</strong></h3>
<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-sau-rieng-triet-de-ca-hat-cui-va-vo-voi-toan-mon-ngon-va-bo-duong-1358207">C&aacute;ch ăn sầu ri&ecirc;ng</a> đơn giản v&agrave; ngon nhất l&agrave; bạn chỉ cần t&aacute;ch vỏ sầu ri&ecirc;ng ra, thưởng thức trực tiếp những m&uacute;i sầu ri&ecirc;ng thơm ngon.<br />
Phần sầu ri&ecirc;ng c&ograve;n lại c&oacute; thể cho v&agrave;o hộp nhựa hay t&uacute;i nilon h&uacute;t ch&acirc;n kh&ocirc;ng v&agrave; bảo quản trong ngăn m&aacute;t tủ lạnh, khi ăn bạn chỉ cần lấy ra v&agrave; thưởng thức.<br />
<img alt="Sầu riêng Ri 6 2.6kg - 3kg (Giao ngẫu nhiên sống hoặc chín) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/281524/bhx/sau-rieng-trai-22kg-25kg-202205242000000044.jpg" />
<h3><strong>Mẹo bảo quản sầu ri&ecirc;ng tươi ngon</strong></h3>
Để giữ được hương vị thơm ngon v&agrave; chất lượng nhất, bạn cần phải bảo quản sầu ri&ecirc;ng đ&uacute;ng c&aacute;ch. <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meo-bao-quan-sau-rieng-trong-tu-lanh-khong-bi-boc-mui-nong-nac-1359202">Bảo quản sầu ri&ecirc;ng ch&iacute;n trong tủ lạnh</a> l&agrave; c&aacute;ch đơn giản v&agrave; hiệu quả, bạn c&oacute; thể sử dụng m&agrave;ng bọc thực phẩm để bọc từng m&uacute;i sầu ri&ecirc;ng lại cẩn thận, sau đ&oacute; cho v&agrave;o hộp đựng (bằng nhựa hay thủy tinh) đều được.

<h3><strong>Những m&oacute;n ăn ngon từ&nbsp;sầu ri&ecirc;ng</strong></h3>
Sầu ri&ecirc;ng ngo&agrave;i thưởng thức trực tiếp để cảm nhận được sự thơm ngon, b&eacute;o ngậy, bạn cũng c&oacute; thể chế biến nhiều <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/mach-ban-sau-rieng-bay-mon-thom-lung-giai-nhiet-mua-he-1090659">m&oacute;n ngon từ sầu ri&ecirc;ng</a> như kem sầu ri&ecirc;ng, sinh tố sầu ri&ecirc;ng, x&ocirc;i sầu ri&ecirc;ng, b&aacute;nh crepe sầu ri&ecirc;ng,... cũng cực kỳ hấp dẫn kh&ocirc;ng k&eacute;m nh&eacute;!<br />
<img alt="Sầu riêng Ri 6 2.6kg - 3kg (Giao ngẫu nhiên sống hoặc chín) 3" class="lazy" src="https://food-map.s3.ap-southeast-1.amazonaws.com/news/2021/04/Mon-ngon-tu-sau-rieng-banh-crepe-sau-rieng-la-dua-1200x675.jpg" /><br />
<em>*Tr&aacute;i sẽ c&oacute; h&igrave;nh dạng v&agrave; m&agrave;u sắc kh&aacute;c nhau, tuy nhi&ecirc;n vẫn đảm bảo chất lượng</em></div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (81, 'Sầu riêng Ri 6 trái 3kg - 3.5kg', 453600, 504000, 'store/images/qua-mong-nuoc/sau-rieng-ri-6-trai-3kg-35kg-202303131511571816_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sầu ri&ecirc;ng l&agrave; loại<a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon"> tr&aacute;i c&acirc;y</a> c&oacute; m&ugrave;i thơm nức mũi, k&iacute;ch th&iacute;ch khứu gi&aacute;c. Sầu ri&ecirc;ng c&oacute; vỏ mỏng, hạt l&eacute;p, cơm v&agrave;ng... <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/sau-rieng-ri-6-trai-3kg-35kg">Sầu ri&ecirc;ng</a>&nbsp;l&agrave; loại Ri 6, chất lượng, tại B&aacute;ch h&oacute;a XANH được đảm bảo chất lượng, thơm ngon. Ngo&agrave;i ra, sầu ri&ecirc;ng c&ograve;n chứa h&agrave;m lượng vitamin, kho&aacute;ng chất tốt cho cơ thể</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua sầu ri&ecirc;ng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Sầu ri&ecirc;ng Ri 6 đảm bảo thơm&nbsp;ngon v&agrave;&nbsp;chất lượng, được lựa chọn kỹ c&agrave;ng. Sầu ri&ecirc;ng c&oacute;&nbsp;<strong>vỏ mỏng, hạt l&eacute;p, cơm d&agrave;y,&nbsp;</strong>m&agrave;u&nbsp;v&agrave;ng &oacute;ng cực kỳ bắt mắt v&agrave; kh&ocirc;ng bị sượng.&nbsp;Sầu ri&ecirc;ng bảo quản ở nhiệt độ thường, sẽ ch&iacute;n sau 3-4 ng&agrave;y.</li>
	<li>Sầu ri&ecirc;ng được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng. Mỗi tr&aacute;i c&oacute; khối lượng khoảng <strong>3kg - 3.5kg.</strong></li>
</ul>

<h3><img alt="Sầu riêng Ri 6 3kg - 3.5kg (Giao ngẫu nhiên sống hoặc chín) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/281524/bhx/sau-rieng-trai-22kg-25kg-202205241959588987.jpg" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của sầu ri&ecirc;ng</strong></h3>

<ul style="margin-left:40px">
	<li>Sầu ri&ecirc;ng được nhiều người y&ecirc;u th&iacute;ch bởi hương&nbsp;thơm đặc trưng,&nbsp;ngo&agrave;i ra đ&acirc;y c&ograve;n l&agrave; loại tr&aacute;i c&acirc;y&nbsp;bổ dưỡng, chứa nhiều loại vitamin như vitamin C, vitamin B,... chất xơ v&agrave; nhiều kho&aacute;ng chất kh&aacute;c c&oacute; lợi cho sức khỏe.</li>
	<li>Trong 100g sầu ri&ecirc;ng chứa khoảng 135 - 180 calo.</li>
</ul>

<p>Tham khảo: <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/sau-rieng-bao-nhieu-calo-an-co-tot-khong-1369635">Ăn sầu ri&ecirc;ng c&oacute; b&eacute;o kh&ocirc;ng?</a></p>

<h3><img alt="Sầu riêng Ri 6 3kg - 3.5kg (Giao ngẫu nhiên sống hoặc chín) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/281524/bhx/sau-rieng-trai-22kg-25kg-202205241959579255.jpg" /></h3>

<h3><strong>T&aacute;c dụng của sầu ri&ecirc;ng đối với sức khoẻ</strong></h3>
Kh&ocirc;ng chỉ l&agrave; loại tr&aacute;i c&acirc;y thơm ngon, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-sau-rieng-quanh-nam-nhung-it-nguoi-biet-cong-dung-cua-loai-qua-nay-1117357">sầu ri&ecirc;ng c&oacute; nhiều c&ocirc;ng dụng</a> tốt cho sức khỏe như hỗ trợ hệ ti&ecirc;u h&oacute;a, chống l&atilde;o h&oacute;a, điều trị chứng mất ngủ, cải thiện xương khớp,...

<h3><strong>C&aacute;ch chọn sầu ri&ecirc;ng ngon&nbsp;</strong></h3>
Để <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/chon-mua-sau-rieng-ngon-khong-thuoc-ep-chin-934714">chọn quả sầu ri&ecirc;ng ngon nhất</a>, bạn c&oacute; thể quan s&aacute;t những đặc điểm sau:

<ul style="margin-left:40px">
	<li>Lựa tr&aacute;i sầu ri&ecirc;ng tr&ograve;n, đều v&agrave;&nbsp;c&oacute; nhiều m&uacute;i</li>
	<li>Gai sầu ri&ecirc;ng nở to, cứng v&agrave; đều</li>
	<li>Khi g&otilde; nhẹ vỏ sẽ nghe tiếng bồm bộp ph&aacute;t ra</li>
	<li>Chọn những quả c&oacute; m&ugrave;i&nbsp;thơm nồng</li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch ăn sầu ri&ecirc;ng ngon đ&uacute;ng chuẩn</strong></h3>
<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-sau-rieng-triet-de-ca-hat-cui-va-vo-voi-toan-mon-ngon-va-bo-duong-1358207">C&aacute;ch ăn sầu ri&ecirc;ng</a> đơn giản v&agrave; ngon nhất l&agrave; bạn chỉ cần t&aacute;ch vỏ sầu ri&ecirc;ng ra, thưởng thức trực tiếp những m&uacute;i sầu ri&ecirc;ng thơm ngon.<br />
Phần sầu ri&ecirc;ng c&ograve;n lại c&oacute; thể cho v&agrave;o hộp nhựa hay t&uacute;i nilon h&uacute;t ch&acirc;n kh&ocirc;ng v&agrave; bảo quản trong ngăn m&aacute;t tủ lạnh, khi ăn bạn chỉ cần lấy ra v&agrave; thưởng thức.<br />
<img alt="Sầu riêng Ri 6 3kg - 3.5kg (Giao ngẫu nhiên sống hoặc chín) 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/281524/bhx/sau-rieng-trai-22kg-25kg-202205242000000044.jpg" />
<h3><strong>Mẹo bảo quản sầu ri&ecirc;ng tươi ngon</strong></h3>
Để giữ được hương vị thơm ngon v&agrave; chất lượng nhất, bạn cần phải bảo quản sầu ri&ecirc;ng đ&uacute;ng c&aacute;ch. <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meo-bao-quan-sau-rieng-trong-tu-lanh-khong-bi-boc-mui-nong-nac-1359202">Bảo quản sầu ri&ecirc;ng ch&iacute;n trong tủ lạnh</a> l&agrave; c&aacute;ch đơn giản v&agrave; hiệu quả, bạn c&oacute; thể sử dụng m&agrave;ng bọc thực phẩm để bọc từng m&uacute;i sầu ri&ecirc;ng lại cẩn thận, sau đ&oacute; cho v&agrave;o hộp đựng (bằng nhựa hay thủy tinh) đều được.

<h3><strong>Những m&oacute;n ăn ngon từ&nbsp;sầu ri&ecirc;ng</strong></h3>
Sầu ri&ecirc;ng ngo&agrave;i thưởng thức trực tiếp để cảm nhận được sự thơm ngon, b&eacute;o ngậy, bạn cũng c&oacute; thể chế biến nhiều <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/mach-ban-sau-rieng-bay-mon-thom-lung-giai-nhiet-mua-he-1090659">m&oacute;n ngon từ sầu ri&ecirc;ng</a> như kem sầu ri&ecirc;ng, sinh tố sầu ri&ecirc;ng, x&ocirc;i sầu ri&ecirc;ng, b&aacute;nh crepe sầu ri&ecirc;ng,... cũng cực kỳ hấp dẫn kh&ocirc;ng k&eacute;m nh&eacute;!<br />
<img alt="Sầu riêng Ri 6 3kg - 3.5kg (Giao ngẫu nhiên sống hoặc chín) 3" class="lazy" src="https://food-map.s3.ap-southeast-1.amazonaws.com/news/2021/04/Mon-ngon-tu-sau-rieng-banh-crepe-sau-rieng-la-dua-1200x675.jpg" /><br />
<em>*Tr&aacute;i sẽ c&oacute; h&igrave;nh dạng v&agrave; m&agrave;u sắc kh&aacute;c nhau, tuy nhi&ecirc;n vẫn đảm bảo chất lượng</em></div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (82, 'Quýt giống Úc thùng 9kg', 460800, 576000, 'store/images/qua-mong-nuoc/quyt-giong-uc-thung-9kg-202303111539280664_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/quyt-giong-uc-thung-9kg">Qu&yacute;t &Uacute;c</a>&nbsp;l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> c&oacute; m&agrave;u v&agrave;ng ươm, quả hơi dẹp, tr&ecirc;n vỏ qu&yacute;t c&oacute; c&aacute;c đốm tinh dầu to b&oacute;ng. <strong>Qu&yacute;t ngon, ngọt nhất khi tr&aacute;i hơi dẹt, cuống c&ograve;n tươi, m&agrave;u s&aacute;ng đều</strong>. Qu&yacute;t &Uacute;c tại B&aacute;ch h&oacute;a XANH được <strong>trồng tại Trung Quốc</strong> chất lượng, tươi ngon</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua qu&yacute;t &Uacute;c tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Qu&yacute;t &Uacute;c tươi ngon, chất lượng, ngọt thanh. Qu&yacute;t &Uacute;c được xem như l&agrave; loại qu&yacute;t ngon nhất thế giới. Qu&yacute;t &Uacute;c c&oacute; m&agrave;u v&agrave;ng ươm, quả hơi đẹp, tr&ecirc;n vỏ qu&yacute;t c&oacute; c&aacute;c đốm tinh dầu to b&oacute;ng. C&aacute;c t&eacute;p qu&yacute;t mọng nước, c&oacute; vị ngọt.</p>
	</li>
	<li>
	<p>Qu&yacute;t &Uacute;c được trồng tại Trung Quốc, đảm bảo nguồn gốc r&otilde; r&agrave;ng.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Quýt giống Úc thùng 9kg 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/303945/bhx/quyt-giong-uc-thung-9kg-202303111537312040.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của qu&yacute;t &Uacute;c&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Qu&yacute;t &Uacute;c l&agrave; một trong những loại tr&aacute;i c&acirc;y c&oacute; gi&aacute; trị dinh dưỡng cao được nhiều người chọn mua. Qu&yacute;t &Uacute;c c&oacute; chứa nhiều vitamin B1, vitamin B2 v&agrave; lượng vitamin C cao gấp nhiều lần so với những loại tr&aacute;i c&acirc;y kh&aacute;c như l&ecirc;. Ngo&agrave;i ra, qu&yacute;t giống &Uacute;c c&ograve;n c&oacute; h&agrave;m lượng protein v&agrave; canxi kh&aacute; cao.</p>
	</li>
	<li>
	<p>Trong 100g qu&yacute;t c&oacute; khoảng 53 Kcal.</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của qu&yacute;t &Uacute;c&nbsp; đối với sức khỏe</strong></h3>

<p>Qu&yacute;t l&agrave; loại tr&aacute;i c&acirc;y.mang đến những c&ocirc;ng dụng to lớn cho sức khỏe con người</p>

<ul style="margin-left:40px">
	<li>
	<p>Tăng cường sức đề kh&aacute;ng, hỗ trợ điều trị cảm v&agrave; ho khan</p>
	</li>
	<li>
	<p>Ngăn ngừa b&eacute;o ph&igrave;, tiểu đường, đột quỵ,...</p>
	</li>
	<li>
	<p>Chống oxy h&oacute;a v&agrave; cải thiện, duy tr&igrave; l&agrave;n da lu&ocirc;n săn chắc</p>
	</li>
	<li>
	<p>Cải thiện thị lực</p>
	</li>
	<li>
	<p>Giảm rụng t&oacute;c nhờ h&agrave;m lượng vitamin B12 cao</p>
	</li>
	<li>
	<p>Gi&uacute;p xương săn chắc</p>
	</li>
</ul>

<h3><img alt="Quýt giống Úc thùng 9kg 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/303945/bhx/quyt-giong-uc-thung-9kg-202303111527209319.jpg" /><br />
<strong>C&aacute;ch chọn qu&yacute;t &Uacute;c&nbsp; tươi ngon</strong></h3>

<p>Để chọn qu&yacute;t ngon, n&ecirc;n chọn những quả c&oacute; cuống c&ograve;n tươi, hơi dẹt, kh&ocirc;ng bị dập, &uacute;ng.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ qu&yacute;t &Uacute;c&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Mứt qu&yacute;t</p>
	</li>
	<li>
	<p>B&aacute;nh b&ocirc;ng lan qu&yacute;t</p>
	</li>
	<li>
	<p>Thạch qu&yacute;t</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản qu&yacute;t &Uacute;c tươi ngon</strong></h3>

<p>Qu&yacute;t c&oacute; thể bảo quản trong tủ lạnh để được l&acirc;u hơn v&agrave; tươi ngon hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</p>
</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (83, 'Cam Ai Cập 1kg', 49000, 0, 'store/images/qua-mong-nuoc/cam-ai-cap-tui-1kg-3-5-trai-202302021432228192_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Cam Ai Cập l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> nhập khẩu từ Ai Cập. Đạt ti&ecirc;u chuẩn xuất khẩu to&agrave;n cầu. Cam ngọt thanh, thơm đặc trưng, m&agrave;u sắc v&agrave;ng kh&aacute; bắt mắt. <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/cam-ai-cap-tui-1-kg-4-5-trai">Cam Ai Cập</a>&nbsp;chứa nhiều Vitamin C, tốt cho da, chống l&atilde;o h&oacute;a, giảm Cholesterol,&nbsp;phục sức khỏe,&nbsp;tạo hồng huyết cầu, giảm căng thẳng</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua cam Ai Cập&nbsp;tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Cam&nbsp;to tr&aacute;i, chắc, cầm nặng tay, tr&aacute;i tr&ograve;n căng b&oacute;ng, mọng nước v&agrave;&nbsp;thơm ngon. Cam v&agrave;ng&nbsp;tươi, kh&ocirc;ng bị dập, bị thối. L&agrave; loại tr&aacute;i c&acirc;y <strong>nhập khẩu từ Ai Cập</strong>&nbsp;an to&agrave;n vệ sinh</li>
	<li>Cam&nbsp;c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, 1kg cam&nbsp;c&oacute; từ 4&nbsp;đến 5 tr&aacute;i.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cam Ai Cập 1kg (3 - 5 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/302224/bhx/cam-ai-cap-tui-1kg-3-5-trai-202302021428580729.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của cam Ai Cập</strong></h3>

<ul style="margin-left:40px">
	<li>Cam lu&ocirc;n được xem l&agrave; loại tr&aacute;i c&acirc;y dinh dưỡng, chứa nhiều vitamin C, c&aacute;c vitamin chống oxy h&oacute;a, c&aacute;c kho&aacute;ng chất như canxi, natri, phốt pho,...lượng chất xơ cao, tốt cho sức khỏe.</li>
	<li>Trong 100g cam&nbsp;c&oacute; khoảng<strong>&nbsp;65&nbsp;kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của cam đối với sức khỏe</strong></h3>
Cam c&oacute; rất nhiều t&aacute;c dụng tốt cho cơ thể do chứa nhiều th&agrave;nh phần như vitamin, c&aacute;c chất dinh dưỡng v&agrave; kho&aacute;ng chất. Gi&uacute;p hệ ti&ecirc;u h&oacute;a hoạt động hiệu quả hơn, tr&aacute;nh cảm c&uacute;m, tăng cường thị lực, gi&uacute;p ngủ ngon,... Ngo&agrave;i ra, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nhung-cong-dung-lam-dep-tuyet-voi-tu-cam-1055087">cam c&ograve;n c&oacute; nhiều c&ocirc;ng dụng l&agrave;m đẹp</a> thần k&igrave; được rất nhiều chị em phụ nữ &aacute;p dụng.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ cam</strong></h3>
Cam l&agrave; một trong những nguy&ecirc;n liệu tạo n&ecirc;n những m&oacute;n ăn ngon hấp dẫn như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mut-vo-cam-cuc-ngon-don-tet-1141051">mứt cam</a>, rau c&acirc;u cam, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-salad-cam-dau-do-cung-sot-mayonnaise-1108988">salad cam</a>,...

<h3><img alt="Cam Ai Cập 1kg (3 - 5 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/302224/bhx/cam-ai-cap-tui-1kg-3-5-trai-202302021428589163.jpg" /><strong>C&aacute;c thức uống dinh dưỡng từ cam</strong></h3>
Cam ngo&agrave;i ăn trực tiếp c&oacute; thể l&agrave;m nước &eacute;p cam v&ocirc; c&ugrave;ng thơm ngon, giải kh&aacute;t v&agrave; cung cấp dinh dưỡng cho người đau.

<h3><strong>C&aacute;ch bảo quản cam&nbsp;tươi ngon</strong></h3>
Cam mua về bạn n&ecirc;n rửa sạch dưới v&ograve;i nước nhỏ để tr&aacute;nh bị dập cam, lau kh&ocirc; v&agrave; cho v&agrave;o t&uacute;i ni l&ocirc;ng v&agrave; bảo quản trong ngăn m&aacute;t tủ lạnh sẽ gi&uacute;p cam được tươi v&agrave; ngon l&acirc;u hơn nh&eacute;<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (84, 'Cam sành 1kg', 29000, 0, 'store/images/qua-mong-nuoc/cam-sanh-tui-1kg-3-4-trai-202211011331467096_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon/cam-sanh-tui-1kg">Cam s&agrave;nh</a> l&agrave; <a href="https://www.bachhoaxanh.com/trai-cay-tuoi-ngon">tr&aacute;i c&acirc;y</a> rất th&ocirc;ng dụng trong đời sống, được ưu ti&ecirc;n chọn mua bởi t&aacute;c dụng thần kỳ của n&oacute; mang lại cho sức khỏe ch&uacute;ng ta. Đặc điểm vỏ cam s&agrave;nh m&agrave;u xanh đến xanh v&agrave;ng khi ch&iacute;n, sần v&agrave; d&agrave;y, t&eacute;p m&agrave;u v&agrave;ng cam đậm, nhiều nước, vị ngọt chua m&ugrave;i rất thơm v&agrave; kh&aacute; nhiều hạt. Ph&ugrave; hợp để vắt nước.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua cam s&agrave;nh tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Cam s&agrave;nh to quả, chắc, <strong>cầm nặng tay, c&oacute; m&agrave;u xanh b&oacute;ng, c&oacute; vị ngọt thanh, thơm</strong>. Cam s&agrave;nh tươi, kh&ocirc;ng bị dập, bị thối</li>
	<li>Cam s&agrave;nh l&agrave; tr&aacute;i c&acirc;y nội, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, 1 kg cam s&agrave;nh c&oacute; từ<strong> 3 đến 4 tr&aacute;i.</strong></li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3 style="text-align:center"><img alt="Cam sành 1kg (3 - 4 trái) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/235006/bhx/cam-sanh-tui-1kg-3-4-trai-202205111923328302.jpg" style="height:500px; width:800px" /></h3>

<h3><strong>Gi&aacute; trị dinh dưỡng của cam s&agrave;nh</strong></h3>

<ul style="margin-left:40px">
	<li>Cam s&agrave;nh l&agrave; tr&aacute;i c&acirc;y chứa nhiều chất dinh dưỡng như vitamin C, c&aacute;c vitamin chống oxy h&oacute;a, c&aacute;c kho&aacute;ng chất như canxi, natri, phốt pho,...lượng chất xơ cao, tốt cho sức khỏe.</li>
	<li>Trong 100g cam s&agrave;nh c&oacute; khoảng<strong> 47 kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của cam s&agrave;nh đối với sức khỏe</strong></h3>
Cam c&oacute; t&aacute;c dụng tốt cho cơ thể do chứa nhiều th&agrave;nh phần như vitamin, c&aacute;c chất dinh dưỡng v&agrave; kho&aacute;ng chất. Gi&uacute;p hệ ti&ecirc;u h&oacute;a hoạt động hiệu quả hơn, tr&aacute;nh cảm c&uacute;m, tăng cường thị lực, gi&uacute;p ngủ ngon,... Ngo&agrave;i ra, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nhung-cong-dung-lam-dep-tuyet-voi-tu-cam-1055087">cam c&ograve;n c&oacute; nhiều c&ocirc;ng dụng l&agrave;m đẹp</a> thần k&igrave; được rất nhiều chị em phụ nữ &aacute;p dụng.

<div style="text-align:center"><img alt="Cam sành 1kg (3 - 4 trái) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8788/235006/bhx/cam-sanh-tui-1kg-3-4-trai-202205111923334110.jpg" style="height:500px; width:800px" /></div>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ cam s&agrave;nh</strong></h3>
Cam l&agrave; một trong những nguy&ecirc;n liệu tạo n&ecirc;n những m&oacute;n ăn ngon hấp dẫn như <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mut-vo-cam-cuc-ngon-don-tet-1141051">mứt cam</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mon-rau-cau-trai-cam-hap-dan-va-bo-duong-1119912">rau c&acirc;u cam</a>, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-salad-cam-dau-do-cung-sot-mayonnaise-1108988">salad cam</a>,...

<h3><strong>C&aacute;c thức uống dinh dưỡng từ cam s&agrave;nh</strong></h3>
Cam s&agrave;nh ngo&agrave;i ăn trực tiếp c&oacute; thể l&agrave;m <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-cam-ep-mat-ong-ngon-kho-cuong-giup-tang-cuong-he-mien-dich-1234511">nước &eacute;p cam</a> v&ocirc; c&ugrave;ng thơm ngon, giải kh&aacute;t v&agrave; cung cấp dinh dưỡng cho người đau.

<h3><strong>C&aacute;ch bảo quản cam s&agrave;nh tươi ngon</strong></h3>
Cam mua về bạn n&ecirc;n rửa sạch dưới v&ograve;i nước nhỏ để tr&aacute;nh bị dập cam, lau kh&ocirc; v&agrave; cho v&agrave;o t&uacute;i ni l&ocirc;ng v&agrave; bảo quản trong ngăn m&aacute;t tủ lạnh sẽ gi&uacute;p cam được tươi v&agrave; ngon l&acirc;u hơn nh&eacute;<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'trai-cay-hat', 0, 0, 0, '2023-05-03 16:30:01', 4);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (85, 'Râu mực nhập khẩu 500g', 49000, 69000, 'store/images/hai-san/rau-muc-nhap-khau-dong-lanh-500g-202304211056106160_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/rau-muc-nhap-khau-dong-lanh-500g">R&acirc;u mực</a> tươi ngon, c&oacute; vị dai gi&ograve;n, sật sật ăn đ&atilde; miệng v&ocirc; c&ugrave;ng. R&acirc;u mực l&agrave; <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">hải sản</a> tạo n&ecirc;n nhiều m&oacute;n ăn thơm ngon v&ocirc; c&ugrave;ng, được c&aacute;c b&agrave; nội trợ ưa chuộng v&agrave; tin d&ugrave;ng, d&ugrave;ng l&agrave;m nguy&ecirc;n liệu cho bữa ăn của cả nh&agrave;</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua r&acirc;u mực tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>R&acirc;u mực tươi ngon, dai gi&ograve;n, chất lượng, được đ&oacute;ng g&oacute;i cẩn thận. R&acirc;u to, chắc rất hấp dẫn.</p>
	</li>
	<li>
	<p>R&acirc;u mực đ&ocirc;ng lạnh, được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, bảo quản tốt.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Râu mực nhập khẩu đông lạnh 500g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/304602/bhx/rau-muc-nhap-khau-dong-lanh-500g-202303220822572735.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của r&acirc;u mực</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>R&acirc;u mực l&agrave; một trong những loại hải sản c&oacute; gi&aacute; trị dinh dưỡng cao, chứa nhiều vitamin A, vitamin C, chất đạm, canxi, chất b&eacute;o, kali, magie,... cần thiết cho cơ thể</p>
	</li>
	<li>
	<p>Trong 100g r&acirc;u mực chứa khoảng <strong>92 Kcal</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của r&acirc;u mực đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Gi&uacute;p cơ thể hấp thụ v&agrave; sử dụng sắt tối ưu</p>
	</li>
	<li>
	<p>Gi&uacute;p hỗ trợ v&agrave; duy tr&igrave; sức khỏe của l&agrave;n da</p>
	</li>
	<li>
	<p>Gi&uacute;p xương chắc khỏe, ngăn ngừa vi&ecirc;m khớp</p>
	</li>
	<li>
	<p>Ngo&agrave;i ra ch&uacute;ng c&ograve;n rất tốt cho tim mạch</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch sơ chế r&acirc;u mực</strong></h3>

<p>R&acirc;u mực đ&atilde; được cắt v&agrave; đ&oacute;ng g&oacute;i h&uacute;t ch&acirc;n kh&ocirc;ng sạch sẽ. Khi mua về bạn chỉ cần rửa sạch lại v&agrave; cắt th&agrave;nh miếng vừa ăn với từng m&oacute;n ăn.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ r&acirc;u mực</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>R&acirc;u mực sốt me</p>
	</li>
	<li>
	<p>R&acirc;u mực nướng sa tế</p>
	</li>
	<li>
	<p>R&acirc;u mực hấp h&agrave;nh gừng</p>
	</li>
	<li>
	<p>Gỏi r&acirc;u mực</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản r&acirc;u mực tươi ngon</strong></h3>

<p>R&acirc;u mực mua về n&ecirc;n chế biến ngay để đảm bảo độ tươi ngon của sản phẩm. Nếu kh&ocirc;ng kịp chế biến, bạn c&oacute; thể bảo quản ch&uacute;ng trong tủ lạnh.</p>

<p><strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</p>
</div>
</div>', 'thit-tuoi-song', 0, 2, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (86, 'Chả basa viên tôm Nhất Tâm 200g', 19000, 25000, 'store/images/hai-san/cha-basa-vien-tom-nhat-tam-goi-200g-202301111043466773_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech" target="_blank">C&aacute; vi&ecirc;n</a> c&oacute; thể d&ugrave;ng chi&ecirc;n, sốt c&agrave; chua hay ăn lẩu, nấu b&uacute;n đều rất dễ d&agrave;ng v&agrave; cho hương vị thơm ngon từ&nbsp;<a href="https://www.bachhoaxanh.com/ca-tom-muc-ech-nhat-tam" target="_blank">c&aacute; vi&ecirc;n Nhất T&acirc;m</a>. <a href="https://www.bachhoaxanh.com/ca-vien-bo-vien/cha-basa-vien-tom-nhat-tam-goi-200g" target="_blank">Chả basa vi&ecirc;n t&ocirc;m Nhất T&acirc;m g&oacute;i 200g</a> được l&agrave;m từ c&aacute; basa tươi ngon v&agrave; c&ugrave;ng t&ocirc;m cho vị ngon thơm b&ugrave;i kh&oacute; cưỡng, bắt vị chứa nhiều chất dinh dưỡng.</div>

<ul style="margin-left:40px">
	<li>T&ecirc;n sản phẩm
	<div>Chả basa vi&ecirc;n t&ocirc;m Nhất T&acirc;m g&oacute;i 200g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>C&aacute; basa (82%), t&ocirc;m 10%, tinh bột biến t&iacute;nh, muối, đường, chất điều vị, chất ổn định,...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Chi&ecirc;n, nướng, nấu canh, lẩu hoặc chế biến c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ m&aacute;t 0 - 4 độ C. Bảo quản đ&ocirc;ng ở nhiệt độ dưới -18 độ C</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Thương hiệu
	<div>Nhất T&acirc;m (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua Chả basa vi&ecirc;n t&ocirc;m Nhất T&acirc;m g&oacute;i 200g tại B&aacute;ch h&oacute;a XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Chả c&aacute; basa vi&ecirc;n t&ocirc;m tươi ngon, chất lượng, vệ sinh</p>
	</li>
	<li>
	<p>Sản phẩm được đảm bảo nguồn gốc r&otilde; r&agrave;ng, uy t&iacute;n</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Chả basa viên tôm Nhất Tâm 200g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/299844/bhx/cha-basa-vien-tom-nhat-tam-goi-200g-202212301115406612.jpg" /><br />
<strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Th&agrave;nh phần của chả basa vi&ecirc;n t&ocirc;m gồm: C&aacute; basa (82%), t&ocirc;m 10%, tinh bột biến t&iacute;nh, muối, đường, chất điều vị, chất ổn định,...</p>
	</li>
	<li>
	<p>Trong 100g chả basa vi&ecirc;n t&ocirc;m c&oacute; khoảng <strong>235 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Gi&uacute;p cung cấp năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Hỗ trợ tăng cường sức đề kh&aacute;ng</p>
	</li>
	<li>
	<p>Gi&uacute;p ăn ngon miệng hơn.</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><img alt="Chả basa viên tôm Nhất Tâm 200g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/299844/bhx/cha-basa-vien-tom-nhat-tam-goi-200g-202301111044003245.jpg" /><br />
<strong>Hướng dẫn sử dụng v&agrave; c&aacute;ch bảo quản</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Chả c&aacute; basa vi&ecirc;n t&ocirc;m c&oacute; thể chi&ecirc;n, nướng, nấu canh, lẩu hoặc chế biến c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch</p>
	</li>
	<li>
	<p>Bảo quản ở nhiệt độ m&aacute;t 0 - 4 độ C. Bảo quản đ&ocirc;ng ở nhiệt độ dưới -18 độ C</p>
	</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ngon từ sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>C&aacute; vi&ecirc;n chi&ecirc;n chấm tương ớt</p>
	</li>
	<li>
	<p>C&aacute; vi&ecirc;n basa v&agrave; t&ocirc;m thả lẩu</p>
	</li>
	<li>
	<p>C&aacute; vi&ecirc;n basa v&agrave; t&ocirc;m nấu canh</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Đảm bảo đ&uacute;ng nguồn gốc xuất xứ</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh tận nơi</p>
	</li>
	<li>
	<p>Sản phẩm chất lượng, gi&aacute; cả phải chăng</p>
	</li>
	<li>
	<p>Mua online nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i hấp dẫn</p>
	</li>
</ul>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (87, 'Khô cá đù sữa tẩm ớt 200g', 56000, 0, 'store/images/hai-san/kho-ca-du-sua-tam-ot-khay-200g-30-36-con-202210111556522172_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/kho-ca-du-sua-tam-ot-khay-200g">Kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt khay 200g</a> cay cay, thơm ,thịt c&aacute; dai ngon, chất lượng, kh&ocirc;ng sợ c&aacute; bị tanh. Kh&ocirc; <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">c&aacute;</a> được đ&oacute;ng g&oacute;i trong khay h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản c&aacute; tiện lợi hơn. Kh&ocirc; <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech-song-phuong">c&aacute; đ&ugrave; Song Phương </a>c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon hấp dẫn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Đ&oacute;ng g&oacute;i
	<div>H&uacute;t ch&acirc;n kh&ocirc;ng</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; sữa chất lượng, được tẩm ớt thơm ngon, kh&ocirc;ng bị tanh, thịt c&aacute; dai ngon, chắc v&agrave; ngọt thịt.</p>
	</li>
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; được đ&oacute;ng khay h&uacute;t ch&acirc;n kh&ocirc;ng, khay 200g, tiện lợi, sạch sẽ, dễ bảo quản.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Khô cá đù sữa tẩm ớt 200g (30 - 36 con) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/291536/bhx/kho-ca-du-sua-tam-ot-khay-200g-30-36-con-202209300825031778.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của kh&ocirc; c&aacute; đ&ugrave; sữa</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; sữa chứa nhiều vitamin A, vitamin B, vitamin D, c&aacute;c kho&aacute;ng chất như canxi, photpho, iot, đồng, kẽm,...</p>
	</li>
	<li>
	<p>Trong 100g kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt c&oacute; khoảng<strong> 275 - 300 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>C&aacute; đ&ugrave; rất tốt cho răng v&agrave; xương khớp</p>
	</li>
	<li>
	<p>Ph&aacute;t triển tế b&agrave;o n&atilde;o v&agrave; tế b&agrave;o thần kinh</p>
	</li>
	<li>
	<p>Hỗ trợ bệnh tim mạch</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><img alt="Khô cá đù sữa tẩm ớt 200g (30 - 36 con) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/291536/bhx/kho-ca-du-sua-tam-ot-khay-200g-30-36-con-202209300825047900.jpg" /><br />
<strong>C&aacute;ch sơ chế kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt</strong></h3>

<p>C&aacute; đ&ugrave; sữa tẩm ớt đ&atilde; được l&agrave;m sạch đầu, ruột v&agrave; mang đi tẩm với ớt, đảm bảo sạch sẽ chất lượng. Khi mua về bạn chỉ cần mang đi chế biến.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt nướng</p>
	</li>
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; ch&aacute;y tỏi</p>
	</li>
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; chưng thịt</p>
	</li>
	<li>
	<p>Kh&ocirc; c&aacute; đ&ugrave; rim me</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt tươi ngon</strong></h3>

<p>Kh&ocirc; c&aacute; đ&ugrave; sữa tẩm ớt n&ecirc;n được bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t hoặc bảo quản trong tủ lạnh để giữ c&aacute; được tươi ngon hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (88, 'Nghêu thịt Lenger 200g', 65000, 0, 'store/images/hai-san/ngheu-thit-lenger-200g-202303220826398526_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ngheu-thit-goi-200g">Ngh&ecirc;u</a> l&agrave; một trong những loại <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">hải sản</a> được nhiều người y&ecirc;u th&iacute;ch, thịt dai ngon, nấu ngọt nước, lại c&oacute; t&iacute;nh m&aacute;t, rất tốt cho sức khỏe. Ngh&ecirc; thịt Lenger sạch sẽ, chỉ c&ograve;n phần thịt v&ocirc; c&ugrave;ng tiện lợi v&agrave; tiết kiệm thời gian cho người d&ugrave;ng.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua ngh&ecirc;u thịt tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Ngh&ecirc;u thịt tươi ngon, được đ&oacute;ng g&oacute;i sẵn, chất lượng, mập v&agrave; dai ngon.</p>
	</li>
	<li>
	<p>Ngh&ecirc;u được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, được lấy thịt tiện lợi, chất lượng.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/302965/bhx/ngheu-thit-lenger-200g-202303220825586965.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của ngh&ecirc;u thịt</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Trong thịt ngh&ecirc;u chứa nhiều dưỡng chất như chất đạm, chất b&eacute;o, kẽm, sắt, magie, canxi, vitamin B, vitamin C,...</p>
	</li>
	<li>
	<p>Trong 100g ngh&ecirc;u thịt chứa khoảng<strong> 148 Kcal</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của ngh&ecirc;u thịt đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Gi&uacute;p tăng cường hệ miễn dịch</p>
	</li>
	<li>
	<p>Nhờ lượng canxi, kẽm gi&uacute;p tăng cường sức khỏe răng miệng v&agrave; xương khớp</p>
	</li>
	<li>
	<p>Tốt cho hoạt động t&igrave;nh dục v&agrave; tuyến gi&aacute;p</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch sơ chế ngh&ecirc;u thịt</strong></h3>

<p>Ngh&ecirc;u thịt được lấy sẵn thịt, bạn chỉ cần rửa sạch thịt ngh&ecirc;u với nước muối lo&atilde;ng v&agrave; mang đi chế biến.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ ngh&ecirc;u thịt</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Ch&aacute;o ngh&ecirc;u v&agrave; h&agrave;nh</p>
	</li>
	<li>
	<p>Canh ngh&ecirc;u rong biển</p>
	</li>
	<li>
	<p>Canh ngh&ecirc;u với rau mồng tơi</p>
	</li>
	<li>
	<p>Ngh&ecirc;u x&agrave;o sa tế</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản ngh&ecirc;u thịt tươi ngon</strong></h3>

<p>Ngh&ecirc;u n&ecirc;n bảo quản trong tủ lạnh để gi&uacute;p ngh&ecirc;u được tươi ngon hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (89, 'Đầu cá hồi đông lạnh 500g (1 - 2 đầu)', 19000, 36000, 'store/images/hai-san/dau-ca-hoi-dong-lanh-500g-1-2-dau-202304130930295445_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Đầu <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech-ca-hoi">c&aacute; hồi</a> c&oacute; xương mềm, b&eacute;o c&oacute; thể nấu canh chua, nấu lẩu,... đầu c&aacute; mua về c&oacute; thể d&ugrave;ng muối v&agrave; chanh để khử m&ugrave;i tanh.&nbsp;<a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/dau-ca-hoi-khay-500g-300g-500g-cai">Đầu c&aacute; hồi tươi đ&ocirc;ng lạnh</a> c&oacute; thể k&eacute;o d&agrave;i thời gian bảo quản, th&iacute;ch hợp cho nhu cầu gia đ&igrave;nh trong việc chế biến v&agrave; mang đến những m&oacute;n ăn bổ dưỡng.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua đầu c&aacute; hồi tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Đầu c&aacute; hồi tươi ngon, nhiều thịt, đầu c&aacute; mềm, thịt b&eacute;o ngọt, được đ&oacute;ng th&agrave;nh khay 500g từ 1 - 2 đầu, h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản thịt c&aacute; được tươi hơn v&agrave; vận chuyển tiện lợi hơn.</li>
	<li>Đầu c&aacute; được đảm bảo nguồn gốc xuất xứ tại Na Uy, Chi L&ecirc;, Anh, Canada</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Đầu cá hồi đông lạnh 500g (1 - 2 đầu) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/274988/bhx/dau-ca-hoi-tuoi-khay-1kg-300g-500g-cai-202203200942163874.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của đầu c&aacute; hồi</strong></h3>

<ul style="margin-left:40px">
	<li>Trong đ&oacute; đầu c&aacute; hồi l&agrave; loại c&aacute; c&oacute; chứa Omega-3 gi&agrave;u EPA v&agrave; DHA, protein c&ugrave;ng nhiều dưỡng chất thiết yếu kh&aacute;c như vitamin B, kali v&agrave; selen,... đều l&agrave; những dưỡng chất cần thiết cho cơ thể.</li>
	<li>Trong 100g đầu c&aacute; hồi c&oacute; khoảng <strong>208 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của đầu c&aacute; hồi đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Gi&uacute;p sản sinh th&ecirc;m collagen</li>
	<li>Cải thiện da, gi&uacute;p chắc khỏe</li>
	<li>Chắc khỏe xương khớp</li>
	<li>Tốt cho hệ ti&ecirc;u h&oacute;a</li>
	<li>Giảm nguy cơ đột quỵ, đau tim</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Đầu cá hồi đông lạnh 500g (1 - 2 đầu) 1" class="lazy" src="https://cdn.tgdd.vn/Files/2019/05/11/1166239/cach-nau-canh-chua-dau-ca-hoi-ngon-dung-chuan-khong-tanh-202208261543533738.jpg" /><br />
<strong>C&aacute;ch sơ chế đầu c&aacute; hồi</strong></h3>
Đầu c&aacute; hồi mua về chặt kh&uacute;c vừa ăn, rửa sạch lại với nước sạch, sau đ&oacute; để r&aacute;o v&agrave; chế biến th&agrave;nh c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ đầu c&aacute; hồi</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-lau-dau-ca-hoi-ngon-ngat-ngay-khong-bi-tanh-1186022">Lẩu đầu c&aacute; hồi</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/hoc-ngay-cach-lam-dau-ca-hoi-chien-toi-man-ngot-mon-nhau-tuyet-voi-1392934">Đầu c&aacute; hồi chi&ecirc;n mắm tỏi mặn ngọt</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/caach-nau-canh-chua-dau-ca-hoi-ngon-dung-chuan-khong-tanh-1166239">Canh chua đầu c&aacute; hồi</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-canh-kim-chi-dau-ca-hoi-thom-ngon-bo-duong-cho-ca-gia-dinh-1337215">Canh đầu c&aacute; hồi nấu kim chi</a></li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản đầu c&aacute; hồi tươi ngon</strong></h3>
Đầu c&aacute; hồi n&ecirc;n được bảo quản trong tủ lạnh để gi&uacute;p c&aacute; được tươi v&agrave; ngon l&acirc;u hơn.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (90, 'Chả basa viên Nhất Tâm 200g', 19000, 25000, 'store/images/hai-san/cha-basa-vien-nhat-tam-goi-200g-202301111045432471_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech" target="_blank">C&aacute; vi&ecirc;n</a> c&oacute; thể d&ugrave;ng chi&ecirc;n, sốt c&agrave; chua hay ăn lẩu, nấu b&uacute;n đều rất dễ d&agrave;ng v&agrave; cho hương vị thơm ngon đ&uacute;ng điệu đến từ&nbsp;<a href="https://www.bachhoaxanh.com/ca-tom-muc-ech-nhat-tam" target="_blank">c&aacute; vi&ecirc;n Nhất T&acirc;m</a>. <a href="https://www.bachhoaxanh.com/ca-vien-bo-vien/cha-basa-vien-nhat-tam-goi-200g" target="_blank">Chả c&aacute; basa vi&ecirc;n Nhất T&acirc;m g&oacute;i 200g</a> được l&agrave;m từ 100% c&aacute; basa tươi ngon v&agrave; chế biến dạng vi&ecirc;n tr&ograve;n nhỏ xinh, vừa miệng, cung cấp&nbsp;dinh dưỡng v&agrave; năng lượng.</div>

<ul style="margin-left:40px">
	<li>T&ecirc;n sản phẩm
	<div>Chả c&aacute; basa vi&ecirc;n Nhất T&acirc;m 200g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>C&aacute; basa (96%), tinh bột biến t&iacute;nh, tinh bột bắp, muối, chất điều vị (621), chất ổn định, h&agrave;nh t&iacute;m, ti&ecirc;u.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Chi&ecirc;n, nướng, nấu canh, lẩu hoặc chế biến c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nhiệt độ m&aacute;t 0 - 4 độ C. Bảo quản đ&ocirc;ng ở nhiệt độ dưới -18 độ C</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Thương hiệu
	<div>Nhất T&acirc;m (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua Chả basa vi&ecirc;n Nhất T&acirc;m g&oacute;i 200g tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Chả c&aacute; tươi ngon, được l&agrave;m từ c&aacute; basa 96%, chất lượng.</p>
	</li>
	<li>
	<p>Chả c&aacute; được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đảm bảo nguồn nguy&ecirc;n liệu.</p>
	</li>
	<li>
	<p>Đặt giao h&agrave;ng nhanh</p>
	</li>
</ul>

<h3><img alt="Chả basa viên Nhất Tâm 200g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/299835/bhx/cha-basa-vien-nhat-tam-goi-200g-202212301120110788.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của Chả basa vi&ecirc;n Nhất T&acirc;m g&oacute;i 200g</strong></h3>

<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Trong chả c&aacute; basa chứa nhiều chất đạm, chất b&eacute;o, natri, kali, kẽm, vitamin B1, vitamin B6,...</p>
	</li>
	<li>
	<p>Trong 100g chả c&aacute; basa c&oacute; khoảng<strong> 220 Kcal</strong></p>
	</li>
</ul>

<h3><img alt="Chả basa viên Nhất Tâm 200g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/299835/bhx/cha-basa-vien-nhat-tam-goi-200g-202301111045569825.jpg" /><br />
<strong>T&aacute;c dụng của Chả basa vi&ecirc;n Nhất T&acirc;m g&oacute;i 200g đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp dưỡng chất cho cơ thể</p>
	</li>
	<li>
	<p>Hỗ trợ tăng cường xương khớp khỏe mạnh</p>
	</li>
	<li>
	<p>Cung cấp năng lượng cho cơ thể hoạt động</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ Chả basa vi&ecirc;n Nhất T&acirc;m g&oacute;i 200g</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Chả c&aacute; basa chi&ecirc;n</p>
	</li>
	<li>
	<p>Chả c&aacute; basa ăn với lẩu</p>
	</li>
	<li>
	<p>Chả c&aacute; basa x&agrave;o ớt chu&ocirc;ng</p>
	</li>
	<li>
	<p>Chả c&aacute; basa cuốn cải bẹ hấp</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản&nbsp; tươi ngon</strong></h3>

<p>Chả c&aacute; basa bảo quản ở ngăn m&aacute;t từ 0-4 độ C, hoặc ngăn đ&ocirc;ng &lt;-18 độ C.</p>
</div>
</div>', 'thit-tuoi-song', 0, 23, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (91, 'Cá cam đông lạnh 700g - 900g/co', 49000, 59000, 'store/images/hai-san/ca-cam-nguyen-con-dong-lanh-700g-900g-202304011236374524_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">L&agrave; loại <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">c&aacute;</a> biển bổ dưỡng, được nhiều người y&ecirc;u th&iacute;ch, chứa nhiều chất dinh dưỡng tốt cho sức khoẻ như omega-3, protein, vitamin E, A...&nbsp;<a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ca-cam-nguyen-con-dong-lanh-tui-700g-900g">C&aacute; cam</a> tươi đ&ocirc;ng lạnh&nbsp;gi&uacute;p bảo quản l&acirc;u hơn m&agrave; thịt c&aacute; vẫn chắc, kh&ocirc;ng bở m&agrave; vẫn giữ nguy&ecirc;n vị đậm đ&agrave;.</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>700g - 900g</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua c&aacute; cam nguy&ecirc;n con tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; cam nguy&ecirc;n con tươi, chất lượng, nguy&ecirc;n con đ&oacute;ng t&uacute;i. C&aacute; thịt dai ngon, chắc v&agrave; thịt.</li>
	<li>C&aacute; cam được đ&oacute;ng t&uacute;i, h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản c&aacute; tốt hơn, vận chuyển cũng tiện lợi hơn. C&aacute; được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cá cam nguyên con đông lạnh 700g - 900g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/279490/bhx/ca-cam-nguyen-con-tui-14kg-202205030837123024.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của c&aacute; cam</strong></h3>

<ul style="margin-left:40px">
	<li>Chứa nhiều vitamin A, vitamin E, omega 3, c&aacute;c kho&aacute;ng chất như sắt, kẽm, đồng,...</li>
	<li>Trong 100g c&aacute; cam c&oacute; khoảng <strong>102 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của c&aacute; cam đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Ngăn ngừa c&aacute;c bệnh về tim mạch</li>
	<li>Giảm cholesterol trong m&aacute;u</li>
	<li>Giảm nguy cơ đột quỵ</li>
	<li>Tăng cường sức đề kh&aacute;ng</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Cá cam nguyên con đông lạnh 700g - 900g 1" class="lazy" src="https://cdn.tgdd.vn/Files/2020/06/11/1262187/cach-lam-mon-ca-cam-nuong-giay-bac-dam-da-hap-dan--760x367.jpg" /><br />
<strong>C&aacute;ch sơ chế c&aacute; cam</strong></h3>
C&aacute; cam mua về n&ecirc;n ch&agrave; s&aacute;t mặt c&aacute; với một &iacute;t muối v&agrave; chanh để gi&uacute;p c&aacute; khử m&ugrave;i tanh, rửa sạch lại với nước.

<h3><strong>Ưu điểm của c&aacute; tươi đ&ocirc;ng lạnh</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; được lạnh nhanh ở nhiệt độ - 40 độ C, trữ đ&ocirc;ng ở -18 độ C đảm bảo được h&agrave;m lượng dinh dưỡng trong c&aacute;</li>
	<li>C&oacute; thể bảo quản l&acirc;u m&agrave; kh&ocirc;ng mất đi dưỡng chất, tiện lợi khi sử dụng</li>
	<li>Mỗi loại được đ&oacute;ng g&oacute;i ri&ecirc;ng, đảm bảo vi khuẩn kh&ocirc;ng c&oacute; khả năng x&acirc;m nhập</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute; cam</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; cam kho thơm chua ngọt ngon miệng</li>
	<li>C&aacute; cam kho gừng đậm vị</li>
	<li>C&aacute; cam kho nước dừa ngọt thanh</li>
	<li>C&aacute; cam kho c&agrave; chua mới lạ độc đ&aacute;o</li>
</ul>

<h3><strong>C&aacute;ch bảo quản c&aacute; cam tươi ngon</strong></h3>
C&aacute; cam n&ecirc;n được bảo quản trong tủ lạnh để gi&uacute;p bảo quản được l&acirc;u cũng như đảm bảo chất lượng sản phẩm.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (92, 'Cua thịt Cà Mau 1 con (230g - 280g)', 118000, 149000, 'store/images/hai-san/cua-thit-ca-mau-1-con-230g-280g-202304130935250914_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Cua thịt nguy&ecirc;n con, tươi ngon, thịt cua chắc, ngọt thịt. <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/cua-thit-ca-mau-hop-1-con">Cua</a> thịt gi&agrave;u dinh dưỡng, hương vị thơm ngon, hấp dẫn, được nhiều người y&ecirc;u th&iacute;ch lựa chọn. Cua thịt tại B&aacute;ch h&oacute;a XANH chất lượng, đảm bảo độ tươi, mang đến sự h&agrave;i l&ograve;ng của kh&aacute;ch h&agrave;ng.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua cua thịt tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Cua kh&ocirc;ng t&iacute;nh d&acirc;y, bao chắc thịt. Cua thịt to con, vỏ chắc, tươi ngon, chất lượng, <strong>bao ăn</strong>. Đặc biệt cua vẫn c&ograve;n sống. Cua thịt c&oacute; thịt ngọt, thơm dai rất hấp dẫn.</li>
	<li>Cua thịt tươi ngon, được đảm bảo nguồn gốc r&otilde; r&agrave;ng, an t&acirc;m cho người d&ugrave;ng.</li>
</ul>

<h3><img alt="Cua thịt Cà Mau 1 con (230g - 280g) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/302665/bhx/cua-thit-ca-mau-hop-1-con-250g-300g-202302181343337536.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của cua thịt</strong></h3>

<ul style="margin-left:40px">
	<li>Cua thịt c&oacute; chứa nhiều kho&aacute;ng chất như canxi, kali, phốt pho, selen, kẽm, đồng,... c&ugrave;ng nhiều vitamin như vitamin B1, vitamin B2, vitamin PP, c&ugrave;ng nhiều dưỡng chất kh&aacute;c nhau.</li>
	<li>Trong 100g thịt cua c&oacute; khoảng <strong>143 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của cua thịt đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tăng cường sức khỏe thị lực</li>
	<li>Giảm nguy cơ bị ung thư</li>
	<li>Th&uacute;c đẩy qu&aacute; tr&igrave;nh ph&aacute;t triển cơ bắp</li>
	<li>Cải thiện sức khỏe tim mạch</li>
</ul>

<h3><img alt="Cua thịt Cà Mau 1 con (230g - 280g) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/302665/bhx/cua-thit-ca-mau-hop-1-con-250g-300g-202302181343358226.jpg" /><br />
<strong>C&aacute;ch sơ chế cua thịt</strong></h3>
Lật bụng cua l&ecirc;n, d&ugrave;ng dao mũi nhọn chọc thẳng v&agrave;o nơi l&otilde;m xuống ở bụng đến khi ch&acirc;n v&agrave; c&agrave;ng cua duỗi ra. Bỏ mai cua v&agrave; rửa sạch nhiều lần với nước.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ cua thịt</strong></h3>

<ul style="margin-left:40px">
	<li>Cua hấp</li>
	<li>Cua nướng</li>
	<li>Cua rang me</li>
	<li>Ch&aacute;o cua thịt</li>
	<li>Cua thịt nấu chảo</li>
</ul>

<h3><strong>C&aacute;ch bảo quản cua thịt tươi ngon</strong></h3>
Cua sau khi nhận bỏ nơi tho&aacute;ng m&aacute;t, kh&ocirc;ng bỏ cua ngập trong nước/ trong bọc k&iacute;n hơi<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (93, 'Cua huỳnh đế 1 con từ 550g', 776000, 800000, 'store/images/hai-san/cua-huynh-de-1-con-tu-550g-202304250926590935_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/cua-huynh-de-1-con">Cua huỳnh đế</a> l&agrave; loại cua biển, c&oacute; thịt ngon, săn chắc, ngọt v&ocirc; c&ugrave;ng hấp dẫn v&agrave; chứa nhiều dưỡng chất cần thiết cho cơ thể. Cua huỳnh đế nguy&ecirc;n con tươi, chất lượng, c&oacute; thể chế biến nhiều m&oacute;n ăn ngon như cua huỳnh đế nướng, nấu ch&aacute;o, rang me,...</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua cua huỳnh đế tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Cua huỳnh đế <strong>c&ograve;n sống</strong>, c&oacute; khối lượng từ 550g, <strong>cua to, thịt ngọt, chắc v&agrave; ngon</strong>. Đ&acirc;y l&agrave; loại cua biển tươi ngon, c&oacute; 6 ch&acirc;n v&agrave; 2 c&agrave;ng, lớp vỏ ngo&agrave;i m&agrave;u đỏ cam đẹp, l&agrave; loại hải sản qu&yacute;, cao cấp kh&ocirc;ng chỉ c&oacute; gi&aacute; trị kinh tế cao m&agrave; c&ograve;n l&agrave; một đặc sản, c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon.</p>
	</li>
	<li>
	<p>Cua huỳnh đế c&oacute; nguồn gốc dọc biển miền đ&ocirc;ng, Phan Thiết v&agrave; Kh&aacute;nh Ho&agrave;.</p>
	</li>
	<li>
	<p>Đặt mua online nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i hấp dẫn.</p>
	</li>
</ul>

<h3><img alt="Cua huỳnh đế 1 con từ 550g 0" class="lazy" src="https://product.hstatic.net/1000030244/product/cua-huynh-de-4_185b2f04a87b40f8a0b4b0b198cb5668_grande.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của cua huỳnh đế</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Kh&ocirc;ng chỉ thơm ngon, cua huỳnh đế c&ograve;n chứa nhiều dinh dưỡng qu&yacute; b&aacute;u cho cơ thể như chứa nhiều protein, chất b&eacute;o, gi&agrave;u vitamin B12, vitamin D, vitamin A cũng c&aacute;c kho&aacute;ng chất như photpho, kẽm, đồng, canxi, selen,...</p>
	</li>
	<li>
	<p>Trong 100g cua huỳnh đế c&oacute; khoảng <strong>62.4 Kcal</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của cua huỳnh đế đối với sức khỏe</strong></h3>

<p>Cua huỳnh đế l&agrave; loại hải sản rất c&oacute; lợi cho sức khỏe như duy tr&igrave; sức khỏe của tế b&agrave;o thần kinh, gi&uacute;p sản sinh, ph&aacute;t triển hồng huyết cầu, bổ tủy, bổ xương, giảm đau, tốt cho người hoạt động tr&iacute; n&atilde;o cường độ cao. Ngo&agrave;i ra, ch&uacute;ng c&ograve;n gi&uacute;p tăng cường sức đề kh&aacute;ng cho cơ thể.</p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ cua huỳnh đế</strong></h3>

<p>Cua huỳnh đế thịt săn chắc, ngọt v&agrave; thơm ngon. Ph&ugrave; hợp cho những buổi tiệc. C&agrave;ng ăn c&agrave;ng th&iacute;ch, c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cua huỳnh đế hấp chấm muối ti&ecirc;u xanh</p>
	</li>
	<li>
	<p>Cua huỳnh đế sốt bơ tỏi</p>
	</li>
	<li>
	<p>Lẩu cua huỳnh đế</p>
	</li>
	<li>
	<p>Cua huỳnh đế rang muối Hồng K&ocirc;ng</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Ph&acirc;n biệt cua huỳnh đế v&agrave; cua ho&agrave;ng đế</strong></h3>

<p>Nhiều người thường nhầm lẫn cua huỳnh đế với cua ho&agrave;ng đế l&agrave; một. Tuy nhi&ecirc;n đ&acirc;y l&agrave; hai loại cua kh&aacute;c nhau:</p>

<ul style="margin-left:40px">
	<li>
	<p><strong>Xuất xứ</strong>: Cua huỳnh đế sống chủ yếu ven biển miền Trung Việt Nam; cua ho&agrave;ng đế sống ở nơi kh&iacute; hậu v&agrave; nhiệt độ đặc biệt khắc nghiệt như v&ugrave;ng biển Alaska (Mỹ).</p>
	</li>
	<li>
	<p><strong>H&igrave;nh d&aacute;ng</strong>: Cua huỳnh đế c&oacute; m&igrave;nh khum tr&ograve;n, mai h&igrave;nh vu&ocirc;ng m&agrave;u cam đỏ, giống 1 con bọ, c&agrave;ng v&agrave; ch&acirc;n ngắn, đầu cua d&agrave;i v&agrave; c&oacute; nhiều r&acirc;u. Trong khi cua ho&agrave;ng đế c&oacute; vỏ rất cứng m&agrave;u x&aacute;m với nhiều gai, sải ch&acirc;n rất d&agrave;i, tr&ocirc;ng như 1 con nhện khổng lồ.</p>
	</li>
	<li>
	<p><strong>K&iacute;ch thước:</strong> Cua huỳnh đế to bằng 1 b&agrave;n tay x&ograve;e, trọng lượng trung b&igrave;nh dưới 1kg/con. Cua ho&agrave;ng đế to bằng 2 b&agrave;n tay x&ograve;e, trung b&igrave;nh từ 2 - 4kg/con.</p>
	</li>
</ul>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (94, 'Tôm càng xanh 500g (8 - 15 con)', 95000, 150000, 'store/images/hai-san/tom-cang-xanh-500g-8-15-con-202304241108152980_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">T&ocirc;m</a> l&agrave; nguồn dinh dưỡng dồi d&agrave;o, cung cấp h&agrave;m lượng canxi v&agrave; sắt rất cao cho chế độ ăn hằng ng&agrave;y. Khi thưởng thức, bạn sẽ cảm nhận phần thịt ngọt nước v&agrave; hơi dai. Ngo&agrave;i ra, <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/tom-cang-tui-500g">t&ocirc;m c&agrave;ng</a> với k&iacute;ch thước to&nbsp;n&ecirc;n thường được d&ugrave;ng để trang tr&iacute; c&aacute;c m&oacute;n ăn trong bữa tiệc hoặc bữa cơm gia đ&igrave;nh.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua t&ocirc;m c&agrave;ng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m c&agrave;ng to con, thịt ngọt, dai v&agrave; tươi. T&ocirc;m được đ&oacute;ng khay <strong>500g</strong>. T&ocirc;m c&agrave;ng được đ&oacute;ng khay h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản v&agrave; vận chuyển tiện lợi hơn.</li>
	<li>T&ocirc;m được đảm bảo nguồn gốc xuất r&otilde; r&agrave;ng.</li>
</ul>

<h3><img alt="Tôm càng xanh 500g (8 - 15 con) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/249433/bhx/tom-cang-khay-500g-10-20-con-kg-202203071800101424.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của t&ocirc;m c&agrave;ng</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m c&agrave;ng c&oacute; chứa nhiều chất dinh dưỡng cần thiết cho cơ thể như chất đạm, chất b&eacute;o, canxi, phốt pho, sắt, vitamin B1, vitamin B2, vitamin PP,...</li>
	<li>Trong 100g t&ocirc;m c&agrave;ng c&oacute; khoảng <strong>56 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của t&ocirc;m c&agrave;ng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>L&agrave; một trong số rất &iacute;t c&aacute;c loại thực phẩm m&agrave; vừa &iacute;t năng lượng lại vừa cung cấp nhiều dinh dưỡng. H&agrave;m lượng c&aacute;c chất dinh dưỡng m&agrave; đặc biệt l&agrave; protein c&oacute; trong t&ocirc;m rất cao.</p>
	</li>
	<li>
	<p>Bổ sung đầy đủ omega 3 sẽ c&oacute; tr&iacute; nhớ tốt v&agrave; khả năng ph&aacute;t triển của n&atilde;o bộ sẽ vượt trội đ&aacute;ng kể.</p>
	</li>
	<li>
	<p>Cung cấp canxi dồi d&agrave;o,&nbsp;th&uacute;c đẩy h&igrave;nh th&agrave;nh một hệ thống xương khớp khỏe mạnh.</p>
	</li>
	<li>
	<p>C&oacute; khả năng ngừa ung thư nhờ c&oacute; khả năng ngăn chặn những tế b&agrave;o ung thư ph&aacute;t triển.</p>
	</li>
</ul>

<h3><img alt="Tôm càng xanh 500g (8 - 15 con) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/249433/bhx/tom-cang-khay-500g-10-20-con-kg-202203071800597343.jpeg" /><br />
<strong>C&aacute;ch sơ chế t&ocirc;m c&agrave;ng</strong></h3>
T&ugrave;y v&agrave;o m&oacute;n ăn c&oacute; thể sơ chế t&ocirc;m c&agrave;ng kh&aacute;c nhau. Bạn c&oacute; thể rửa sạch t&ocirc;m với nước, giữ nguy&ecirc;n vỏ hoặc lột vỏ để chế biến.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ t&ocirc;m c&agrave;ng</strong></h3>
T&ocirc;m c&agrave;ng c&oacute; thể chế biến nhiều m&oacute;n ăn ngon như:

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tom-luoc-binh-thuong-xua-roi-tom-luoc-nuoc-dua-moi-chuan-ngon-1175546">T&ocirc;m luộc nước dừa</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mien-xao-tom-ngon-964001">Miến x&agrave;o t&ocirc;m</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/thom-mui-toi-ngay-vi-bo-voi-mon-tom-xao-bo-toi-1178803">T&ocirc;m x&agrave;o bơ tỏi</a></li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản t&ocirc;m c&agrave;ng tươi ngon</strong></h3>
T&ocirc;m c&agrave;ng n&ecirc;n được bảo quản trong tủ lạnh để gi&uacute;p t&ocirc;m tươi v&agrave; ngon l&acirc;u hơn.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (95, 'Tép rong 500g', 89000, 93000, 'store/images/hai-san/tep-rong-500g-202304220915553772_300x300.jpg', '<div class="details"><h2 class="textinfpro" id="specification">Thông tin sản phẩm</h2><div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/tep-rong-500g">Tép rong</a> có nguồn gốc ở đồng bằng sông Cửu Long. Tép có kích thước khá nhỏ hơn nhiều so với tôm nên có thể ăn tép rong nguyên con, không cần lột vỏ như các con tôm lớn. Vị của chúng của khá ngọt, thích hợp để chế biến thành nhiều món ăn đơn giản trong các bữa cơm gia đình.</div></div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01.932150', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (96, 'Tôm hùm bông nguyên con từ 230g - 300g', 190000, 0, 'store/images/hai-san/tom-hum-bong-nguyen-con-tu-230g-300g-202303041457407993_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/tom-hum-nguyen-con-tu-230g-tro-len">T&ocirc;m h&ugrave;m b&ocirc;ng</a>&nbsp;l&agrave; <strong>t&ocirc;m tươi</strong> ngon, c&oacute; thịt ngọt v&agrave; dai, l&agrave; t&ocirc;m ngộp c&oacute; nguồn gốc tại Kh&aacute;nh H&ograve;a. L&agrave; loại <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">hải sản</a> gi&agrave;u dinh dưỡng,&nbsp;cung cấp h&agrave;m lượng canxi v&agrave; sắt rất cao cho chế độ ăn hằng ng&agrave;y. T&ocirc;m h&ugrave;m b&ocirc;ng c&ograve;n mang lại nhiều lợi &iacute;ch cho sức khỏe.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua t&ocirc;m h&ugrave;m tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li><strong>T&ocirc;m&nbsp;h&ugrave;m b&ocirc;ng, nguồn gốc Kh&aacute;nh H&ograve;a</strong>, chất lượng,&nbsp;c&oacute; thịt dai, ngọt.</li>
	<li>T&ocirc;m h&ugrave;m c&oacute; khối lượng từ <strong>230g-300g/ 1con.</strong></li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của t&ocirc;m h&ugrave;m</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m h&ugrave;m l&agrave; nguồn cung cấp dưỡng chất dồi d&agrave;o cho cơ thể. T&ocirc;m h&ugrave;m chứa nhiều kho&aacute;ng chất như <strong>đồng, selen, kẽm</strong>,... c&aacute;c v<strong>itamin B12, vitamin E v&agrave; lượng &iacute;t chất b&eacute;o omega 3.</strong></li>
	<li>Trong 100g t&ocirc;m h&ugrave;m c&oacute; chứa khoảng <strong>145 calo</strong>.</li>
</ul>

<h3><strong>T&aacute;c dụng của t&ocirc;m h&ugrave;m đối với sức khỏe</strong></h3>

<p>T&ocirc;m h&ugrave;m l&agrave; một thực phẩm chứa h&agrave;m lượng cao acid b&eacute;o Omega 3 n&ecirc;n rất tốt để giảm lượng Cholesterol trong cơ thể. Ngo&agrave;i ra trong t&ocirc;m h&ugrave;m c&ograve;n cung cấp lượng đồng v&agrave; Selen rất cao cho c&oacute; thể.&nbsp;Ch&iacute;nh v&igrave; thế, t&ocirc;m h&ugrave;m c&oacute; rất nhiều lợi &iacute;ch cho sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Tốt cho người bị thiếu m&aacute;u</p>
	</li>
	<li>
	<p>Tốt cho hệ thần kinh</p>
	</li>
	<li>
	<p>...</p>
	</li>
</ul>

<h3><img alt="Tôm hùm bông nguyên con từ 230g - 300g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/277527/bhx/tom-hum-xanh-nguyen-con-300g-350g-202205281638348085.jpg" /></h3>

<h3><strong>C&aacute;ch chọn t&ocirc;m h&ugrave;m tươi ngon</strong></h3>
Để <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-chon-tom-hum-tuoi-ngon-1167902">chọn t&ocirc;m h&ugrave;m tươi ngon</a>, bạn c&oacute; thể tham khảo những mẹo dưới đ&acirc;y:

<ul style="margin-left:40px">
	<li>C&oacute; vỏ b&ecirc;n ngo&agrave;i b&oacute;ng lo&aacute;ng, bắt mắt</li>
	<li>C&agrave;ng t&ocirc;m h&ugrave;m chắc khỏe, m&agrave;u sắc trong xanh</li>
	<li>C&oacute; phần khớp nối giữa đầu v&agrave; th&acirc;n kh&iacute;t nhau</li>
	<li>C&agrave;ng t&ocirc;m kh&ocirc;ng bị rụng rời khỏi th&acirc;n t&ocirc;m h&ugrave;m</li>
	<li>T&ocirc;m h&ugrave;m kh&ocirc;ng bốc m&ugrave;i hay bị chảy nhớt</li>
</ul>

<h3><strong>C&aacute;ch b&oacute;c t&ocirc;m h&ugrave;m nhanh chuẩn</strong></h3>

<ul style="margin-left:40px">
	<li><strong>C&aacute;ch b&oacute;c t&ocirc;m h&ugrave;m sống</strong></li>
</ul>
- D&ugrave;ng tay tr&aacute;i giữ phần đầu t&ocirc;m, giữ t&ocirc;m nằm s&aacute;t v&agrave; cố định tr&ecirc;n thớt.&nbsp;<br />
- Tay phải d&ugrave;ng dao đ&acirc;m v&agrave;o phần khớp nối giữa đầu v&agrave; đu&ocirc;i t&ocirc;m, &aacute;p s&aacute;t lưỡi dao v&agrave;o vỏ t&ocirc;m rồi xoay đều lưỡi dao theo chiều kim đồng hồ. Lấy đầu v&agrave; th&acirc;n t&ocirc;m<br />
- Lật ngửa đu&ocirc;i t&ocirc;m tr&ecirc;n thớt, d&ugrave;ng k&eacute;o cắt dọc 2 b&ecirc;n vỏ bụng t&ocirc;m, tiếp theo d&ugrave;ng dao c&oacute; mũi nhọn rạch từ từ phần vỏ bụng dưới đi.<br />
- Tương tự bạn đ&acirc;m mũi dao v&agrave;o theo vỏ lưng t&ocirc;m, rạch từ từ từng ch&uacute;t một để t&aacute;ch rời phần thịt t&ocirc;m.
<ul style="margin-left:40px">
	<li><strong>C&aacute;ch b&oacute;c t&ocirc;m h&ugrave;m ch&iacute;n</strong></li>
</ul>
- D&ugrave;ng tay tr&aacute;i cố định phần đầu t&ocirc;m, tay c&ograve;n lại giữ th&acirc;n t&ocirc;m, &nbsp;xoay th&acirc;n t&ocirc;m hơn 1 nửa v&ograve;ng rồi k&eacute;o rời th&acirc;n ra khỏi đầu t&ocirc;m.<br />
- Cho th&acirc;n t&ocirc;m đặt trong l&ograve;ng b&agrave;n tay, ng&oacute;n tay c&aacute;i đặt ở mặt dưới bụng t&ocirc;m, ấn giữ vừa phải. Tay c&ograve;n lại b&oacute;p đều, vừa b&oacute;p vừa miết nhẹ to&agrave;n th&acirc;n t&ocirc;m để lấy thịt t&ocirc;m ra
<h3><strong>Mẹo bảo quản t&ocirc;m h&ugrave;m tươi ngon</strong></h3>
T&ocirc;m h&ugrave;m n&ecirc;n bảo quản bằng c&aacute;ch d&ugrave;ng giấy ẩm bọc lại hoặc sử dụng t&uacute;i giấy, để v&agrave;o ngăn đ&ocirc;ng tủ lạnh. Tuy nhi&ecirc;n kh&ocirc;ng n&ecirc;n để t&ocirc;m qu&aacute; l&acirc;u trong tủ đ&ocirc;ng

<h3><strong>C&aacute;ch chế biến t&ocirc;m h&ugrave;m</strong></h3>

<p>Những <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cac-mon-ngon-tu-tom-hum-ma-ban-nen-biet-1168987">m&oacute;n ăn ngon từ t&ocirc;m h&ugrave;m </a>bạn c&oacute; thể tham khảo như:</p>

<ul style="margin-left:40px">
	<li><strong>T&ocirc;m h&ugrave;m nướng</strong>: t&ocirc;m h&ugrave;m mua về rửa sạch, ng&acirc;m nước muối 10 ph&uacute;t để bớt tanh. Cho t&ocirc;m h&ugrave;m l&ecirc;n vỉ than, rồi bắt đầu nướng, đến khi ch&iacute;n đều 2 mặt l&agrave; được</li>
	<li><strong>T&ocirc;m h&ugrave;m hấp</strong>: Cho t&ocirc;m h&ugrave;m ng&acirc;m ngập trong bia 30 - 45 ph&uacute;t.Cho phần nước bia đ&atilde; ướp t&ocirc;m h&ugrave;m v&agrave;o nồi, rồi cho t&ocirc;m h&ugrave;m l&ecirc;n tr&ecirc;n xửng hấp đến khi t&ocirc;m ch&iacute;n</li>
	<li><strong>T&ocirc;m h&ugrave;m sốt ph&ocirc; mai</strong>: Rửa sạch t&ocirc;m h&ugrave;m. Bắt chảo n&oacute;ng, cho th&ecirc;m bơ, tỏi bằm, &iacute;t đường, &iacute;t bột n&ecirc;m, 2 muỗng c&agrave; ph&ecirc;,...vừa miệng. Sau đ&oacute; cho t&ocirc;m v&agrave;o đảo đều đến khi đỏ vỏ. Cho ph&ocirc; mai v&agrave;o k&iacute;n mặt chảo, đến kho ph&ocirc; mai tan chảy hết th&igrave; được.</li>
</ul>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (97, 'Tôm sú nguyên con 500g', 148000, 163000, 'store/images/hai-san/tom-su-nguyen-con-500g-10-13-con-202304220918426447_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">T&ocirc;m</a> s&uacute; l&agrave; loại thực phẩm quen thuộc, c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon như luộc, hấp, nướng, c&aacute;c m&oacute;n lẩu,.... Thịt <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/tom-su-nguyen-con-khay-500g-12-15-con">t&ocirc;m s&uacute;</a> dai dai, c&oacute; vị ngọt rất hấp dẫn. T&ocirc;m s&uacute; tại B&aacute;ch ho&aacute; XANH rất tươi ngon v&agrave; được nhiều b&agrave; nội trợ chọn mua.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua t&ocirc;m s&uacute; tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m s&uacute; tươi ngon, chất lượng, được đ&oacute;ng khay <strong>500g từ 10 - 13&nbsp;con</strong>. Thịt t&ocirc;m chắc, ngọt, dai ngon, cực kỳ chất lượng.</li>
	<li>T&ocirc;m được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng, đ&ocirc;ng lạnh, được đ&oacute;ng khay h&uacute;t ch&acirc;n gi&uacute;p t&ocirc;m được đảm bảo tươi ngon, chất lượng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Tôm sú nguyên con 500g (10 - 13 con) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/285416/bhx/tom-su-nguyen-con-khay-500g-12-15-con-202207261009153581.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của t&ocirc;m s&uacute;</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m s&uacute; chứa nhiều chất đạm, c&aacute;c kho&aacute;ng chất như canxi, kali, magie, sắt,... c&aacute;c vitamin như vitamin B1, vitamin A, vitamin D v&agrave; c&aacute;c chất dinh dưỡng kh&aacute;c.</li>
	<li>Trong 100g t&ocirc;m s&uacute; c&oacute; khoảng <strong>99 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của t&ocirc;m s&uacute; đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Giảm nguy cơ bị ung thư</li>
	<li>Hỗ trợ qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>Hỗ trợ qu&aacute; tr&igrave;nh tạo m&aacute;u v&agrave; t&aacute;i tạo mạch m&aacute;u</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế t&ocirc;m s&uacute;</strong></h3>

<ul style="margin-left:40px">
	<li>Bước 1: Bạn giữ chặt t&ocirc;m tr&ecirc;n tay, sau đ&oacute; d&ugrave;ng đầu ng&oacute;n tay trỏ v&agrave; ng&oacute;n tay c&aacute;i một b&ecirc;n giữ chặt phần đầu, c&ograve;n đầu ng&oacute;n tay trỏ v&agrave; ng&oacute;n tay c&aacute;i c&ograve;n lại giữ chặt phần th&acirc;n t&ocirc;m (điểm gần với khớp nối giữa đầu với th&acirc;n).</li>
	<li>Bước 2: Thực hiện thao t&aacute;c gập phần đầu với th&acirc;n, đồng thời b&oacute;p phần t&uacute;i ph&acirc;n ra ngo&agrave;i.</li>
	<li>Bước 3: Tiếp theo, nắm giữ một phần chỉ đen rồi k&eacute;o ra. Cuối c&ugrave;ng rửa sạch t&ocirc;m lại với nước sạch.</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ t&ocirc;m s&uacute;</strong></h3>

<ul style="margin-left:40px">
	<li>Cuối tuần healthy với <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cuoi-tuan-healthy-voi-mon-salad-cam-tom-su-thanh-mat-1307878">salad cam t&ocirc;m s&uacute;</a></li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tom-su-tam-bot-chien-xu-ngon-dung-dieu-khong-phai-ai-cung-biet-cach-lam-1248691">T&ocirc;m s&uacute; tempura</a> chuẩn Nhật</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tom-luoc-binh-thuong-xua-roi-tom-luoc-nuoc-dua-moi-chuan-ngon-1175546">T&ocirc;m luộc nước dừa</a> si&ecirc;u ngon</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-mien-xao-tom-ngon-964001">Miến x&agrave;o t&ocirc;m</a> ngon ngất ng&acirc;y</li>
	<li>T&ocirc;m x&agrave;o bơ tỏi</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-tom-rang-toi-don-gian-nhung-ngon-ngat-ngay-1239942">T&ocirc;m rang tỏi</a></li>
	<li>Ch&aacute;o t&ocirc;m cho b&eacute;</li>
</ul>

<h3><strong>C&aacute;ch bảo quản t&ocirc;m s&uacute; tươi ngon</strong></h3>
T&ocirc;m s&uacute; mua về n&ecirc;n sử dụng ngay để đảm bảo được độ tươi ngon, nếu kh&ocirc;ng sử dụng kịp, bạn c&oacute; thể bảo quản t&ocirc;m trong ngăn m&aacute;t để bảo quản t&ocirc;m.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (98, 'Tôm thẻ nguyên con 250g (10-13 con)', 50000, 0, 'store/images/hai-san/tom-the-nguyen-con-250g-10-13-con-202304220922260090_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">T&ocirc;m</a> thẻ khay tại B&aacute;ch ho&aacute; XANH tươi ngon v&ocirc; c&ugrave;ng, t&ocirc;m to, thịt ngọt v&agrave; cầm rất chắc tay, d&ugrave;ng l&agrave;m nguy&ecirc;n liệu ch&iacute;nh cho nhiều m&oacute;n ăn. <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/tom-the-nguyen-con-khay-250g">T&ocirc;m thẻ</a> chứa nhiều năng lượng v&agrave; protein tốt cho cơ thể, từ trẻ em cho đến người gi&agrave; ai cũng c&oacute; thể ăn t&ocirc;m thẻ.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>T&ocirc;m thẻ</div>
	</li>
	<li>Khối lượng
	<div>250g</div>
	</li>
	<li>Đ&oacute;ng g&oacute;i
	<div>H&uacute;t ch&acirc;n kh&ocirc;ng</div>
	</li>
	<li>Bảo quản
	<div>4 ng&agrave;y kể từ ng&agrave;y đ&oacute;ng g&oacute;i (nhiệt độ từ 2 - 5 độ C)</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua t&ocirc;m thẻ tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m thẻ tươi ngon, to con, thịt dai, ngọt, gi&ograve;n. T&ocirc;m chất lượng, được đ&oacute;ng khay <strong>250g từ 10 - 13 con.</strong></li>
	<li>T&ocirc;m được đ&oacute;ng t&uacute;i h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản v&agrave; vận chuyển tiện lợi hơn, được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Tôm thẻ nguyên con 250g (10 - 13 con) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/281942/bhx/tom-the-nguyen-con-khay-250g-202205261316012917.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của t&ocirc;m thẻ</strong></h3>

<ul style="margin-left:40px">
	<li>Loại t&ocirc;m chứa rất nhiều nguồn năng lượng, dưỡng chất cần thiết cho cơ thể con người bao gồm: Protein, chất b&eacute;o, Kali, Vitamin B12, vitamin A, D, canxi,...</li>
	<li>Trong 100g t&ocirc;m thẻ c&oacute; khoảng <strong>99 Kcal.</strong></li>
</ul>

<h3><strong>T&aacute;c dụng của t&ocirc;m thẻ đối với sức khỏe</strong></h3>
T&ocirc;m thẻ với gi&aacute; trị dinh dưỡng vượt trội rất hữu &iacute;ch cho qu&aacute; tr&igrave;nh ph&aacute;t triển thể chất, n&atilde;o bộ ở trẻ em. Đồng thời, tăng cường sức đề kh&aacute;ng cho người cao tuổi.

<h3><img alt="Tôm thẻ nguyên con 250g (10 - 13 con) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/281942/bhx/tom-the-nguyen-con-khay-250g-202205261316023182.jpg" /><br />
<strong>C&aacute;ch sơ chế t&ocirc;m thẻ</strong></h3>

<ul style="margin-left:40px">
	<li>Rửa t&ocirc;m với nước sạch. Cắt bỏ phần r&acirc;u.</li>
	<li>Lột vỏ t&ocirc;m nhanh, bạn c&oacute; thể h&ograve;a tan một ch&uacute;t ph&egrave;n chua với nước rồi cho t&ocirc;m v&agrave;o ng&acirc;m một l&uacute;c.</li>
	<li>Khứa nhẹ nh&agrave;ng t&aacute;ch lấy phần chỉ đen ở lưng t&ocirc;m.</li>
	<li>Tẩm ướp gia vị khi nấu ngon hơn.</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ t&ocirc;m thẻ</strong></h3>

<ul style="margin-left:40px">
	<li>T&ocirc;m thẻ hấp bia sả.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/tom-luoc-binh-thuong-xua-roi-tom-luoc-nuoc-dua-moi-chuan-ngon-1175546">T&ocirc;m thẻ luộc nước dừa</a>.</li>
	<li>Một số m&oacute;n canh gi&uacute;p ngọt nước, t&ocirc;m x&agrave;o rau củ,...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản t&ocirc;m thẻ tươi ngon</strong></h3>
Bảo quản trong 4 ng&agrave;y kể từ ng&agrave;y đ&oacute;ng g&oacute;i (nhiệt độ từ 2 - 5 độ C)<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 32, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (99, 'Cá lòng tong 500g', 89300, 94000, 'store/images/hai-san/ca-long-tong-500g-202304220902454432_300x300.jpg', '<div class="details"><h2 class="textinfpro" id="specification">Thông tin sản phẩm</h2><div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ca-long-tong-500g">Cá lòng tong</a> là loại <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">cá</a> khá nhỏ, là món ăn quen thuộc trong các gia đình tại miền Tây. Dù được chế biến thành món ăn gì, cá lòng tong vẫn là món ăn hấp dẫn nhờ thịt cá mềm, ăn không thấy ngán. Một số món ăn từ cá lòng tong như kho tiêu, chiên giòn,...</div></div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01.932150', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (100, 'Cá he làm sạch 500g (3 - 7 con)', 56000, 59000, 'store/images/hai-san/ca-he-lam-sach-500g-3-7-con-202304260836004421_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ca-he-lam-sach-500g">C&aacute; he</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">c&aacute;</a> c&oacute; m&agrave;u đỏ hoặc m&agrave;u v&agrave;ng nghệ, vẩy trắng c&oacute; &aacute;nh kim, thịt c&aacute; mềm mịn. C&aacute; he kh&ocirc;ng chỉ l&agrave; một m&oacute;n ăn ngon m&agrave; c&ograve;n l&agrave; một loại thực phẩm đầy dưỡng chất. Thịt c&aacute; he chứa rất nhiều chất dinh dưỡng thiết yếu cho cơ thể ch&uacute;ng ta như protein, chất b&eacute;o, chất sắt,...</div>

<div class="description nospeci">
<h3 style="text-align:justify"><strong>Ưu điểm khi mua c&aacute; he tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Sản phẩm tại B&aacute;ch h&oacute;a XANH đảm bảo tươi ngon, chất lượng, được l&agrave;m sạch v&agrave; đựng trong t&uacute;i h&uacute;t ch&acirc;n kh&ocirc;ng sạch sẽ</p>
	</li>
	<li>
	<p style="text-align:justify">Đảm bảo nguồn gốc xuất xứ an to&agrave;n, kh&ocirc;ng h&oacute;a chất độc hại</p>
	</li>
	<li>
	<p style="text-align:justify">Đ&uacute;ng số lượng, khối lượng, giao h&agrave;ng nhanh ch&oacute;ng, đ&uacute;ng giờ, đảm bảo vệ sinh</p>
	</li>
	<li>
	<p style="text-align:justify">Đặt h&agrave;ng dễ d&agrave;ng nhanh ch&oacute;ng qua app v&agrave; web B&aacute;ch h&oacute;a XANH</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Gi&aacute; trị dinh dưỡng của c&aacute; he</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Th&agrave;nh phần c&aacute; he chứa nhiều protein, chất b&eacute;o, vitamin, omega 3 v&agrave; nhiều loại kho&aacute;ng chất tốt cho sức khỏe như sắt, kẽm, canxi,photpho...</p>
	</li>
	<li>
	<p style="text-align:justify">Trong 100g c&aacute; he c&oacute; chứa mức năng lượng tương đương khoảng 115 calo</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong><img alt="Cá he làm sạch 500g (3 - 7 con) 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8782/305737/bhx/files/ca-he-lam-sach-500g-3-7-con-202304260836148849.jpg" style="height:768px; width:1024px" /><br />
T&aacute;c dụng của c&aacute; he đối với sức khoẻ</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Tốt cho n&atilde;o bộ, tăng cường tập trung, cải thiện tr&iacute; nhớ, ngăn ngừa nguy cơ mắc bệnh Alzheimer</p>
	</li>
	<li>
	<p style="text-align:justify">Tốt cho sức khỏe tim mạch</p>
	</li>
	<li>
	<p style="text-align:justify">Bổ sung sắt tự nhi&ecirc;n cho cơ thể, cải thiện t&igrave;nh trạng thiếu m&aacute;u</p>
	</li>
	<li>
	<p style="text-align:justify">Tăng cường miễn dịch</p>
	</li>
	<li>
	<p style="text-align:justify">Gi&uacute;p xương khớp v&agrave; răng chắc khỏe</p>
	</li>
	<li>
	<p style="text-align:justify">Tốt cho mắt</p>
	</li>
	<li>
	<p style="text-align:justify">Gi&uacute;p ngủ ngon giấc hơn</p>
	</li>
	<li>
	<p style="text-align:justify">&hellip;</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>C&aacute;ch sơ chế c&aacute; he</strong></h3>

<p style="text-align:justify">Sơ chế c&aacute; he cũng tương tự như c&aacute;c loại c&aacute; kh&aacute;c: Sau khi mua về cắt bỏ v&acirc;y v&agrave; mang, đ&aacute;nh vẩy, mổ bụng v&agrave; bỏ phần ruột. Để loại bỏ m&ugrave;i tanh, c&oacute; thể sử dụng muối v&agrave; giấm, xoa đều l&ecirc;n c&aacute; sau đ&oacute; rửa lại với nước sạch nhiều lần</p>

<h3 style="text-align:justify"><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute; he</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">C&aacute; he kho</p>
	</li>
	<li>
	<p style="text-align:justify">C&aacute; he chi&ecirc;n gi&ograve;n</p>
	</li>
	<li>
	<p style="text-align:justify">C&aacute; he kho c&agrave;</p>
	</li>
	<li>
	<p style="text-align:justify">C&aacute; he kho rục</p>
	</li>
	<li>
	<p style="text-align:justify">C&aacute; he kho me</p>
	</li>
	<li>
	<p style="text-align:justify">&hellip;</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong><img alt="Cá he làm sạch 500g (3 - 7 con) 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8782/305737/bhx/files/1260-1200x676-65.jpg" style="height:676px; width:1200px" /><br />
C&aacute;ch bảo quản c&aacute; he tươi ngon</strong></h3>

<p style="text-align:justify">Nếu chưa sử dụng ngay, cần bảo quản c&aacute; he trong ngăn đ&ocirc;ng tủ lạnh, lưu &yacute; kh&ocirc;ng cấp đ&ocirc;ng lại sau khi r&atilde; đ&ocirc;ng</p>

<h3 style="text-align:justify"><strong>C&aacute;c th&ocirc;ng tin li&ecirc;n quan đến sản phẩm</strong></h3>

<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/ca-he-lam-gi-ngon-tong-hop-7-mon-ngon-ca-he-thom-ngon-1523538">C&aacute; he l&agrave;m g&igrave; ngon? Tổng hợp 7 m&oacute;n ngon c&aacute; he thơm ngon</a></p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (101, 'Cá bống tượng 500g-550g (3-6 con)', 91200, 96000, 'store/images/hai-san/ca-bong-tuong-500g-3-6-con-202304220848068995_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ca-bong-tuong-tui-500g">C&aacute; bống tượng</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">c&aacute;</a> c&oacute; nhiều nhớt, m&agrave;u lưng hơi x&aacute;m, da b&oacute;ng, rất th&iacute;ch hợp cho c&aacute;c m&oacute;n c&aacute; bống tượng kho ti&ecirc;u, c&aacute; bống tượng kho thơm. Thịt c&aacute; bống tượng ngọt, ngon, được c&aacute;c b&agrave; nội trợ rất y&ecirc;u th&iacute;ch.</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua c&aacute; bống tượng tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>C&aacute; bống tượng tươi ngon, chất lượng, thịt ngọt, ngon, chắc.</p>
	</li>
	<li>
	<p>C&aacute; bống tượng c&oacute; nhiều m&agrave;u đen, điểm th&ecirc;m &iacute;t vằn n&acirc;u, đầu to hơn so với th&acirc;n. Khi lật ngửa vảy bụng v&agrave; lưng đều, c&aacute;c v&acirc;y nguy&ecirc;n, c&aacute; c&oacute; nhiều nhớt, m&agrave;u lưng hơi x&aacute;m, da b&oacute;ng, mang ph&ugrave;ng thật to v&agrave; c&aacute;c v&acirc;y xo&egrave; ra hết cỡ.</p>
	</li>
	<li>
	<p>C&aacute; bống tượng được đảm bảo nguồn gốc r&otilde; r&agrave;ng, đ&oacute;ng g&oacute;i tiện lợi cho người d&ugrave;ng.</p>
	</li>
</ul>

<h3><strong>Gi&aacute; trị dinh dưỡng của c&aacute; bống tượng</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>C&aacute; bống tượng l&agrave; loại c&aacute; chứa nhiều dưỡng chất như vitamin B2, vitamin PP, vitamin E, vitamin C,... c&aacute;c kho&aacute;ng chất như canxi, sắt, kẽm, phốt pho,... cần thiết cho cơ thể</p>
	</li>
	<li>
	<p>Trong 100g c&aacute; bống c&oacute; khoảng <strong>300 Kcal</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của c&aacute; bống tượng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp dưỡng chất cho cơ thể</p>
	</li>
	<li>
	<p>Hỗ trợ tăng cường sức đề kh&aacute;ng</p>
	</li>
	<li>
	<p>Hỗ trợ chắc khỏe xương khớp</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute; bống tượng</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>C&aacute; bống tượng hấp nấm</p>
	</li>
	<li>
	<p>C&aacute; bống tượng kho dứa</p>
	</li>
	<li>
	<p>C&aacute; bống tượng kho ti&ecirc;u</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản c&aacute; bống tượng tươi ngon</strong></h3>

<p>Bạn c&oacute; thể bảo quản c&aacute; bống tượng trong tủ lạnh để giữ cho c&oacute; được tươi ngon l&acirc;u hơn.</p>

<p><strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</p>
</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (102, 'Cá chạch quế 500g (4-9 con)', 44600, 47000, 'store/images/hai-san/ca-chach-que-500g-4-9-con-202304260833492051_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&aacute; chạch quế&nbsp;th&acirc;n tr&ograve;n, dẹt b&ecirc;n, nhất l&agrave; gần đu&ocirc;i, da trơn, mỏng.&nbsp;C&aacute; c&oacute; m&agrave;u v&agrave;ng, n&acirc;u hoặc x&aacute;m đen, m&agrave;u lưng xẫm hơn bụng. Tr&ecirc;n th&acirc;n c&oacute; nhiều chấm, mỗi chấm do rất nhiều chấm nhỏ hợp th&agrave;nh. C&aacute; chạch quế nấu m&oacute;n ngon như c&aacute; chạch kho ti&ecirc;u, c&aacute; chạch quế chi&ecirc;n gi&ograve;n,...</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (103, 'Cá hường làm sạch 500g-550g', 48400, 51000, 'store/images/hai-san/ca-huong-nguyen-con-lam-sach-khay-300g-350g-2-3-con-202210111513190967_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">C&aacute;</a> hường hay c&ograve;n gọi l&agrave; c&aacute; m&ugrave;i, c&aacute; c&oacute; thịt chắc ngọt, &iacute;t xương, cũng l&agrave; loại c&aacute; phổ biến được nhiều b&agrave; nội trợ chọn mua.&nbsp;<a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ca-huong-nguyen-con-lam-sach-khay-300g-3-5-con">C&aacute; hường</a> giữ được độ tươi ngon từ c&aacute; tươi, gi&uacute;p bảo quản l&acirc;u hơn m&agrave; thịt c&aacute; vẫn chắc, kh&ocirc;ng bở m&agrave; vẫn giữ nguy&ecirc;n vị đậm đ&agrave;.</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>300g</div>
	</li>
</ul>

<div class="description">
<h3><strong>Ưu điểm khi mua c&aacute; hường nguy&ecirc;n con l&agrave;m sạch tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; hường tươi ngon, chắc thịt, được l&agrave;m sạch sẵn v&agrave; đ&oacute;ng khay.</li>
	<li>C&aacute; hường được đảm bảo nguồn gốc r&otilde; r&agrave;ng, đ&oacute;ng khay h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản được tốt hơn.</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cá hường nguyên con làm sạch 500g - 550g (2-3 con) 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/248990/bhx/ca-huong-lam-sach-khay-500g-5-7-con-202203091150219193.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của c&aacute; hường</strong></h3>

<ul style="margin-left:40px">
	<li>Trong thịt c&aacute; hường c&oacute; chứa nhiều kho&aacute;ng chất như chất b&eacute;o, protein, canxi, sắt, magie, natri, kali, phốt pho,...</li>
	<li>Trong 100g c&aacute; hường c&oacute; khoảng <strong>104 Kcal.</strong></li>
</ul>

<h3><img alt="Cá hường nguyên con làm sạch 500g - 550g (2-3 con) 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/248990/bhx/ca-huong-lam-sach-khay-500g-5-7-con-202203091149242601.jpg" /><br />
<strong>T&aacute;c dụng của c&aacute; hường đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Gi&uacute;p chắc khỏe xương v&agrave; răng</li>
	<li>Giảm đ&aacute;ng kể c&aacute;c nguy cơ về bệnh tim mạch</li>
	<li>Tăng cường sức đề kh&aacute;ng</li>
	<li>Tăng cường khả năng trao đổi chất</li>
	<li>&hellip;</li>
</ul>

<h3><strong>C&aacute;ch sơ chế c&aacute; hường</strong></h3>
C&aacute; hường mua tại B&aacute;ch h&oacute;a XANH được l&agrave;m sạch sẵn, bạn chỉ cần rửa lại với nước sạch để loại bỏ m&aacute;u v&agrave; chất bẩn l&agrave; c&oacute; thể mang đi chế biến.

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute; hường</strong></h3>

<ul style="margin-left:40px">
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-ca-huong-muoi-sa-chien-don-gian-va-thom-ngon-1089975">C&aacute; hường muối sả chi&ecirc;n</a></li>
	<li>C&aacute; hường chi&ecirc;n</li>
	<li>C&aacute; hường kho c&agrave; chua</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/hai-cach-nau-mon-ca-huong-don-gian-ma-ngon-mieng-1113037">C&aacute; hường kho</a></li>
	<li>...</li>
</ul>

<h3><strong>C&aacute;ch bảo quản c&aacute; hường tươi ngon</strong></h3>
C&aacute; hường n&ecirc;n được bảo quản trong tủ lạnh để gi&uacute;p c&aacute; giữ được độ tươi ngon.<br />
<strong>Lưu &yacute;:</strong> Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (104, 'Cá diêu hồng làm sạch (300g - 450g /con)', 39000, 0, 'store/images/hai-san/ca-dieu-hong-lam-sach-300g-450g-con-202303311333119175_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/ca-tom-muc-ech">C&aacute;</a>&nbsp;di&ecirc;u hồng loại c&aacute; phổ biến c&oacute; thịt nhiều, &iacute;t xương, thịt trắng, ngọt v&agrave; l&agrave;nh t&iacute;nh, <a href="https://www.bachhoaxanh.com/ca-tom-muc-ech/ca-dieu-hong-lam-sach">c&aacute; di&ecirc;u hồng</a> chế biến th&agrave;nh rất nhiều m&oacute;n ngon trong bữa cơm gia đ&igrave;nh như c&aacute; di&ecirc;u hồng kho, c&aacute; di&ecirc;u hồng nấu canh chua, c&aacute; di&ecirc;u hồng chi&ecirc;n gi&ograve;n, c&aacute; di&ecirc;u hồng sốt c&agrave; chua,...</div>

<div class="description nospeci">
<h3><strong>Ưu điểm khi mua c&aacute; di&ecirc;u hồng l&agrave;m sạch tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; di&ecirc;u hồng tươi ngon, được đ&oacute;ng khay <strong>nguy&ecirc;n con từ 300g - 450g</strong>, thịt c&aacute; dai ngon, chắc thịt, ngọt. C&aacute; được đ&oacute;ng khay h&uacute;t ch&acirc;n kh&ocirc;ng gi&uacute;p bảo quản được tốt hơn. C&aacute; di&ecirc;u hồng cũng được đảm bảo nguồn gốc r&otilde; r&agrave;ng</li>
	<li>Đặt giao h&agrave;ng nhanh</li>
</ul>

<h3><img alt="Cá diêu hồng làm sạch 300g - 450g/con 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8782/271113/bhx/ca-dieu-hong-tui-1-con-202202171855255282.jpg" /><br />
<strong>Gi&aacute; trị dinh dưỡng của c&aacute; di&ecirc;u hồng</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; di&ecirc;u hồng chứa nhiều kho&aacute;ng chất như canxi, sắt, vitamin A, vitamin B, vitamin D, gi&agrave;u protein,...</li>
	<li>Trong 100g c&aacute; di&ecirc;u hồng c&oacute; khoảng 86 Kcal.</li>
</ul>

<h3><strong>T&aacute;c dụng của c&aacute; di&ecirc;u hồng đối với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>Tốt cho hệ ti&ecirc;u h&oacute;a</li>
	<li>Tốt cho người sau đau phục hồi sức khỏe</li>
	<li>Tăng cường hệ miễn dịch</li>
	<li>Tăng cường qu&aacute; tr&igrave;nh trao đổi chất</li>
	<li>&hellip;</li>
</ul>

<h3><img alt="Cá diêu hồng làm sạch 300g - 450g/con 1" class="lazy" src="https://cdn.tgdd.vn/Files/2019/11/08/1216702/cach-lam-ca-dieu-hong-chien-xu-gion-tan-cho-bua-com-them-phong-phu-201911081217364760.jpg" /><br />
<strong>C&aacute;ch sơ chế c&aacute; di&ecirc;u hồng</strong></h3>

<ul style="margin-left:40px">
	<li>C&aacute; đ&atilde; được l&agrave;m sạch ruột, vẩy,...</li>
	<li>Lấy muối ch&agrave; cho bớt nhớt v&agrave; tanh.</li>
	<li>Sau đ&oacute; rửa nhiều lần với nước sạch.</li>
	<li>Tẩm ướp gia vị trước khi nấu để c&aacute; ngon hơn.</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ăn ngon từ c&aacute; di&ecirc;u hồng</strong></h3>
D&ugrave;ng bổ dưỡng cho nhiều bệnh chứng suy nhược nhất l&agrave; người gi&agrave; suy nhược, trẻ em c&ograve;i cọc chậm lớn... Sau đ&acirc;y l&agrave; một số m&oacute;n ăn thuốc từ c&aacute; di&ecirc;u hồng:

<ul style="margin-left:40px">
	<li>Thơm ngon kh&oacute; cưỡng với c&aacute; di&ecirc;u hồng hấp nước tương.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-lam-ca-dieu-hong-kho-ca-chua-1197278">C&aacute; đi&ecirc;u hồng kho c&agrave; chua</a> đậm đ&agrave; thấm vị.</li>
	<li>Lạ miệng với m&oacute;n c&aacute; di&ecirc;u hồng chi&ecirc;n x&ugrave;.</li>
	<li><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/troi-se-lanh-lam-ca-dieu-hong-hap-hanh-gung-am-long-ca-nha-1219557">C&aacute; di&ecirc;u hồng hấp h&agrave;nh gừng.</a></li>
</ul>

<h3><strong>C&aacute;ch bảo quản c&aacute; di&ecirc;u hồng tươi ngon</strong></h3>
C&aacute; di&ecirc;u hồng c&oacute; thể bảo quản trong ngăn tủ lạnh để gi&uacute;p c&aacute; tươi ngon hơn.<br />
<strong>Lưu &yacute;: </strong>Sản phẩm nhận được c&oacute; thể kh&aacute;c với h&igrave;nh ảnh về m&agrave;u sắc v&agrave; số lượng nhưng vẫn đảm bảo về mặt khối lượng v&agrave; chất lượng.</div>
</div>', 'thit-tuoi-song', 0, 0, 0, '2023-05-03 16:30:01', 5);


INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (105, 'Dầu hào Maggi đậm đặc 530g', 38000, 0, 'store/images/bo-trung/dau-hao-dam-dac-maggi-chai-530g-202302270856482914_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/bo-maggi-dau-hao">Dầu h&agrave;o Maggi</a>&nbsp;l&agrave; một trong những loại&nbsp;<a href="https://www.bachhoaxanh.com/bo-dau-hao">dầu h&agrave;o</a>&nbsp;c&oacute; m&agrave;u sắc bắt mắt, hương vị lại rất đậm đ&agrave;. <a href="https://www.bachhoaxanh.com/bo/dau-hao-dam-dac-maggi-chai-530g">Dầu h&agrave;o Maggi đậm đặc 530g</a> được c&ocirc; đặc từ h&agrave;o nguy&ecirc;n chất kết hợp ho&agrave;n hảo c&ugrave;ng c&aacute;c loại gia vị kh&aacute;c, tạo n&ecirc;n một tổng thể gi&uacute;p m&oacute;n ăn vừa thơm ngon, vừa bổ dưỡng.</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>530g</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>X&agrave;o, ướp c&aacute;c m&oacute;n nướng, ram, rim...</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, muối, chất ổn định (1442), chất điều vị (621), m&agrave;u tổng hợp 150c, hương h&agrave;o tổng hợp, chất điều vị (E627, E631), chiết xuất h&agrave;o nguy&ecirc;n chất (1g/1kg), chất điều chỉnh độ chua E330, chất bảo quản 202</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Maggi (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Maggi&nbsp;</strong></h3>

<p>Maggi l&agrave; thương hiệu quen thuộc, được th&agrave;nh lập năm 1947 thuộc tập đo&agrave;n của Nestle. Maggi được th&agrave;nh lập nhằm mục ti&ecirc;u tạo n&ecirc;n những m&oacute;n ăn ngon cho người d&ugrave;ng, tạo ra những bữa ăn bổ dưỡng, thơm ngon cho gia đ&igrave;nh bạn. C&aacute;c sản phẩm của Maggi đa dạng, như hạt n&ecirc;m, nước mắm, gia vị n&ecirc;m sẵn,...</p>

<h3><img alt="Dầu hào đậm đặc Maggi chai 530g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/91408/bhx/dau-hao-dam-dac-maggi-chai-530g-202208151601433291.jpg" /><br />
<strong>Th&agrave;nh phần dinh dưỡng trong Dầu h&agrave;o đậm đặc Maggi chai 530g</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Dầu h&agrave;o chứa nhiều th&agrave;nh phần dinh dưỡng như c&aacute;c vitamin A, vitamin B, vitamin C, c&aacute;c axit amin cần thiết cho cơ thể, kho&aacute;ng chất đặc biệt l&agrave; kẽm.</p>
	</li>
	<li>
	<p>Trong 100g dầu h&agrave;o chứa <strong>94 Kcal.</strong></p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Cải thiện sức đề kh&aacute;ng v&agrave; hệ thống miễn dịch của cơ thể</p>
	</li>
	<li>
	<p>C&acirc;n bằng dưỡng chất b&ecirc;n trong cơ thể</p>
	</li>
	<li>
	<p>Gi&uacute;p cấu tạo tế b&agrave;o cơ thể</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><img alt="Dầu hào đậm đặc Maggi chai 530g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/91408/bhx/dau-hao-dam-dac-maggi-chai-530g-202208151601542889.jpg" /><br />
<strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<p>Dầu h&agrave;o được sử dụng để l&agrave;m gia vị chế biến c&aacute;c m&oacute;n ăn như x&agrave;o, ướp c&aacute;c m&oacute;n nướng, ram, rim...</p>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản Dầu h&agrave;o đậm đặc Maggi chai 530g</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</p>
	</li>
	<li>
	<p>Kh&ocirc;ng n&ecirc;n n&ecirc;m nếm dầu h&agrave;o với c&aacute;c loại nước sốt cay, giấm, đường</p>
	</li>
	<li>
	<p>Dầu h&agrave;o c&ograve;n c&oacute; khả năng loại bỏ m&ugrave;i tanh của hải sản, thịt c&aacute; gi&uacute;p ch&uacute;ng trở n&ecirc;n thơm ngon hơn.</p>
	</li>
	<li>
	<p>V&igrave; dầu h&agrave;o cũng c&oacute; t&iacute;nh mặn, n&ecirc;n bạn cần giảm bớt lượng muối khi c&ugrave;ng n&ecirc;m nếm nh&eacute;!</p>
	</li>
</ul>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Dầu h&agrave;o Maggi c&oacute; m&agrave;u n&acirc;u v&agrave;ng s&aacute;ng, độ sệt vừa phải, vừa tạo m&agrave;u, vừa tạo m&ugrave;i, l&agrave; b&iacute; quyết để c&oacute; được m&oacute;n ngon đậm đ&agrave; tròn vị.</p>
	</li>
	<li>
	<p>Mua online tại b&aacute;ch h&oacute;a XANH để nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i, giao h&agrave;ng tận nh&agrave;, h&agrave;ng h&oacute;a đảm bảo chất lượng v&agrave; nguồn gốc r&otilde; r&agrave;ng.</p>
	</li>
</ul>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (106, '10 gói bơ lạt TH True Butter 10g', 27000, 28500, 'store/images/bo-trung/bo-lat-th-true-butter-vi-100g-10-goi-x-10g-202304141659034953_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/bo-th-true-butter-bo" target="_blank">Bơ&nbsp;TH True Butter</a> c&oacute; thể d&ugrave;ng để ăn trực tiếp, ăn k&egrave;m với b&aacute;nh mỳ, sử dụng để l&agrave;m b&aacute;nh hoặc chế biến c&aacute;c m&oacute;n chi&ecirc;n, x&agrave;o. <a href="https://www.bachhoaxanh.com/bo/bo-lat-tu-nhien-th-true-butter-vi-100g-10-goi-x-10g" target="_blank">Bơ lạt tự nhi&ecirc;n TH True Butter vỉ 100g</a> sản xuất từ chất b&eacute;o của sữa tươi sạch nguy&ecirc;n chất c&ugrave;ng với qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n tạo n&ecirc;n hương vị <a href="https://www.bachhoaxanh.com/bo-bo" target="_blank">bơ</a>&nbsp;thơm ngon.</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>100g (10 g&oacute;i x 10g)</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>Ăn trực tiếp hoặc d&ugrave;ng l&agrave;m nguy&ecirc;n liệu chế biến.</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Chất b&eacute;o từ sữa b&ograve; tươi, dịch men, hương bơ tự nhi&ecirc;n,...</div>
	</li>
	<li>Bảo quản
	<div>Tốt nhất ở điều kiện từ 2 độ C đến 8 độ C</div>
	</li>
	<li>Năng lượng
	<div>728,5 kcal/100g</div>
	</li>
	<li>Thương hiệu
	<div>TH True Butter (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (107, 'Dầu giấm salad Cholimex 270g', 16200, 0, 'store/images/bo-trung/dau-giam-tron-salad-cholimex-chai-270g-202205161048156422_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm chiết xuất từ c&aacute;c nguy&ecirc;n liệu tự nhi&ecirc;n, th&iacute;ch hợp d&ugrave;ng để trộn c&aacute;c m&oacute;n salad, gỏi chua, ăn khai vị, gi&uacute;p tăng hương vị thơm ngon, hấp dẫn cho m&oacute;n ăn. Đ&acirc;y là nguy&ecirc;n li&ecirc;̣u v&ocirc; cùng c&acirc;̀n thi&ecirc;́t đ&ecirc;̉ tạo thành m&ocirc;̣t bữa ăn hoàn hảo cho cả nhà.</div>

<ul style="margin-left:40px">
	<li>Loại
	<div>Dầu giấm trộn salad</div>
	</li>
	<li>Dung t&iacute;ch
	<div>270g</div>
	</li>
	<li>Độ chua
	<div>Chua ngọt</div>
	</li>
	<li>C&ocirc;ng dụng
	<div>D&ugrave;ng để trộn c&aacute;c m&oacute;n salad, gỏi chua, ăn khai vị. Lắc đều trước khi sử dụng</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, giấm 10%, dầu ăn 9%, củ h&agrave;nh, tỏi, ớt, muối ăn, ti&ecirc;u, chất bảo quản (211), chất điều vị (621)</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Cholimex (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Cholimex l&agrave; thương hiệu gia vị, thực phẩm nổi tiếng h&agrave;ng đầu tại Việt Nam với c&aacute;c sản phẩm gia vị, thực phẩm sơ chế tẩm ướp, l&agrave;m sẵn,... Th&agrave;nh lập từ năm 1983 v&agrave; đạt chứng nhận thương hiệu quốc gia Việt Nam v&agrave;o năm 2020.<br />
B&ecirc;n cạnh sự ph&aacute;t triển v&agrave; đầu tư nghi&ecirc;m t&uacute;c, Cholimex cũng tham gia c&aacute;c chương tr&igrave;nh kết nối y&ecirc;u thương để chia sẻ h&igrave;nh ảnh thương hiệu v&agrave; giới thiệu c&aacute;c m&oacute;n ngon, gia vị ho&agrave;n hảo đến nhiều đối tượng kh&aacute;ch h&agrave;ng ở c&aacute;c v&ugrave;ng miền kh&aacute;c nhau. Tới thời điểm hiện tại với hơn 36 năm ph&aacute;t triển, h&atilde;ng đ&atilde; c&oacute; mặt ở khắp 63 tỉnh th&agrave;nh tr&ecirc;n cả nước với mức gi&aacute; hợp l&yacute; v&agrave; được nhiều kh&aacute;ch h&agrave;ng ưa th&iacute;ch tin d&ugrave;ng.<br />
<img alt="Dầu dấm trộn salad Cholimex chai 270g 0" class="lazy" src="https://cdn.tgdd.vn/Files/2022/06/23/1441939/ot-sa-te-cholimex-loai-gia-vi-dac-biet-trong-am-thuc-viet-202206231625292469.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Dầu giấm trộn salad Cholimex chai 270g l&agrave;m từ c&aacute;c th&agrave;nh phần: Nước, đường, giấm 10%, dầu ăn 9%, củ h&agrave;nh, tỏi, ớt, muối ăn, ti&ecirc;u, chất bảo quản (211), chất điều vị (621),... Đảm bảo cung cấp được c&aacute;c gi&aacute; trị dinh dưỡng như: năng lượng, carbohydrate,... v&agrave; c&aacute;c kho&aacute;ng chất ph&ugrave; hợp cho sức khỏe người d&ugrave;ng.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Dầu giấm trộn salad Cholimex chai 270g, sản phẩm c&oacute; c&aacute;c t&aacute;c dụng nổi bật với sức khỏe của kh&aacute;ch h&agrave;ng như:</p>

<ul style="margin-left:40px">
	<li>L&agrave; m&oacute;n gia vị độc đ&aacute;o, c&oacute; thể kết hợp cho nhiều m&oacute;n ăn thơm ngon kh&oacute; cưỡng, bắt vị v&agrave; k&iacute;ch th&iacute;ch vị gi&aacute;c tốt.</li>
	<li>B&ecirc;n cạnh đ&oacute; c&oacute; chứa nhiều dưỡng chất cần thiết cho sự ph&aacute;t triển của cơ thể.</li>
	<li>&hellip;</li>
</ul>
<img alt="Dầu dấm trộn salad Cholimex chai 270g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/91451/bhx/dau-dam-tron-salad-cholimex-chai-270g-3-org.jpg" />
<h3><strong>Hướng dẫn sử dụng v&agrave; c&aacute;ch bảo quản</strong></h3>

<ul style="margin-left:40px">
	<li><strong>Hướng dẫn sử dụng:</strong> D&ugrave;ng để trộn c&aacute;c m&oacute;n salad, gỏi chua, ăn khai vị. Lắc đều trước khi sử dụng. Bạn cũng c&oacute; thể kết hợp cho c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch v&agrave;o nhu cầu sử dụng của bạn nh&eacute;!</li>
	<li><strong>C&aacute;ch bảo quản:</strong> Bảo quản ở nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, nhiệt độ thường, đậy k&iacute;n nắp ngay sau khi sử dụng. Tr&aacute;nh nơi c&oacute; nhiệt độ cao hay &aacute;nh nắng trực tiếp, tr&aacute;nh lửa.</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ngon từ sản phẩm</strong></h3>

<p>Dầu giấm trộn salad Cholimex chai 270g c&oacute; thể sử dụng l&agrave;m nguy&ecirc;n liệu hay kết hợp cho c&aacute;c m&oacute;n ngon như: salad trộn dầu giấm, b&ograve; nh&uacute;ng giấm, c&aacute;c m&oacute;n gỏi thịt, gỏi hải sản, gỏi ng&oacute; sen,...<br />
<img alt="Dầu dấm trộn salad Cholimex chai 270g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/91451/bhx/dau-dam-tron-salad-cholimex-chai-270g-4-org.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<ul style="margin-left:40px">
	<li>Dầu giấm trộn salad Cholimex chai 270g đang được kinh doanh tại B&aacute;ch h&oacute;a XANH với mức gi&aacute; v&ocirc; c&ugrave;ng hấp dẫn, dễ tiếp cận với nhiều kh&aacute;ch h&agrave;ng, đặc biệt cam kết h&agrave;ng ch&iacute;nh h&atilde;ng 100%, chất lượng cao, an to&agrave;n cho người d&ugrave;ng.</li>
	<li>K&egrave;m theo dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng tốt, gi&aacute; ưu đ&atilde;i hấp dẫn, tận t&acirc;m, chu đ&aacute;o, giao h&agrave;ng nhanh ch&oacute;ng tận nơi khi mua h&agrave;ng online.</li>
</ul>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (108, 'Bơ thực vật Tường An 200g', 22500, 0, 'store/images/bo-trung/bo-thuc-vat-tuong-an-hu-200g-202212011020440551_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p>Sản phẩm&nbsp;<a href="https://www.bachhoaxanh.com/bo-bo" target="_blank">bơ</a> của&nbsp;thương hiệu <a href="https://www.bachhoaxanh.com/bo-tuong-an-bo" target="_blank">bơ Tường An</a>&nbsp;đang được rất nhiều người ti&ecirc;u d&ugrave;ng ưa chuộng. <a href="https://www.bachhoaxanh.com/bo/bo-margarine-hop-200gr">Bơ thực vật Tường An hũ 200g</a>&nbsp;c&oacute; vị mặn dịu tự nhi&ecirc;n, bạn&nbsp;c&oacute; thể sử dụng sản phẩm để l&agrave;m c&aacute;c m&oacute;n nướng, m&oacute;n x&agrave;o, nước sốt, l&agrave;m b&aacute;nh... v&agrave; chế biến c&aacute;c m&oacute;n chay.</p>
</div>

<ul style="margin-left:40px">
	<li>Đặc t&iacute;nh
	<div>Bổ sung vitamin A. Kh&ocirc;ng chứa cholesterol, chất b&eacute;o cấu h&igrave;nh Trans</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng cho c&ocirc;ng nghiệp chế biến b&aacute;nh kẹo, c&agrave; ph&ecirc;, ăn với b&aacute;nh m&igrave;, chi&ecirc;n, x&agrave;o, d&ugrave;ng được cho người ăn chay</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Dầu thực vật tinh luyện, nước, vitamin A, lecithin (322), hương bơ, beta caroten, mono v&agrave; diglycerid của c&aacute;c axit b&eacute;o (471), BHT (321)</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, bảo quản lạnh sau khi mở nắp</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Thương hiệu
	<div>Tường An (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;Tường An</h3>

<p>Tường An l&agrave; thương hiệu thuộc quyền quản l&yacute; của C&ocirc;ng ty Cổ phần Dầu thực vật Tường An, được th&agrave;nh lập từ 1977. C&aacute;c sản phẩm của Tường An hẳn đ&atilde; rất quen thuộc với người ti&ecirc;u d&ugrave;ng Việt, xuất hiện rất phổ biến trong gian bếp của mỗi gia đ&igrave;nh, ngo&agrave;i ra Tường An c&ograve;n mở rộng ph&acirc;n phối sản phẩm của m&igrave;nh khắp c&aacute;c tỉnh th&agrave;nh tr&ecirc;n cả nước, từ si&ecirc;u thị, nh&agrave; h&agrave;ng, qu&aacute;n ăn, nh&agrave; trẻ, trường học,...</p>

<h3>Th&agrave;nh phần dinh dưỡng trong bơ thực vật Tường An</h3>

<p>Được l&agrave;m từ dầu thực vật tinh luyện, bơ thực vật Tường An c&oacute; th&agrave;nh phần dinh dưỡng như: calo, vitamin A, chất đạm, natri,... kh&ocirc;ng chứa Cholesterol v&agrave; axit b&eacute;o cấu h&igrave;nh trans.<br />
Trung b&igrave;nh trong 100g bơ thực vật của Tường An c&oacute; chứa khoảng 590 đến 610 calo.</p>

<p style="text-align:justify"><img alt="Bơ thực vật Tường An hũ 200g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/91785/bhx/bo-thuc-vat-tuong-an-hu-200g-202212011020440551.jpg" /></p>

<h3 style="text-align:justify">T&aacute;c dụng của bơ thực vật Tường An với sức khỏe</h3>

<p style="text-align:justify">Bơ thực vật Tường An được phối trộn theo c&ocirc;ng nghệ tinh luyện hiện đại từ Dầu thực vật cao cấp, c&ugrave;ng nguy&ecirc;n liệu nhập khẩu 100%, bổ sung th&ecirc;m vitamin A, E, tăng cường vi chất dinh dưỡng cho cơ thể. Ngo&agrave;i ra, bơ thực vật c&ograve;n c&oacute; nhiều c&ocirc;ng dụng tốt cho sức khỏe:</p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Với lượng chất b&eacute;o thấp, n&ecirc;n rất th&iacute;ch hợp với người ăn ki&ecirc;ng hoặc đang trong qu&aacute; tr&igrave;nh giảm c&acirc;n.</p>
	</li>
	<li>
	<p style="text-align:justify">Giảm c&aacute;c nguy cơ về c&aacute;c bệnh cao huyết &aacute;p, bệnh tim mạch.</p>
	</li>
	<li>
	<p style="text-align:justify">Vitamin A rất cần thiết cho sức khỏe của mắt, gi&uacute;p tăng cường thị lực v&agrave; khả năng miễn dịch của mắt.</p>
	</li>
</ul>

<p style="text-align:justify">&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bo-thuc-vat-la-gi-chung-tot-hay-xau-1033949">Bơ thực vật l&agrave; g&igrave;? Ch&uacute;ng tốt hay xấu?</a></p>

<h3 style="text-align:justify">Hướng dẫn sử dụng bơ thực vật Tường An</h3>

<p style="text-align:justify">Sử dụng để chế biến b&aacute;nh kẹo, c&agrave; ph&ecirc;, ăn k&egrave;m với b&aacute;nh m&igrave;, hoặc d&ugrave;ng để chi&ecirc;n, x&agrave;o m&oacute;n ăn, bơ Tường An th&iacute;ch hợp sử dụng cho cả người&nbsp;ăn chay.<br />
<img alt="Bơ thực vật Tường An hũ 200g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/91785/bhx/bo-thuc-vat-tuong-an-hu-200g-202212011022285054.jpg" /></p>

<h3 style="text-align:justify">Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản bơ thực vật Tường An</h3>

<p style="text-align:justify">Bảo quản bơ ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp v&agrave; lưu &yacute; khi lấy bơ ra khỏi hũ n&ecirc;n sử dụng muỗng sạch, để tr&aacute;nh l&agrave;m giảm chất lượng của sản phẩm.</p>

<h3 style="text-align:justify">Ưu điểm khi mua bơ thực vật&nbsp;tại B&aacute;ch ho&aacute; XANH</h3>

<p style="text-align:justify">B&aacute;ch ho&aacute; XANH l&agrave; một trong những địa chỉ uy t&iacute;n cung cấp c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của thương hiệu Tường An. Tại đ&acirc;y, h&agrave;ng h&oacute;a lu&ocirc;n được đảm bảo về nguồn gốc cũng như chất lượng, c&ugrave;ng với đ&oacute; l&agrave; gi&aacute; b&aacute;n rất hợp l&yacute; n&ecirc;n bạn c&oacute; thể y&ecirc;n t&acirc;m mua sắm. Ngo&agrave;i ra, khi mua h&agrave;ng tại trang web www.bachhoaxanh.com bạn c&ograve;n được giao h&agrave;ng tận nơi c&ugrave;ng nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (109, 'Dầu hào Lee Kum Kee 510g', 29900, 0, 'store/images/bo-trung/dau-hao-lee-kum-kee-chai-510g-202303082226419341_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">Dầu h&agrave;o</a><a href="https://www.bachhoaxanh.com/dau-hao-lee-kum-kee" target="_blank">&nbsp;Lee Kum Kee</a>&nbsp;l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">dầu h&agrave;o</a> nhập khẩu từ Malaysia, được xem l&agrave; một b&iacute; k&iacute;p cho c&aacute;c m&oacute;n x&agrave;o được s&aacute;ng b&oacute;ng đẹp mắt. <a href="https://www.bachhoaxanh.com/dau-hao/dau-hao-kum-chun-lee-kum-kee-chai-510g" target="_blank">Dầu h&agrave;o Kum Chun Lee Kum Kee chai 510g</a>&nbsp;c&oacute; hương vị c&acirc;n bằng giữa vị ngọt xen lẫn vị mặn nhẹ, l&agrave;m nổi bật l&ecirc;n sự tự nhi&ecirc;n tinh tế trong từng m&oacute;n ăn.</div>

<ul style="margin-left:40px">
	<li>Trọng lượng
	<div>510g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, muối, tinh bột bắp biển t&iacute;nh, chiết xuất h&agrave;o 4% (h&agrave;o 90%, nước, muối), chất điều vị (Monosodium L-Glutamate/621), bột m&igrave;, m&agrave;u thực phẩm tự nhi&ecirc;n (Caramel l-Plain/150a). C&oacute; chứa l&uacute;a m&igrave;.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ph&ugrave; hợp với c&aacute;c m&oacute;n ăn, khi cần n&ecirc;m nếm hoặc x&agrave;o. Thịt g&agrave; x&agrave;o với ớt chu&ocirc;ng xanh - Trộn 250g thịt th&aacute;i l&aacute;t với 1 muỗng dầu h&agrave;o v&agrave; 1 muỗng tinh bột ng&ocirc;. Để qua một b&ecirc;n cho ngấm gia vị. Đun n&oacute;ng dầu ăn v&agrave; x&agrave;o thịt cho đến khi ch&iacute;n t&aacute;i khoảng 80%. Th&ecirc;m ớt chu&ocirc;ng v&agrave; th&ecirc;m 2 muỗng dầu h&agrave;o. Tiếp tục x&agrave;o cho đến khi ch&iacute;n.</div>
	</li>
	<li>Lưu &yacute;
	<div>Chỉ sử dụng sản phẩm khi bao b&igrave; c&ograve;n nguy&ecirc;n vẹn</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời. Giữ trong tủ lạnh sau khi mở nắp.</div>
	</li>
	<li>Thương hiệu
	<div>Lee Kum Kee (Hồng K&ocirc;ng)</div>
	</li>
	<li>Sản xuất
	<div>Malaysia</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Lee Kum Kee</h3>

<p>Lee Kum Kee l&agrave; thương hiệu gia vị chất lượng thuộc Tập đo&agrave;n Lee Kum Kee, th&agrave;nh lập v&agrave;o năm 1888 tại Trung Quốc. Tnh đến nay đ&atilde; gần 134 năm c&oacute; mặt tr&ecirc;n thị trường, Lee Kum Kee đ&atilde; chứng minh được chất lượng v&agrave; trở th&agrave;nh biểu tượng của sự tin cậy, cũng như rất được ưa chuộng bởi&nbsp;kh&aacute;ch h&agrave;ng tr&ecirc;n khắp thế giới.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong dầu h&agrave;o Lee Kum Kee kum chun chai 510g</h3>

<p>Dầu h&agrave;o l&agrave; một loại sốt gia vị c&oacute; chiết xuất từ h&agrave;u, gi&uacute;p mang lại m&agrave;u sắc n&acirc;u c&aacute;nh gi&aacute;n bắt mắt v&agrave; hương vị mặn ngọt h&agrave;i h&ograve;a cho m&oacute;n ăn.</p>

<p>Dầu h&agrave;o Lee Kum Kee kum chun 510g được sản xuất từ những th&agrave;nh phần ch&iacute;nh như: Nước, đường, muối, tinh bột bắp biến t&iacute;nh, chiết xuất h&agrave;u,...<br />
<img alt="Dầu hào Lee Kum Kee chai 510g 0" class="lazy" src="https://lzd-img-global.slatic.net/g/p/a24c03b6740c1e24973bc174fc7fe6fe.jpg_720x720q80.jpg_.webp" /></p>

<h3>T&aacute;c dụng của dầu h&agrave;o Lee Kum Kee kum chun với sức khỏe</h3>

<p>Kh&ocirc;ng chỉ tăng hương vị cho m&oacute;n ăn, m&agrave; dầu h&agrave;o c&ograve;n chứa nhiều chất dinh dưỡng v&agrave; axit amin mang lại c&ocirc;ng dụng tốt cho sức khỏe.</p>

<ul style="margin-left:40px">
	<li>
	<p>Hỗ trợ sự ph&aacute;t triển của cơ thể nhờ c&oacute; chứa đến 22 loại axit amin.</p>
	</li>
	<li>
	<p>Tăng khả năng miễn dịch v&agrave; sức đề kh&aacute;ng của cơ thể.</p>
	</li>
</ul>

<h3>Hướng dẫn sử dụng dầu h&agrave;o Lee Kum Kee kum chun</h3>

<p>Dầu h&agrave;o Lee Kum Kee kum chun tuy c&oacute; m&agrave;u sắc n&acirc;u c&aacute;nh gi&aacute;n gần giống nước tương, nhưng thực chất dầu h&agrave;o v&agrave; nước tương l&agrave; hai loại gia vị kh&aacute;c nhau.</p>

<p>Dầu h&agrave;o rất hợp d&ugrave;ng n&ecirc;m nếm cho c&aacute;c m&oacute;n ăn, đặc biệt l&agrave; m&oacute;n x&agrave;o, kh&ocirc;ng những thế dầu h&agrave;o c&ograve;n gi&uacute;p khử m&ugrave;i tanh, h&ocirc;i của c&aacute;c loại hải sản, thịt.<br />
<img alt="Dầu hào Lee Kum Kee chai 510g 1" class="lazy" src="https://vn-test-11.slatic.net/p/4f7c4abd7398a79fed38cc28cea070f8.jpg" /></p>

<p>C&ugrave;ng B&aacute;ch h&oacute;a XANH tham khảo c&aacute;ch d&ugrave;ng dầu h&agrave;o để nấu m&oacute;n thịt g&agrave; x&agrave;o ớt chu&ocirc;ng xanh nh&eacute;:</p>

<ul style="margin-left:40px">
	<li>
	<p>Trộn 250g thịt đ&atilde; được th&aacute;i l&aacute;t c&ugrave;ng 1 muỗng dầu h&agrave;o v&agrave; 1 muỗng tinh bột ng&ocirc; v&agrave; ướp trong khoảng 15 ph&uacute;t cho thấm gia vị.</p>
	</li>
	<li>
	<p>Đun dầu ăn v&agrave; x&agrave;o thịt cho đến khi vừa ch&iacute;n tới, th&ecirc;m 2 muỗng dầu h&agrave;o v&agrave; ớt chu&ocirc;ng.</p>
	</li>
	<li>
	<p>X&agrave;o cho đến khi m&oacute;n ăn ch&iacute;n ho&agrave;n to&agrave;n.</p>
	</li>
</ul>

<p>Kh&ocirc;ng n&ecirc;n đun m&oacute;n ăn với dầu h&agrave;o trong khoảng thời gian d&agrave;i v&igrave; điều n&agrave;y rất dễ l&agrave;m mất gi&aacute; trị dinh dưỡng v&agrave; hương vị thơm ngon vốn c&oacute; của dầu h&agrave;o.</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản dầu h&agrave;o Lee Kum Kee kum chun</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản ở nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời.</p>
	</li>
	<li>
	<p>Lưu &yacute;, để dầu h&agrave;o trong tủ lạnh sau khi mở nắp.</p>
	</li>
	<li>
	<p>Đậy k&iacute;n sau khi sử dụng.<br />
	<img alt="Dầu hào Lee Kum Kee chai 510g 2" class="lazy" src="https://salt.tikicdn.com/cache/525x525/ts/product/cb/82/1b/7c3839ad42240777da89fa7117cb2c8b.jpg" /></p>
	</li>
</ul>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>C&aacute;c cửa h&agrave;ng của B&aacute;ch h&oacute;a XANH tr&ecirc;n to&agrave;n quốc hiện đang b&agrave;y b&aacute;n c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của những thương hiệu nổi tiếng với mức gi&aacute; rất cạnh tranh. Kh&ocirc;ng những thế, khi mua h&agrave;ng online tại bachhoaxanh.com, bạn c&ograve;n được giao h&agrave;ng tận nơi c&ugrave;ng những khuyến m&atilde;i si&ecirc;u hấp dẫn.</p>
&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dau-hao-lee-kum-kee-co-ngon-khong-1307883">Dầu h&agrave;o Lee Kum Kee c&oacute; ngon kh&ocirc;ng?</a></div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (110, 'Bơ thực vật Meizan 80g', 9000, 0, 'store/images/bo-trung/bo-thuc-vat-meizan-hu-80g-202205161132461131_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p>Sản phẩm c&oacute; vị mặn dịu tự nhi&ecirc;n, người d&ugrave;ng c&oacute; thể sử dụng sản phẩm để l&agrave;m c&aacute;c m&oacute;n nướng, m&oacute;n x&agrave;o, nước sốt, l&agrave;m b&aacute;nh... tạo n&ecirc;n độ b&eacute;o c&ugrave;ng hương vị thơm ngon đặc trưng. Ngo&agrave;i ra,&nbsp;bạn cũng c&oacute; thể d&ugrave;ng trực tiếp để ăn c&ugrave;ng với b&aacute;nh m&igrave; v&agrave; một số đồ ăn nhanh kh&aacute;c.</p>
</div>

<ul style="margin-left:40px">
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng với b&aacute;nh m&igrave;, l&agrave;m b&aacute;nh, chi&ecirc;n x&agrave;o</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Dầu cọ, dầu stearin cọ, dầu olein nhận cọ, dầu stearin gạo, dầu đậu n&agrave;nh, dầu stearin cọ hy-đro h&oacute;a v&agrave; tinh luyện, nước, muối, hương bơ tổng hợp, chất nhũ h&oacute;a (476), lecitin đậu n&agrave;nh (322(i)), chất chống oxy h&oacute;a (321), (330), chất bảo quản (202), (211), phẩm m&agrave;u tổng hợp (160a(i)). Sản phẩm chứa nguy&ecirc;n liệu c&oacute; nguồn gốc từ đậu n&agrave;nh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, bảo quản lạnh sau khi mở nắp</div>
	</li>
	<li>Khối lượng
	<div>80g</div>
	</li>
	<li>Thương hiệu
	<div>Meizan (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Meizan l&agrave; thương hiệu chuy&ecirc;n về c&aacute;c sản phẩm gia vị được quản l&yacute; v&agrave; ph&aacute;t triển bởi C&ocirc;ng ty TNHH Dầu thực vật C&aacute;i L&acirc;n (CALOFIC). Th&agrave;nh lập từ năm 1996, với kinh nghiệm nhiều năm trong việc sản xuất v&agrave; ph&aacute;t triển c&aacute;c loại gia vị đ&atilde; gi&uacute;p Meizan chiếm trọn l&ograve;ng tin của người d&ugrave;ng bằng c&aacute;c sản phẩm chất lượng.<br />
<img alt="Bơ thực vật Meizan hũ 80g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/211277/bhx/bo-thuc-vat-meizan-hu-80g-202106031406168797.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Sản phẩm <a href="https://www.bachhoaxanh.com/bo-meizan-bo">bơ Meizan</a> được l&agrave;m từ c&aacute;c th&agrave;nh phần như dầu cọ, dầu đậu n&agrave;nh,... n&ecirc;n sẽ cung cấp cho cơ thể nguồn năng lượng dồi d&agrave;o, chất b&eacute;o,... Theo th&ocirc;ng tin được nghi&ecirc;n cứu, trong 100g <a href="https://www.bachhoaxanh.com/bo-bo">bơ</a>&nbsp;sẽ cung cấp khoảng 716.7 kcal.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng của sản phẩm <a href="https://www.bachhoaxanh.com/bo/bo-thuc-vat-meizan-hu-80g">bơ thực vật Meizan hũ 80g</a> đối với sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Bổ sung c&aacute;c chất b&eacute;o cần thiết</p>
	</li>
	<li>
	<p>Hỗ trợ hệ ti&ecirc;u h&oacute;a</p>
	</li>
	<li>
	<p>Gi&uacute;p xương chắc khỏe</p>
	</li>
	<li>
	<p>K&iacute;ch th&iacute;ch vị gi&aacute;c</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<p>Bơ lạt c&oacute; thể d&ugrave;ng trong nhiều m&oacute;n ăn, m&oacute;n b&aacute;nh để tăng cường vị thơm b&eacute;o. Bạn c&oacute; thể d&ugrave;ng k&egrave;m với b&aacute;nh m&igrave;, d&ugrave;ng trong c&aacute;c m&oacute;n chi&ecirc;n x&agrave;o để thay thế dầu ăn. Sản phẩm th&iacute;ch hợp cho người ăn chay.</p>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Bạn chỉ cần bảo quản sản phẩm ở nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, sau khi mở nắp cần bảo quản sản phẩm trong tủ lạnh để giữ chất lượng tốt nhất.<br />
Lưu &yacute;: Kh&ocirc;ng sử dụng khi sản phẩm c&oacute; dấu hiệu hết hạn, hương vị v&agrave; m&agrave;u sắc thay đổi. Nếu bị dị ứng đậu n&agrave;nh bạn cũng kh&ocirc;ng n&ecirc;n d&ugrave;ng để đảm bảo sức khỏe.<br />
<img alt="Bơ thực vật Meizan hũ 80g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/211277/bhx/bo-thuc-vat-meizan-hu-80g-202106031406243458.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>B&aacute;ch h&oacute;a XANH l&agrave; một trong những thương hiệu uy t&iacute;n khi chọn mua c&aacute;c sản phẩm bơ, tại đ&acirc;y c&aacute;c sản phẩm được kiểm tra nghi&ecirc;m ngặt, đảm bảo chất lượng v&agrave; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Khi mua sắm tại đ&acirc;y bạn c&ograve;n được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng v&agrave; tận nơi.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (111, 'Giấm gạo Ajinomoto 400ml', 17000, 0, 'store/images/bo-trung/giam-gao-len-men-ajinomoto-chai-400ml-202205161049398514_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p><a href="https://www.bachhoaxanh.com/giam/giam-gao-len-men-ajinomoto-chai-400ml">Giấm gạo l&ecirc;n men Ajinomoto chai 400ml</a> được l&ecirc;n men tự nhi&ecirc;n từ gạo với vị chua dịu v&agrave; m&ugrave;i hương đặc trưng mang lại sự ngon miệng v&agrave; tăng hương vị cho nhiều m&oacute;n ăn.<a href="https://www.bachhoaxanh.com/giam-ajinomoto"> Giấm ăn Ajinomoto</a> thương hiệu với những sản phẩm <a href="https://www.bachhoaxanh.com/giam">giấm</a> ăn chất lượng, được sử dụng rất phổ biến hiện nay.</p>
</div>

<ul style="margin-left:40px">
	<li>Loại
	<div>Giấm gạo l&ecirc;n men</div>
	</li>
	<li>Dung t&iacute;ch
	<div>400ml</div>
	</li>
	<li>Độ chua
	<div>4,5%</div>
	</li>
	<li>C&ocirc;ng dụng
	<div>Pha đến độ chua ph&ugrave; hợp với m&oacute;n ăn của bạn</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, cồn thực phẩm, gạo (20g/l)</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Lưu &yacute;
	<div>Do bản chất giấm l&ecirc;n men tự nhi&ecirc;n, một số chất lơ lửng c&oacute; thể xuất hiện trong qu&aacute; tr&igrave;nh bảo quản nhưng kh&ocirc;ng ảnh hưởng đến chất lượng sản phẩm</div>
	</li>
	<li>Thương hiệu
	<div>Ajinomoto (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Ajinomoto</h3>

<p>Ajinomoto, thương hiệu được người ti&ecirc;u d&ugrave;ng tr&ecirc;n thế giới biến đến với d&ograve;ng sản phẩm bột ngọt, thuộc sở hữu của tập đo&agrave;n Ajinomoto của Nhật Bản, v&agrave; ch&iacute;nh thức bước ch&acirc;n v&agrave;o thị trường Việt Nam v&agrave;o năm 1991. Sau hơn hơn 30 năm c&oacute; mặt tại Việt Nam, Ajinomoto kh&ocirc;ng những được y&ecirc;u th&iacute;ch với d&ograve;ng sản phẩm bột ngọt m&agrave; c&aacute;c sản phẩm như: Giấm gạo, nước tương,... cũng đang được sử dụng rất phổ biến hiện nay.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong giấm gạo l&ecirc;n men Ajinomoto chai 400ml</h3>

<p>Giấm gạo l&ecirc;n men Ajinomoto được l&ecirc;n men tự nhi&ecirc;n từ gạo, mang đến vị chua dịu v&agrave; m&ugrave;i thơm đặc trưng. Th&agrave;nh phần c&oacute; chứa: Nước, cồn thực phẩm, gạo. Độ chua: 4,5%.<br />
<img class="lazy" src="https://lh5.googleusercontent.com/kgs4wASW6S6I_FdbktLf6rfk5g_GzW81p9bS4icyPawYuwpl5e4ItktiGqlq_tHFLDRHjL-6xXX420T4-wEzkohLkF-Uph1mAHHnkqzEL-YdmzzgeI5R-jEkGnbO-37Q2TnN5NPY" style="height:600px; width:800px" /></p>

<h3>T&aacute;c dụng của giấm gạo l&ecirc;n men Ajinomoto với sức khỏe</h3>

<p>Kh&ocirc;ng chỉ l&agrave;m tăng hương vị cho m&oacute;n ăn, giấm gạo c&ograve;n được sử dụng nhiều bởi những lợi &iacute;ch tuyệt vời của n&oacute; đối với sức khỏe, n&oacute; c&oacute; t&aacute;c động t&iacute;ch cực đến hầu hết c&aacute;c cơ quan trong cơ thể như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Gi&uacute;p tăng cường sức khỏe hệ miễn dịch v&igrave; n&oacute; c&oacute; chứa c&aacute;c axit amin thiết yếu.</p>
	</li>
	<li>
	<p>Giấm gạo chứa axit axetic tốt gi&uacute;p tăng cường sức khỏe hệ ti&ecirc;u h&oacute;a.</p>
	</li>
	<li>
	<p>Ngo&agrave;i ra giấm gạo gi&uacute;p cơ thể c&oacute; thể hấp thụ nhiều canxi, kali, v&agrave; vitamin từ những thực phẩm kh&aacute;c.</p>
	</li>
	<li>
	<p>Ăn giấm gạo c&oacute; khả năng l&agrave;m chậm sự t&iacute;ch tụ cholesterol tr&ecirc;n th&agrave;nh mạch m&aacute;u n&ecirc;n rất tốt cho sức khỏe tim mạch nh&eacute;.</p>
	</li>
	<li>
	<p>Nhờ v&agrave;o chất axit acetic c&oacute; trong giấm gạo kh&ocirc;ng chỉ c&oacute; t&aacute;c dụng k&iacute;ch th&iacute;ch sự ngon miệng, cải thiện hệ ti&ecirc;u h&oacute;a m&agrave; giấm gạo c&ograve;n gi&uacute;p giảm c&acirc;n.</p>
	</li>
</ul>

<p>B&ecirc;n cạnh đ&oacute;, trước mỗi bữa ăn bạn c&oacute; thể d&ugrave;ng 2 muỗng giấm nhỏ. Việc n&agrave;y sẽ gi&uacute;p bạn hạn chế sự th&egrave;m ăn từ đ&oacute; l&agrave;m giảm lượng thức ăn được nạp v&agrave;o cơ thể. Đ&acirc;y l&agrave; c&aacute;ch hiệu quả để bạn c&oacute; thể giảm c&acirc;n như mong muốn.</p>

<h3>Hướng dẫn sử dụng giấm gạo l&ecirc;n men Ajinomoto</h3>

<p>Giấm gạo Ajinomoto c&oacute; m&agrave;u trắng trong, hơi ngả v&agrave;ng, thường được l&agrave;m từ rượu gạo, l&agrave; loại gia vị th&ocirc;ng dụng, được d&ugrave;ng ở hầu hết c&aacute;c nước ch&acirc;u &Aacute;. Giấm gạo l&ecirc;n men th&iacute;ch hợp l&agrave;m gia vị n&ecirc;m v&agrave;o thức ăn, nước chấm để tạo vị chua, thơm đặc trưng, hoặc d&ugrave;ng để muối chua rau quả nhằm lưu trữ được l&acirc;u hơn.</p>

<p>Ngo&agrave;i ra, giấm c&ograve;n được sử dụng để khử m&ugrave;i tanh cho c&aacute;, l&agrave;m sạch chảo nồi, hay bồn rửa b&aacute;t bẩn&hellip; như một số mẹo vặt của nh&agrave; bếp.<br />
<img class="lazy" src="https://lh3.googleusercontent.com/ahaWTOrIMhqynnQ3z1yaX6BiOdv3VPYNYsEEYeqhZTDFi-5a0ETeQiDJBXKN7OIVQWupEttBuHql8pR1DHEPVqQMGge6xjVuhyqBfXJ5Fnoe261IJgV-Cb5o4GDa99pDAXw2EmW9" style="height:600px; width:800px" /></p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản giấm gạo l&ecirc;n men Ajinomoto</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản giấm gạo ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh &aacute;nh nắng mặt trời.</p>
	</li>
	<li>
	<p>Lưu &yacute;, đậy k&iacute;n nắp sau khi sử dụng.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng d&ugrave;ng sản phẩm hết hạn sử dụng.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua h&agrave;ng tại B&aacute;ch ho&aacute; XANH</h3>

<p>Bạn c&oacute; thể gh&eacute; c&aacute;c cửa h&agrave;ng của B&aacute;ch h&oacute;a XANH để mua sắm c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của c&aacute;c thương hiệu nổi tiếng với mức gi&aacute; hợp l&yacute;. Ngo&agrave;i ra, khi mua h&agrave;ng online tại bachhoaxanh.com, bạn sẽ được giao h&agrave;ng tận nơi c&ugrave;ng những khuyến m&atilde;i si&ecirc;u hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 0, 5, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (112, 'Giấm ăn A Tuấn Khang 900ml', 17200, 0, 'store/images/bo-trung/giam-tinh-luyen-a-tuan-khang-chai-900ml-202209010914003687_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p>Sản phẩm&nbsp;<a href="https://www.bachhoaxanh.com/bo" target="_blank">giấm ăn</a>&nbsp;của thương hiệu&nbsp;&nbsp;<a href="https://www.bachhoaxanh.com/bo-a-tuan-khang" target="_blank">A Tuấn Khang</a>&nbsp;l&agrave; loại gia vị quen thuộc đối với người ti&ecirc;u d&ugrave;ng Việt trong nhiều năm qua.&nbsp;<a href="https://www.bachhoaxanh.com/bo/giam-tinh-luyen-a-tuan-khang-chai-900ml" target="_blank">Giấm tinh luyện A Tuấn Khang chai 500ml</a>&nbsp;được sử dụng&nbsp;để pha nước chấm, ng&acirc;m đồ chua, l&agrave;m mềm thịt, khử m&ugrave;i tanh của thực phẩm, d&ugrave;ng để rửa rau&hellip;</p>
</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>900ml</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Kh&ocirc;ng sử dụng sản phẩm khi đ&atilde; hết hạn sử dụng</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng trộn gỏi hoặc l&agrave;m gia vị.</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước 95%, chất điều chỉnh độ acid 5%.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>A Tuấn Khang (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (113, 'Bơ đậu mịn Golden Farm 170g', 36900, 0, 'store/images/bo-trung/bo-dau-phong-min-golden-farm-hu-170g-202205161130322613_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Được l&agrave;m từ hạt đậu phộng hảo hạng v&agrave; c&aacute;c loại gia vị tự nhi&ecirc;n, l&agrave; &quot;si&ecirc;u thực phẩm&quot; dinh dưỡng, cung cấp nguồn năng lượng dồi d&agrave;o v&agrave; c&aacute;c dưỡng chất thiết yếu cho cơ thể.&nbsp;với hương vị thơm b&eacute;o tự nhi&ecirc;n, hậu mặn ngọt h&ograve;a quyện, chất bơ s&aacute;nh mịn mang đến cho bạn những bữa ăn ngon, nhanh gọn.</div>

<ul style="margin-left:40px">
	<li>Đặc t&iacute;nh
	<div>Bơ đậu phộng dạng mịn</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng l&agrave;m b&aacute;nh m&igrave;, l&agrave;m nh&acirc;n b&aacute;nh, x&acirc;y sinh tố v&agrave; l&agrave;m c&aacute;c loại nước chấm. Sản phẩm c&oacute; th&agrave;nh phần chủ yếu l&agrave; đậu phộng nguy&ecirc;n chất n&ecirc;n c&oacute; thể t&aacute;ch dầu l&agrave; hiện tượng b&igrave;nh thường, chất lượng sản phẩm vẫn ổn định</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng (90%), đường, dầu thực vật (dầu đậu n&agrave;nh), muối</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, bảo quản lạnh sau khi mở nắp</div>
	</li>
	<li>Khối lượng
	<div>170g</div>
	</li>
	<li>Thương hiệu
	<div>Golden Farm (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><a href="https://www.bachhoaxanh.com/bo-bo" target="_blank">Bơ</a>&nbsp;l&agrave; loại thực phẩm đầy dinh dưỡng v&agrave; thơm ngon ph&ugrave; hợp cho một lối sống l&agrave;nh mạnh. <a href="https://www.bachhoaxanh.com/bo/bo-dau-phong-min-golden-farm-hu-170g" target="_blank">Bơ đậu phộng mịn Golden Farm 170g</a>&nbsp;của&nbsp;<a href="https://www.bachhoaxanh.com/bo-golden-farm-bo" target="_blank">bơ&nbsp;Golden Farm</a> lu&ocirc;n được người d&ugrave;ng tin tưởng lựa chọn.</p>

<p><img class="lazy" src="https://lh5.googleusercontent.com/EDDGBbCZCfLXHXtKXtKOTOs3Lc_ss2O7C2jyArV5sCVdobVRMzDTh9qJ_UoRwNdU0hSSIuDh6_TTxOV8F-ubDcucqJfSBR02FGKybhl67VacbWLNPTZffSYD7nwMc63uSlxiVcv9" style="height:530px; width:800px" /></p>

<h2><strong>Lớp bơ&nbsp;mịn m&agrave;ng</strong></h2>

<p>Sản phẩm <strong>dạng mịn, kh&ocirc;ng chứa hạt</strong>. Sản phẩm được l&agrave;m từ đậu phộng (90%), đường, dầu thực vật, muối tốt cho sức khỏe người ti&ecirc;u d&ugrave;ng.</p>

<h2><strong>C&aacute;ch sử dụng</strong></h2>

<p>Sản phẩm hạt mịn n&ecirc;n c&oacute; thể d&ugrave;ng l&agrave;m <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/banh-mi-phet-bo-dau-phong-phong-cach-hong-kong-thom-ngon-kho-cuong-1099012" target="_blank">b&aacute;nh m&igrave; phết bơ đậu phộng</a>, l&agrave;m nh&acirc;n b&aacute;nh v&agrave; l&agrave;m c&aacute;c loại nước chấm. Sản phẩm c&oacute; th&agrave;nh phần chủ yếu l&agrave; đậu phộng nguy&ecirc;n chất n&ecirc;n ho&agrave;n to&agrave;n c&oacute; thể <strong>t&aacute;ch dầu l&agrave; hiện tượng b&igrave;nh thường, chất lượng sản phẩm vẫn ổn định.</strong></p>

<p><img class="lazy" src="https://lh4.googleusercontent.com/MThWDiBOdWIVDo0GzQNhQ8hKzF_OGQjjNhqvrL5Oa-_oPOadN2RTFaAVNDY-ZjsqQBrtf1Qi3UPT7t2iJYVk0IOpGthixSZybU5jMfqJ5O1x4pRBhANqMx3brn7it1FrJCozmzoV" style="height:530px; width:800px" /></p>

<h2><strong>Tiện lợi</strong></h2>

<p>Sản phẩm <strong>dạng hủ nắp vặn dễ d&agrave;ng sử dụng v&agrave; bảo quản l&acirc;u d&agrave;i </strong>trong ngăn m&aacute;t tủ lạnh. Chỉ cần phết l&ecirc;n l&aacute;t b&aacute;nh m&igrave; l&agrave; bạn đ&atilde; c&oacute; một bữa s&aacute;ng đầy đủ thơm ngon.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (114, 'Giấm táo Ottogi 450ml', 25000, 0, 'store/images/bo-trung/giam-tao-ottogi-chai-450ml-202205161137476458_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&aacute;c sản phẩm&nbsp;<a href="https://www.bachhoaxanh.com/bo-ottogi-giam-an">giấm Ottogi</a>&nbsp;được đ&oacute;ng chai an to&agrave;n, thuận tiện cho việc sử dụng v&agrave; bảo quản.&nbsp;<a href="https://www.bachhoaxanh.com/bo/giam-tao-ottogi-chai-450ml">Giấm t&aacute;o Ottogi chai 450ml</a> l&agrave; sự kết hợp&nbsp;từ t&aacute;o c&ocirc; đặc v&agrave; rượu l&ecirc;n men tự nhi&ecirc;n, g&oacute;p phần gi&uacute;p cho c&aacute;c m&oacute;n trộn salad, gỏi chua, c&aacute;c m&oacute;n nh&uacute;ng <a href="https://www.bachhoaxanh.com/bo-giam-an">giấm</a>&hellip; đậm đ&agrave; hơn.</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>450ml</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng trộn gỏi, trộn salad, ướp thức ăn</div>
	</li>
	<li>Th&agrave;nh phần
	<div>T&aacute;o c&ocirc; đặc (5%), hương t&aacute;o (0.082%), rượu cồn l&ecirc;n men</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Ottogi (H&agrave;n Quốc)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (115, 'Giấm hoa quả A Tuấn Khang 500ml', 16000, 0, 'store/images/bo-trung/giam-nuoi-hoa-qua-a-tuan-khang-chai-500ml-202205161050551568_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/giam-a-tuan-khang" target="_blank">Giấm A Tuấn Khang</a> l&agrave; thương hiệu gia vị quen thuộc đối với c&aacute;c gia đinh Việt Nam trong nhiều năm qua. <a href="https://www.bachhoaxanh.com/giam/giam-hoa-qua-atk-chai-500ml" target="_blank">Giấm nu&ocirc;i hoa quả A Tuấn Khang chai 500ml</a> l&agrave; một loại giấm v&ocirc; c&ugrave;ng chất lượng v&agrave; bổ dưỡng với c&aacute;c nguy&ecirc;n liệu tự nhi&ecirc;n từ tr&aacute;i c&acirc;y&hellip; mang đến hương vị đặc trưng hơn so với c&aacute;c loại&nbsp;<a href="https://www.bachhoaxanh.com/giam" target="_blank">giấm</a> kh&aacute;c.</div>

<ul style="margin-left:40px">
	<li>Loại
	<div>Giấm nu&ocirc;i hoa quả</div>
	</li>
	<li>Dung t&iacute;ch
	<div>500ml</div>
	</li>
	<li>C&ocirc;ng dụng
	<div>D&ugrave;ng chế biến c&aacute;c m&oacute;n salad hoặc pha nước chấm</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Hoa quả (chuối xi&ecirc;m ch&iacute;nh, t&aacute;o, l&ecirc;, thanh long, dứa,...) 48%, nước dừa tươi 38%, nước lọc 10%, đường cate 4%</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Lưu &yacute;
	<div>Trong giấm l&ecirc;n men tự nhi&ecirc;n sẽ c&oacute; những sợi trắng d&agrave;i li ti l&agrave; con giấm, v&ocirc; hại tới sức khoẻ</div>
	</li>
	<li>Thương hiệu
	<div>A Tuấn Khang (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (116, 'Dầu hào chay Lee Kum Kee 510g', 45100, 47500, 'store/images/bo-trung/dau-hao-chay-lee-kum-kee-chai-510g-202303082234231676_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">Dầu h&agrave;o</a><a href="https://www.bachhoaxanh.com/dau-hao-lee-kum-kee" target="_blank">&nbsp;Lee Kum Kee</a>&nbsp;l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">dầu h&agrave;o</a> nhập khẩu từ Malaysia, được xem l&agrave; b&iacute; k&iacute;p cho c&aacute;c m&oacute;n x&agrave;o được s&aacute;ng b&oacute;ng đẹp mắt. <a href="https://www.bachhoaxanh.com/dau-hao/dau-hao-chay-lee-kum-kee-chai-510g" target="_blank">Dầu h&agrave;o chay Lee Kum Kee chai 510g</a>&nbsp;c&oacute; hương vị c&acirc;n bằng giữa vị ngọt xen lẫn vị mặn nhẹ, d&ugrave;ng được cho cả m&oacute;n chay lẫn m&oacute;n mặn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Dầu h&agrave;o chay</div>
	</li>
	<li>Trọng lượng
	<div>510g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước tương (nước, đậu n&agrave;nh, muối, bột mỳ), đường glucose, đường, muối, tinh bột bắp biến t&iacute;nh, m&agrave;u thực phẩm tự nhi&ecirc;n Caramel I-Plain/150a, bột nấm rơm, chiết xuất men (chiết xuất men, muối), hương vị tự nhi&ecirc;n v&agrave; nh&acirc;n tạo, chất điều chỉnh độ axit (acid lactic/720), chất bảo quản (Sodium Benzoate/211), chất điều vị (Disodium 5&#39;-Inosinate/631, Disodium 5&#39;-Gluanylate/627). C&oacute; chứa đậu n&agrave;nh, l&uacute;a mỳ.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng để ướp, x&agrave;o hoặc n&ecirc;m nếm cho c&aacute;c m&oacute;n ăn chay.</div>
	</li>
	<li>Lưu &yacute;
	<div>Chỉ sử dụng sản phẩm khi bao b&igrave; c&ograve;n nguy&ecirc;n vẹn</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời. Giữ trong tủ lạnh sau khi mở nắp. Lắc đều trước khi sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>Lee Kum Kee (Hồng K&ocirc;ng)</div>
	</li>
	<li>Sản xuất
	<div>Malaysia</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (117, '2 chai dầu hào chay Maggi 350g', 27000, 54000, 'store/images/bo-trung/dau-hao-chay-maggi-chai-350g-202304271541259245_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/bo-dau-hao">Dầu h&agrave;o</a>&nbsp;l&agrave; loại gia vị quen thuộc trong đ&oacute;&nbsp;thương hiệu <a href="https://www.bachhoaxanh.com/bo-maggi-dau-hao">dầu h&agrave;o Maggi</a>&nbsp;được đ&aacute;nh gi&aacute; cao về chất lượng. <a href="https://www.bachhoaxanh.com/bo/combo-2-dau-hao-chay-maggi-chai-350g">2 chai dầu h&agrave;o chay Maggi nấm hương chai 350g</a>&nbsp;c&agrave;ng trở n&ecirc;n đặc biệt hơn v&igrave; được chế biến từ những nguy&ecirc;n liệu thuần chay, n&ecirc;n người ăn mặn hay ăn chay đều c&oacute; thể sử dụng được.</div>

<ul style="margin-left:40px">
	<li>Combo gồm
	<div>2&nbsp;chai dầu h&agrave;o chay Maggi từ nấm hương</div>
	</li>
	<li>Khối lượng
	<div>350g/chai</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>1. 20g (1,5 muỗng s&uacute;p) cho 400g rau. 2. X&agrave;o rau với dầu ăn, xong n&ecirc;m với dầu h&agrave;o chay Maggi từ nấm hương. 3. Kh&ocirc;ng cần n&ecirc;m th&ecirc;m gia vị kh&aacute;c.</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, muối i ốt, chất ổn định 1442, chất điều vị, hương liệu giống tự nhi&ecirc;n, chất tạo m&agrave;u tổng hợp, bột nấm hương, chất điều chỉnh độ acid 330, chất bảo quản 202.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Maggi (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (118, 'Dầu hào gấu trúc Lee Kum Kee 255g', 29900, 0, 'store/images/bo-trung/dau-hao-lee-kum-kee-gau-truc-chai-255g-202304051454585205_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/bo/dau-hao-gau-truc-lee-kum-kee-chai-255g" target="_blank">Dầu h&agrave;o Lee Kum Kee gấu tr&uacute;c chai 255g</a>&nbsp;được chiết xuất từ h&agrave;o tươi 100%, c&oacute; hương vị c&acirc;n bằng giữa vị ngọt xen lẫn vị mặn nhẹ.&nbsp;<a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">Dầu h&agrave;o</a><a href="https://www.bachhoaxanh.com/dau-hao-lee-kum-kee" target="_blank">&nbsp;Lee Kum Kee</a>&nbsp;l&agrave; nh&atilde;n hiệu&nbsp;<a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">dầu h&agrave;o</a>&nbsp;được y&ecirc;u th&iacute;ch tại nhiều quốc gia tr&ecirc;n thế giới, kh&ocirc;ng chất bảo quản v&agrave; bột ngọt, rất an to&agrave;n cho sức khỏe.</div>

<ul style="margin-left:40px">
	<li>Đặc t&iacute;nh
	<div>Chiết xuất h&agrave;o từ 100% h&agrave;o tươi thật, kh&ocirc;ng chất bảo quản.</div>
	</li>
	<li>Khối lượng
	<div>255g</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>X&agrave;o, ướp, n&ecirc;m m&oacute;n ăn</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, muối, tinh bột bắp biến t&iacute;nh, chiết xuất h&agrave;o 11%, bột mỳ, m&agrave;u thực phẩm tư nhi&ecirc;n c&oacute; chứa l&uacute;a mỳ,...</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Lee Kum Kee (Hồng K&ocirc;ng)</div>
	</li>
	<li>Nơi sản xuất
	<div>Malaysia</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (119, 'Dầu hào chay Lee Kum Kee 255g', 38000, 39800, 'store/images/bo-trung/dau-hao-chay-lee-kum-kee-chai-255g-202303082235355526_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">Dầu h&agrave;o</a><a href="https://www.bachhoaxanh.com/dau-hao-lee-kum-kee" target="_blank">&nbsp;Lee Kum Kee</a>&nbsp;l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/dau-hao" target="_blank">dầu h&agrave;o</a> nhập khẩu từ Malaysia, được xem l&agrave; một b&iacute; k&iacute;p cho c&aacute;c m&oacute;n x&agrave;o được s&aacute;ng b&oacute;ng đẹp mắt. <a href="https://www.bachhoaxanh.com/dau-hao/dau-hao-chay-lee-kum-kee-chai-255g" target="_blank">Dầu h&agrave;o chay Lee Kum Kee chai 255g</a>&nbsp;c&oacute; hương vị c&acirc;n bằng giữa vị ngọt xen lẫn vị mặn nhẹ, l&agrave;m nổi bật l&ecirc;n sự tự nhi&ecirc;n tinh tế trong từng m&oacute;n ăn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Dầu h&agrave;o chay</div>
	</li>
	<li>Trọng lượng
	<div>255g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước tương (nước, đậu n&agrave;nh, muối, bột mỳ), đường glucose, đường, muối, tinh bột bắp biến t&iacute;nh, m&agrave;u thực phẩm tự nhi&ecirc;n Caramel I-Plain/150a, bột nấm rơm, chiết xuất men (chiết xuất men, muối), hương vị tự nhi&ecirc;n v&agrave; nh&acirc;n tạo, chất điều chỉnh độ axit (acid lactic/720), chất bảo quản (Sodium Benzoate/211), chất điều vị (Disodium 5&#39;-Inosinate/631, Disodium 5&#39;-Gluanylate/627). C&oacute; chứa đậu n&agrave;nh, l&uacute;a mỳ.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng để ướp, x&agrave;o hoặc n&ecirc;m nếm cho c&aacute;c m&oacute;n ăn chay.</div>
	</li>
	<li>Lưu &yacute;
	<div>Chỉ sử dụng sản phẩm khi bao b&igrave; c&ograve;n nguy&ecirc;n vẹn</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời. Giữ trong tủ lạnh sau khi mở nắp. Lắc đều trước khi sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>Lee Kum Kee (Hồng K&ocirc;ng)</div>
	</li>
	<li>Sản xuất
	<div>Malaysia</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (120, 'Dầu hào bào ngư Bếp Việt 1kg', 72000, 0, 'store/images/bo-trung/dau-hao-bao-ngu-bep-viet-goi-1kg-202205161243397392_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p><a href="https://www.bachhoaxanh.com/bo-dau-hao">Dầu h&agrave;o</a> của thương hiệu <a href="https://www.bachhoaxanh.com/bo-bep-viet-dau-hao">dầu h&agrave;o Bếp Việt</a>&nbsp;l&agrave; một sự kết hợp ho&agrave;n hảo giữa chiết xuất h&agrave;u v&agrave; chiết xuất b&agrave;o ngư nguy&ecirc;n chất.&nbsp;<a href="https://www.bachhoaxanh.com/bo/dau-hao-bao-ngu-bep-viet-goi-1kg" target="_blank">Dầu h&agrave;o b&agrave;o ngư Bếp Việt g&oacute;i 1kg</a>&nbsp;gi&agrave;u chất dinh dưỡng, với hương vị thơm ngon ph&ugrave; hợp với c&aacute;c m&oacute;n ăn, mang lại cho m&oacute;n ăn một hương vị đậm đ&agrave; v&agrave; độc đ&aacute;o.</p>
</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>1kg</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Kh&ocirc;ng d&ugrave;ng cho người ăn chay</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng l&agrave;m gia vị chế biến c&aacute;c m&oacute;n ăn như</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, chiết xuất h&agrave;u, chiết xuất b&agrave;o ngư, chiết xuất nấm men, muối, cốt nước tương c&ocirc; đặc (đậu n&agrave;nh, nước), chất l&agrave;m đầy, chất điều vị, chất điều chỉnh độ acid,...</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Bếp Việt (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (121, 'Bơ thực vật Tường An 800g', 61000, 0, 'store/images/bo-trung/bo-thuc-vat-tuong-an-hop-800g-202205161241178229_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với hương vị đặc trưng được phối trộn theo c&ocirc;ng thức độc quyền c&ugrave;ng dưỡng chất&nbsp;Vitamin A.&nbsp;<a href="https://www.bachhoaxanh.com/bo/bo-thuc-vat-margarine-tuong-an-hop-800g" target="_blank">Bơ thực vật margarine Tường An hộp 800g</a> đến từ thương hiệu <a href="https://www.bachhoaxanh.com/bo-tuong-an-bo" target="_blank">bơ Tường An</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/bo-bo" target="_blank">bơ</a>, th&iacute;ch hợp cho việc chế biến m&oacute;n ăn chi&ecirc;n, x&agrave;o, l&agrave;m b&aacute;nh,... d&agrave;nh cho người ăn chay v&agrave; ăn mặn.</div>

<ul style="margin-left:40px">
	<li>Đặc t&iacute;nh
	<div>Bổ sung vitamin A. Kh&ocirc;ng chứa cholesterol, chất b&eacute;o cấu h&igrave;nh Trans</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng cho c&ocirc;ng nghiệp chế biến b&aacute;nh kẹo, c&agrave; ph&ecirc;, ăn với b&aacute;nh m&igrave;, chi&ecirc;n, x&agrave;o, d&ugrave;ng được cho người ăn chay</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Dầu thực vật tinh luyện, nước. Phụ gia thực phẩm gồm Lecithin (322), hương bơ, muối, mono v&agrave; diglycerid của c&aacute;c axit b&eacute;o (471), chất chống oxy h&oacute;a (321), acid citric (330),...</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, bảo quản lạnh sau khi mở nắp</div>
	</li>
	<li>Khối lượng
	<div>800g</div>
	</li>
	<li>Thương hiệu
	<div>Tường An (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Tường An</h3>

<p>Bơ thực vật Tường An hiện đang l&agrave; d&ograve;ng sản phẩm bơ thực vật b&aacute;n chạy số 1 tại thị trường Việt Nam được sản xuất bởi C&ocirc;ng ty cổ phần dầu thực vật Tường An.<br />
Tường An l&agrave; thương hiệu đ&atilde; c&oacute; hơn 43 năm đồng h&agrave;nh c&ugrave;ng người nội trợ Việt Nam, g&oacute;p phần tạo n&ecirc;n những m&oacute;n ăn ngon, tr&ograve;n vị. Ngo&agrave;i dầu ăn, Bơ cũng l&agrave; sản phẩm rất được ưa chuộng hiện nay của Tường An, được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại đạt chuẩn n&ecirc;n c&aacute;c sản phẩm mang thương hiệu Tường An đều rất chất lượng, an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong bơ thực vật Tường An&nbsp;800g</h3>

<p>Bơ thực vật Tường An 800g c&oacute; những th&agrave;nh phần như: Dầu thực vật tinh luyện, nước v&agrave; Vitamin A palmitat.<br />
<img alt="Bơ thực vật Tường An hộp 800g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3465/244894/bhx/files/244894%20Bv.png" style="height:500px; width:800px" /></p>

<h3>T&aacute;c dụng của bơ thực vật Tường An với sức khỏe</h3>

<p>Được sản xuất từ nguồn nguy&ecirc;n liệu nhập khẩu 100%, bổ sung th&ecirc;m Vitamin A v&agrave; c&aacute;c chất dinh dưỡng, ngo&agrave;i ra d&ograve;ng sản phẩm bơ thực vật Tường An kh&ocirc;ng chứa cholesterol, axit b&eacute;o cấu h&igrave;nh trans n&ecirc;n rất an to&agrave;n, tốt cho sức khỏe.</p>

<h3>Hướng dẫn sử dụng&nbsp;bơ thực vật Tường An</h3>

<p>Bơ Tường An c&oacute; m&agrave;u sắc v&agrave; m&ugrave;i vị tương tự như những loại bơ động vật, ngo&agrave;i ra được bổ sung th&ecirc;m muối, c&ugrave;ng hương liệu n&ecirc;n rất th&iacute;ch hợp d&ugrave;ng để ăn k&egrave;m với b&aacute;nh m&igrave;, hoặc l&agrave;m tăng hương vị cho c&aacute;c m&oacute;n ăn bằng c&aacute;ch cho một &iacute;t bơ chung với dầu ăn sau đ&oacute; bỏ thịt v&agrave;o để chi&ecirc;n, x&agrave;o....</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản&nbsp;bơ thực vật Tường An</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản bơ thực vật&nbsp;ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh &aacute;nh nắng trực tiếp, sau khi mở bao b&igrave; n&ecirc;n để&nbsp;bơ trong ngăn m&aacute;t tủ lạnh.</p>
	</li>
	<li>
	<p>Lưu &yacute;, ngưng sử dụng, nếu bơ bị mất m&agrave;u, c&oacute; vị chua, v&agrave; c&oacute; m&ugrave;i lạ.<br />
	<img alt="Bơ thực vật Tường An hộp 800g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/244894/bhx/bo-thuc-vat-margarine-tuong-an-hop-800g-202111031437450559.jpg" /></p>
	</li>
</ul>

<h3>Ưu điểm khi mua bơ thực vật&nbsp;tại B&aacute;ch ho&aacute; XANH</h3>

<p>B&aacute;ch h&oacute;a XANH l&agrave; địa chỉ uy t&iacute;n để chọn mua c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của Tường An c&ugrave;ng mức gi&aacute; rất phải chăng. Ngo&agrave;i ra, khi mua h&agrave;ng online tại bachhoaxanh.com, bạn sẽ được giao h&agrave;ng tận nơi c&ugrave;ng nhiều khuyến m&atilde;i hấp dẫn.<br />
&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bo-tuong-an-gia-vi-khong-the-thieu-trong-cac-mon-an-ngon-dinh-duong-1449879">Bơ Tường An - gia vị kh&ocirc;ng thể thiếu trong c&aacute;c m&oacute;n ăn ngon, dinh dưỡng</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (122, 'Dầu hào chay Maggi 820g', 52000, 0, 'store/images/bo-trung/dau-hao-chay-maggi-tu-nam-huong-chai-820g-202303082131254190_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/bo-maggi">Dầu h&agrave;o Maggi</a>&nbsp;l&agrave; thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/bo">dầu h&agrave;o</a>&nbsp;số 1 tại Việt Nam. Sản phẩm <a href="https://www.bachhoaxanh.com/bo/dau-hao-chay-maggi-tu-nam-huong-chai-820g">Dầu h&agrave;o chay Maggi nấm hương chai 820g</a> nguy&ecirc;n liệu ch&iacute;nh từ nấm hương tự nhi&ecirc;n với thịt nấm xay nhuyễn tạo n&ecirc;n hỗn hợp xốt&nbsp;s&oacute;ng s&aacute;nh với vị thanh ngọt cho m&oacute;n ăn th&ecirc;m đậm đ&agrave;, hấp dẫn.</p>
</div>

<ul style="margin-left:40px">
	<li>Khối lượng
	<div>820g</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>1. 20g (1,5 muỗng s&uacute;p) cho 400g rau. 2. X&agrave;o rau với dầu ăn, xong n&ecirc;m với dầu h&agrave;o chay Maggi từ nấm hương. 3. Kh&ocirc;ng cần n&ecirc;m th&ecirc;m gia vị kh&aacute;c.</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, muối i ốt, chất ổn định 1442, chất điều vị, hương liệu giống tự nhi&ecirc;n, chất tạo m&agrave;u tổng hợp, bột nấm hương, chất điều chỉnh độ acid 330, chất bảo quản 202.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Maggi (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;Maggi</h3>

<p>Dầu h&agrave;o chay Maggi từ nấm hương l&agrave; d&ograve;ng sản phẩm dầu h&agrave;o d&agrave;nh cho người ăn chay được sản xuất bởi C&ocirc;ng ty TNHH Nestl&eacute; Việt Nam.<br />
Maggi l&agrave; thương hiệu chuy&ecirc;n sản xuất v&agrave; kinh doanh c&aacute;c sản phẩm gia vị bếp nổi tiếng tr&ecirc;n to&agrave;n thế giới với hơn 300 sản phẩm đ&atilde; được b&aacute;n ra tr&ecirc;n thị trường, hiện Maggi đang l&agrave; thương hiệu thuộc sở hữu của tập đo&agrave;n Nestle, tại Việt Nam Maggi rất được ưa chuộng với những d&ograve;ng sản phẩm như: Dầu h&agrave;o, hạt n&ecirc;m, nước mắm,...</p>

<h3>Th&agrave;nh phần dinh dưỡng trong dầu h&agrave;o chay Maggi từ nấm hương chai 820g</h3>

<p>Những gi&aacute; trị dinh dưỡng c&oacute; trong dầu h&agrave;o chay Maggi từ nấm hương 820g: Calo, carbohydrate, đường, chất đạm, natri...trong 100g dầu h&agrave;o Maggi c&oacute; chứa khoảng 100 calo.<br />
<img alt="Dầu hào chay Maggi chai 820g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/282347/bhx/dau-hao-chay-maggi-tu-nam-huong-chai-820g-202206221331189559.jpg" /></p>

<h3>T&aacute;c dụng của dầu h&agrave;o chay Maggi từ nấm hương với sức khỏe</h3>

<p>Được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại, với nguồn nguy&ecirc;n liệu được chọn lọc kỹ lưỡng n&ecirc;n đảm bảo an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng. Ngo&agrave;i ra, dầu h&agrave;o chay Maggi c&ograve;n c&oacute; nhiều c&ocirc;ng dụng tốt cho sức khỏe.</p>

<ul style="margin-left:40px">
	<li>
	<p>Hỗ trợ sự ph&aacute;t triển của cơ thể nhờ c&oacute; chứa đến 22 loại axit amin.</p>
	</li>
	<li>
	<p>Tăng khả năng miễn dịch v&agrave; sức đề kh&aacute;ng.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng l&agrave;m tăng c&acirc;n, sử dụng được cho người ăn ki&ecirc;ng, giảm c&acirc;n.</p>
	</li>
</ul>

<h3>Hướng dẫn sử dụng&nbsp;dầu h&agrave;o chay Maggi từ nấm hương</h3>

<p>Dầu h&agrave;o chay Maggi c&oacute; m&agrave;u n&acirc;u c&aacute;nh gi&aacute;n&nbsp;với vị thanh ngọt đặc trưng, rất hợp khi chế biến c&aacute;c m&oacute;n x&agrave;o, chi&ecirc;n như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cải th&igrave;a x&agrave;o dầu h&agrave;o.</p>
	</li>
	<li>
	<p>Sườn cốt lết sốt dầu h&agrave;o.</p>
	</li>
	<li>
	<p>Nấm mối kho dầu h&agrave;o.</p>
	</li>
</ul>

<p>C&oacute; thể d&ugrave;ng để nấu m&oacute;n chay hay m&oacute;n mặn.<br />
<img alt="Dầu hào chay Maggi chai 820g 1" class="lazy" src="https://www.giadinhnestle.com.vn/sites/default/files/2022-06/IN-ARTICLE%20BANNERS%20-%2003.jpg" /></p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản dầu h&agrave;o chay Maggi từ nấm hương</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản dầu h&agrave;o Maggi ở nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời.</p>
	</li>
	<li>
	<p>Lưu &yacute;, sử dụng dầu h&agrave;o trong khoảng từ 2 - 3 th&aacute;ng sau khi mở nắp, để đảm bảo chất lượng của sản phẩm.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua dầu h&agrave;o tại B&aacute;ch ho&aacute; XANH</h3>

<p>B&aacute;ch h&oacute;a XANH l&agrave; địa chỉ uy t&iacute;n để chọn mua c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của Maggi c&ugrave;ng mức gi&aacute; rất phải chăng. Kh&ocirc;ng những thế, khi mua h&agrave;ng online tại bachhoaxanh.com, bạn c&ograve;n được giao h&agrave;ng tận nơi c&ugrave;ng những khuyến m&atilde;i si&ecirc;u hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 1, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (123, 'Bơ đậu hạt Golden Farm 170g', 36900, 0, 'store/images/bo-trung/bo-dau-phong-hat-golden-farm-hu-170g-202205161131044496_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/bo-bo">Bơ</a> đến từ thương hiệu <a href="https://www.bachhoaxanh.com/bo-golden-farm-bo">bơ Golden Farm</a> được l&agrave;m từ hạt đậu phộng hảo hạng v&agrave; c&aacute;c loại gia vị tự nhi&ecirc;n.&nbsp;<a href="https://www.bachhoaxanh.com/bo/bo-dau-phong-hat-golden-farm-hu-170g">Bơ đậu phộng hạt Golden Farm hũ 170g</a>&nbsp;với hương vị thơm b&eacute;o tự nhi&ecirc;n, hậu mặn ngọt h&ograve;a quyện, chất bơ s&aacute;nh mịn mang đến cho bạn những bữa ăn ngon, nhanh gọn.</div>

<ul style="margin-left:40px">
	<li>Đặc t&iacute;nh
	<div>Độ đặc vừa phải, c&oacute; lẫn những hạt đậu phộng nhỏ</div>
	</li>
	<li>Khuy&ecirc;n d&ugrave;ng
	<div>Chay mặn đều d&ugrave;ng được</div>
	</li>
	<li>Th&iacute;ch hợp
	<div>D&ugrave;ng l&agrave;m b&aacute;nh m&igrave;, l&agrave;m nh&acirc;n b&aacute;nh, x&acirc;y sinh tố v&agrave; l&agrave;m c&aacute;c loại nước chấm. Sản phẩm c&oacute; th&agrave;nh phần chủ yếu l&agrave; đậu phộng nguy&ecirc;n chất n&ecirc;n c&oacute; thể t&aacute;ch dầu l&agrave; hiện tượng b&igrave;nh thường, chất lượng sản phẩm vẫn ổn định</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đậu phộng (90%), đường, dầu thực vật (dầu đậu n&agrave;nh), muối</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, bảo quản lạnh sau khi mở nắp</div>
	</li>
	<li>Khối lượng
	<div>170g</div>
	</li>
	<li>Năng lượng
	<div>645 kcal/100g</div>
	</li>
	<li>Thương hiệu
	<div>Golden Farm (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Golden Farm</h3>

<p>Bơ đậu phộng hạt Golden Farm với hương vị thơm b&eacute;o tự nhi&ecirc;n, hậu mặn ngọt h&ograve;a quyện, chất bơ s&aacute;nh mịn mang đến cho bạn những bữa ăn ngon, nhanh gọn.</p>

<p>Golden Farm thuộc quyền sở hữu của c&ocirc;ng ty TNHH C&aacute;nh Đồng V&agrave;ng, th&agrave;nh lập từ năm 2000, l&agrave; nh&atilde;n hiệu rất nổi tiếng tr&ecirc;n thị trường với c&aacute;c d&ograve;ng sản phẩm: Bơ đậu phộng, c&aacute;c loại xốt mayonnaise, mứt tr&aacute;i c&acirc;y,...</p>

<h3>Th&agrave;nh phần dinh dưỡng trong bơ đậu phộng hạt Golden Farm hũ 170g</h3>

<p>Gi&aacute; trị dinh dưỡng trong sản phẩm: Năng lượng, carbohydrate, chất xơ, đường, sodium, chất b&eacute;o, chất đạm, canxi, sắt, kali,... Trong bơ đậu phộng Golden Farm 170g c&oacute; khoảng 650 kcal.</p>

<p>Sản phẩm dạng c&ocirc; đặc c&oacute; lẫn những hạt đậu phộng nhỏ, khi sử dụng cảm nhận được hạt đậu phộng đặc trưng, khi ăn rất vui miệng.<br />
<img alt="Bơ đậu phộng hạt Golden Farm hũ 170g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3465/174517/bhx/bo-dau-phong-hat-golden-farm-hu-170g-202205161131044496.png" /></p>

<h3>T&aacute;c dụng của bơ đậu phộng hạt Golden Farm với sức khỏe</h3>

<p>Được l&agrave;m từ hạt đậu phộng hảo hạng v&agrave; c&aacute;c loại gia vị tự nhi&ecirc;n, l&agrave; &quot;si&ecirc;u thực phẩm&quot; dinh dưỡng, cung cấp nguồn năng lượng dồi d&agrave;o v&agrave; c&aacute;c dưỡng chất thiết yếu cho cơ thể.</p>

<ul style="margin-left:40px">
	<li>
	<p>Bơ đậu phộng gi&agrave;u chất đạm.</p>
	</li>
	<li>
	<p>Rất ph&ugrave; hợp d&ugrave;ng cho người ăn ki&ecirc;ng, l&agrave;m giảm đường c&oacute; trong m&aacute;u v&igrave; bơ đậu phộng chỉ chứa khoảng 20% carbs.</p>
	</li>
	<li>
	<p>Gi&agrave;u vitamin v&agrave; kho&aacute;ng chất.</p>
	</li>
</ul>

<h3>Hướng dẫn sử dụng bơ đậu phộng hạt Golden Farm</h3>

<p>Bơ đậu phộng hạt Golden Farm c&oacute; dạng hạt n&ecirc;n ph&ugrave; hợp d&ugrave;ng l&agrave;m b&aacute;nh m&igrave; phết bơ đậu phộng, l&agrave;m nh&acirc;n b&aacute;nh,... Đặc biệt, với loại bơ hạt nhỏ n&agrave;y, bạn c&oacute; thể d&ugrave;ng để xay sinh tố để tăng độ b&eacute;o ngậy.<br />
<img class="lazy" src="https://lh4.googleusercontent.com/oaQVCMI-eBKbfggnIldsAAujARbZ1evr5zGlEeFyz7yeb8dCV2CqxcX-dG0EUpwbacv85-4iXhJ7OOlC3IVIbJtjDf3cobp7IfrbYyo-bFT-avMS-xZaZ8l4iwPC8P0NlpVS1av0" /></p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản bơ đậu phộng hạt Golden Farm</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản bơ đậu phộng ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>
	</li>
	<li>
	<p>N&ecirc;n để bơ trong ngăn m&aacute;t tủ lạnh sau khi mở nắp.</p>
	</li>
	<li>
	<p>Lưu &yacute;, sản phẩm c&oacute; th&agrave;nh phần chủ yếu l&agrave; đậu phộng nguy&ecirc;n chất n&ecirc;n ho&agrave;n to&agrave;n c&oacute; thể t&aacute;ch dầu l&agrave; hiện tượng b&igrave;nh thường, chất lượng sản phẩm vẫn ổn định.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua bơ đậu phộng tại B&aacute;ch ho&aacute; XANH</h3>

<p>Bạn c&oacute; thể gh&eacute; c&aacute;c cửa h&agrave;ng của B&aacute;ch h&oacute;a XANH để mua sắm c&aacute;c sản phẩm bơ đậu phộng, bơ thực vật,... ch&iacute;nh h&atilde;ng với mức gi&aacute; hợp l&yacute;.</p>

<p>Ngo&agrave;i ra, khi mua h&agrave;ng online tại bachhoaxanh.com, bạn sẽ được giao h&agrave;ng tận nơi c&ugrave;ng những khuyến m&atilde;i cực sốc mỗi ng&agrave;y.</p>

<p>&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bua-sang-nhanh-gon-thom-ngon-voi-bo-dau-phong-golden-farm-1438581">Bữa s&aacute;ng nhanh gọn, thơm ngon với bơ đậu phộng Golden Farm</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (124, 'Giấm nho đỏ Eufood 500ml', 35000, 0, 'store/images/bo-trung/giam-nho-do-eufood-paladin-chai-500ml-202205161240177480_300x300.png', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/bo-eufood-giam-an">Giấm Eufood</a>&nbsp;được nhập khẩu ch&iacute;nh h&atilde;ng, đảm bảo chất lượng.&nbsp;<a href="https://www.bachhoaxanh.com/bo/giam-nho-do-paladin-eufood-chai-500ml">Giấm nho đỏ Paladin Eufood chai 500ml</a>&nbsp;d&ugrave;ng để trộn c&aacute;c m&oacute;n salad, chế biến c&aacute;c m&oacute;n gỏi, tẩm ướp thịt b&ograve;, thịt lợn, rau củ quả,...&nbsp;<a href="https://www.bachhoaxanh.com/bo-giam-an">Giấm</a>&nbsp;nho c&ograve;n&nbsp;gi&uacute;p&nbsp;chống oxy h&oacute;a v&agrave; ngăn ngừa l&atilde;o h&oacute;a da.</div>

<ul style="margin-left:40px">
	<li>Loại
	<div>Giấm nho đỏ</div>
	</li>
	<li>Dung t&iacute;ch
	<div>500ml</div>
	</li>
	<li>C&ocirc;ng dụng
	<div>D&ugrave;ng để trộn c&aacute;c m&oacute;n salad, chế biến c&aacute;c m&oacute;n gỏi, c&aacute;c m&oacute;n dưa chua, tẩm ướp thịt b&ograve;, thịt lợn, rau củ quả,...</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Giấm rượu đỏ, nước, chất bảo quản (Potassium metabisulphite) (c&oacute; chứa Sulphites)</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Lưu &yacute;
	<div>Sản phẩm c&oacute; nguồn gốc tự nhi&ecirc;n n&ecirc;n c&oacute; thể xuất hiện vẩn hoặc cặn nhưng kh&ocirc;ng ảnh hưởng đến chất lượng.<br />
	Người bị vi&ecirc;m lo&eacute;t dạ d&agrave;y kh&ocirc;ng n&ecirc;n sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>Eufood (Th&aacute;i Lan)</div>
	</li>
	<li>Sản xuất tại
	<div>Bồ Đ&agrave;o Nha</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 6);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (125, '6 chai nước táo TH True Juice 350ml', 112000, 0, 'store/images/nuoc-ep-trai-cay/loc-6-chai-nuoc-tao-tu-nhien-th-true-juice-350ml-202210101341590860_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước &eacute;p tr&aacute;i c&acirc;y</a> thơm ngon, bổ dưỡng từ thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-th-true-juice">TH True Juice</a> an to&agrave;n chất lượng. <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/loc-6-chai-nuoc-tao-tu-nhien-th-true-juice-350ml">Lốc 6 nước &eacute;p t&aacute;o TH True Juice chai 350ml</a> với 99.96% nước &eacute;p t&aacute;o c&ocirc; đặc chứa c&aacute;c hợp chất chống oxy h&oacute;a tăng cường khả năng miễn dịch tối tưu cho cơ thể, cho bạn cảm gi&aacute;c sảng kho&aacute;i tươi m&aacute;t khi thưởng thức.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>TH True Juice (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>T&aacute;o tự nhi&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>99,96% nước t&aacute;o &eacute;p từ nước t&aacute;o c&ocirc; đặc, hương tự nhi&ecirc;n.</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p kh&ocirc;ng đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>350ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t. Sau khi mở, bảo quản lạnh ở 4 độ C - 10 độ C v&agrave; sử dụng hết trong v&ograve;ng 3 ng&agrave;y.</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Tập đo&agrave;n TH rất nổi tiếng với c&aacute;c sản phẩm sữa, nước &eacute;p, nước gạo rang, tr&agrave;,... đ&oacute;ng chai tiện lợi, thơm ngon. Trong đ&oacute; TH True Juice l&agrave; thương hiệu được y&ecirc;u th&iacute;ch với rất nhiều d&ograve;ng, loại sản phẩm chất lượng. Tất cả c&aacute;c sản phẩm của TH True Juice đều được sản xuất từ nguồn nguy&ecirc;n liệu tươi sạch được chọn lọc kỹ c&ugrave;ng d&acirc;y chuyền sản xuất hiện đại n&ecirc;n mang đến c&aacute;c sản phẩm an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.<br />
<img alt="Lốc 6 chai nước táo tự nhiên TH True Juice 350ml 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/259885/bhx/loc-6-chai-nuoc-tao-tu-nhien-th-true-juice-350ml-202202251429350472.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>T&aacute;o l&agrave; loại tr&aacute;i c&acirc;y nổi tiếng với nhiều vitamin C, chất chống oxy h&oacute;a c&ugrave;ng c&aacute;c chất chống ung thư. Nước t&aacute;o &eacute;p sẽ cung cấp cho bạn nguồn năng lượng, chất đạm, chất b&eacute;o, carbohydrate cho cơ thể. Trung b&igrave;nh trong 100ml nước t&aacute;o &eacute;p sẽ cung cấp cho cơ thể khoảng 48 kcal.<br />
<img alt="Lốc 6 chai nước táo tự nhiên TH True Juice 350ml 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/259885/bhx/loc-6-chai-nuoc-tao-tu-nhien-th-true-juice-350ml-202111271127198502.jpg" /></p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng nổi bật của sản phẩm đối với sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp chất chống oxy h&oacute;a</p>
	</li>
	<li>
	<p>Ph&ograve;ng ngừa ung thư, trầm cảm</p>
	</li>
	<li>
	<p>L&agrave;m đẹp da</p>
	</li>
	<li>
	<p>Tăng cường sức đề kh&aacute;ng</p>
	</li>
	<li>
	<p>Hỗ trợ hệ ti&ecirc;u h&oacute;a</p>
	</li>
	<li>
	<p>Hỗ trợ giảm c&acirc;n</p>
	</li>
	<li>
	<p>Chống vi&ecirc;m</p>
	</li>
	<li>
	<p>Giảm cảm gi&aacute;c đầy bụng, kh&oacute; ti&ecirc;u</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Bảo quản nước t&aacute;o TH True Juice ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh đặt sản phẩm ở nơi c&oacute; nhiệt độ cao hoặc dưới &aacute;nh nắng trực tiếp từ mặt trời. Sản phẩm sẽ ngon hơn khi bạn d&ugrave;ng lạnh v&agrave; sau khi mở nắp n&ecirc;n bảo quản trong ngăn m&aacute;t tủ lạnh v&agrave; sử dụng trong ng&agrave;y.<br />
Lưu &yacute;: Kh&ocirc;ng sử dụng khi bạn dị ứng th&agrave;nh phần sản phẩm, sản phẩm hết hạn hoặc c&oacute; dấu hiệu hỏng hoặc c&oacute; m&ugrave;i vị lạ.<br />
<img alt="Lốc 6 chai nước táo tự nhiên TH True Juice 350ml 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/259885/bhx/loc-6-chai-nuoc-tao-tu-nhien-th-true-juice-350ml-202111271127206319.jpg" /></p>

<h3><strong>C&aacute;c m&oacute;n ăn ngon với sản phẩm</strong></h3>

<p>Nước t&aacute;o &eacute;p c&oacute; thể sử dụng l&agrave;m c&aacute;c m&oacute;n như kẹo dẻo, thạch t&aacute;o,... thơm ngon d&ugrave;ng hằng ng&agrave;y.</p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>B&aacute;ch h&oacute;a XANH l&agrave; một trong những địa chỉ uy t&iacute;n với c&aacute;c sản phẩm đảm bảo đ&uacute;ng nguồn gốc xuất xứ, chất lượng được kiểm tra nghi&ecirc;m ngặt. Khi mua sắm c&aacute;c sản phẩm tại B&aacute;ch h&oacute;a XANH bạn sẽ nhận được nhiều ưu đ&atilde;i, khuyến m&atilde;i hấp dẫn, được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng, tận nơi.</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (126, '6 chai nước cam có tép Teppy 327ml', 54000, 0, 'store/images/nuoc-ep-trai-cay/6-chai-nuoc-cam-co-tep-teppy-327ml-202210101106283821_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Chiết xuất từ những quả cam mọng nước c&ugrave;ng với những t&eacute;p cam tươi hấp dẫn tự nhi&ecirc;n. V&agrave; được sản xuất theo c&ocirc;ng nghệ hiện đại, kh&ocirc;ng chất độc hại kh&ocirc;ng ảnh hưởng đến sức khỏe người ti&ecirc;u d&ugrave;ng. <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/loc-6-chai-nuo-c-cam-co-tep-teppy-chai-1-li-t">6 chai nước cam c&oacute; t&eacute;p Teppy 327ml</a>&nbsp;chứa nhiều vitamin C hỗ trợ cung cấp năng lượng cho cơ thể.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Teppy (Việt Nam)</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Cam c&oacute; t&eacute;p</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường HFCS, nước cốt cam v&agrave; t&eacute;p cam (12.2%), hương cam tổng hợp, chất điều chỉnh độ axit (330, 331(iii)), Lactate Calcium (400 ppm), vitamin E (11 ppm) v&agrave; m&agrave;u thực phẩm (102, 110).</div>
	</li>
	<li>Lượng đường
	<div>C&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>327ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao.</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu Teppy</strong></h3>

<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước &eacute;p</a> cam Teppy nguy&ecirc;n t&eacute;p được chiết xuất từ những quả cam mọng nước c&ugrave;ng với những t&eacute;p cam tươi hấp dẫn tự nhi&ecirc;n, đ&acirc;y l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-cam">nước cam</a> nổi tiếng của nh&agrave;&nbsp;Coca Cola với th&agrave;nh phần tự nhi&ecirc;n v&agrave; hương vị ch&acirc;n thật tươi m&aacute;t.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-teppy">Nước &eacute;p Teppy</a>&nbsp;l&agrave; nước uống dinh dưỡng giải kh&aacute;t ph&ugrave; hợp cho cả gia đ&igrave;nh</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng của&nbsp;sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Nước &eacute;p cam Teppy&nbsp;được chiết xuất từ những quả cam mọng nước c&ugrave;ng với những t&eacute;p cam tươi hấp dẫn tự nhi&ecirc;n, chứa nhiều vitamin min E v&agrave; C, đường, natri v&agrave; carbohrate,...</p>
	</li>
	<li>
	<p style="text-align:justify">Năng lượng của sản phẩm khoảng 56 calo/100ml</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Tăng cường để kh&aacute;ng</p>
	</li>
	<li>
	<p style="text-align:justify">Bổ sung nước, cấp ẩm cho da</p>
	</li>
	<li>
	<p style="text-align:justify">Cung cấp năng lượng cho cơ thể, giải nhiệt, giải kh&aacute;t, giảm căng thẳng</p>
	</li>
	<li>
	<p style="text-align:justify">Tốt cho sức khỏe hệ ti&ecirc;u h&oacute;a, tim mạch</p>
	</li>
	<li>
	<p style="text-align:justify">Chống l&atilde;o h&oacute;a</p>
	</li>
	<li>
	<p style="text-align:justify">...</p>
	</li>
</ul>

<h3 style="text-align:justify"><img alt="6 chai nước cam có tép Teppy 327ml 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/194457/bhx/6-chai-nuoc-cam-co-tep-minute-maid-teppy-327ml-201907260939455159.jpg" /><br />
<strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Để nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t</p>
	</li>
	<li>
	<p style="text-align:justify">Tr&aacute;nh &aacute;nh nắng trực tiếp</p>
	</li>
	<li>
	<p style="text-align:justify">D&ugrave;ng hết sau khi mở nắp hoặc trong 24h nếu được bảo quản trong tủ lạnh</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong><img alt="6 chai nước cam có tép Teppy 327ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/201203/bhx/files/24-chai-nuoc-cam-co-tep-teppy-327ml-202202122154223811(1).jpg" style="height:768px; width:1024px" /><br />
Ưu điểm khi mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Cam kết ch&iacute;nh h&atilde;ng, thơm ngon, chất lượng từ nh&agrave; sản xuất uy t&iacute;n</p>
	</li>
	<li>
	<p style="text-align:justify">Gi&aacute; b&aacute;n tốt, nhiều chương tr&igrave;nh ưu đ&atilde;i hấp dẫn</p>
	</li>
	<li>
	<p style="text-align:justify">Giao h&agrave;ng tận nh&agrave; nhanh ch&oacute;ng, tiện lợi</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>C&aacute;c th&ocirc;ng tin li&ecirc;n quan đến sản phẩm</strong></h3>

<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bo-sung-vitamin-c-hang-ngay-voi-nuoc-cam-ep-teppy-1322768">Bổ sung vitamin C hằng ng&agrave;y với nước cam &eacute;p Teppy</a></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (127, '6 hộp nước dừa dứa non Cocoxim 330ml', 101000, 0, 'store/images/nuoc-ep-trai-cay/6-hop-nuoc-dua-dua-non-cocoxim-330ml-202210101411404080_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với điều kiện tự nhi&ecirc;n thuận lợi từ v&ugrave;ng ven biển ph&ugrave; sa, Bến Tre tự h&agrave;o vun trồng được giống Dừa Dứa, mang vị ngọt thanh m&aacute;t của Dừa Xi&ecirc;m, xen lẫn hương thơm dịu nhẹ m&ugrave;i l&aacute; dứa, tự nhi&ecirc;n v&agrave; thuần t&uacute;y. Nước dừa dứa non Cocoxim 330ml cho bạn tận hưởng cảm gi&aacute;c thư th&aacute;i sảng kho&aacute;i v&ocirc; c&ugrave;ng dễ chịu</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Cocoxim (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Dừa dứa non</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước dừa, đường, hương l&aacute; dứa, hương dừa dứa tự nhi&ecirc;n, chất điều chỉnh độ acid, muối</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p c&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>330ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao. Sau khi mở nắp, bảo quản ở ngăn lạnh v&agrave; sử dụng trong v&ograve;ng 3 ng&agrave;y</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h2>Nước dừa, thức uống thanh m&aacute;t chứa nhiều dinh dưỡng tốt cho sức khỏe</h2>

<p><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/loi-ich-khong-ngo-khi-uong-nuoc-dua-moi-ngay-1016913">C&ocirc;ng dụng của nước dừa</a>: Một ly nước dừa mỗi ng&agrave;y sẽ gi&uacute;p l&agrave;n da bổ sung nước, l&agrave;m chậm qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a. Từ đ&oacute;, l&agrave;n da của bạn sẽ trở n&ecirc;n căng mịn v&agrave; rạng rỡ hơn.Nước dừa c&oacute; thể k&iacute;ch th&iacute;ch tuyến gi&aacute;p, gi&uacute;p tăng cường năng lượng cơ thể. Mỗi ng&agrave;y bạn uống nước dừa sẽ thấy tinh thần thoải m&aacute;i hơn, ăn uống ngon miệng v&agrave; l&agrave;m việc hiệu quả hơn.<br />
<br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-cocoxim">Nước dừa Cocoxim</a>&nbsp;chứa &iacute;t chất b&eacute;o ngo&agrave;i ra n&oacute; c&ograve;n l&agrave;m ch&uacute;ng ta c&oacute; cảm gi&aacute;c no hơn, điều n&agrave;y sẽ kiềm chế cảm gi&aacute;c th&egrave;m ăn gi&uacute;p giảm c&acirc;n nhanh ch&oacute;ng. Bạn c&oacute; thể thay nước ngọt bằng nước dừa để kiểm so&aacute;t c&acirc;n nặng<br />
Kh&ocirc;ng chỉ thanh m&aacute;t, trong nước dừa chứa nhiều dinh dưỡng c&oacute; lợi cho sức khỏe. Chỉ với một ly nước dừa mỗi ng&agrave;y cơ thể bạn sẽ c&oacute; sự thay đổi r&otilde; rệt: l&agrave;n da căng mịn hơn, cơ thể thon gọn v&agrave; tr&agrave;n đầy năng lượng hơn.</p>

<h2>Nước Dừa m&oacute;n qu&agrave; từ Bến Tre</h2>

<p>Với điều kiện tự nhi&ecirc;n thuận lợi từ v&ugrave;ng ven biển ph&ugrave; sa, Bến Tre tự h&agrave;o vun trồng được giống Dừa Dứa, mang vị ngọt thanh m&aacute;t của Dừa Xi&ecirc;m, xen lẫn Hương thơm dịu nhẹ m&ugrave;i l&aacute; dứa, tự nhi&ecirc;n v&agrave; thuần t&uacute;y.<br />
Bằng c&ocirc;ng nghệ tiệt tr&ugrave;ng UHT tr&ecirc;n d&acirc;y chuyền TetraPak hiện đại,<br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/loc-6-hop-nuoc-dua-cocoxim-dua-dua-non-330ml">6 hộp nước dừa dứa non Cocoxim 330ml</a> với dạng lốc tiện lợi sẽ lưu giữ vẹn nguy&ecirc;n hương vị tươi ngon, thanh m&aacute;t của Dừa Dứa, để bạn dễ d&agrave;ng thưởng thức mọi l&uacute;c mọi nơi.<br />
Xem th&ecirc;m nhiều sản phẩm <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước tr&aacute;i c&acirc;y</a> thơm ngon bổ dưỡng tại B&aacute;ch H&oacute;a XANH</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (128, '6 lon nước cam ép Twister Tropicana 320ml', 63000, 0, 'store/images/nuoc-ep-trai-cay/6-lon-nuoc-cam-ep-twister-tropicana-320ml-202210101022024588_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Được chiết xuất từ những t&eacute;p cam tươi nguy&ecirc;n chất tươi ngon v&agrave; bổ dưỡng. Nước cam &eacute;p Twister với nguồn nguy&ecirc;n liệu tự nhi&ecirc;n được lựa chọn cẩn thận kết hợp c&ocirc;ng nghệ sản xuất hiện đại, mang lại thức uống c&oacute; hương vị thơm ngon, tốt cho sức khỏe. Cam kết ch&iacute;nh h&atilde;ng v&agrave; an to&agrave;n</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Twister (Anh)</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Cam &eacute;p</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường m&iacute;a, nước cam ho&agrave;n nguy&ecirc;n từ nước cam c&ocirc; đặc (10%), chất điều chỉnh độ axit (330, 33iii), chất ổn định (415, 414), Vitamin C (144 mg/l), chất bảo quản (202),...</div>
	</li>
	<li>Lượng đường
	<div>C&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>320ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao.</div>
	</li>
</ul>

<div class="description">
<p>C&ocirc;ng dụng tuyệt vời của cam đối với cơ thể<br />
Tr&aacute;i cam chứa rất nhiều dưỡng chất, axit tự nhi&ecirc;n,chất xơ, nhiều vitamin đặc biệt l&agrave; vitamin C,&hellip; đ&acirc;y l&agrave; những chất rất tốt cho sức khỏe. Cam c&oacute; thể ăn, l&agrave;m <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước &eacute;p tr&aacute;i c&acirc;y</a>&nbsp;hay sinh tố đều rất ngon.<br />
Cam c&oacute; vị ngọt ngọt, chua chua thường biết đến như một loại tr&aacute;i c&acirc;y tr&aacute;ng miệng, một ly nước giải kh&aacute;t. Ngo&agrave;i những t&aacute;c dụng n&agrave;y ra th&igrave; cam c&ograve;n c&oacute; nhiều c&ocirc;ng dụng tuyệt vời kh&aacute;c m&agrave; kh&ocirc;ng phải ai cũng biết.<br />
<img alt="6 lon nước cam ép Twister Tropicana 320ml 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/204873/bhx/6-lon-nuoc-cam-ep-twister-tropicana-320ml-201906241339180626.JPG" /><br />
Axit citric c&oacute; trong cam trị v&agrave; ngừa mụn rất tốt. Bạn chỉ cần sử dụng nước cam, thoa l&ecirc;n v&ugrave;ng da c&oacute; mụn, để nước cam kh&ocirc; v&agrave; rửa lại với nước sạch, lặp lại mỗi ng&agrave;y mụn sẽ dần biến mất.<br />
Sữa kết hợp với vỏ cam xay nhuyễn l&agrave; hỗn hợp gi&uacute;p tẩy sạch da rất tốt. Sử dụng ch&uacute;ng mỗi ng&agrave;y vết n&aacute;m, vết sạm hay v&ugrave;ng da bị sạm đen do &aacute;nh nắng của bạn sẽ cải thiện rất r&otilde;.<br />
<img alt="6 lon nước cam ép Twister Tropicana 320ml 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/204873/bhx/6-lon-nuoc-cam-ep-twister-tropicana-320ml-201906241339184088.JPG" /><br />
Ngo&agrave;i ra cam l&agrave; một trong c&aacute;c thực phẩm c&oacute; trong thực đơn giảm c&acirc;n của c&aacute;c chị em, cam c&oacute; chứa chất pectin c&oacute; t&aacute;c dụng ngăn chặn sự th&egrave;m ăn v&agrave; cơn đ&oacute;i trong v&agrave;i giờ, từ đ&oacute; g&oacute;p phần gi&uacute;p giảm c&acirc;n hiệu quả v&agrave; l&agrave;nh mạnh.<br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/cam-twister-pet-455ml">Nước cam &eacute;p Twister 455ml</a> mang dưỡng chất tốt l&agrave;nh cho ng&agrave;y mới<br />
<img alt="6 lon nước cam ép Twister Tropicana 320ml 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/204873/bhx/6-lon-nuoc-cam-ep-twister-tropicana-320ml-201906241339182967.JPG" /><br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/6-lon-nuoc-cam-ep-twister-tropicana-320ml">6 lon nước cam &eacute;p Twister Tropicana 320ml&nbsp;</a>được chiết xuất từ những t&eacute;p cam tươi nguy&ecirc;n chất tươi ngon v&agrave; bổ dưỡng. Nước cam &eacute;p Twister với nguồn nguy&ecirc;n liệu tự nhi&ecirc;n được lựa chọn cẩn thận kết hợp c&ocirc;ng nghệ sản xuất hiện đại, mang lại thức uống c&oacute; hương vị thơm ngon, tốt cho sức khỏe. Khi thưởng thức <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-twister">nước &eacute;p tr&aacute;i c&acirc;y&nbsp;Twister</a> gi&uacute;p xua tan mọi cảm gi&aacute;c mệt mỏi, căng thẳng ngay tức th&igrave;, đem lại cảm gi&aacute;c thoải m&aacute;i nhất cho bạn sau mỗi lần sử dụng.</p>

<ul style="margin-left:40px">
	<li>
	<p>Đến từ chuy&ecirc;n gia nước tr&aacute;i c&acirc;y số 1 thế giới &ndash; Tropicana, Tropicana Twister l&agrave; nh&atilde;n h&agrave;ng số 1 tại Việt Nam trong ng&agrave;nh Nước Tr&aacute;i c&acirc;y. Với hương vị thơm ngon tự nhi&ecirc;n, nước cam &eacute;p Twister c&ograve;n bổ sung vitamin A v&agrave; C, l&agrave; c&aacute;c dưỡng chất tốt l&agrave;nh gi&uacute;p mỗi ng&agrave;y của bạn tươi kh&ocirc;ng cần tưới.</p>
	</li>
	<li>
	<p>Hương vị: Twister Cam c&oacute; th&agrave;nh phần chủ yếu từ nước cốt cam tự nhi&ecirc;n, vị ngọt thanh m&aacute;t c&ugrave;ng hương thơm tự nhi&ecirc;n trong từng t&eacute;p cam tươi, mang lại cảm gi&aacute;c sảng kho&aacute;i, tươi mới.</p>
	</li>
	<li>
	<p>Thiết kế: Lon 320ml</p>
	</li>
	<li>
	<p>Số lượng: 24 lon/ th&ugrave;ng</p>
	</li>
	<li>
	<p>HSD: 06 th&aacute;ng kể từ ng&agrave;y sản xuất</p>
	</li>
	<li>
	<p>Ngon hơn khi uống lạnh. Bảo quản nơi sạch sẽ, kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời</p>
	</li>
</ul>

<p>Xem th&ecirc;m:&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nhung-cong-dung-lam-dep-tuyet-voi-tu-cam-1055087">C&ocirc;ng dụng tuyệt vời của cam đối với cơ thể</a></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (129, '6 chai nước gạo rang TH True Rice 300ml', 93000, 0, 'store/images/nuoc-ep-trai-cay/loc-6-chai-nuoc-gao-rang-th-true-rice-300ml-202210101904203215_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-th-true-rice">Nước gạo rang TH True Rice</a> ho&agrave;n to&agrave;n tự nhi&ecirc;n, kh&ocirc;ng chứa đường với vị ngọt thanh từ gạo.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/loc-6-chai-nuoc-gao-rang-th-true-rice-300ml">Lốc 6 chai nước gạo rang TH True Rice 300ml</a> cung cấp nhiều dưỡng chất cho cơ thể, cấp nước v&agrave; giải kh&aacute;t hiệu quả. Mua ng&agrave;y nhiều loại&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước &eacute;p</a>, nước gạo, nước tr&aacute;i c&acirc;y ch&iacute;nh h&atilde;ng, chất lượng&nbsp;tại B&aacute;ch ho&aacute; XANH</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>TH True Rice (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Dịch chiết xuất từ gạo (98%), dầu hướng dương, chất ổn định (418,471,410) hương gạo tự nhi&ecirc;n, chất chống oxy h&oacute;a</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p kh&ocirc;ng đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>300ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Sau khi mở bảo quản lạnh ở 4 -10 độ C v&agrave; sử dụng hết trong v&ograve;ng 3 ng&agrave;y.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, sạch, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (130, '4 chai nước trái cây Pororo vị dâu 235ml', 79000, 0, 'store/images/nuoc-ep-trai-cay/4-chai-nuoc-trai-cay-pororo-vi-dau-235ml-202210101428092768_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Thức uống tr&aacute;i c&acirc;y</a> chất lượng với hương vị thơm ngon sản xuất tại H&agrave;n Quốc, kh&ocirc;ng c&oacute; ga, chứa nhiều vitamin v&agrave; c&aacute;c dưỡng chất tốt cho sức khỏe.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/4-chai-nuoc-trai-cay-pororo-vi-dau-235ml">4 chai nước tr&aacute;i c&acirc;y Pororo vị d&acirc;u 235ml</a>&nbsp;ch&iacute;nh h&atilde;ng <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-pororo">nước tr&aacute;i c&acirc;y&nbsp;Pororo</a>&nbsp;chua ngọt tươi m&aacute;t hấp dẫn</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Pororo (H&agrave;n Quốc)</div>
	</li>
	<li>Sản xuất tại
	<div>H&agrave;n Quốc</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>d&acirc;u</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước tinh khiết, đường, bột sữa, nước d&acirc;u c&ocirc; đặc, acid citric, calci lactat, hương sữa, polysaccharide đậu n&agrave;nh, sodium citrate, hương d&acirc;u, chất tạo nhũ, vitamin D3</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p c&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>235ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao. Sau khi mở nắp, bảo quản ở ngăn lạnh v&agrave; sử dụng trong v&ograve;ng 3 ng&agrave;y</div>
	</li>
	<li>Sản xuất tại
	<div>H&agrave;n Quốc</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (131, '6 hộp nước ép trái vải Malee 1 lít', 357000, 0, 'store/images/nuoc-ep-trai-cay/6-hop-nuoc-ep-trai-vai-malee-1-lit-202210101439375611_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Được sản xuất tại Th&aacute;i Lan, c&oacute; vị vải ngọt thanh m&aacute;t v&agrave; hương thơm đặc trưng tự nhi&ecirc;n l&agrave; hương vị y&ecirc;u th&iacute;ch của nhiều người. Sản phẩm được sản xuất trong d&acirc;y truyền kh&eacute;p k&iacute;n với ti&ecirc;u chuẩn chất lượng cao chứa nhiều vitamin C v&agrave; c&aacute;c th&agrave;nh phần tốt cho sức khỏe v&agrave; sắc đẹp</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Malee (Th&aacute;i Lan)</div>
	</li>
	<li>Sản xuất tại
	<div>Th&aacute;i Lan</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Tr&aacute;i vải</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước &eacute;p vải 100%</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p kh&ocirc;ng đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao. Sau khi mở nắp, bảo quản ở ngăn lạnh v&agrave; sử dụng trong v&ograve;ng 3 ng&agrave;y</div>
	</li>
	<li>Sản xuất tại
	<div>Th&aacute;i Lan</div>
	</li>
</ul>

<div class="description">
<div style="text-align:justify"><strong><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay" target="_blank" title="Nước ép">Nước &eacute;p</a></strong> tr&aacute;i Vải&nbsp;<strong><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-malee" target="_blank" title="Malee">Malee</a></strong>&nbsp;được nhiều người y&ecirc;u th&iacute;ch bởi vị ngọt thanh m&aacute;t v&agrave; hương thơm đặc trưng tự nhi&ecirc;n. Sản phẩm được sản xuất trong d&acirc;y truyền kh&eacute;p k&iacute;n với ti&ecirc;u chuẩn chất lượng cao chứa nhiều vitamin C v&agrave; c&aacute;c th&agrave;nh phần chống oxy h&oacute;a tốt cho l&agrave;n da, hạn chế nếp nhăn v&agrave; chống l&atilde;o h&oacute;a da hiệu quả.</div>

<div style="text-align:center"><img alt="6 hộp nước ép trái vải Malee 1 lít 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/91166/bhx/files/nuoc-ep-trai-vai-malee-1-lit.jpg" style="height:600px; width:800px" /></div>

<div style="text-align:justify"><strong><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/6-hop-nuoc-ep-trai-vai-malee-1-lit" target="_blank" title="Nước ép vải">Nước &eacute;p vải</a></strong>&nbsp;chứa nhiều kali nhưng lại &iacute;t natri, hỗ trợ điều trị chứng cao huyết &aacute;p, co thắt mạch m&aacute;u, giảm nguy cơ đột quỵ v&agrave; tai biến. Ngo&agrave;i ra, uống nước &eacute;p vải hằng ng&agrave;y c&ograve;n l&agrave;m tăng lượng cholesterol tốt v&agrave; giảm cholesterol xấu th&uacute;c đẩy cơ thể sản sinh hồng cầu, cải thiện qu&aacute; tr&igrave;nh lưu th&ocirc;ng m&aacute;u.</div>

<div style="text-align:center"><img alt="6 hộp nước ép trái vải Malee 1 lít 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/91166/bhx/files/nuoc-ep-trai-vai-malee-1-lit%20(3).jpg" style="height:531px; width:800px" /></div>

<div style="text-align:justify">Chất xơ h&ograve;a tan, pectin trong&nbsp;nước &eacute;p tr&aacute;i c&acirc;y&nbsp;hỗ trợ rất tốt cho hệ ti&ecirc;u h&oacute;a. Kh&ocirc;ng những thế nhờ gi&agrave;u hợp chất flavonoid, sản phẩm c&ograve;n c&oacute; t&aacute;c dụng kh&aacute;ng vi&ecirc;m v&agrave; l&agrave;m giảm đau vi&ecirc;m khớp.</div>

<div style="text-align:center"><img alt="6 hộp nước ép trái vải Malee 1 lít 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/91166/bhx/files/nuoc-ep-trai-vai-malee-1-lit%20(2).jpg" style="height:563px; width:800px" /></div>

<div style="text-align:justify">Vỏ hộp được l&agrave;m bằng giấy tr&aacute;ng nh&ocirc;m, gi&uacute;p bảo quản nước &eacute;p lu&ocirc;n giữ được hương vị tự nhi&ecirc;n thơm ngon l&acirc;u d&agrave;i, đem lại sự y&ecirc;n t&acirc;m cho bạn v&agrave; cả gia đ&igrave;nh mỗi khi sử dụng.</div>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (132, '6 lon nước cam ép Minute Maid Splash 320ml', 57000, 0, 'store/images/nuoc-ep-trai-cay/6-lon-nuoc-cam-ep-minute-maid-splash-320ml-202210130928045615_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước tr&aacute;i c&acirc;y</a>&nbsp;cam c&oacute; t&eacute;p kh&aacute;c biệt hẳn với c&aacute;c sản phẩm nước cam &eacute;p c&ograve;n lại bởi vị cam tươi ngon, hương cam thơm m&aacute;t v&agrave; m&agrave;u cam ho&agrave;n to&agrave;n tự nhi&ecirc;n. Mang hương vị tươi nguy&ecirc;n từ thi&ecirc;n nhi&ecirc;n, <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-minute-maid">nước cam &eacute;p Minute Maid Splash</a> l&agrave; thức uống tuyệt hảo rất ph&ugrave; hợp với nhu cầu ti&ecirc;u d&ugrave;ng th&ocirc;ng minh hiện nay</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Minute Maid (Mỹ)</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Cam &eacute;p</div>
	</li>
	<li>Lượng đường
	<div>C&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>320ml</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao.</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Minute Maid Splash l&agrave; thương hiệu mới của C&ocirc;ng ty Coca Cola được ra mắt tại thị trường Việt Nam. Minute Maid Splash chủ yếu sử dụng c&aacute;c th&agrave;nh phần tươi ngon chọn lọc v&agrave; sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại. Sản phẩm nước &eacute;p thuộc thương hiệu n&agrave;y được người ti&ecirc;u d&ugrave;ng y&ecirc;u th&iacute;ch v&agrave; lựa chọn sử dụng.<br />
<img alt="6 lon nước cam ép Minute Maid Splash 320ml 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/225632/bhx/6-lon-nuoc-cam-ep-minute-maid-splash-320ml-202103270903473826.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Được l&agrave;m từ nước v&agrave; cam, đường n&ecirc;n sẽ cung cấp cho cơ thể năng lượng, bổ sung c&aacute;c vitamin v&agrave; kho&aacute;ng chất kh&aacute;c. 100ml nước &eacute;p cam sẽ cung cấp khoảng 41 kcal.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng nổi bật như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng</p>
	</li>
	<li>
	<p>Bổ sung dinh dưỡng</p>
	</li>
	<li>
	<p>Tăng cường sức đề kh&aacute;ng</p>
	</li>
	<li>
	<p>L&agrave;m đẹp da</p>
	</li>
	<li>
	<p>Gi&uacute;p xương chắc khỏe</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Khi sử dụng c&aacute;c loại nước ngọt c&oacute; ga bạn kh&ocirc;ng n&ecirc;n lắc mạnh trước khi sử dụng. Bảo quản sản phẩm nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh nơi c&oacute; nhiệt độ cao v&agrave; &aacute;nh nắng trực tiếp, kh&ocirc;ng đặt sản phẩm gần nguồn nhiệt. Sau khi mở lon n&ecirc;n bảo quản lạnh.<br />
Lưu &yacute;: Kh&ocirc;ng sử dụng khi bạn bị dị ứng hoặc sản phẩm c&oacute; dấu hiệu hư hỏng<br />
<img alt="6 lon nước cam ép Minute Maid Splash 320ml 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/225632/bhx/6-lon-nuoc-cam-ep-minute-maid-splash-320ml-202008101326291631.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Một trong những địa chỉ uy t&iacute;n cung cấp c&aacute;c sản phẩm chất lượng, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng hiện nay l&agrave; B&aacute;ch h&oacute;a XANH. Khi đặt h&agrave;ng tại đ&acirc;y, bạn sẽ được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng, tận nơi c&ugrave;ng nhiều ưu đ&atilde;i giảm gi&aacute; hấp dẫn.</p>
</div>
</div>', 'thuc-uong', 0, 87, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (133, 'Nước ép lựu Juss 1 lít', 31500, 45000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-luu-juss-1-lit-202210101005547430_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước &eacute;p tr&aacute;i c&acirc;y</a> chất lượng của thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-juss">nước &eacute;p Juss</a>&nbsp;từ Thổ Nhĩ Kỳ.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-ep-luu-juss-1-lit">Nước &eacute;p lựu Juss lựu đỏ 1 l&iacute;t </a>từ quả lựu tươi ngon chứa nhiều vitamin v&agrave; dinh dưỡng gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, cung cấp năng lượng cho cơ thể khỏe mạnh, mang lại hiệu quả l&agrave;m đẹp da rất tốt, đặc biệt tốt cho mẹ bầu v&agrave; thai nhi</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Juss (Thổ Nhĩ Kỳ)</div>
	</li>
	<li>Sản xuất tại
	<div>Thổ Nhĩ Kỳ</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Lựu</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, nước &eacute;p lựu c&ocirc; đặc, chất điều chỉnh acid, hương liệu lựu tự nhi&ecirc;n,..</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p c&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh. Bảo quản lạnh sau khi mở bao b&igrave; v&agrave; sử dụng trong v&ograve;ng 2 ng&agrave;y. Sử dụng tốt nhất trước ng&agrave;y hết hạn được ghi tr&ecirc;n phần đầu của hộp</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, sạch, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất tại
	<div>Thổ Nhĩ Kỳ</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (134, 'Nước gạo Hàn Quốc OKF 1.5 lít', 41300, 59000, 'store/images/nuoc-ep-trai-cay/nuoc-gao-han-quoc-okf-15-lit-202210102025372475_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-okf">nước gạo OKF</a> ch&iacute;nh h&atilde;ng thương hiệu H&agrave;n Quốc thơm ngon, chứa nhiều dinh dưỡng v&agrave; c&ocirc;ng dụng cho sức khỏe như bồi bổ sức khỏe, giảm stress, giảm b&eacute;o, đẹp da,...rất được ưa chuộng.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-gao-han-quoc-okf-15-lit">Nước gạo h&agrave;n quốc OKF 1.5 l&iacute;t</a> chai lớn d&ugrave;ng cho cả gia đ&igrave;nh cam kết chất lượng, an to&agrave;n</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>OKF (H&agrave;n Quốc)</div>
	</li>
	<li>Sản xuất tại
	<div>H&agrave;n Quốc</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, chiết xuất gạo, maltodextrin, kem thực vật, hương gạo, este của sucrose với c&aacute;c acid b&eacute;o, nước &eacute;p bưởi, chất điều chỉnh độ acid, sucralose,...</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p kh&ocirc;ng đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1.5 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, giữ lạnh sau khi mở bao b&igrave;</div>
	</li>
	<li>Sản xuất tại
	<div>H&agrave;n Quốc</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (135, 'Nước ép nectar trái cây nhiệt đới Juss 1 lít', 31500, 45000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-nectar-trai-cay-nhiet-doi-juss-1-lit-202210101018000388_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước &eacute;p tr&aacute;i c&acirc;y</a> chất lượng thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-juss">Juss</a> đến từ Thổ Nhĩ Kỳ.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-ep-nectar-trai-cay-nhiet-doi-juss-1-lit">Nước &eacute;p nectar tr&aacute;i c&acirc;y nhiệt đới Juss 1 l&iacute;t </a>từ nhiều loại tr&aacute;i c&acirc;y tươi ngon chứa nhiều vitamin, dinh dưỡng gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, cung cấp năng lượng, c&oacute; lợi cho sức khỏe đồng thời mang lại hiệu quả l&agrave;m đẹp da rất tốt</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Juss</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Nectar, tr&aacute;i c&acirc;y nhiệt đới</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước &eacute;p tr&aacute;i c&acirc;y hỗn hợp, chất chống oxy ho&aacute;,..</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh. Bảo quản lạnh sau khi mở bao b&igrave; v&agrave; sử dụng trong v&ograve;ng 2 ng&agrave;y. Sử dụng tốt nhất trước ng&agrave;y hết hạn được ghi tr&ecirc;n phần đầu của hộp</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, sạch, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (136, 'Nước ép ổi Juss 1 lít', 31500, 45000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-oi-juss-1-lit-202210101012301273_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước &eacute;p tr&aacute;i c&acirc;y</a> chất lượng thơm ngon của thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-juss">nước &eacute;p Juss</a> đến từ Thổ Nhĩ Kỳ.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-ep-oi-juss-1-lit">Nước &eacute;p ổi Juss 1 l&iacute;t </a>từ quả ổi tươi ngon chứa nhiều vitamin v&agrave; dinh dưỡng gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, cung cấp năng lượng cho cơ thể khỏe mạnh đồng thời mang lại hiệu quả l&agrave;m đẹp da rất tốt</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Juss (Thổ Nhĩ Kỳ)</div>
	</li>
	<li>Sản xuất tại
	<div>Thổ Nhĩ Kỳ</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Ổi</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, ổi xay nhuyễn, chất chống oxy ho&aacute;, chất tạo ngọt tự nhi&ecirc;n,..</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p c&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh. Bảo quản lạnh sau khi mở bao b&igrave; v&agrave; sử dụng trong v&ograve;ng 2 ng&agrave;y. Sử dụng tốt nhất trước ng&agrave;y hết hạn được ghi tr&ecirc;n phần đầu của hộp</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, sạch, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất tại
	<div>Thổ Nhĩ Kỳ</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (137, 'Nước ép nho Juss 1 lít', 31500, 45000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-nho-juss-1-lit-202210101011122106_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước &eacute;p tr&aacute;i c&acirc;y</a> chất lượng thơm ngon của thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-juss">nước &eacute;p Juss</a> đến từ Thổ Nhĩ Kỳ.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-ep-nho-juss-1-lit">Nước &eacute;p nho Juss 1 l&iacute;t </a>từ quả nho tươi ngon chứa nhiều vitamin v&agrave; dinh dưỡng gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, cung cấp năng lượng, c&oacute; lợi cho sức khỏe đồng thời mang lại hiệu quả l&agrave;m đẹp da rất tốt</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Juss (Thổ Nhĩ Kỳ)</div>
	</li>
	<li>Sản xuất tại
	<div>Thổ Nhĩ Kỳ</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Nho</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, nước &eacute;p nho c&ocirc; đặc, chất điều chỉnh độ acid, chất tạo m&agrave;u, hương liệu nho tự nhi&ecirc;n,..</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p c&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh. Bảo quản lạnh sau khi mở bao b&igrave; v&agrave; sử dụng trong v&ograve;ng 2 ng&agrave;y. Sử dụng tốt nhất trước ng&agrave;y hết hạn được ghi tr&ecirc;n phần đầu của hộp</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, sạch, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất tại
	<div>Thổ Nhĩ Kỳ</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (138, 'Nước cam ép Twister Tropicana 1 lít', 18500, 22000, 'store/images/nuoc-ep-trai-cay/nuoc-cam-ep-twister-tropicana-1-lit-202210101357213547_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Chiết xuất từ những t&eacute;p cam tươi nguy&ecirc;n chất tươi ngon v&agrave; bổ dưỡng kết hợp c&ocirc;ng nghệ sản xuất hiện đại, mang lại thức uống c&oacute; hương vị thơm ngon, tốt cho sức khỏe, gi&uacute;p xua tan mọi cảm gi&aacute;c mệt mỏi, căng thẳng ngay tức th&igrave;, đem lại cảm gi&aacute;c thoải m&aacute;i nhất sau mỗi lần sử dụng.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Twister (Anh)</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Cam &eacute;p</div>
	</li>
	<li>Lượng đường
	<div>C&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao.</div>
	</li>
</ul>

<div class="description">
<p>Cam c&oacute; vị ngọt ngọt, chua chua thường biết đến như một loại tr&aacute;i c&acirc;y tr&aacute;ng miệng, một ly nước giải kh&aacute;t. Ngo&agrave;i những t&aacute;c dụng n&agrave;y ra th&igrave; cam c&ograve;n c&oacute; nhiều c&ocirc;ng dụng tuyệt vời kh&aacute;c đối với sức khoẻ m&agrave; kh&ocirc;ng phải ai cũng biết.<br />
<img alt="Nước cam ép Twister Tropicana 1 lít 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/219795/bhx/nuoc-cam-ep-twister-chai-1-lit-202003161057443056.jpg" /><br />
Mỗi khi thời tiết thay đổi ch&uacute;ng ta dễ bị bệnh l&agrave; do sức đề kh&aacute;ng yếu, những con virus sẽ dễ x&acirc;m nhập v&agrave;o cơ thể v&agrave; g&acirc;y bệnh hơn. D&ugrave;ng <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước &eacute;p tr&aacute;i c&acirc;y</a>&nbsp;Twister mỗi ng&agrave;y th&igrave; chẳng lo g&igrave; cả bởi v&igrave; vitamin C trong nước cam đ&atilde; gi&uacute;p cho sức đề kh&aacute;ng trở n&ecirc;n khỏe mạnh hơn, kh&ocirc;ng một con virus n&agrave;o c&oacute; thể &quot;tấn c&ocirc;ng&quot; v&agrave;o người ch&uacute;ng ta nữa.<br />
<img alt="Nước cam ép Twister Tropicana 1 lít 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/219795/bhx/nuoc-cam-ep-twister-chai-1-lit-202003161057457075.jpg" /></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-cam-ep-twister-cam-1-lit">Nước cam &eacute;p Twister 1 l&iacute;t</a>&nbsp;được chiết xuất từ những t&eacute;p cam tươi nguy&ecirc;n chất tươi ngon v&agrave; bổ dưỡng. <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-twister">Nước&nbsp;&eacute;p tr&aacute;i c&acirc;y&nbsp;Twister</a> với nguồn nguy&ecirc;n liệu tự nhi&ecirc;n được lựa chọn cẩn thận kết hợp c&ocirc;ng nghệ sản xuất hiện đại, mang lại thức uống c&oacute; hương vị thơm ngon, tốt cho sức khỏe. Khi thưởng thức Nước cam &eacute;p Twister gi&uacute;p xua tan mọi cảm gi&aacute;c mệt mỏi, căng thẳng ngay tức th&igrave;, đem lại cảm gi&aacute;c thoải m&aacute;i nhất cho bạn sau mỗi lần sử dụng.</p>
	</li>
	<li>
	<p style="text-align:justify">Đến từ chuy&ecirc;n gia nước tr&aacute;i c&acirc;y số 1 thế giới &ndash; Tropicana, Tropicana Twister l&agrave; nh&atilde;n h&agrave;ng số 1 tại Việt Nam trong ng&agrave;nh Nước Tr&aacute;i c&acirc;y.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/cam-twister-pet-455ml">Nước cam &eacute;p Twister 455ml</a> hương vị thơm ngon tự nhi&ecirc;n, nước cam &eacute;p Twister c&ograve;n bổ sung vitamin A v&agrave; C, l&agrave; c&aacute;c dưỡng chất tốt l&agrave;nh gi&uacute;p mỗi ng&agrave;y của bạn tươi kh&ocirc;ng cần tưới.</p>
	</li>
	<li>
	<p style="text-align:justify">Hương vị: Twister Cam c&oacute; th&agrave;nh phần chủ yếu từ nước cốt cam tự nhi&ecirc;n, vị ngọt thanh m&aacute;t c&ugrave;ng hương thơm tự nhi&ecirc;n trong từng t&eacute;p cam tươi, mang lại cảm gi&aacute;c sảng kho&aacute;i, tươi mới.</p>
	</li>
	<li>
	<p style="text-align:justify">Thiết kế: Chai 1000ml</p>
	</li>
	<li>
	<p style="text-align:justify">HSD: 06 th&aacute;ng kể từ ng&agrave;y sản xuất</p>
	</li>
	<li>
	<p style="text-align:justify">Ngon hơn khi uống lạnh. Bảo quản nơi sạch sẽ, kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời</p>
	</li>
</ul>

<p>Xem th&ecirc;m:&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nap-nang-luong-bo-sung-vitamin-c-cung-nuoc-cam-ep-twister-1317057">Nạp năng lượng, bổ sung vitamin C c&ugrave;ng nước cam &eacute;p Twister</a></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (139, 'Thùng 12 chai nước cam ép Twister Tropicana 1 lít', 222000, 250000, 'store/images/nuoc-ep-trai-cay/12-chai-nuoc-cam-ep-twister-tropicana-1-lit-202210101359295286_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Chiết xuất từ những t&eacute;p cam tươi nguy&ecirc;n chất tươi ngon v&agrave; bổ dưỡng kết hợp c&ocirc;ng nghệ sản xuất hiện đại, mang lại thức uống c&oacute; hương vị thơm ngon, tốt cho sức khỏe, gi&uacute;p xua tan mọi cảm gi&aacute;c mệt mỏi, căng thẳng ngay tức th&igrave;, đem lại cảm gi&aacute;c thoải m&aacute;i nhất sau mỗi lần sử dụng.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Twister (Anh)</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Cam &eacute;p</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường m&iacute;a, nước cam ho&agrave;n nguy&ecirc;n từ nước cam c&ocirc; đặc 10%, chất điều chỉnh độ acid, chất ổn định, vitamin C, chất bảo quản, hỗn hợp hương cam tự nhi&ecirc;n v&agrave; giống tự nhi&ecirc;n, beta caroten</div>
	</li>
	<li>Lượng đường
	<div>C&oacute; đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao.</div>
	</li>
</ul>

<div class="description">
<h2><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nhung-tac-dung-tuyet-voi-cua-trai-cam-co-the-ban-chua-biet-het-1154482">Cam loại tr&aacute;i c&acirc;y quen thuộc được nhiều người y&ecirc;u th&iacute;ch</a></h2>

<p>Tr&aacute;i cam chứa rất nhiều dưỡng chất, axit tự nhi&ecirc;n,chất xơ, nhiều vitamin đặc biệt l&agrave; vitamin C,&hellip; đ&acirc;y l&agrave; những chất rất tốt cho sức khỏe. Cam c&oacute; thể ăn, l&agrave;m <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước &eacute;p </a>hay sinh tố đều rất ngon.<br />
<img alt="12 chai nước cam ép Twister Tropicana 1 lít 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/3265/219802/bhx/thung-12-chai-nuoc-cam-ep-twister-1-lit-202003161134253804.jpg" style="height:400px; width:533px" /><br />
Trong tr&aacute;i cam c&oacute; chứa nhiều chất polyphenol gi&uacute;p tăng cường hệ miễn dịch, bảo vệ cơ thể khỏi sự x&acirc;m hại của virus. C&ugrave;ng với vitamin C cao gi&uacute;p bảo vệ c&aacute;c tế b&agrave;o khỏi c&aacute;c gốc tự do g&acirc;y hại.<br />
Cam chứa nhiều chất xơ quan trọng cho chức năng tối ưu ho&aacute; hệ thống tim mạch. Tuy nhi&ecirc;n c&aacute;c bạn đừng n&ecirc;n lạm dụng cam, nếu như ăn qu&aacute; nhiều cam sẽ g&acirc;y ra những t&aacute;c hại nguy hiểm<br />
<br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/12-chai-nuoc-cam-ep-twister-1-lit">Nước cam &eacute;p Twister 1 l&iacute;t&nbsp;12 chai </a>tiện dụng được chiết xuất từ những t&eacute;p cam tươi nguy&ecirc;n chất tươi ngon v&agrave; bổ dưỡng. <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-twister">Nước cam &eacute;p Twister </a>với nguồn nguy&ecirc;n liệu tự nhi&ecirc;n được lựa chọn cẩn thận kết hợp c&ocirc;ng nghệ sản xuất hiện đại, mang lại thức uống c&oacute; hương vị thơm ngon, tốt cho sức khỏe. Khi thưởng thức Nước cam &eacute;p Twister gi&uacute;p xua tan mọi cảm gi&aacute;c mệt mỏi, căng thẳng ngay tức th&igrave;, đem lại cảm gi&aacute;c thoải m&aacute;i nhất cho bạn sau mỗi lần sử dụng.</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (140, 'Nước ép táo Vfresh 1 lít', 41000, 46000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-tao-vfresh-1-lit-202210102207169953_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm nước &eacute;p tr&aacute;i c&acirc;y từ thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-vfresh" target="_blank" title="Nước ép trái cây, nước ép hoa quả Vfresh tại Bách Hoá XANH">nước &eacute;p Vfresh</a> được l&agrave;m từ nguy&ecirc;n liệu tự nhi&ecirc;n tươi ngon c&oacute; hương vị ngọt dịu, thơm m&aacute;t từ những tr&aacute;i t&aacute;o tươi ngon,&nbsp;sản phẩm chứa nhi&ecirc;̀u khoáng ch&acirc;́t, dinh dưỡng, ch&acirc;́t ch&ocirc;́ng oxy hóa, lượng vitamin C cao tốt cho sức khỏe</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Vfresh (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>T&aacute;o</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước t&aacute;o &eacute;p từ nước t&aacute;o c&ocirc; đặc, hương liệu tổng hợp d&ugrave;ng cho thực phẩm, chất chống oxy h&oacute;a</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p kh&ocirc;ng đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao. Sau khi mở nắp, bảo quản ở ngăn lạnh v&agrave; sử dụng trong v&ograve;ng 3 ng&agrave;y</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><strong>Nước &eacute;p t&aacute;o Vfresh </strong>được l&agrave;m từ 100% t&aacute;o tự nhi&ecirc;n c&oacute; hương vị ngọt dịu, thơm m&aacute;t từ những tr&aacute;i t&aacute;o tươi ngon,&nbsp;sản phẩm chứa nhi&ecirc;̀u khoáng ch&acirc;́t, dinh dưỡng, ch&acirc;́t ch&ocirc;́ng oxy hóa, lượng vitamin C cao tốt cho h&ecirc;̣ mi&ecirc;̃n dịch và cơ thể, gi&uacute;p ph&ograve;ng ngừa ung thư một c&aacute;ch hiệu quả.<br />
<img alt="Nước ép táo Vfresh 1 lít 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/79181/bhx/files/tao2.jpg" style="height:960px; width:960px" /><br />
<strong><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-tao" target="_blank" title="Nước ép táo các thương hiệu nổi tiếng chỉ có tại Bách Hoá XANH">Nước &eacute;p t&aacute;o</a></strong> c&oacute; rất nhiều lợi &iacute;ch.&nbsp;T&aacute;o l&agrave; loại tr&aacute;i c&acirc;y tốt nhất cho sức khỏe v&agrave; ti&ecirc;u thụ n&oacute; dưới dạng <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay" target="_blank" title="Nước ép trái cây, nước ép hoa quả các thương hiệu nổi tiếng tại Bách Hoá XANH"><strong>nước &eacute;p</strong></a> thậm ch&iacute; c&ograve;n tốt hơn. Nước &eacute;p t&aacute;o c&oacute; thể&nbsp;giải độc v&agrave; l&agrave;m sạch cơ thể. Ngo&agrave;i ra&nbsp;nước t&aacute;o Vfresh c&ograve;n c&oacute; t&aacute;c dụng hỗ trợ điều trị bệnh thiếu m&aacute;u, giảm vi&ecirc;m khớp v&agrave; yếu cơ.<br />
<img alt="Nước ép táo Vfresh 1 lít 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/79181/bhx/files/tao1.jpg" style="height:475px; width:675px" /><br />
Đặc biệt, nước t&aacute;o &eacute;p r&acirc;́t tốt cho h&ecirc;̣ ti&ecirc;u h&oacute;a v&agrave; h&agrave;m lượng axit malic thấp, ph&acirc;n t&aacute;n dễ d&agrave;ng trong cơ thể n&ecirc;n c&ograve;n gi&uacute;p giữ g&igrave;n v&oacute;c d&aacute;ng một c&aacute;ch hiệu quả.<br />
<img alt="Nước ép táo Vfresh 1 lít 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/79181/bhx/files/tao3.jpeg" style="height:544px; width:800px" /><br />
Sản phẩm được sản xuất từ tr&aacute;i c&acirc;y nguy&ecirc;n chất, kh&ocirc;ng phẩm m&agrave;u, kh&ocirc;ng chứa chất bảo quản, đạt ti&ecirc;u chuẩn an to&agrave;n vệ sinh thực phẩm, an toàn tuy&ecirc;̣t đ&ocirc;́i cho người ti&ecirc;u dùng.<br />
<br />
Mua ngay sản phẩm <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-tao-vfresh-hop-1l">Nước t&aacute;o Vfresh kh&ocirc;ng đường hộp 1l&iacute;t</a> chất lượng thơm ngon v&agrave; bổ dưỡng tại hệ thống B&aacute;ch H&oacute;a XANH</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (141, 'Nước ép cam không đường Vfresh 1 lít', 44000, 49000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-cam-khong-duong-vfresh-1-lit-202303141604201066_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm nước &eacute;p tr&aacute;i c&acirc;y chất lượng thơ ngon từ thương hiệu Vfresh với 100% th&agrave;nh phần từ cam tươi c&oacute; chứa nhiều vitamin C rất&nbsp;ph&ugrave; hợp cho cơ thể đang bệnh hoặc mới chớm bệnh&nbsp;gi&uacute;p chống lại bệnh cảm c&uacute;m v&agrave; cảm lạnh,&nbsp;tăng cường sức đề kh&aacute;ng. Cam kết ch&iacute;nh h&atilde;ng v&agrave; an to&agrave;n</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Vfresh (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Cam kh&ocirc;ng đường</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước cam &eacute;p từ nước cam c&ocirc; đặc, hương liệu tổng hợp d&ugrave;ng cho thực phẩm.</div>
	</li>
	<li>Lượng đường
	<div>Nước &eacute;p kh&ocirc;ng đường</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>Lắc đều trước khi sử dụng. Ngon hơn khi uống lạnh.</div>
	</li>
	<li>Điểm nổi bật
	<div>Sản phẩm được sản xuất từ cam &eacute;p nguy&ecirc;n chất n&ecirc;n sẽ c&oacute; một ch&uacute;t vị đắng nhẫn (tuỳ lốc) kh&ocirc;ng ngọt đều như c&aacute;c loại nước &eacute;p hương cam kh&aacute;c</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ cao. Sau khi mở nắp, bảo quản ở ngăn lạnh v&agrave; sử dụng trong v&ograve;ng 3 ng&agrave;y</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay" target="_blank" title="Nước ép các loại">Nước &eacute;p</a> cam&nbsp;Vfresh được l&agrave;m từ khoảng <strong>2.6kg cam tươi </strong>(cho b&igrave;nh 1L)<strong> / 0.5kg cam tươi </strong>(cho hộp 180ml)&nbsp;kh&ocirc;ng biến đổi gen, gi&agrave;u vitamin C tự nhi&ecirc;n, <strong>kh&ocirc;ng bổ sung đường </strong>cho cơ thể khỏe mạnh v&agrave; tr&agrave;n đầy sức sống.&nbsp;Ngo&agrave;i ra&nbsp;nước cam cũng rất gi&agrave;u magi&ecirc; gi&uacute;p <strong>duy tr&igrave; v&agrave; ổn định huyết &aacute;p</strong>&nbsp;ở mức ph&ugrave; hợp với cơ thể v&agrave;&nbsp;chống đ&ocirc;ng m&aacute;u.<br />
<img alt="Nước ép cam không đường Vfresh 1 lít 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/79155/bhx/files/a1.jpg" style="height:461px; width:653px" /><br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-cam" target="_blank" title="Nước ép cam">Nước &eacute;p cam</a>&nbsp;gi&uacute;p <strong>b&ugrave; năng lượng cho cơ thể sau khi vận động</strong>,&nbsp;hỗ trợ giải nhiệt rất tốt. Đồng thời <strong>chất chống oxy ho&aacute;</strong> c&oacute; trong cam&nbsp;đem lại l&agrave;n da mịn m&agrave;ng, tươi trẻ,&nbsp;hỗ trợ điều tiết c&acirc;n nặng v&agrave; giảm nguy cơ mắc bệnh tim.<br />
<img alt="Nước ép cam không đường Vfresh 1 lít 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/79155/bhx/files/a2.jpg" style="height:393px; width:700px" /><br />
<strong>Nước &eacute;p tr&aacute;i c&acirc;y&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-vfresh" target="_blank" title="Nước ép trái cây Vfresh">nước &eacute;p&nbsp;Vfresh</a> </strong>với&nbsp;th&agrave;nh phần từ cam tươi c&oacute; chứa nhiều vitamin C rất&nbsp;ph&ugrave; hợp cho cơ thể đang bệnh hoặc mới chớm bệnh&nbsp;gi&uacute;p chống lại bệnh cảm c&uacute;m v&agrave; cảm lạnh,&nbsp;tăng cường sức đề kh&aacute;ng.&nbsp;<br />
<img alt="Nước ép cam không đường Vfresh 1 lít 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/79155/bhx/files/a3.jpg" style="height:430px; width:580px" /><br />
Mua ngay <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-cam-vfresh-hop-1l">Nước cam Vfresh hộp 1l&iacute;t</a> chất lượng thơm ngon tại B&aacute;ch H&oacute;a XANH</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (142, 'Nước ép đào Vfresh 1 lít', 36000, 40000, 'store/images/nuoc-ep-trai-cay/nuoc-ep-dao-vfresh-1-lit-202210102035409131_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm nước &eacute;p tr&aacute;i c&acirc;y chất lượng thơm ngon từ thương hiệu Vfresh được l&agrave;m từ nguy&ecirc;n liệu tự nhi&ecirc;n tươi ngon v&agrave; đ&agrave;o tươi nguy&ecirc;n chất giữ nguy&ecirc;n được hương vị tự nhi&ecirc;n, thơm ngon vốn c&oacute;. Sản phẩm gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, cung cấp chất dinh dưỡng, tốt cho sức khỏe.</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Vfresh (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
	<li>Loại sản phẩm
	<div>Nước &eacute;p</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Đ&agrave;o</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, nước đ&agrave;o &eacute;p từ nước đ&agrave;o c&ocirc; đặc (42%), đường tinh luyện, chất ổn định (440), hương liệu tổng hợp d&ugrave;ng cho thực phẩm,...</div>
	</li>
	<li>Lượng đường
	<div>C&oacute; đường</div>
	</li>
	<li>Hương vị
	<div>Đ&agrave;o</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
</ul>

<div class="description">
<p>Nước đ&agrave;o Vfresh l&agrave;m từ <strong>nguy&ecirc;n liệu tự nhi&ecirc;n tươi ngon</strong> v&agrave; đ&agrave;o&nbsp;tươi nguy&ecirc;n chất 100%&nbsp;(chứa đến 42% đ&agrave;o &eacute;p) n&ecirc;n giữ nguy&ecirc;n được hương vị tự nhi&ecirc;n, thơm ngon vốn c&oacute;. Cung cấp chất dinh dưỡng, tốt cho sức khỏe.<br />
<img alt="Nước ép đào Vfresh 1 lít 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/91777/bhx/files/a3.jpg" style="height:768px; width:1024px" /><br />
Sản phẩm chứa đuờng glucoza, đường saccaro, protein, caroten, vitamin B1, B2, C, PP v&agrave; c&aacute;c chất sắt. Gi&uacute;p bổ sung <strong>dưỡng chất&nbsp;cho v&oacute;c d&aacute;ng v&agrave; sức khoẻ cho cơ thể</strong>&nbsp;để bạn lu&ocirc;n khoẻ khoắn v&agrave; tươi tắn năng động.<br />
<img alt="Nước ép đào Vfresh 1 lít 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/91777/bhx/files/a2.jpg" style="height:374px; width:500px" /><br />
Nước &eacute;p đ&agrave;o c&oacute; chứa beta-carotene gi&uacute;p <strong>cải thiện thị lực</strong> v&agrave; ngăn ngừa oxy h&oacute;a v&otilde;ng mạc, <strong>cải thiện lưu th&ocirc;ng m&aacute;u trong mắt</strong>, l&agrave;m gi&atilde;n cơ mắt v&agrave; c&aacute;c cơ xung quang mắt gi&uacute;p hạn chế tối đa t&igrave;nh trạng mỏi mắt.&nbsp;<br />
<img alt="Nước ép đào Vfresh 1 lít 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/91777/bhx/files/a1.jpg" style="height:374px; width:500px" /><br />
Ngo&agrave;i những lợi &iacute;ch tr&ecirc;n, chất chống oxy ho&aacute; v&agrave; vitamin C cũng được t&igrave;m thấy trong đ&agrave;o nguy&ecirc;n tr&aacute;i v&agrave; <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay" target="_blank" title="nước ép trái cây, nước ép hoa quả các loại">nước &eacute;p</a> c&oacute; thể gi&uacute;p bạn <strong>giảm c&acirc;n</strong>,<strong> chống sưng vi&ecirc;m </strong>v&agrave; <strong>cải thiện&nbsp;sắc tố da</strong>, l&agrave;m da mềm mịn v&agrave; s&aacute;ng hơn.<br />
Mua ngay <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/necta-dao-vfresh-hop-1-l">Nước &eacute;p đ&agrave;o Vfresh 1L</a>&nbsp;ch&iacute;nh h&atilde;ng <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-vfresh" target="_blank" title="Nước ép trái cây Vfresh">nước &eacute;p Vfresh</a>&nbsp;chất lượng thơm ngon v&agrave; bổ dưỡng tại hệ thống B&aacute;ch H&oacute;a XANH</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (143, 'Thùng 12 hộp nước ép lựu & trái cây hỗn hợp Malee 1 lít', 720000, 0, 'store/images/nuoc-ep-trai-cay/12-hop-nuoc-ep-luu-trai-cay-hon-hop-malee-1-lit-202210101355345248_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">nước &eacute;p</a> chất lượng từ thương hiệu <a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-malee">Malee</a> được sản xuất tại Th&aacute;i Lan.&nbsp;<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/12-hop-nuoc-ep-luu-va-trai-cay-hon-hop-malee-1-lit">12 hộp nước &eacute;p lựu &amp; tr&aacute;i c&acirc;y hỗn hợp Malee hộp 1 l&iacute;t </a>từ nguồn tr&aacute;i c&acirc;y tươi ngon, nhiều vitamin v&agrave; dưỡng chất gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, đồng thời cung cấp năng lượng cho cơ thể sảng kho&aacute;i. Cam kết an to&agrave;n v&agrave; chất lượng</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Malee (Th&aacute;i Lan)</div>
	</li>
	<li>Sản xuất tại
	<div>Th&aacute;i Lan</div>
	</li>
	<li>Loại sản phẩm
	<div>Nước &eacute;p</div>
	</li>
	<li>Loại tr&aacute;i c&acirc;y
	<div>Lựu &amp; tr&aacute;i c&acirc;y hỗn hợp</div>
	</li>
	<li>Độ tuổi sử dụng
	<div>D&ugrave;ng cho trẻ từ 6 tuổi</div>
	</li>
	<li>Th&agrave;nh phần
	<div>55% nước &eacute;p tr&aacute;i lựu, 30% nước &eacute;p nho, 15 % nước &eacute;p t&aacute;o</div>
	</li>
	<li>Lượng đường
	<div>Kh&ocirc;ng đường</div>
	</li>
	<li>Hương vị
	<div>Hỗn hợp</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Đ&oacute;ng g&oacute;i
	<div>Th&ugrave;ng</div>
	</li>
	<li>Số lượng
	<div>12 hộp</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>D&ugrave;ng trực tiếp, sau khi mở nắp bảo quản ở nhiệt độ lạnh từ 2-8 độ C trong v&ograve;ng 3 ng&agrave;y</div>
	</li>
	<li>Điểm nổi bật
	<div>Bổ sung nguồn vitamin C cao gi&uacute;p cơ thể chống lại c&aacute;c gốc tự do</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 200, 0, '2023-05-03 16:30:01', 7);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (144, 'Thùng 12 hộp nước ép quýt Malee 1 lít', 660000, 0, 'store/images/nuoc-ep-trai-cay/12-hop-nuoc-ep-quyt-malee-1-lit-202210101439544283_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm nước &eacute;p tr&aacute;i c&acirc;y chất lượng từ thương hiệu Malee được sản xuất tại Th&aacute;i Lan.&nbsp;Nước &eacute;p qu&yacute;t Malee hộp 1 l&iacute;t từ tr&aacute;i qu&yacute;t ch&iacute;n mọng tươi ngon chứa nhiều vitamin v&agrave; dưỡng chất gi&uacute;p giải kh&aacute;t nhanh ch&oacute;ng, đồng thời cung cấp năng lượng cho cơ thể sản kho&aacute;i. Cam kết an to&agrave;n v&agrave; chất lượng</div>

<ul style="margin-left:40px">
	<li>Thương hiệu
	<div>Malee (Th&aacute;i Lan)</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước &eacute;p qu&yacute;t nguy&ecirc;n chất</div>
	</li>
	<li>Lượng đường
	<div>Kh&ocirc;ng đường</div>
	</li>
	<li>Hương vị
	<div>Qu&yacute;t</div>
	</li>
	<li>Số lượng
	<div>12 hộp</div>
	</li>
	<li>Thể t&iacute;ch
	<div>1L</div>
	</li>
	<li>Sản xuất tại
	<div>Th&aacute;i Lan</div>
	</li>
</ul>

<div class="description">
<h2><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/mach-ban-cong-dung-nuoc-ep-trai-cay-lam-dep-da-1086996">L&agrave;m đẹp tự nhi&ecirc;n thanh lọc cơ thể</a></h2>

<p><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay">Nước &eacute;p</a> qu&yacute;t Malee c&oacute; nhiều vitamin C, l&agrave; chất tăng cường với sắt l&agrave;m tăng khả năng hấp thụ sắt ở cả người lớn lẫn trẻ nhỏ, c&acirc;n bằng thị lực của tuổi gi&agrave;, vitamin C c&ograve;n c&oacute; chức năng miễn dịch, tham gia sản xuất một số chất dẫn truyền thần kinh v&agrave; hormon, tổng hợp carnitine, hấp thụ v&agrave; sử dụng c&aacute;c yếu tố dinh dưỡng kh&aacute;c. Vitamin C cũng l&agrave; một chất dinh dưỡng chống oxy h&oacute;a rất quan trọng.<br />
<img class="lazy" src="https://lh4.googleusercontent.com/InVY49BnNi6gMlQByfLyukYnaKO1BSuyEqc7s3XW64SEPkBSwzIH5qsWhLX9UVzMUif4JlI2WiNsbv2zTB9xkhWmEfu8zBMXaNHfQewKuBpM2uUfwLPzU7Gr4b8Tnuk2rkRMKenS" style="height:451px; width:602px" /><br />
Ngo&agrave;i ra sản phẩm chứa nhiều chất xơ h&ograve;a tan v&agrave; kh&ocirc;ng h&ograve;a tan như hemicellulose, pectin sẽ ngăn cản lượng hấp thụ cholesterol trong ruột gi&uacute;p nhuận tr&agrave;ng v&agrave; hỗ trợ ti&ecirc;u h&oacute;a, cho hệ đường ruột của bạn lu&ocirc;n khỏe mạnh.</p>

<h2>Gi&aacute; cả ph&ugrave; hợp đi k&egrave;m chất lượng</h2>

<p><a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay/nuoc-ep-quyt-malee-1-lit">12 hộp nước &eacute;p qu&yacute;t Malee 1 l&iacute;t</a> với 12 hộp đi k&egrave;m gi&uacute;p ch&uacute;ng ta tiết kiệm thời gian mỗi khi mua lẻ 1 hộp, kh&ocirc;ng cần phải mỗi ng&agrave;y phải đi mua nếu ta th&iacute;ch uống sản phẩm n&agrave;y, k&egrave;m theo đ&oacute; l&agrave; giảm đi 1 số chi ph&iacute; nhất định khi ta mua lẻ.<br />
<img class="lazy" src="//cdn.tgdd.vn/Products/Images//3265/201714/bhx/files/image.png" style="height:400px; width:534px" /><br />
<a href="https://www.bachhoaxanh.com/nuoc-ep-trai-cay-malee">Nước &eacute;p Malee</a> l&agrave; sản phẩm c&oacute; th&agrave;nh phần l&agrave; 100% tr&aacute;i qu&yacute;t ch&iacute;n mọng, mang đến hương vị tự nhi&ecirc;n, sảng kho&aacute;i v&agrave; tr&agrave;n đầy năng lượng, ph&ugrave; hợp với nhu cầu bổ sung nguồn dưỡng chất dồi d&agrave;o trong c&aacute;c hoạt động hằng ng&agrave;y. Sản phẩm được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, được kiểm duyệt chặt chẽ, đảm bảo chất lượng v&agrave; an to&agrave;n cho người sử dụng.</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 7);


INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (145, 'Gia vị lẩu Thái Aji-Quick 50g', 8400, 0, 'store/images/gia-vi/-202211160920453190_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">L&agrave; loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn</a> hiện đang được rất nhiều người ưa chuộng của thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-aji-quick" target="_blank">gia vị n&ecirc;m sẵn Aji-Quick</a>. <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/aji-quick-lau-thai-goi-55g-120" target="_blank">Gia vị n&ecirc;m sẵn nấu lẩu Th&aacute;i Aji-Quick g&oacute;i 50g</a>&nbsp;l&agrave; sự kết hợp h&agrave;i h&ograve;a của tất cả c&aacute;c loại gia vị cần thiết, cho m&oacute;n lẩu th&aacute;i chua cay đậm vị như ở nh&agrave; h&agrave;ng ngay tại nh&agrave;.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Gia vị n&ecirc;m sẵn lẩu Th&aacute;i</div>
	</li>
	<li>Khối lượng
	<div>50g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Muối, đường, chất điều vị, me, ớt, chất điều chỉnh độ acid, riềng, dầu ăn, hương Tom Yum tổng hợp, chất chiết từ men, ti&ecirc;u, phẩm m&agrave;u, chất tạo ngọt, hương nấm tổng hợp. Sản phẩm c&oacute; chứa sữa, t&ocirc;m, c&aacute;, đậu phộng, đậu n&agrave;nh.</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>1 g&oacute;i 50g nấu được 1.5 l&iacute;t nước d&ugrave;ng</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Phi thơm h&agrave;nh, tỏi với 6 - 7 muỗng canh dầu ăn bằng lửa nhỏ, th&ecirc;m 1 tr&aacute;i c&agrave; chua cắt m&uacute;i v&agrave; 1/4 tr&aacute;i thơm cắt l&aacute;t v&agrave;o x&agrave;o cho ch&iacute;n bằng lửa lớn. Cho 1,5 l&iacute;t nước v&agrave;o, đun s&ocirc;i, cho g&oacute;i gia vị v&agrave;o, khuấy đều. Th&ecirc;m v&agrave;i t&eacute;p sả đập dập v&agrave; l&aacute; chanh v&agrave;o. Đun s&ocirc;i lại v&agrave; thưởng thức. Th&ecirc;m hải sản, rau tuỳ th&iacute;ch</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Aji-Quick ()</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Aji Quick</h3>

<p>Aji Quick l&agrave; thương hiệu rất nổi tiếng với d&ograve;ng sản phẩm gia vị n&ecirc;m sẵn, tiện lợi gi&uacute;p tiết kiệm thời gian chế biến m&oacute;n ăn hằng ng&agrave;y. Thuộc tập đo&agrave;n Ajinomoto nổi tiếng của Nhật Bản, được th&agrave;nh lập v&agrave;o năm 1908, với hơn 100 năm lịch sử h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển tr&ecirc;n thị trường, hiện nay Ajinomoto đ&atilde; c&oacute; mặt tr&ecirc;n 35 quốc gia to&agrave;n thế giới trong đ&oacute; c&oacute; Việt Nam.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong gia vị lẩu Th&aacute;i Aji Quick</h3>

<p>L&agrave; sản phẩm gia vị n&ecirc;m sẵn gi&uacute;p nấu nướng nhanh ch&oacute;ng, tiết kiệm thời gian tối đa, lại rất dễ d&agrave;ng sử dụng, sản phẩm gia vị n&ecirc;m sẵn lẩu Th&aacute;i Aji-Quick g&oacute;i 50g c&oacute; những th&agrave;nh phần dinh dưỡng như: Năng lượng, protein, carbohydrate,.... Theo đ&oacute;, 100g gia vị n&ecirc;m sẵn lẩu th&aacute;i c&oacute; chứa khoảng 147 - 231 kcal.<br />
<img alt="Gia vị nêm sẵn lẩu Thái Aji-Quick gói 50g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/91755/bhx/gia-vi-nem-san-lau-thai-aji-quick-goi-55g-202205161607204645.jpg" /></p>

<h3>T&aacute;c dụng của sản phẩm với sức khỏe</h3>

<p>C&aacute;c sản phẩm mang thương hiệu Aji Quick l&agrave;m từ những nguy&ecirc;n liệu, gia vị tự nhi&ecirc;n chất lượng v&agrave; được sản xuất theo c&ocirc;ng nghệ hiện đại của Nhật Bản, đảm bảo vệ sinh thực phẩm rất an to&agrave;n cho người sử dụng.</p>

<h3>Hướng dẫn sử dụng</h3>

<p>Với g&oacute;i gia vị n&ecirc;m sẵn của Aji Quick, bạn sẽ c&oacute; ngay một nồi lẩu Th&aacute;i chua chua, cay cay đậm đ&agrave; đ&uacute;ng chuẩn chỉ với những bước đơn giản như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Phi thơm h&agrave;nh, tỏi với 6 - 7 muỗng canh dầu ăn, th&ecirc;m v&agrave;o 1 tr&aacute;i c&agrave; chua cắt m&uacute;i v&agrave; 1/4 tr&aacute;i thơm đ&atilde; được cắt l&aacute;t v&agrave;o x&agrave;o ch&iacute;n.</p>
	</li>
	<li>
	<p>Tiếp đến đun s&ocirc;i 1.5 l&iacute;t nước, sau đ&oacute; cho g&oacute;i gia vị lẩu Th&aacute;i Aji Quick v&agrave;o v&agrave; khuấy thật đều tay.</p>
	</li>
	<li>
	<p>Cho th&ecirc;m một v&agrave;i t&eacute;p sả đập dập v&agrave; l&aacute; chạm sẽ thơm ngon hơn, sau đ&oacute; đợi nước lẩu s&ocirc;i rồi thưởng thức.</p>
	</li>
</ul>

<p>Ăn chung với hải sản, thịt v&agrave; rau. Bạn c&ograve;n c&oacute; thể d&ugrave;ng gia vị n&ecirc;m sẵn lẩu Th&aacute;i để nấu những m&oacute;n canh, kết hợp c&ugrave;ng c&aacute;c loại rau củ như: Bắp cải, c&agrave; chua, hoặc gi&aacute; đỗ,...</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản gia vị n&ecirc;m sẵn lẩu Th&aacute;i Aji-Quick g&oacute;i 50g</h3>

<ul style="margin-left:40px">
	<li>
	<p>Cần bảo quản sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh nơi c&oacute; nhiệt độ cao.</p>
	</li>
	<li>
	<p>Lưu &yacute;, sản phẩm c&oacute; chứa sulfite, gi&aacute;p x&aacute;c, sữa, thủy sản, đậu n&agrave;nh, đậu phộng.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>C&aacute;c cửa h&agrave;ng của B&aacute;ch h&oacute;a XANH tr&ecirc;n to&agrave;n quốc hiện đang c&oacute; b&aacute;n c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của những thương hiệu nổi tiếng với mức gi&aacute; rất cạnh tranh. Kh&ocirc;ng những thế, khi mua h&agrave;ng online tại bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n ứng dụng điện thoại, bạn c&ograve;n được giao h&agrave;ng tận nơi c&ugrave;ng những khuyến m&atilde;i si&ecirc;u hấp dẫn.</p>

<p>&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-nau-lau-thai-bang-goi-gia-vi-aji-quick-nhanh-gon-ma-van-chuan-vi-truyen-thong-1136383">C&aacute;ch nấu lẩu th&aacute;i bằng g&oacute;i gia vị Aji Quick ngon chuẩn vị</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (146, 'Nước gia vị Maggi 350g', 29000, 0, 'store/images/gia-vi/gia-vi-nem-san-co-dac-maggi-chai-350g-202205162235387645_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">L&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn</a> tiện lợi, mới mẽ v&agrave; tiện dụng đến từ thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-maggi" target="_blank">gia vị Maggi</a>.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/gia-vi-nem-san-co-dac-maggi-chai-350g" target="_blank">Nước gia vị c&ocirc; đặc Maggi chai 350g</a> với vị kết hợp giữa nước mắm, h&agrave;nh, tỏi c&ugrave;ng nhiều loại gia vị quen thuộc kh&aacute;c l&agrave; nguy&ecirc;n liệu ch&iacute;nh gi&uacute;p cho mọi m&oacute;n ăn được chế biến nhanh ch&oacute;ng v&agrave; thơm ngon đậm đ&agrave; hơn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Nước gia vị c&ocirc; đặc</div>
	</li>
	<li>Khối lượng
	<div>350g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, muối iod, đường, chất ổn định, nước mắm từ tinh cốt c&aacute;, bột gia vị, hương tự nhi&ecirc;n, nước cốt thịt g&agrave; hầm,...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>N&ecirc;m nếm cho c&aacute;c m&oacute;n canh, v&agrave; d&ugrave;ng để ướp, kho hoặc x&agrave;o,...</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Maggi (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 1, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (147, 'Gia vị nấu canh chua Knorr 30g', 7200, 0, 'store/images/gia-vi/gia-vi-hoan-chinh-nau-canh-chua-cho-mon-canh-ngon-dung-dieu-knorr-goi-30g-202301050938425064_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Mỗi g&oacute;i nhỏ <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/gia-vi-hoan-chinh-nau-canh-chua-knorr-goi-30gg" target="_blank">gia vị ho&agrave;n chỉnh nấu canh chua Knorr 30g</a> chứa đầy đủ c&aacute;c gia vị cần thiết, được phối trộn với một tỷ lệ ho&agrave;n hảo,&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san-knorr" target="_blank">gia vị n&ecirc;m sẵn Knorr</a> gi&uacute;p cho bạn c&oacute; thể nấu được m&oacute;n canh ngon đ&uacute;ng điệu đ&atilde;i cả nh&agrave;. Sản phẩm l&agrave; loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn</a>&nbsp;thiết yếu kh&ocirc;ng thể thiếu cho mọi bữa ăn ngon.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Gia vị ho&agrave;n chỉnh nấu canh chua</div>
	</li>
	<li>Khối lượng
	<div>30g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, chất điều vị, bột nước mắm, bột me, chất điều chỉnh độ acid, bột sắn, maltodextrin, dầu cọ, chất chống đ&ocirc;ng v&oacute;n, chất điều vị, hương nước mắm tự nhi&ecirc;n, hương me tổng hợp, chất tạo ngọt tổng hợp, m&agrave;u thực phẩm tự nhi&ecirc;n.</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>1 g&oacute;i 30g nấu với 750ml nước</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Đun s&ocirc;i 3 ch&eacute;n nước, th&ecirc;m c&aacute;, thơm, c&agrave; chua v&agrave;o, nấu ch&iacute;n. Cho g&oacute;i gia vị v&agrave;o, th&ecirc;m đậu bắp, bạc h&agrave;, gi&aacute; đỗ v&agrave;o, nấu ch&iacute;n. Tắt bếp, trang tr&iacute; ng&ograve; om, ng&ograve; gai v&agrave; dầu tỏi phi</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Knorr (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (148, 'Xốt thịt kho Chinsu 10x70g', 60000, 0, 'store/images/gia-vi/gia-vi-hoan-chinh-dang-xot-thit-kho-chinsu-hop-700g-202205261712202887_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">L&agrave; loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn </a>với sự kết hợp đầy đủ của c&aacute;c loại gia vị quen thuộc từ thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-chinsu" target="_blank">gia vị Chisnu</a>. <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/gia-vi-hoan-chinh-dang-xot-thit-kho-trung-chinsu-goi-70g" target="_blank">Gia vị ho&agrave;n chỉnh dạng xốt thịt kho Chinsu hộp 700g</a> được xem l&agrave; vị cứu tinh cho c&aacute;c b&agrave; nội trợ trong việc chế biến những m&oacute;n ăn cầu k&igrave;, phức tạp.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Gia vị ho&agrave;n chỉnh dạng xốt thịt kho.</div>
	</li>
	<li>Khối lượng
	<div>70g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước mắm (c&aacute;, muối, nước), nước, đường, h&agrave;nh t&iacute;m, dầu thực vật, chất điều vị (621, 635), tỏi, muối, dextroza, h&agrave;nh t&acirc;y, chất ổn định (1442, 471, 415), chất tạo m&agrave;u (caramel (150a), paprika oleoresin tự nhi&ecirc;n), gia vị hỗn hợp, nước m&agrave;u dừa, chất điều chỉnh độ axit (330), hương liệu tổng hợp, chất bảo quản (202), chất tạo ngọt acesulfame potassium tổng hợp, chất chống oxy h&oacute;a (320, 321)</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>G&oacute;i 70g nấu với 400g thịt.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ướp 400g thịt với 1 g&oacute;i xốt Chinsu thịt kho trong khoảng 10 ph&uacute;t. Cho thịt v&agrave;o nồi, th&ecirc;m khoảng 1 ch&eacute;n nước v&agrave; đun s&ocirc;i. C&oacute; thể th&ecirc;m trứng luộc. Kho nhỏ lửa đến khi thịt mềm thấm vị, l&ecirc;n m&agrave;u n&acirc;u v&agrave;ng như &yacute;.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Chinsu (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description"><strong>Gia vị ho&agrave;n chỉnh Chinsu&nbsp;dạng xốt thịt kho trứng</strong>&nbsp;c&oacute; sự kết hợp đầy đủ của nước m&agrave;u, đường, muối v&agrave; nước mắm, được pha trộn c&ocirc;ng phu cho m&oacute;n thịt kho trứng vàng n&acirc;u sóng sánh, th&acirc;́m vị đ&acirc;̣m đà.<br />
<img alt="Gia vị hoàn chỉnh dạng xốt thịt kho Chinsu hộp 700g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/202877/bhx/files/gia-vi-hoan-chinh-dang-xot-thit-kho-trung-chinsu-hop-700g-10-goi-x-70g.png" style="height:418px; width:600px" /><br />
<br />
Nước x&ocirc;́t đặc sánh được căn chỉnh hoàn hảo, thấm vị đến từng thớ thịt: ngọt thanh của nước màu dừa, đậm đ&agrave; nước mắm, thơm ng&acirc;̣y của thịt ba chỉ.<br />
<img alt="Gia vị hoàn chỉnh dạng xốt thịt kho Chinsu hộp 700g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/202877/bhx/files/gia-vi-hoan-chinh-dang-xot-thit-kho-trung-chinsu-hop-700g-10-goi-x-70g-2.png" style="height:551px; width:600px" /><img alt="Gia vị hoàn chỉnh dạng xốt thịt kho Chinsu hộp 700g 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/202877/bhx/files/gia-vi-hoan-chinh-dang-xot-thit-kho-trung-chinsu-hop-700g-10-goi-x-70g-3.png" style="height:489px; width:600px" /><img alt="Gia vị hoàn chỉnh dạng xốt thịt kho Chinsu hộp 700g 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/202877/bhx/files/gia-vi-hoan-chinh-dang-xot-thit-kho-trung-chinsu-hop-700g-10-goi-x-70g-4.png" style="height:262px; width:600px" /><br />
<br />
Kh&ocirc;ng cần n&ecirc;m nếm phức tạp, chỉ cần có thịt và 1 gói gia vị l&agrave; bạn đã có ngay món thịt kho trứng chu&acirc;̉n vị sau 30 phút ch&ecirc;́ bi&ecirc;́n. Thịt kho c&oacute; thể ăn c&ugrave;ng với cơm, với b&aacute;nh t&eacute;t, hay thậm ch&iacute; l&agrave; b&aacute;nh m&igrave;, b&aacute;nh bao nhạt.</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (149, 'Xốt ướp thịt nướng Cholimex 200g', 20500, 22300, 'store/images/gia-vi/xot-uop-thit-nuong-cholimex-hu-200g-202303021627268068_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san/sauce-uop-thit-nuong-hu-tt-200g-32" target="_blank">Xốt ướp thịt nướng Cholimex hũ 200g</a>&nbsp;l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-uop-nuong" target="_blank">xốt gia vị&nbsp;ướp nướng</a>&nbsp;tiện dụng v&igrave; tổng hợp đủ c&aacute;c gia vị như nước mắm, tỏi, h&agrave;nh, đường, muối ăn, mật ong, sả, ti&ecirc;u,&hellip;&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-tam-uop-cholimex" target="_blank">Gia vị n&ecirc;m sẵn Cholimex</a>&nbsp;lu&ocirc;n mang đến những sản phẩm tiện lợi gi&uacute;p người d&ugrave;ng tiết kiệm thời gian nấu nướng hằng ng&agrave;y.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt ướp thịt nướng</div>
	</li>
	<li>Khối lượng
	<div>200g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, nước, nước mắm (c&aacute; cơm, muối), h&agrave;nh, tỏi, dầu n&agrave;nh, mật ong, sả, ti&ecirc;u, dầu m&egrave;, chất ổn định (1422), chất điều vị (621), phẩm m&agrave;u tổng hợp</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ướp khoảng 1 giờ trước khi nướng hoặc chi&ecirc;n. C&oacute; thể ướp t&ocirc;m, g&agrave; , thịt c&aacute;c loại,...</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Bảo quản trong ngăn m&aacute;t tủ lạnh nếu kh&ocirc;ng d&ugrave;ng hết</div>
	</li>
	<li>Thương hiệu
	<div>Cholimex (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Cholimex</h3>

<p>Xốt ướp thịt nướng Cholimex l&agrave; một trong những sản phẩm sốt ướp b&aacute;n rất chạy tr&ecirc;n thị trường hiện nay, được sản xuất bởi C&ocirc;ng ty Cổ phần thực phẩm Cholimex.</p>

<p>Thương hiệu Cholimex được người ti&ecirc;u d&ugrave;ng biết đến với những d&ograve;ng sản phẩm chất lượng c&ugrave;ng gi&aacute; th&agrave;nh hợp l&yacute; như: Tương ớt, tương đen, tương c&agrave;, gia vị ướp nướng, nước mắm, sa tế,...</p>

<h3>Th&agrave;nh phần dinh dưỡng trong xốt ướp thịt nướng Cholimex hũ 200g</h3>

<p>Sản phẩm được sản xuất dựa tr&ecirc;n c&ocirc;ng thức ho&agrave;n hảo từ c&aacute;c loại gia vị truyền thống quen thuộc: nước mắm, mật ong, sả, ti&ecirc;u,... tạo n&ecirc;n nước xốt ướp thịt nướng Cholimex đặc s&aacute;nh, thơm lừng, ướp với loại thịt n&agrave;o cũng hợp.<br />
<img alt="Xốt ướp thịt nướng Cholimex hũ 200g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96242/bhx/files/1.png" /></p>

<h3>T&aacute;c dụng của xốt ướp thịt nướng Cholimex cho sức khỏe</h3>

<p>Xốt ướp thịt nướng Cholimex được l&agrave;m từ những nguy&ecirc;n liệu chất lượng, được tuyển chọn kỹ c&agrave;ng, đạt chuẩn vệ sinh thực phẩm n&ecirc;n rất an to&agrave;n cho sức khỏe người sử dụng.</p>

<h3>Hướng dẫn sử dụng xốt ướp thịt nướng Cholimex</h3>

<p><img alt="Xốt ướp thịt nướng Cholimex hũ 200g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96242/bhx/files/2.png" /><br />
Sự căn chỉnh ho&agrave;n hảo c&acirc;n bằng về vị, xốt ướp thịt nướng Cholimex cho m&oacute;n thịt nướng kh&ocirc;ng chỉ mềm thấm vị, m&agrave; c&ograve;n mang m&agrave;u sắc bắt mắt v&agrave; hương thơm hấp dẫn đ&aacute;nh thức mọi gi&aacute;c quan.</p>

<p>Với 1 hũ xốt ướp thịt nướng 200g d&ugrave;ng để ướp với khoảng 1,5kg nguy&ecirc;n liệu. Để thịt thấm vị hơn, bạn n&ecirc;n d&ugrave;ng dao để khứa thịt v&agrave; ướp thịt 1 tiếng trước khi nướng. Vắt 1 &iacute;t nước cốt chanh v&agrave;o sốt ướp sẽ l&agrave;m thịt mềm hơn, kh&ocirc;ng bị kh&ocirc; khi nướng.<br />
<img alt="Xốt ướp thịt nướng Cholimex hũ 200g 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96242/bhx/files/thit-nuong.PNG" /></p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản xốt ướp thịt nướng Cholimex</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản hũ xốt ở nơi kh&ocirc; tho&aacute;ng, kh&ocirc;ng để sản phẩm dưới &aacute;nh nắng trực tiếp.</p>
	</li>
	<li>
	<p>Lưu &yacute;, n&ecirc;n giữ lạnh v&agrave; d&ugrave;ng hết trong 2 th&aacute;ng sau khi mở nắp.</p>
	</li>
	<li>
	<p>Vặn chặt nắp hũ sau khi d&ugrave;ng.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua xốt ướp thịt nướng tại B&aacute;ch ho&aacute; XANH</h3>

<p>B&aacute;ch h&oacute;a XANH cam kết chỉ b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng, đầy đủ nguồn gốc, xuất xứ r&otilde; r&agrave;ng. Ngo&agrave;i ra, khi mua sắm trực tuyến tại website hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH bạn c&ograve;n được giao h&agrave;ng nhanh, tận nơi, c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>

<p>&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bien-bua-com-gia-dinh-tro-nen-phong-phu-va-thom-ngon-hon-rat-nhieu-nho-goi-gia-vi-nem-san-cholimex-1281851">Bữa cơm gia đ&igrave;nh phong ph&uacute; v&agrave; thơm ngon nhờ gia vị n&ecirc;m sẵn Cholimex</a></p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (150, 'Bột cà ri ướp Ông Chà Và 10g', 3200, 0, 'store/images/gia-vi/bot-ca-ri-uop-ong-cha-va-goi-10g-202211151604536283_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-ong-cha-va">Gia vị n&ecirc;m sẵn &Ocirc;ng Ch&agrave; V&agrave;</a> l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san">gia vị n&ecirc;m sẵn</a>&nbsp;được rất nhiều người ưa chuộng.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/bot-ca-ri-uop-ong-cha-va-goi-10g">Bột c&agrave; ri ướp &Ocirc;ng Ch&agrave; V&agrave; g&oacute;i 10g</a> l&agrave; loại gia vị dạng bột, gi&uacute;p m&oacute;n c&agrave; ri chế biến nhanh ch&oacute;ng hơn, mang đến hương vị đậm đ&agrave;, chuẩn vị c&agrave; ri Ấn Độ.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Bột c&agrave; ri ướp</div>
	</li>
	<li>Khối lượng
	<div>10g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột nghệ, hạt điều m&agrave;u, muối, l&aacute; c&agrave; ri (5%), bột th&igrave; l&agrave;, bột tiểu hồi, hột ng&ograve;, ớt, đại hồi, quế, đinh hương, bột siron, tỏi, thảo quả, ti&ecirc;u, xơ protein đậu n&agrave;nh, bột nui.</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>G&oacute;i 10g ướp 500g thịt</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ướp với c&aacute;c loại thức ăn như thịt b&ograve;, thịt d&ecirc;, thịt g&agrave;, c&aacute;, hải sản, ếch để chế biến c&aacute;c m&oacute;n ăn c&agrave; ri x&agrave;o lăn, muối sả ớt, tẩm ướp lắc sả, g&agrave; kho gừng,... M&oacute;n ăn sẽ thơm ngon hơn. Chay mặn đều d&ugrave;ng được.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>&Ocirc;ng Ch&agrave; V&agrave; (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu &Ocirc;ng Ch&agrave; V&agrave;</h3>

<p>&Ocirc;ng Ch&agrave; V&agrave; l&agrave; thương hiệu rất nổi tiếng với những sản phẩm bột gia vị, sốt chấm. Thuộc quyền sở hữu của C&ocirc;ng ty Cổ phần Nosafood, đ&acirc;y l&agrave; thương hiệu đ&atilde; c&oacute; từ rất l&acirc;u tr&ecirc;n thị trường, lần đầu xuất hiện v&agrave;o năm 1939. Khi ấy, đối với những đầu bếp chuy&ecirc;n nghiệp, &Ocirc;ng Ch&agrave; V&agrave; l&agrave; thương hiệu gia vị kh&ocirc;ng thể thiếu trong chế biến m&oacute;n ăn ngon, chuẩn vị.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong bột c&agrave; ri ướp &Ocirc;ng Ch&agrave; V&agrave; g&oacute;i 10g</h3>

<p>Trong bột c&agrave; ri &Ocirc;ng Ch&agrave; V&agrave; 10g c&oacute; những nguy&ecirc;n liệu từ thi&ecirc;n nhi&ecirc;n như: Bột nghệ, hạt điều m&agrave;u, muối, l&aacute; c&agrave; ri, bột tiểu hồi, bột ng&ograve;, ớt, đinh hương,....<br />
<img alt="Bột cà ri ướp Ông Chà Và gói 10g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/208849/bhx/bot-ca-ri-uop-ong-cha-va-goi-10g-202211151604536283.jpg" /></p>

<h3>T&aacute;c dụng của bột c&agrave; ri ướp &Ocirc;ng Ch&agrave; V&agrave; với sức khỏe</h3>

<p>Sản phẩm của thương hiệu &Ocirc;ng Ch&agrave; V&agrave; rất an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng bởi kh&ocirc;ng chứa chất bảo quản, kh&ocirc;ng phẩm m&agrave;u tổng hợp, kh&ocirc;ng hương liệu. Được sản xuất theo c&ocirc;ng thức truyền thống, kết hợp c&ugrave;ng c&ocirc;ng nghệ hiện đại, đảm bảo nghi&ecirc;m ngặt về vệ sinh an to&agrave;n thực phẩm.</p>

<h3>Hướng dẫn sử dụng bột c&agrave; ri ướp &Ocirc;ng Ch&agrave; V&agrave;</h3>

<ul>
	<li>
	<p>Ngo&agrave;i sử dụng l&agrave;m gia vị cho m&oacute;n c&agrave; ri. Bột c&agrave; ri ướp &Ocirc;ng Ch&agrave; V&agrave; c&ograve;n d&ugrave;ng l&agrave;m nguy&ecirc;n liệu tẩm ướp với c&aacute;c loại thịt để chế biến th&agrave;nh những m&oacute;n ăn ngon như: C&agrave; ri x&agrave;o lăn, g&agrave; kho gừng,...</p>
	</li>
	<li>
	<p>Sử dụng với lượng vừa đủ, t&ugrave;y theo từng m&oacute;n ăn kh&aacute;c nhau.</p>
	</li>
</ul>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản bột c&agrave; ri ướp &Ocirc;ng Ch&agrave; V&agrave;</h3>

<p>Sản phẩm được đựng trong g&oacute;i nhỏ 10g, sử dụng tiện lợi v&agrave; dễ d&agrave;ng bảo quản.</p>

<ul style="margin-left:40px">
	<li>
	<p>Để bột c&agrave; ri ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh những nơi ẩm ướt v&agrave; &aacute;nh nắng mặt trời chiếu trực tiếp.</p>
	</li>
	<li>
	<p>Sử dụng hết sau khi mở bao b&igrave;.</p>
	</li>
	<li>
	<p>D&ugrave;ng được cho cả m&oacute;n chay lẫn m&oacute;n mặn.<br />
	<img alt="Bột cà ri ướp Ông Chà Và gói 10g 1" class="lazy" src="https://sunhouse.com.vn/pic/news/images/cach-nau-mon-ca-ri-ga-thom-ngon-cho-ngay-tro-gio.jpg" /></p>
	</li>
</ul>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>Để hạn chế rủi ro mua phải h&agrave;ng giả, h&agrave;ng nh&aacute;i, bạn h&atilde;y mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH, v&igrave; ch&uacute;ng t&ocirc;i cam kết chỉ b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng, đầy đủ nguồn gốc, xuất xứ. Ngo&agrave;i ra, bạn c&ograve;n nhận nhiều ưu đ&atilde;i hấp dẫn v&agrave; được giao h&agrave;ng tận nh&agrave; khi mua h&agrave;ng trực tuyến tại www.bachhoaxanh.com.</p>
&gt;&gt;&gt; <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/gia-vi-nem-san-ong-cha-va-cuu-tinh-cho-cuoc-song-ban-ron-1310868">Gia vị n&ecirc;m sẵn &ocirc;ng Ch&agrave; V&agrave; - Cứu tinh cho cuộc sống bận rộn</a></div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (151, 'Sốt ướp nướng Lee Kum Kee 240g', 49800, 0, 'store/images/gia-vi/sot-uop-do-nuong-lee-kum-kee-hu-240g-202209082003560838_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">
<p>L&agrave; loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san">sốt ướp nướng n&ecirc;m sẵn</a>&nbsp;rất được ưa chuộng&nbsp;của&nbsp;thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-lee-kum-kee" target="_blank" title="Gia vị Lee Kum Kee">gia vị n&ecirc;m sẵn Lee Kum Kee</a> từ Hồng K&ocirc;ng.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-uop-do-nuong-leekumkee-hu-240g-12" target="_blank">Sốt ướp đồ nướng Lee Kum Kee hũ 240g</a>&nbsp;l&agrave;m&nbsp;từ&nbsp;mật ong kết hợp c&ugrave;ng&nbsp;đậu tương,&nbsp;sử dụng như một loại sốt ướp nướng, hoặc d&ugrave;ng l&agrave;m gia vị cho m&oacute;n x&agrave;o, cho cả m&oacute;n chay v&agrave; m&oacute;n mặn.</p>
</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sốt ướp đồ nướng</div>
	</li>
	<li>Khối lượng
	<div>240g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, nước, muối, đậu n&agrave;nh l&ecirc;n men (nước, muối, đậu n&agrave;nh, bột m&igrave;), mật ong, nước tương (nước, muối, đậu n&agrave;nh, l&uacute;a m&igrave;, m&agrave;u thực phẩm tự nhi&ecirc;n, siro h&agrave;m lượng fructose cao), siro mạch nha, tinh bột bắp biến t&iacute;nh, tỏi kh&ocirc;, gia vị, acid điều chỉnh, phẩm m&agrave;u hỗn hợp. Sốt c&oacute; chứa đậu n&agrave;nh, l&uacute;a m&igrave; v&agrave; l&uacute;a mạch</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ướp 4 c&aacute;i đ&ugrave;i g&agrave; (khoảng 800g) với bột tỏi, 3 muỗng sốt (1 muỗng canh tương đương 20g), 1 muỗng c&agrave; ph&ecirc; nước chanh trong 2 giờ. Nướng ở 180 độ C trong 30 - 40 ph&uacute;t. C&oacute; thể nướng bằng bếp than hoặc l&ograve; vi s&oacute;ng.<br />
	Chay mặn đều c&oacute; thể d&ugrave;ng được.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Bảo quản trong ngăn m&aacute;t tủ lạnh nếu kh&ocirc;ng d&ugrave;ng hết</div>
	</li>
	<li>Thương hiệu
	<div>Lee Kum Kee (Hồng K&ocirc;ng)</div>
	</li>
	<li>Nơi sản xuất
	<div>Trung Quốc</div>
	</li>
</ul>

<div class="description">
<div style="text-align:justify">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Lee Kum Kee</h3>

<p>Lee Kum Kee l&agrave; thương hiệu gia vị, sốt c&oacute; xuất xứ từ Hong Kong. Với hơn 134 năm kinh nghiệm sản xuất v&agrave; ph&acirc;n phối&nbsp;gia vị tr&ecirc;n thị trường trong v&agrave; ngo&agrave;i nước,&nbsp;c&aacute;c sản phẩm của Lee Kum Kee đều được sản xuất từ những nguy&ecirc;n liệu chất lượng nhất kết hợp c&ugrave;ng c&ocirc;ng thức đặc biệt tạo ra sản phẩm với hương vị đặc trưng, hấp dẫn rất ph&ugrave; hợp để chế biến c&aacute;c m&oacute;n quay, nướng.<br />
<img alt="Sốt ướp đồ nướng Lee Kum Kee hũ 240g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96423/bhx/files/1.png" style="height:102px; width:600px" /></p>

<h3>Th&agrave;nh phần dinh dưỡng trong sốt ướp đồ nướng Lee Kum Kee hũ 240g</h3>

<p>Sản phẩm được đựng trong hũ thủy tinh 240g. Sốt ướp đồ nướng Lee Kum Kee c&oacute; c&aacute;c th&agrave;nh phần ch&iacute;nh l&agrave;: Đường, nước, muối, đậu n&agrave;nh l&ecirc;n men, mật ong, nước tương,...<br />
<img alt="Sốt ướp đồ nướng Lee Kum Kee hũ 240g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96423/bhx/files/sot-uop-do-nuong-lee-kum-kee.gif" style="height:600px; width:600px" /></p>

<h3>T&aacute;c dụng của sốt ướp đồ nướng Lee Kum Kee với sức khỏe</h3>

<p>C&aacute;c sản phẩm mang thương hiệu Lee Kum Kee được sản xuất tr&ecirc;n d&acirc;y chuyền sản xuất hiện đại, đặt chất lượng v&agrave; dinh dưỡng trong sản phẩm l&ecirc;n h&agrave;ng đầu, l&agrave;m từ nguồn nguy&ecirc;n liệu tự nhi&ecirc;n, kh&ocirc;ng biến đổi gen, kh&ocirc;ng th&ecirc;m chất bảo quản, kh&ocirc;ng chứa&nbsp;hương v&agrave;&nbsp;m&agrave;u nh&acirc;n tạo, đảm bảo vệ sinh thực phẩm n&ecirc;n rất an to&agrave;n cho sức khỏe của người ti&ecirc;u d&ugrave;ng.<br />
<img alt="Sốt ướp đồ nướng Lee Kum Kee hũ 240g 2" class="lazy" src="https://scontent-hkt1-2.xx.fbcdn.net/v/t39.30808-6/321395094_545136927264721_3088728330223727848_n.jpg?_nc_cat=108&amp;ccb=1-7&amp;_nc_sid=730e14&amp;_nc_ohc=d-ngiaVpvjgAX8GmMiI&amp;_nc_oc=AQni-KvOU6m5-xjIRFz8IhA6PyXE8onDCGwZ0M4IJ_AoW8O0eSDnpoeGJaAyrYqYOn8&amp;_nc_ht=scontent-hkt1-2.xx&amp;oh=00_AfBywfwQa-Fe7_Q0kw_e3-ZIZ9betBKTC0ZTa9GlKTbNsg&amp;oe=63CACA83" /></p>

<h3>Hướng dẫn sử dụng sốt ướp đồ nướng Lee Kum Kee</h3>
<img alt="Sốt ướp đồ nướng Lee Kum Kee hũ 240g 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96423/bhx/files/2.png" style="height:98px; width:599px" />
<p>&nbsp;</p>

<p>&nbsp;</p>

<ul>
	<li>
	<p>Việc chế biến c&aacute;c m&oacute;n nướng tại nh&agrave; thật đơn giản nhờ c&oacute; sốt ướp đồ nướng Lee Kum Kee. Kh&ocirc;ng cần &ldquo;tay nghề&rdquo; cao, bạn vẫn c&oacute; thể l&agrave;m được m&oacute;n nướng ngon như tại nh&agrave; h&agrave;ng.</p>
	</li>
	<li>
	<p>Mật ong h&ograve;a quyện với đậu tương v&agrave; c&aacute;c gia vị quen thuộc của người &Aacute; Đ&ocirc;ng, tạo n&ecirc;n một loại sốt đặc s&aacute;nh, thơm lừng, ướp với loại thịt n&agrave;o cũng hợp. M&oacute;n thịt nướng kh&ocirc;ng chỉ mềm thấm vị, m&agrave; c&ograve;n c&oacute; m&agrave;u sắc bắt mắt v&agrave; hương thơm quyến rũ, đ&aacute;nh thức mọi gi&aacute;c quan.</p>
	</li>
	<li>
	<p>Sử dụng như nước sốt hoặc d&ugrave;ng để phết l&ecirc;n thịt trong khi nướng, ngo&agrave;i ra bạn c&oacute; thể d&ugrave;ng l&agrave;m gia vị cho m&oacute;n x&agrave;o.</p>
	</li>
</ul>

<p>Để thịt thấm vị hơn, bạn n&ecirc;n d&ugrave;ng dao để khứa thịt v&agrave; ướp trong 2 tiếng trước khi nướng. Vắt 1 &iacute;t nước cốt chanh v&agrave;o sốt ướp sẽ l&agrave;m thịt mềm hơn, kh&ocirc;ng bị kh&ocirc; khi nướng.<br />
<img alt="Sốt ướp đồ nướng Lee Kum Kee hũ 240g 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//2807/96423/bhx/files/sot-uop-lee-kum-kee.jpg" style="height:450px; width:800px" /></p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sốt ướp đồ nướng Lee Kum Kee</h3>

<ul style="margin-left:40px">
	<li>
	<p>Để sản phẩm ở nơi kh&ocirc; tho&aacute;ng, kh&ocirc;ng để dưới &aacute;nh nắng trực tiếp.</p>
	</li>
	<li>
	<p>Lưu &yacute; bảo quản trong ngăn m&aacute;t tủ lạnh sau khi mở nắp sản phẩm.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng d&ugrave;ng cho những người bị dị ứng với c&aacute;c th&agrave;nh phần như đậu n&agrave;nh, l&uacute;a m&igrave; v&agrave; l&uacute;a mạch.</p>
	</li>
	<li>
	<p>Sốt ướp đồ nướng Lee Kum Kee c&oacute; thể d&ugrave;ng cho cả m&oacute;n chay lẫn mặn.<br />
	<img alt="Sốt ướp đồ nướng Lee Kum Kee hũ 240g 5" class="lazy" src="https://scontent-hkt1-1.xx.fbcdn.net/v/t39.30808-6/315198754_681692643524576_3613423543331761282_n.jpg?_nc_cat=111&amp;ccb=1-7&amp;_nc_sid=730e14&amp;_nc_ohc=W496N7pi4wwAX8C9q8Y&amp;_nc_ht=scontent-hkt1-1.xx&amp;oh=00_AfCnVjtGITsCT0j9f5NnLJdf2Jp_Lg0DLK1Es7YRPvDmmA&amp;oe=63CAB3B0" /></p>
	</li>
</ul>

<h3>Ưu điểm khi mua h&agrave;ng tại B&aacute;ch ho&aacute; XANH</h3>

<p>B&aacute;ch h&oacute;a XANH cam kết chỉ b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng, đầy đủ nguồn gốc, xuất xứ r&otilde; r&agrave;ng, n&ecirc;n bạn c&oacute; thể an t&acirc;m khi mua h&agrave;ng tại đ&acirc;y. Ngo&agrave;i ra, khi mua sắm trực tuyến tại www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n thiết bị điện thoại bạn c&ograve;n được giao h&agrave;ng nhanh, tận nơi, c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (152, 'Xốt ướp thịt Ottogi 80g', 7000, 8800, 'store/images/gia-vi/xot-uop-thit-truyen-thong-ottogi-goi-80g-202301191547581920_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-uop-thit-truyen-thong-ottogi-ottogi-80g">Xốt ướp thịt truyền thống Ottogi g&oacute;i 80g</a>&nbsp;mang hương vị đậm đ&agrave; cho bữa ăn của bạn th&ecirc;m phần hấp dẫn. Đ&acirc;y l&agrave; <a href="https://www.bachhoaxanh.com/gia-vi-nem-san">gia vị n&ecirc;m sẵn</a>&nbsp;của thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san-ottogi-uop-nuong">xốt ướp nướng Ottogi</a> c&oacute; th&agrave;nh phần tự nhi&ecirc;n v&agrave; được kiểm nghiệm an to&agrave;n n&ecirc;n bạn c&oacute; thể y&ecirc;n t&acirc;m sử dụng cho c&aacute;c m&oacute;n nướng như thịt, hải sản,...</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt ướp thịt truyền thống</div>
	</li>
	<li>Khối lượng
	<div>80g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, đường, sả, h&agrave;nh t&iacute;m, nước mắm, dầu n&agrave;nh, muối i-ốt, đường, tỏi, dầu h&agrave;o, ớt, chất ổn định, mật ong, gừng, chất điều vị, ti&ecirc;u, chiết xuất ớt, bột ngũ vị hương, phẩm m&agrave;u tổng hợp, chất bảo quản.</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>G&oacute;i 80g d&ugrave;ng cho 400g thịt hoặc hải sản.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Bước 1 G&oacute;i nhỏ 80g d&ugrave;ng cho 400g thịt hoặc hải sản, ướp trong v&ograve;ng 30 ph&uacute;t<br />
	Bước 2 Nướng thịt, hải sản đ&atilde; ướp bằng l&ograve; vị s&oacute;ng, bếp than hoặc l&ograve; nướng điện.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Thương hiệu
	<div>Ottogi (H&agrave;n Quốc)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Ottogi</h3>

<p>Ottogi thương hiệu thực phẩm số 1 tại H&agrave;n Quốc, thuộc tập đo&agrave;n Ottogi, được th&agrave;nh lập v&agrave;o năm 1969. Ottogi ch&iacute;nh thức bước ch&acirc;n v&agrave;o thị trường Việt Nam từ năm 2007, c&aacute;c sản phẩm nổi bật của Ottogi được nhiều người ti&ecirc;u d&ugrave;ng ưa chuộng: Xốt c&agrave; chua, xốt ướp, xốt mayonnaise, m&ugrave; tạt mật ong, giấm,...</p>

<h3>Th&agrave;nh phần dinh dưỡng trong xốt ướp thịt truyền thống Ottogi</h3>

<p>Trong xốt ướp thịt truyền thống Ottogi c&oacute; c&aacute;c th&agrave;nh phần ch&iacute;nh l&agrave;: Nước, đường, sả, h&agrave;nh t&iacute;m, nước mắm, dầu n&agrave;nh, muối i ốt,... v&agrave; những gi&aacute; trị dinh dưỡng như: Năng lượng, carbohydrate, chất đạm, chất b&eacute;o.</p>

<p>Theo th&ocirc;ng tin tr&ecirc;n bao b&igrave; sản phẩm, trong 100g xốt ướp thịt nướng Ottogi c&oacute; chứa khoảng 95 kcal.<br />
<img alt="Xốt ướp thịt truyền thống Ottogi gói 80g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/255627/bhx/xot-uop-thit-truyen-thong-ottogi-goi-80g-202209081004425182.jpg" /></p>

<h3>T&aacute;c dụng của xốt ướp thịt truyền thống Ottogi với sức khỏe</h3>

<p>C&aacute;c sản phẩm mang thương hiệu Ottogi được sản xuất tr&ecirc;n d&acirc;y chuyền sản xuất hiện đại, đ&aacute;p ứng theo hệ thống GMP v&agrave; HACCP, c&ugrave;ng triết l&yacute; kinh doanh đặt chất lượng v&agrave; dinh dưỡng trong sản phẩm l&ecirc;n h&agrave;ng đầu, đảm bảo vệ sinh thực phẩm n&ecirc;n rất an to&agrave;n cho sức khỏe của người ti&ecirc;u d&ugrave;ng.</p>

<h3>Hướng dẫn sử dụng xốt ướp thịt truyền thống Ottogi</h3>

<p>Với một g&oacute;i xốt ướp thịt nướng 80g d&ugrave;ng để ướp với 400g thịt hoặc c&aacute;c loại hải sản trong 30 ph&uacute;t, sau đ&oacute; nướng thịt, hải sản đ&atilde; được ướp tr&ecirc;n bếp than, l&ograve; vi s&oacute;ng, l&ograve; nướng cho đến khi ch&iacute;n v&agrave;ng đều hai mặt l&agrave; c&oacute; thể sử dụng được.</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản xốt ướp thịt truyền thống Ottogi</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản sản phẩm ở nơi kh&ocirc; tho&aacute;ng, kh&ocirc;ng để sản phẩm dưới &aacute;nh nắng trực tiếp.</p>
	</li>
	<li>
	<p>Lưu &yacute; nếu sử dụng c&ograve;n dư, th&igrave; phải bảo quản trong ngăn m&aacute;t tủ lạnh v&agrave; d&ugrave;ng hết trong ng&agrave;y.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng d&ugrave;ng cho những người bị dị ứng với c&aacute;c th&agrave;nh phần như đậu n&agrave;nh, bắp, thủy hải sản.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng d&ugrave;ng sản phẩm hết hạn sử dụng.<br />
	<img alt="Xốt ướp thịt truyền thống Ottogi gói 80g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/255627/bhx/xot-uop-thit-truyen-thong-ottogi-80g-202111301006230407.jpg" /></p>
	</li>
</ul>

<h3>Ưu điểm khi mua h&agrave;ng tại B&aacute;ch ho&aacute; XANH</h3>

<p>B&aacute;ch h&oacute;a XANH cam kết chỉ b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng, đầy đủ nguồn gốc, xuất xứ r&otilde; r&agrave;ng, n&ecirc;n bạn c&oacute; thể an t&acirc;m khi mua h&agrave;ng tại đ&acirc;y. Ngo&agrave;i ra, khi mua sắm trực tuyến tại www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n thiết bị điện thoại bạn c&ograve;n được giao h&agrave;ng nhanh, tận nơi, c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (153, 'Tỏi phi Nguyên Bảo 50g', 16600, 0, 'store/images/gia-vi/toi-phi-nguyen-bao-goi-50g-202301050955187889_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">L&agrave; loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị chế biến sẵn</a>&nbsp;rất tiện lợi v&agrave; thơm ngon từ thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-nguyen-bao" target="_blank">gia vị n&ecirc;m sẵn Nguy&ecirc;n Bảo</a> quen thuộc.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/toi-phi-tui-50g" target="_blank">Tỏi phi Nguy&ecirc;n Bảo t&uacute;i 50g</a>&nbsp;d&ugrave;ng l&agrave;m gia vị ăn k&egrave;m, gi&uacute;p m&oacute;n ăn th&ecirc;m dậy m&ugrave;i thơm hấp dẫn, thơm ngon chuẩn vị. Ngo&agrave;i ra, từng miếng tỏi gi&ograve;n rụm cũng rất k&iacute;ch th&iacute;ch vị gi&aacute;c.</div>

<ul style="margin-left:40px">
	<li>Th&agrave;nh phần
	<div>Củ tỏi 80%, dầu đậu n&agrave;nh.</div>
	</li>
	<li>H&agrave;m lượng protein
	<div>6,5 - 11(g/100g)</div>
	</li>
	<li>Hướng dẫn sử dụng
	<div>D&ugrave;ng l&agrave;m gia vị tạo m&ugrave;i thơm, nấu chế biến c&aacute;c m&oacute;n ăn</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Tốt nhất ở nhiệt độ 0-10 độ C</div>
	</li>
	<li>Thương hiệu
	<div>Nguy&ecirc;n Bảo</div>
	</li>
	<li>Xuất xứ
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Nguy&ecirc;n Bảo</h3>

<p>Nguy&ecirc;n Bảo, thương hiệu quen thuộc với người ti&ecirc;u d&ugrave;ng chuy&ecirc;n sản xuất v&agrave; ph&acirc;n phối những mặt h&agrave;ng gia vị chế biến sẵn, thực phẩm kh&ocirc;,... Thuộc C&ocirc;ng ty Thương Mại Xuất Nhập Khẩu Nguy&ecirc;n Bảo, c&aacute;c sản phẩm mang thương hiệu Nguy&ecirc;n Bảo đều c&oacute; chất lượng tốt c&ugrave;ng gi&aacute; th&agrave;nh phải chăng tr&ecirc;n thị trường n&ecirc;n được nhiều c&aacute;c b&agrave; nội trợ tin tưởng lựa chọn.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong tỏi phi Nguy&ecirc;n Bảo g&oacute;i 50g</h3>

<p>Sản phẩm tỏi phi của Nguy&ecirc;n Bảo c&oacute; chứa những th&agrave;nh phần ch&iacute;nh như: Củ tỏi, dầu đậu n&agrave;nh. Trong đ&oacute; h&agrave;m lượng chất đạm khoảng từ 6.5 - 11 (g/100g)</p>

<h3>T&aacute;c dụng của tỏi phi với sức khỏe</h3>

<p>Tỏi phi l&agrave; gia vị xuất hiện phổ biến, l&agrave;m tăng hương vị cho c&aacute;c m&oacute;n ăn hằng ng&agrave;y, kh&ocirc;ng những thế đ&acirc;y c&ograve;n l&agrave; loại gia vị c&oacute; nhiều t&aacute;c dụng hữu &iacute;ch như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Kh&aacute;ng khuẩn, kh&aacute;ng vi&ecirc;m.</p>
	</li>
	<li>
	<p>L&agrave;m giảm cholesterol xấu trong cơ thể.</p>
	</li>
	<li>
	<p>Ngo&agrave;i ra c&ograve;n gi&uacute;p ph&ograve;ng chống ung thư,...<br />
	<img alt="Tỏi phi Nguyên Bảo gói 50g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/233816/bhx/toi-phi-nguyen-bao-goi-50g-202208220936090514.jpg" /></p>
	</li>
</ul>

<h3>Hướng dẫn sử dụng tỏi phi Nguy&ecirc;n Bảo</h3>

<p>Tỏi phi c&oacute; thể sử dụng cho nhiều mục đ&iacute;ch kh&aacute;c nhau, ngo&agrave;i d&ugrave;ng l&agrave;m gia vị cho m&oacute;n ăn bạn c&oacute; thể sử dụng tỏi phi để l&agrave;m c&aacute;c m&oacute;n ngon như: B&aacute;nh tr&aacute;ng trộn tỏi phi, nộm t&ocirc;m xo&agrave;i tỏi phi, dầu tỏi phi, cải th&igrave;a tỏi phi,...</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản tỏi phi Nguy&ecirc;n Bảo</h3>

<p>Bạn n&ecirc;n bảo quản sản phẩm trong hũ nhựa, hoặc hũ thủy tinh c&oacute; nắp đậy k&iacute;n v&agrave; để ở nơi tho&aacute;ng m&aacute;t, sau khi mở bao b&igrave; sản phẩm, bảo quản ở mức nhiệt từ 0 - 10 độ C v&agrave; sử dụng hết trong v&ograve;ng 30 ng&agrave;y.</p>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>Tại B&aacute;ch h&oacute;a XANH h&agrave;ng h&oacute;a lu&ocirc;n được đảm bảo về nguồn gốc cũng như chất lượng, gi&aacute; b&aacute;n rất hợp l&yacute; n&ecirc;n bạn c&oacute; thể y&ecirc;n t&acirc;m mua sắm. Đặc biệt khi mua sắm online tại trang website www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n điện thoại để được giao h&agrave;ng nhanh ch&oacute;ng tận nh&agrave; c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (154, 'Xốt ướp sườn nướng Ottogi 80g', 7000, 8800, 'store/images/gia-vi/xot-uop-suon-nuong-dam-vi-dua-com-ottogi-goi-80g-202301191552590659_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-ottogi-uop-nuong">Xốt ướp nướng Ottogi</a>&nbsp;l&agrave; sự lựa chọn ho&agrave;n hảo cho những bữa tiệc nướng. Đ&acirc;y l&agrave; loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san">gia vị n&ecirc;m sẵn</a> sở hữu c&ocirc;ng thức chế biến ri&ecirc;ng, mang hương vị v&ocirc; c&ugrave;ng đậm đ&agrave; cho m&oacute;n ăn của bạn. Với g&oacute;i&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-uop-suon-nuong-ottogi-goi-80g">xốt ướp sườn nướng Ottogi 80g</a> cho 400g thịt sườn l&agrave; bạn sẽ c&oacute; ngay một m&oacute;n nướng ngon đ&uacute;ng điệu.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt ướp sườn nướng đậm vị đưa cơm.</div>
	</li>
	<li>Khối lượng
	<div>80g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, nước tương, nước mắm, h&agrave;nh t&iacute;m, đường, tỏi, chất ổn định, chất điều vị, đạm thực vật thủy ph&acirc;n, muối i-ốt, mật ong, dầu n&agrave;nh, ti&ecirc;u, chiết xuất ớt, phẩm m&agrave;u tổng hợp, bột ngũ vị hương, chất bảo quản.</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>G&oacute;i 80g d&ugrave;ng cho 400g thịt.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Bước 1, uớp một g&oacute;i xốt 80g cho 400g thịt trong v&ograve;ng 30ph&uacute;t.<br />
	Bước 2, ram tr&ecirc;n chảo hoặc nướng đến khi ch&iacute;n v&agrave;ng l&agrave; c&oacute; thể d&ugrave;ng.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh &aacute;nh nắng trực tiếp. Bảo quản lạnh sau khi mở bao b&igrave;.</div>
	</li>
	<li>Thương hiệu
	<div>Ottogi (H&agrave;n Quốc)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify">Đ&ocirc;i n&eacute;t về thương hiệu</h3>

<p style="text-align:justify">Ottogi l&agrave; thương hiệu thuộc quyền sở hữu của Tập đo&agrave;n Ottogi, c&oacute; xuất xứ từ đất nước H&agrave;n Quốc, th&agrave;nh lập từ năm 1969 t&iacute;nh đến nay Ottogi đ&atilde; c&oacute; hơn 50 năm hoạt động tr&ecirc;n thị trường v&agrave; trở th&agrave;nh thương hiệu sản xuất gia vị thực phẩm top đầu của H&agrave;n Quốc.</p>

<h3 style="text-align:justify">Th&agrave;nh phần dinh dưỡng trong sản phẩm</h3>

<p style="text-align:justify">Trong xốt ướp sườn nướng Ottogi c&oacute; c&aacute;c th&agrave;nh phần dinh dưỡng như: calo, carbohydrate, chất đạm, chất b&eacute;o.<br />
Trung b&igrave;nh trong 100g sốt ướp sườn của thương hiệu Ottogi c&oacute; chứa khoảng 67 calo.</p>

<p style="text-align:center"><img alt="Xốt ướp sườn nướng đậm vị đưa cơm Ottogi gói 80g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8271/255602/bhx/files/255602%20BV.png" style="height:500px; width:800px" /></p>

<h3 style="text-align:justify">T&aacute;c dụng của sản phẩm với sức khỏe</h3>

<p style="text-align:justify">C&ugrave;ng với d&acirc;y chuyền sản xuất hiện đại, đ&aacute;p ứng theo hệ thống GMP v&agrave; HACCP, c&ugrave;ng triết l&yacute; kinh doanh đặt chất lượng v&agrave; dinh dưỡng trong sản phẩm l&ecirc;n h&agrave;ng đầu, đảm bảo vệ sinh thực phẩm, n&ecirc;n rất an to&agrave;n cho sức khỏe của người ti&ecirc;u d&ugrave;ng.</p>

<h3 style="text-align:justify">Hướng dẫn sử dụng sản phẩm</h3>

<p style="text-align:justify">Với một g&oacute;i sốt ướp thịt nướng 80g bạn d&ugrave;ng để ướp với 400g thịt trong 30 ph&uacute;t, sau đ&oacute; ram thịt tr&ecirc;n chảo hoặc nướng tr&ecirc;n bếp than cho đến khi ch&iacute;n v&agrave;ng đều hai mặt l&agrave; c&oacute; thể sử dụng được.</p>

<h3 style="text-align:justify">Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</h3>

<p style="text-align:justify">Bảo quản sản phẩm ở nơi kh&ocirc; tho&aacute;ng, kh&ocirc;ng để sản phẩm dưới &aacute;nh nắng trực tiếp. Lưu &yacute; nếu sử dụng c&ograve;n dư, th&igrave; phải bảo quản trong ngăn m&aacute;t tủ lạnh v&agrave; d&ugrave;ng hết trong ng&agrave;y.</p>

<h3 style="text-align:justify">Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p style="text-align:justify">B&aacute;ch h&oacute;a XANH cam kết chỉ b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng, đầy đủ nguồn gốc, xuất xứ r&otilde; r&agrave;ng, n&ecirc;n bạn c&oacute; thể an t&acirc;m khi mua h&agrave;ng tại đ&acirc;y. Ngo&agrave;i ra, khi mua sắm trực tuyến tại www.bachhoaxanh.com bạn c&ograve;n được giao h&agrave;ng nhanh, tận nơi, c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 0, 90, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (155, 'Cơm mẻ Elkei A Tuấn Khang 500g', 19000, 0, 'store/images/gia-vi/com-me-elkei-a-tuan-khang-chai-500g-202301301733505891_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-a-tuan-khang">Gia vị A Tuấn Khang</a> l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san">gia vị n&ecirc;m sẵn</a> truyền thống nổi tiếng của Việt Nam.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/com-me-elkei-a-tuan-khang-chai-500g">Cơm mẻ Elkei A Tuấn Khang chai 500g</a> c&oacute; vị chua gắt v&agrave; thơm đặc trưng, rất bổ dưỡng, gi&agrave;u đạm, vitamin, acid lactic,... mang lại nhiều lợi &iacute;ch cho sức khỏe người sử dụng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Cơm mẻ</div>
	</li>
	<li>Khối lượng
	<div>500g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Gạo ch&iacute;n v&agrave; mẻ c&aacute;i (90%), nước (0.1%). H&agrave;m lượng acid lactic 1.24%.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Mẻ c&oacute; vị chua, d&ugrave;ng như dấm, me, chanh cho m&oacute;n lẩu, canh chua, ốc nấu đậu phụ chuối xanh, thịt b&ograve; nh&uacute;ng mẻ,...</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>A Tuấn Khang (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (156, 'Xốt nấu bò kho Cholimex 90g', 8900, 10500, 'store/images/gia-vi/bo-kho-cholimex-goi-90g-202205162218094646_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-cholimex" target="_blank">Gia vị n&ecirc;m sẵn Cholimex</a>&nbsp;sử dụng nguồn nguy&ecirc;n liệu tươi sạch, chất lượng, đảm bảo an to&agrave;n cho sức khỏe người sử dụng. <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-nau-bo-kho-cholimex-goi-90g" target="_blank">Xốt b&ograve; kho Cholimex g&oacute;i 90g</a> l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn</a>&nbsp;tiện lợi, tiết kiệm thời gian nấu nướng, mang lại hương vị b&ograve; kho ngon đ&uacute;ng chuẩn nh&agrave; h&agrave;ng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt b&ograve; kho</div>
	</li>
	<li>Khối lượng
	<div>90g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, dầu n&agrave;nh, muối ăn, đường c&aacute;t, sả, l&aacute; c&agrave; ri, bột quế, bột đại hồi, đinh hương, ớt, gừng, h&agrave;nh t&iacute;m, c&agrave; chua, tỏi,...</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>G&oacute;i 90g d&ugrave;ng cho 500g thịt b&ograve;.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ướp thịt b&ograve; với 2/3 lượng xốt khoảng 20 ph&uacute;t. Phi thơm h&agrave;nh, tỏi băm, sả c&acirc;y cho thịt b&ograve; đ&atilde; ướp v&agrave;o đảo đều cho đến khi thịt săn lại. Cho nước s&ocirc;i hoặc nước dừa tươi v&agrave;o ngập thịt, đun s&ocirc;i, để lửa nhỏ v&agrave; đậy nắp trong 60 - 70 ph&uacute;t. Cho tiếp c&agrave; rốt gọt vỏ, cắt kh&uacute;c v&agrave;o nấu khoảng 10 - 20 ph&uacute;t. Cho phần xốt c&ograve;n lại v&agrave; bột năng h&ograve;a tan với nước v&agrave;o nấu s&ocirc;i. Tắt bếp, cho ra t&ocirc;. D&ugrave;ng với b&aacute;nh m&igrave;, hủ tiếu, m&igrave; hoặc cơm.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Thương hiệu
	<div>Cholimex (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (157, 'Xốt nấu bún bò Cholimex 90g', 8900, 10500, 'store/images/gia-vi/xot-bun-bo-cholimex-goi-90g-202205162220169060_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-cholimex" target="_blank">Gia vị n&ecirc;m sẵn Cholimex</a>&nbsp;sử dụng nguồn nguy&ecirc;n liệu chất lượng, đảm bảo an to&agrave;n cho sức khỏe người d&ugrave;ng. <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-nau-bun-bo-cholimex-goi-90g" target="_blank">Xốt nấu b&uacute;n b&ograve; Cholimex 90g</a> mang đậm hương vị b&uacute;n b&ograve; thơm ngon đặc trưng, chuẩn vị Huế, l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn</a>&nbsp;tiện lợi, tiết kiệm thời gian nấu nướng hằng ng&agrave;y.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt b&uacute;n b&ograve;</div>
	</li>
	<li>Khối lượng
	<div>90g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, muối ăn, dầu n&agrave;nh, sả, h&agrave;nh t&iacute;m, tỏi, mắm ruốc Huế, hương b&ograve; tổng hợp, bột quế, bột đại hồi, bột thảo quả,...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Hầm 2 l&iacute;t nước với nạm b&ograve;, xương v&agrave; một &iacute;t sả c&acirc;y (khoảng 30 ph&uacute;t). Cho g&oacute;i Xốt b&uacute;n b&ograve; v&agrave;o, khuấy cho hỗn hợp tan đều. Hầm nhỏ lửa để gia vị ngấm v&agrave;o nạm b&ograve;, xương (khoảng 10 ph&uacute;t). D&ugrave;ng n&oacute;ng với b&uacute;n, rau, chả cua để tăng độ hấp dẫn.</div>
	</li>
	<li>Lưu &yacute;
	<div>Người dị ứng với c&aacute;c th&agrave;nh phần tr&ecirc;n cần lưu &yacute; khi sử dụng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Thương hiệu
	<div>Cholimex (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Cholimex Food l&agrave; thương hiệu chuy&ecirc;n sản xuất v&agrave; cung cấp c&aacute;c loại nước chấm, gia vị,... với d&acirc;y chuyền sản xuất hiện đại, chất lượng đảm bảo được đ&aacute;nh gi&aacute; cao từ người ti&ecirc;u d&ugrave;ng. B&ecirc;n cạnh đ&oacute; Cholimex c&ograve;n mang đến rất nhiều sản phẩm tiện lợi gi&uacute;p việc n&ecirc;m nếm trở n&ecirc;n dễ d&agrave;ng cho c&aacute;c b&agrave; nội trợ.<br />
<img alt="Xốt nấu bún bò Cholimex gói 90g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/229401/bhx/xot-bun-bo-cholimex-goi-90g-202011051450111555.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Th&agrave;nh phần ch&iacute;nh l&agrave;m n&ecirc;n sản phẩm l&agrave; muối, dầu, sả, h&agrave;nh, mắm ruốc v&agrave; một số gia vị kh&aacute;c n&ecirc;n sẽ mang đến cho cơ thể chất đạm, chất b&eacute;o, năng lượng.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng nổi bật của sản phẩm đối với sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng</p>
	</li>
	<li>
	<p>Bổ sung dinh dưỡng</p>
	</li>
	<li>
	<p>K&iacute;ch th&iacute;ch vị gi&aacute;c</p>
	</li>
	<li>
	<p>Hỗ trợ ti&ecirc;u h&oacute;a</p>
	</li>
	<li>
	<p>Nhuận tr&agrave;ng</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<p>Xốt b&uacute;n b&ograve; l&agrave; loại gia vị quen thuộc gi&uacute;p b&agrave; nội trợ dễ d&agrave;ng chế biến m&oacute;n b&uacute;n b&ograve; chuẩn vị, Xốt được đ&oacute;ng g&oacute;i nhỏ dễ sử dụng. Hầm 2 l&iacute;t nước với nạm b&ograve;, xương v&agrave; một &iacute;t sả c&acirc;y (khoảng 30 ph&uacute;t). Cho g&oacute;i Xốt b&uacute;n b&ograve; v&agrave;o, khuấy cho hỗn hợp tan đều. Hầm nhỏ lửa để gia vị ngấm v&agrave;o nạm b&ograve;, xương (khoảng 10 ph&uacute;t). D&ugrave;ng n&oacute;ng với b&uacute;n, rau, chả cua để tăng độ hấp dẫn.&nbsp;<br />
<img alt="Xốt nấu bún bò Cholimex gói 90g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/229401/bhx/xot-bun-bo-cholimex-goi-90g-202011051450125213.jpg" /></p>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Sau khi mở g&oacute;i bạn n&ecirc;n sớm sử dụng. Nếu chưa mở g&oacute;i bạn chỉ cần bảo quản sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh nhiệt độ cao hoặc &aacute;nh nắng trực tiếp từ mặt trời. Kh&ocirc;ng d&ugrave;ng khi sản phẩm c&oacute; dấu hiệu ẩm mốc, hết hạn hoặc c&oacute; m&ugrave;i vị kh&aacute;c lạ.<br />
Lưu &yacute;: Người mẫn cảm hoặc dị ứng c&aacute;c th&agrave;nh phần sản phẩm cần lưu &yacute; khi sử dụng.</p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Khi mua sản phẩm tại B&aacute;ch h&oacute;a XANH bạn sẽ được an t&acirc;m bởi chất lượng sản phẩm lu&ocirc;n được đảm bảo, được kiểm tra kỹ về nguồn gốc xuất xứ cũng như chất lượng. Đặc biệt khi mua sắm tại đ&acirc;y bạn c&ograve;n được giao h&agrave;ng nhanh ch&oacute;ng, tận nơi.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (158, 'Gia vị ướp xá xíu Cholimex 70g', 7100, 8400, 'store/images/gia-vi/gia-vi-uop-xa-xiu-cholimex-goi-70g-202303261903080293_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">L&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-uop-nuong" target="_blank">gia vị n&ecirc;m sẵn ướp nướng</a>&nbsp;tiện lợi của thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-cholimex" target="_blank">gia vị n&ecirc;m sẵn Cholimex</a>. <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-uop-xa-xiu-cholimex-goi-70g" target="_blank">Xốt ướp thịt x&aacute; x&iacute;u Cholimex g&oacute;i 70g</a>&nbsp;kết hợp giữa c&ocirc;ng thức truyền thống v&agrave; quy tr&igrave;nh chế biến hiện đại giúp cho m&oacute;n thịt x&aacute; x&iacute;u của bạn thơm ngon với vị mặn ngọt h&agrave;i ho&agrave; mà lại v&ocirc; c&ugrave;ng nhanh ch&oacute;ng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt ướp x&aacute; x&iacute;u</div>
	</li>
	<li>Khối lượng
	<div>70g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Tương hột, đường c&aacute;t, đường thốt nốt, tỏi, mật ong, nước tương, muối ăn, nước, chất điều vị, chất điều chỉnh độ acid, ngũ vị hương, phẩm m&agrave;u, rượu gạo, bột m&igrave;, chất bảo quản</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ướp 500g thịt g&agrave;, vịt, sườn non heo, đặc biệt l&agrave; thịt nạc heo l&agrave;m x&aacute; x&iacute;u tuỳ th&iacute;ch với g&oacute;i sốt. C&oacute; thể ướp x&aacute; x&iacute;u chay</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Bảo quản trong ngăn m&aacute;t tủ lạnh nếu kh&ocirc;ng d&ugrave;ng hết</div>
	</li>
	<li>Thương hiệu
	<div>Cholimex (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Cholimex</h3>

<p>Cholimex, thương hiệu rất quen thuộc với người ti&ecirc;u d&ugrave;ng, thuộc quản l&yacute; của C&ocirc;ng ty Cổ phần thực phẩm Cholimex, được th&agrave;nh lập v&agrave;o năm 1983. Vừa qua, thương hiệu Cholimex đ&atilde; nhận được giải thưởng &ldquo;Thương hiệu quốc gia Việt Nam&rdquo; năm 2022 c&ugrave;ng với c&aacute;c d&ograve;ng sản phẩm đặc trưng như: Xốt, nước chấm, gia vị v&agrave; thực phẩm đ&ocirc;ng lạnh.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong gia vị ướp x&aacute; x&iacute;u Cholimex</h3>

<p>Gia vị ướp x&aacute; x&iacute;u Cholimex 70g được l&agrave;m từ những nguy&ecirc;n liệu tươi ngon, sản phẩm c&oacute; chứa những th&agrave;nh phần ch&iacute;nh như: Tương hột, đường c&aacute;t, đường thốt nốt, tỏi, mật ong, nước tương, muối ăn, nước,...<br />
<img alt="Gia vị ướp xá xíu Cholimex gói 70g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8271/158016/bhx/gia-vi-uop-xa-xiu-cholimex-goi-70g-202212160847575859.jpg" /></p>

<h3>T&aacute;c dụng của sản phẩm với sức khỏe</h3>

<p>C&aacute;c sản phẩm của Cholimex đảm bảo sản xuất từ nguồn nguy&ecirc;n liệu tươi, sạch được tuyển chọn kỹ c&agrave;ng, trải qua quy tr&igrave;nh chế biến v&agrave; đ&oacute;ng g&oacute;i kh&eacute;p k&iacute;n, kh&ocirc;ng chứa h&oacute;a chất v&agrave; chất bảo quản g&acirc;y hại v&agrave; đồng thời đ&aacute;p ứng đầy đủ c&aacute;c ti&ecirc;u chuẩn vệ sinh thực phẩm n&ecirc;n rất an to&agrave;n cho sức khỏe của người ti&ecirc;u d&ugrave;ng.</p>

<h3>Hướng dẫn sử dụng</h3>

<p>D&ugrave;ng để tẩm ướp c&aacute;c loại thực phẩm như g&agrave;, vịt, sườn non heo, đặc biệt ph&ugrave; hợp ướp với thịt nạc heo l&agrave;m m&oacute;n x&aacute; x&iacute;u, x&aacute; x&iacute;u chay,... D&ugrave;ng cho cả m&oacute;n chay v&agrave; m&oacute;n mặn.</p>

<p>Sốt gia vị ướp x&aacute; x&iacute;u của Cholimex sử dụng rất đơn giản, bạn h&atilde;y cho một g&oacute;i xốt 70g v&agrave;o ướp c&ugrave;ng với 500g thịt đ&atilde; được cắt miếng trong v&ograve;ng 1 giờ đồng hồ, sau đ&oacute; d&ugrave;ng để nướng hoặc x&agrave;o.</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản gia vị ướp x&aacute; x&iacute;u Cholimex</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản g&oacute;i gia vị ướp x&aacute; x&iacute;u ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh những nơi ẩm ướt, v&agrave; &aacute;nh nắng mặt trời.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng sản phẩm hết hạn sử dụng.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>Bạn c&oacute; thể gh&eacute; c&aacute;c cửa h&agrave;ng của B&aacute;ch h&oacute;a XANH để mua sắm c&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của c&aacute;c thương hiệu nổi tiếng với mức gi&aacute; hợp l&yacute;. Ngo&agrave;i ra, khi mua h&agrave;ng online tại bachhoaxanh.com, bạn sẽ được giao h&agrave;ng tận nơi c&ugrave;ng những khuyến m&atilde;i si&ecirc;u hấp dẫn.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (159, 'Nước nấu lẩu Thái chay SG Food 150g', 19800, 23000, 'store/images/gia-vi/nuoc-dung-co-dac-lau-thai-chay-sg-food-goi-150g-202205161703109011_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Dạng <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-nau-lau-canh" target="_blank">sốt gia vị n&ecirc;m sẵn nấu lẩu</a>&nbsp;của thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-sg-food" target="_blank">gia vị n&ecirc;m sẵn SG Food</a> được xem l&agrave; trợ thủ đắc lực cho mọi nh&agrave; trong những ng&agrave;y bận rộn.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/nuoc-dung-lau-co-dac-vi-thai-chay-sgf-150g" target="_blank">Nước d&ugrave;ng c&ocirc; đặc lẩu Th&aacute;i chay SG Food g&oacute;i 150g</a> gi&uacute;p tiết kiệm thời gian trong kh&acirc;u sơ chế, chế biến mang đến bữa ăn ngon v&agrave; đầy đủ chất dinh dưỡng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Nước d&ugrave;ng c&ocirc; đặc lẩu Th&aacute;i chay</div>
	</li>
	<li>Khối lượng
	<div>150g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, me, dầu đậu n&agrave;nh, ớt, sả, h&agrave;nh, riềng, ớt, chất điều chỉnh độ acid (E330), chất ổn định (E1414, E466), l&aacute; chanh, chất điều vị (E950), chất bảo quản (E202)</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>1 g&oacute;i 150g d&ugrave;ng cho 6 người ăn</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Trước khi mở g&oacute;i, bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Sau khi mở g&oacute;i, để ngăn m&aacute;t tủ lạnh sau khi mở bao b&igrave; được 7 ng&agrave;y, để ngăn đ&aacute; được 3 th&aacute;ng</div>
	</li>
	<li>Thương hiệu
	<div>SG Food (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (160, 'Sốt lẩu Thái Cholimex 280g', 18300, 19900, 'store/images/gia-vi/sot-lau-thai-cholimex-chai-280g-202211101048380177_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&oacute; th&agrave;nh phần gồm dầu ăn, tỏi, sả, gừng, riềng, l&aacute; chanh, me, ớt, đường, muối&hellip; Sản phẩm mang tới sự thơm ngon của những nguy&ecirc;n liệu tự nhi&ecirc;n, hương vị đậm đ&agrave;, k&iacute;ch th&iacute;ch vị gi&aacute;c, ph&ugrave; hợp khẩu vị của người Việt Nam.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sốt lẩu Th&aacute;i</div>
	</li>
	<li>Khối lượng
	<div>280g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Dầu ăn, tỏi, sả, gừng, riềng, l&aacute; chanh, me, ớt, đường, muối ăn, nước, chất ổn định (1422), chất điều vị (621), chất điều chỉnh độ acid (330), (270), chất bảo quản (211)</div>
	</li>
	<li>Lượng d&ugrave;ng
	<div>1 chai 280g nấu được 1.5 l&iacute;t nước d&ugrave;ng</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho sốt v&agrave;o 1,5 l&iacute;t nước đun s&ocirc;i. Th&ecirc;m hải sản, rau tuỳ th&iacute;ch v&agrave;o.</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Cholimex (Việt Nam)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">Ở bất kỳ nơi đ&acirc;u tr&ecirc;n c&aacute;c con phố, mọi người đều dễ d&agrave;ng bắt gặp những nồi lẩu nghi ng&uacute;t kh&oacute;i với nước d&ugrave;ng chua cay đậm vị. Tuy nhi&ecirc;n, lẩu th&aacute;i kh&ocirc;ng phải l&agrave; m&oacute;n ăn dễ nấu, v&igrave; thế nhiều thương hiệu chuy&ecirc;n cung cấp gia vị ho&agrave;n chỉnh như <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-cholimex" target="_blank">gia vị n&ecirc;m sẵn Cholimex</a> đ&atilde; mang đến cho người ti&ecirc;u d&ugrave;ng <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/lau-thai-cholimex-ccholimexhai-280g" target="_blank">Sốt lẩu Th&aacute;i Cholimex chai 280g</a>&nbsp;với hương vị chuẩn lẩu Th&aacute;i, rất tiện lợi, tiết kiệm thời gian chế biến, lại dễ d&agrave;ng sử dụng.<br />
<img alt="Sốt lẩu Thái Cholimex chai 280g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8271/96243/bhx/files/96243.jpg" style="height:500px; width:800px" />
<h2><strong>Vị lẩu Th&aacute;i đ&uacute;ng chuẩn</strong></h2>

<p>Sản phẩm gi&uacute;p bạn nấu một nồi lẩu Th&aacute;i chua cay đ&uacute;ng chuẩn với c&aacute;c <strong>nguy&ecirc;n liệu tự nhi&ecirc;n</strong>&nbsp;như dầu ăn, tỏi, sả, gừng, riềng, l&aacute; chanh, me, ớt, đường, muối ăn,... an to&agrave;n v&agrave; đảm bảo vệ sinh thực phẩm. Với loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-nau-lau-canh" target="_blank">sốt nấu lẩu n&ecirc;m sẵn</a> n&agrave;y,&nbsp;bạn kh&ocirc;ng cần tốn qu&aacute; nhiều&nbsp;thời gian cho việc lựa chọn v&agrave; chuẩn bị từng loại nguy&ecirc;n liệu.</p>

<h2><strong>Hướng dẫn sử dụng</strong></h2>

<p>- Cho <strong>1.5l l&iacute;t nước</strong> v&agrave;o đun s&ocirc;i, sau đ&oacute; cho nước lẩu trong chai v&agrave;o nấu c&ugrave;ng.</p>

<p>- Th&ecirc;m c&aacute;c nguy&ecirc;n liệu kh&aacute;c như t&ocirc;m, thịt, mực, c&aacute;, rau&hellip; v&agrave;o nấu theo &yacute; th&iacute;ch.<br />
<img alt="Sốt lẩu Thái Cholimex chai 280g 1" class="lazy" src="https://www.knorr.com/content/dam/unilever/global/recipe_image/158/15802/158022-default.jpg/_jcr_content/renditions/cq5dam.web.800.600.jpeg" style="height:550px; width:800px" /><br />
<br />
Đ&acirc;y l&agrave; cũng l&agrave; một<strong> &quot;b&iacute; k&iacute;p&quot; </strong>để nấu những <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/da-tim-ra-bi-quyet-lam-noi-lau-thai-sieu-re-cua-cac-quan-an-1215673" target="_blank">nồi lẩu si&ecirc;u ngon, gi&aacute; phải chăng</a> tại c&aacute;c qu&aacute;n lẩu lề đường đấy nh&eacute;.</p>
</div>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (161, 'Sốt cà chua ớt Agnesi 400g', 92000, 0, 'store/images/gia-vi/sot-ca-chua-ot-agnesi-arrabbiata-hu-400g-202205170610093438_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&aacute;c dạng <a href="https://www.bachhoaxanh.com/gia-vi-nem-san-agnesi-sot-ca-mi-y">nước sốt c&agrave; chua Agnesi</a> gi&uacute;p bạn tạo n&ecirc;n m&oacute;n ăn thơm ngon, tr&ograve;n vị. Kh&ocirc;ng chỉ l&agrave; một loại <a href="https://www.bachhoaxanh.com/gia-vi-nem-san">gia vị n&ecirc;m sẵn</a> th&ocirc;ng thường, m&agrave; <a href="https://www.bachhoaxanh.com/gia-vi-nem-san/sot-ca-chua-ot-agnesi-arrabbiata-hu-400g">sốt c&agrave; chua ớt Arrabbiata Agnesi hũ 400g</a> c&ograve;n mang lại nhiều chất dinh dưỡng cần thiết cho cơ thể bạn. Gi&uacute;p tăng cường hệ miễn dịch, đảm bảo sức khoẻ gia đ&igrave;nh bạn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sốt c&agrave; chua ớt</div>
	</li>
	<li>Khối lượng
	<div>400g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>100% c&agrave; chua &Yacute;, h&agrave;nh, tỏi, ớt đỏ, dầu olive...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>C&Aacute;CH 1 - L&agrave;m n&oacute;ng chảo ở lửa vừa, cho sốt v&agrave;o nấu khoảng 2 ph&uacute;t v&agrave; cho m&igrave; v&agrave;o trộn c&ugrave;ng. C&Aacute;CH 2 - H&acirc;m n&oacute;ng sốt ở nhiệt độ trung b&igrave;nh trong l&ograve; vi s&oacute;ng v&agrave; cho m&igrave; v&agrave;o trộn</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản lạnh. D&ugrave;ng hết trong v&ograve;ng 5 ng&agrave;y sau khi mở nắp</div>
	</li>
	<li>Thương hiệu
	<div>Agnesi (&Yacute;)</div>
	</li>
	<li>Nơi sản xuất
	<div>&Yacute;</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (162, 'Sốt Arrabbiata Pietro Coricelli 350g', 89000, 0, 'store/images/gia-vi/sot-arrabbiata-pietro-coricelli-hu-350g-202207271439591213_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-pietro-coricelli-pigeon-sot-ca-mi-y" target="_blank">Sốt m&igrave; &Yacute; Pietro Coricelli</a>&nbsp;l&agrave; loại&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san">gia vị n&ecirc;m sẵn</a>&nbsp;được nhập khẩu từ &Yacute;.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/sot-arrabbiata-pietro-coricelli-hu-350g" target="_blank">Sốt Arrabbiata Pietro Coricelli hũ 350g</a> gi&uacute;p bữa ăn đậm đ&agrave; hơn th&uacute; vị với vị chua từ c&agrave; v&agrave; vị cay của ớt cho c&aacute;c m&oacute;n mỳ &yacute;, nui th&ecirc;m thơm ngon, hấp dẫn hơn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sốt Arrabbiata</div>
	</li>
	<li>Khối lượng
	<div>350g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột c&agrave; chua, bột nh&atilde;o c&agrave; chua, dầu olive, muối, đường, tỏi, ng&ograve; t&acirc;y, ớt</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng để chế biến c&aacute;c m&oacute;n mỳ spaghetti, nui, pizza, c&aacute;c m&oacute;n x&agrave;o nấu hợp khẩu vị</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Pietro Coricelli (&Yacute;)</div>
	</li>
	<li>Nơi sản xuất
	<div>&Yacute;</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (163, 'Xốt cà chua Remia 544g', 76000, 0, 'store/images/gia-vi/xot-ca-chua-remia-chai-544g-202211141548059940_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-sot-ca-mi-y" target="_blank">Xốt gia vị c&agrave; chua</a>&nbsp;của thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san-remia" target="_blank">gia vị n&ecirc;m sẵn Remia</a>&nbsp;gi&uacute;p cho bữa ăn của bạn đậm đ&agrave; hơn với vị chua k&iacute;ch th&iacute;ch vị gi&aacute;c. Kết hợp giữa c&agrave; chua ch&iacute;n tự nhi&ecirc;n, tỏi v&agrave; một số gia vị kh&aacute;c,&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/xot-ca-chua-remia-chai-500ml" target="_blank">xốt c&agrave; chua Remia chai 544g</a>&nbsp;l&agrave; loại xốt chấm kh&ocirc;ng thể thiếu cho c&aacute;c m&oacute;n m&igrave; &Yacute; v&agrave; m&oacute;n chi&ecirc;n, nướng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Xốt c&agrave; chua</div>
	</li>
	<li>Khối lượng
	<div>544g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>C&agrave; chua ch&iacute;n đỏ, giấm, muối, gia vị, h&agrave;nh t&acirc;y,&hellip;</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng để chế biến c&aacute;c m&oacute;n x&agrave;o nấu, chấm c&aacute;c m&oacute;n thịt b&ograve;, heo, g&agrave;&hellip; nướng, quay, chi&ecirc;n, hấp, luộc</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Remia (H&agrave; Lan)</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (164, 'Sốt mì Ý Castello Arrabbiata 350g', 72000, 0, 'store/images/gia-vi/sot-mi-y-castello-arrabbiata-hu-350g-202209201116364685_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/gia-vi-nem-san-castello-sot-ca-mi-y" target="_blank">Sốt m&igrave; &Yacute; Castello</a> l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/gia-vi-nem-san" target="_blank">gia vị n&ecirc;m sẵn</a> nhập khẩu từ &Yacute; với nguồn nguy&ecirc;n liệu an to&agrave;n v&agrave; c&ocirc;ng nghệ sản xuất hiện đại.&nbsp;<a href="https://www.bachhoaxanh.com/gia-vi-nem-san/sot-mi-y-arrabbiata-castello-hu-350g" target="_blank">Sốt m&igrave; &Yacute; Castello Arrabbiata hũ 350g</a>&nbsp;với th&agrave;nh phần ch&iacute;nh l&agrave; c&agrave; chua gi&agrave;u vitamin, c&ugrave;ng&nbsp;vị c&aacute;c loại rau m&ugrave;i (kinh giới,...) gi&uacute;p m&oacute;n m&igrave; &Yacute; của bạn th&ecirc;m đậm đ&agrave;, hấp dẫn.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sốt m&igrave; &Yacute; Castello Arrabbiata</div>
	</li>
	<li>Khối lượng
	<div>350g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>C&agrave; chua, dầu &ocirc; liu, h&agrave;nh, muối, tỏi, đường, ớt, hạt ti&ecirc;u, hương liệu tự nhi&ecirc;n</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Chế biến m&oacute;n m&igrave; &Yacute; hoặc x&agrave;o nấu tuỳ th&iacute;ch</div>
	</li>
	<li>Bảo quản
	<div>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Bảo quản trong ngăn m&aacute;t tủ lạnh nếu kh&ocirc;ng d&ugrave;ng hết</div>
	</li>
	<li>Thương hiệu
	<div>Castello (&Yacute;)</div>
	</li>
	<li>Nơi sản xuất
	<div>&Yacute;</div>
	</li>
</ul>
</div>', 'nguyen-lieu', 0, 0, 0, '2023-05-03 16:30:01', 8);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (165, 'Bột lúa mạch Milo Active Go 330g', 55500, 0, 'store/images/ngu-coc-dinh-duong/bot-thuc-uong-lua-mach-3in1-milo-active-go-bich-330g-202205211020550243_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-ca-cao-dang-bot">Thức uống cacao l&uacute;a mạch</a>&nbsp;của thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-milo">ngũ cốc Milo</a>&nbsp;từ mầm l&uacute;a mạch nguy&ecirc;n c&aacute;m c&oacute; t&aacute;c dụng cung cấp nguồn năng lượng hoạt động l&acirc;u d&agrave;i hơn cho việc học tập, chơi thể thao v&agrave; c&aacute;c hoạt động thể chất.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/bot-thuc-uong-lua-mach-3in1-milo-active-go-bich-330g">Bột thức uống l&uacute;a mạch 3in1 Milo Active Go bịch 330g</a>&nbsp;dạng bột mịn dễ h&ograve;a tan, bịch 15 g&oacute;i tiết kiệm.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Bột thức uống l&uacute;a mạch</div>
	</li>
	<li>Khối lượng
	<div>3 d&atilde;y x 5 g&oacute;i x 22g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>D&ugrave;ng cho trẻ từ 6 tuổi trở l&ecirc;n v&agrave; người lớn</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, Protomalt 29% (chiết xuất từ mầm l&uacute;a mạch), sữa bột t&aacute;ch kem, dầu thực vật, cacao, kho&aacute;ng chất, bột whey, vitamin (C, B3, B6, B2, D, B12)</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Uống n&oacute;ng</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Kh&ocirc;ng sử dụng cho người c&oacute; khả năng mẫn cảm hoặc dị ứng với c&aacute;c th&agrave;nh phần trong sản phẩm. Kh&ocirc;ng d&ugrave;ng sản phẩm c&oacute; m&agrave;u sắc, m&ugrave;i vị bất thường, sản phẩm hết hạn sử dụng.</div>
	</li>
	<li>Thương hiệu
	<div>Milo ()</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu</h3>

<p>Milo, thương hiệu chuy&ecirc;n về c&aacute;c sản phẩm thức uống dinh dưỡng rất được ưa chuộng. Được th&agrave;nh lập v&agrave;o năm 1934, thuộc sở hữu của tập đo&agrave;n Nestl&eacute;, nổi bật trong c&aacute;c d&ograve;ng sản phẩm của Milo l&agrave; sản phẩm thức uống dinh dưỡng với hương vị cacao, l&uacute;a mạch đặc trưng, bổ sung chất dinh dưỡng cho cơ thể. C&aacute;c sản phẩm của Milo hiện rất được sử dụng rất phổ biến ở nhiều quốc gia tr&ecirc;n thế giới, trong đ&oacute; c&oacute; Việt Nam.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong sản phẩm</h3>

<p>Sản phẩm bột thức uống l&uacute;a mạch 3in1 Milo Active Go bịch 330g c&oacute; chứa những th&agrave;nh phần dinh dưỡng tốt cho sức khỏe như: Năng lượng, carbohydrate, đường, chất b&eacute;o, chất đạm, natri, canxi, phốt pho, sắt, v&agrave; c&aacute;c Vitamin C, D, B2, B6, B12, B3. Trung b&igrave;nh trong 100g bột l&uacute;a mạch milo c&oacute; chứa khoảng 418 kcal.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Với c&ocirc;ng thức Activ Go, kết hợp giữa 6 loại vitamin v&agrave; kho&aacute;ng chất thiết yếu cho cơ thể, gi&uacute;p giải ph&oacute;ng năng lượng hiệu quả, tăng cường khả năng miễn dịch của trẻ em.</p>
	</li>
	<li>
	<p>Cung cấp năng lượng từ mầm l&uacute;a mạch, đạm v&agrave; canxi từ sữa c&ugrave;ng với đ&oacute; l&agrave; 6 loại vitamin v&agrave; kho&aacute;ng chất thiết yếu cho sự ph&aacute;t triển to&agrave;n diện của cơ thể.<br />
	<img alt="Bột thức uống lúa mạch 3in1 Milo Active Go bịch 330g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8286/239164/bhx/bot-thuc-uong-lua-mach-3in1-milo-active-go-bich-330g-202205211020550243.jpg" /></p>
	</li>
</ul>

<h3>Hướng dẫn sử dụng sản phẩm</h3>

<p>Bạn c&oacute; thể sử dụng bột thức uống l&uacute;a mạch 3in1 Milo theo hai c&aacute;ch:</p>

<p>Uống n&oacute;ng: H&ograve;a tan 1 g&oacute;i Milo 22g với 110ml nước n&oacute;ng (60 - 65 độ C), khuấy đều v&agrave; thưởng thức.</p>

<p>Uống lạnh: Pha 1 g&oacute;i Milo 22g với 50ml nước n&oacute;ng, bỏ th&ecirc;m đ&aacute; để thưởng thức.</p>

<h3>C&aacute;c m&oacute;n ngon từ sản phẩm</h3>

<p>Sản phẩm bột l&uacute;a mạch 3in1 Milo kh&ocirc;ng những d&ugrave;ng để pha chế thức uống, m&agrave; c&ograve;n chế biến được th&agrave;nh rất nhiều m&oacute;n ngon khiến nhiều người m&ecirc; mẩn như: B&aacute;nh milo lava, rau c&acirc;u sữa milo, b&aacute;nh trung thu rau c&acirc;u milo,...</p>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh &aacute;nh nắng mặt trời.</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng sản phẩm hết hạn sử dụng.</p>
	</li>
	<li>
	<p>N&ecirc;n uống ngay sau khi pha chế.</p>
	</li>
</ul>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>C&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của Milo c&oacute; thể dễ d&agrave;ng t&igrave;m mua tại c&aacute;c cửa h&agrave;ng B&aacute;ch h&oacute;a XANH tr&ecirc;n to&agrave;n quốc. B&aacute;ch h&oacute;a XANH chỉ kinh doanh h&agrave;ng h&oacute;a c&oacute; nguồn gốc r&otilde; r&agrave;ng, n&ecirc;n bạn c&oacute; thể an t&acirc;m mua h&agrave;ng tại đ&acirc;y.<br />
Ngo&agrave;i ra, bạn c&oacute; thể đặt h&agrave;ng tại www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n điện thoại để được giao h&agrave;ng nhanh ch&oacute;ng tận nh&agrave; c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (166, 'Ngũ cốc gạo lức huyết rồng Việt Đài 450g', 45000, 63400, 'store/images/ngu-coc-dinh-duong/gao-luc-huyet-rong-viet-dai-bich-450g-202205211002305382_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-viet-dai">Bột ngũ cốc Việt Đ&agrave;i</a> l&agrave; sản phẩm bổ sung dinh dưỡng cho cả người gi&agrave; v&agrave; trẻ nhỏ hơn 3 tuổi. Bột <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">ngũ cốc</a> sở hữu bảng th&agrave;nh phần phong ph&uacute;, đảm bảo cung cấp nguồn dinh dưỡng tối đa.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/ngu-coc-gao-luc-canxi-viet-dai-bich-450g">Gạo lức huyết rồng Việt Đ&agrave;i bịch 450g</a> bổ sung sắt v&agrave; chất xơ cho cơ thể khoẻ mạnh</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Gạo lức huyết rồng</div>
	</li>
	<li>Khối lượng
	<div>30g x 15 gói</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Gạo lức huyết rồng (18%), yến mạch (8%), malt (5%), đường (31,9%), bột kem thực vật (24%), canxi ((DCP, TCP) (0,5%)), soya lecithin, bột cốt dừa, gạo nếp cẩm nguy&ecirc;n c&aacute;m, bột mỳ, hương tổng hợp c&aacute;c loại, gia vị vừa đủ.</div>
	</li>
	<li>Thương hiệu
	<div>Việt Đ&agrave;i</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify">Việt Đ&agrave;i l&agrave; thương hiệu C&ocirc;ng ty TNHH Thanh An v&agrave; được th&agrave;nh lập v&agrave;o năm 1998. Trải qua hơn 2 thập kỷ kh&ocirc;ng ngừng nghi&ecirc;n cứu v&agrave; ph&aacute;t triển, thương hiệu Việt Đ&agrave;i hiện nay đ&atilde; v&agrave; đang tạo được vị thế lớn mạnh tr&ecirc;n thị trường ti&ecirc;u d&ugrave;ng tại Việt Nam qua c&aacute;c sản phẩm&nbsp;gi&agrave;u dinh dưỡng, thơm ngon, dễ uống v&agrave; ph&ugrave; hợp&nbsp;nhu cầu dinh dưỡng hằng ng&agrave;y&nbsp;với mọi lứa tuổi của người ti&ecirc;u&nbsp;d&ugrave;ng.</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm</strong></h3>

<p style="text-align:justify">Th&agrave;nh phần ch&iacute;nh của bột gạo lức huyết rồng&nbsp;bao gồm:&nbsp;Gạo lức huyết rồng (12,5%), yến mạch nguy&ecirc;n c&aacute;m 8%, gạo nếp cẩm nguy&ecirc;n c&aacute;m, bột mỳ nguy&ecirc;n c&aacute;m 3%, malt, bột cốt dừa, đường k&iacute;nh, bột kem thực vật, chất xơ h&ograve;a tan, muối, kho&aacute;ng chất,... Ngo&agrave;i ra, sản phẩm cung cấp cho cơ thể khoảng <strong>từ 325- 542 kcal</strong> tr&ecirc;n <strong>100g ngũ cốc</strong>.</p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p style="text-align:justify">Bột gạo lức huyết rồng&nbsp;Việt Đ&agrave;i l&agrave; sản phẩm rất l&yacute; tưởng d&agrave;nh cho phần đ&ocirc;ng người ti&ecirc;u d&ugrave;ng. Sản phẩm c&ograve;n bổ sung th&ecirc;m canxi cho xương chắc khỏe v&agrave; ph&ograve;ng ngừa lo&atilde;ng xương. Ngũ cốc c&ograve;n bổ sung&nbsp;vitamin D3, chất sắt v&agrave; chất xơ, gi&uacute;p thanh lọc cơ thể, cho người d&ugrave;ng c&oacute; được một bữa ăn đủ đầy dinh dưỡng v&agrave; tốt cho ti&ecirc;u h&oacute;a.<br />
<img alt="Ngũ cốc gạo lứt huyết rồng Việt Đài bịch 450g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/213542/bhx/files/nrc.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<p style="text-align:justify">Bột gạo lức huyết rồng&nbsp;Việt Đ&agrave;i rất dễ sử dụng. Bạn chỉ cần h&ograve;a 1 g&oacute;i với khoảng 120ml &ndash; 150ml nước n&oacute;ng tr&ecirc;n 90&deg;C. Sau đ&oacute;, h&atilde;y khuấy đều trước khi d&ugrave;ng v&agrave; thưởng thức. Ngo&agrave;i ra,&nbsp;nh&agrave; sản xuất khuy&ecirc;n d&ugrave;ng n&ecirc;n lượng d&ugrave;ng từ&nbsp;&nbsp;2 - 3 g&oacute;i mỗi ng&agrave;y để bổ sung đủ đầy dưỡng chất.</p>

<h3 style="text-align:justify"><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p style="text-align:justify">Lưu &yacute;, sản phẩm&nbsp;kh&ocirc;ng ph&ugrave; hợp&nbsp;sử dụng cho trẻ dưới 3 tuổi v&agrave; người bị dị ứng với c&aacute;c th&agrave;nh phần c&oacute; trong ngũ cốc. Ngo&agrave;i ra, sản phẩm kh&ocirc;ng chứa chất bảo quản, phẩm m&agrave;u v&agrave; kh&ocirc;ng bổ sung đường k&iacute;nh. Do kh&ocirc;ng sử dụng chất bảo quản, người d&ugrave;ng cần bảo quản ngũ cốc ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, sạch sẽ, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời.<br />
<img alt="Ngũ cốc gạo lứt huyết rồng Việt Đài bịch 450g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/213542/bhx/files/gao-luc-huyet-rong-viet-dai-bich-450g-202104060957443826.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch h&oacute;a XANH</strong></h3>

<p style="text-align:justify">Bột gạo lức huyết rồng&nbsp;Việt Đ&agrave;i đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH, đảm bảo 100% nguồn gốc xuất xứ từ nh&agrave; sản xuất, an to&agrave;n với người d&ugrave;ng, c&ugrave;ng với gi&aacute; th&agrave;nh&nbsp;cực tốt. Người d&ugrave;ng c&oacute; thể mua h&agrave;ng online tại website hoặc app B&aacute;ch h&oacute;a XANH để nhận được nhiều ưu đ&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nơi, tiện lợi.<br />
<strong>Xem th&ecirc;m</strong>:&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bot-ngu-coc-an-kieng-viet-dai-bao-nhieu-calo-cach-pha-su-dung-ngu-coc-viet-dai-1389582">Bột ngũ cốc ăn ki&ecirc;ng Việt Đ&agrave;i bao nhi&ecirc;u calo? C&aacute;ch pha sử dụng ngũ cốc Việt Đ&agrave;</a></p>
</div>
</div>', 'thuc-an-nhanh', 0, 45, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (167, 'Ngũ cốc VinaCafé B''fast 500g', 67500, 0, 'store/images/ngu-coc-dinh-duong/ngu-coc-dinh-duong-vinacafe-bfast-bich-500g-202205210942462207_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-vinacafe">Ngũ cốc VinaCaf&eacute; B&#39;fast</a>&nbsp;l&agrave; nguồn bổ sung canxi cho gia đ&igrave;nh mỗi ng&agrave;y. Ngo&agrave;i ra, <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">ngũ cốc</a> c&ograve;n gi&uacute;p cung cấp th&ecirc;m chất đạm, chất xơ, phốt ph&aacute;t, carbohydrate,.. c&oacute; thể d&ugrave;ng thay thế bữa ăn nhẹ cho cả nh&agrave;.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/ngu-coc-vinacafe-bich-25g-20goi">Ngũ cốc dinh dưỡng VinaCaf&eacute; B&#39;fast Kachi bịch 500g</a>&nbsp;c&oacute; 20 g&oacute;i nhỏ tiện d&ugrave;ng, dễ pha</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Ngũ cốc dinh dưỡng</div>
	</li>
	<li>Khối lượng
	<div>25g x 20 g&oacute;i</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Cho trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, vảy ngũ cốc 33% (bột m&igrave;, glucose syrup, bột đậu n&agrave;nh, chiết xuất mầm l&uacute;a mạch, đường, tinh bột bắp, dextrose, bột nếp, bột gạo, fructo syrup, tinh bột biến t&iacute;nh (1414), muối, hương vani tổng hợp), bột kem thực vật (glucose syrup, dầu thực vật, chiết xuất mầm l&uacute;a mạch, protein sữa, chất ổn định (340ii, 452i), chất nhũ h&oacute;a, chất chống đ&ocirc;ng)</div>
	</li>
	<li>Năng lượng
	<div>449kcal/100g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Đổ ngũ cốc v&agrave;o ly, r&oacute;t 140ml nước n&oacute;ng khuấy đều v&agrave; thưởng thức.</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Sản phẩm chứa c&aacute;c nguy&ecirc;n liệu c&oacute; nguồn gốc từ l&uacute;a m&igrave;, đậu n&agrave;nh, sữa</div>
	</li>
	<li>Thương hiệu
	<div>VinaCaf&eacute; (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>VinaCaf&eacute; l&agrave; thương hiệu nỗi tiếng thuộc sở hữa của&nbsp;C&ocirc;ng ty Cổ phần Vinacaf&eacute; Bi&ecirc;n H&ograve;a được th&agrave;nh lập v&agrave;o năm 1969.&nbsp;Tuy nhi&ecirc;n, m&atilde;i đến năm&nbsp;1983, nh&atilde;n hiệu &quot;Vinacaf&eacute;&quot; mới được xuất hiện với &yacute; nghĩa c&agrave; ph&ecirc; do Việt Nam sản xuất. Hiện nay thương hiệu được biết đến với c&aacute;c sản phẩm h&ograve;a tan nổi tiếng h&agrave;ng đầu Việt Nam. Một trong những sản phẩm tạo n&ecirc;n t&ecirc;n tuổi của thương hiệu n&agrave;y kh&ocirc;ng thể kh&ocirc;ng nhắc đến đ&oacute; l&agrave; bột ngũ cốc</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng c&oacute; trong sản phẩm&nbsp;</strong></h3>
<img alt="Ngũ cốc dinh dưỡng VinaCafé B''fast bịch 500g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/79376/bhx/files/ngu-coc-dinh-duong-vinacafe-bfast-bich-500g-202210040826376409.png" style="height:768px; width:740px" />
<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Ngũ cốc B&#39;fast bổ sung canxi 500g c&oacute; th&agrave;nh phần ch&iacute;nh được l&agrave;m từ thi&ecirc;n nhi&ecirc;n như:&nbsp;B&ocirc;̣t mì, glucose syrup, b&ocirc;̣t đ&acirc;̣u nành, chi&ecirc;́t xu&acirc;́t m&acirc;̀m lúa mạch,&nbsp;đường....&nbsp;đảm bảo cho bạn c&oacute; một bữa s&aacute;ng tiện lợi v&agrave; dinh dưỡng để khởi đầu ng&agrave;y mới.</p>
	</li>
	<li>
	<p>Trong 100g ngũ cốc c&oacute; chứa khoảng&nbsp;449kcal</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng đối với sức khỏe</strong></h3>
<img alt="Ngũ cốc dinh dưỡng VinaCafé B''fast bịch 500g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/79376/bhx/files/ngu-coc-dinh-duong-vinacafe-bfast-bich-500g-202004241129560378.jpg" style="height:768px; width:1024px" />
<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Nguồn cung cấp canxi vượt trội cho cơ thể</p>
	</li>
	<li>
	<p>Cung cấp c&aacute;c chất dinh dưỡng từ đạm, chất xơ, phốt ph&aacute;t,..</p>
	</li>
	<li>
	<p>Cung cấp năng lượng ngay thức th&igrave; cho cơ thể</p>
	</li>
	<li>
	<p>Kiểm so&aacute;t c&acirc;n nặng hiệu quả.</p>
	</li>
</ul>

<h3><strong>Hướng dẫn sử dụng</strong></h3>

<p>H&ograve;a bột với khoảng 140ml nước n&oacute;ng, khuấy đều c&oacute; thể tăng giảm lượng nước n&agrave;y tùy theo sở th&iacute;ch uống đậm nhạt, c&oacute; thể d&ugrave;ng chung với đ&aacute;.</p>

<h3><strong>C&aacute;c m&oacute;n ngon được l&agrave;m từ bột ngũ cốc&nbsp;</strong></h3>

<p>Bạn c&oacute; thể sử dụng bột ngũ cốc cho c&aacute;c m&oacute;n: Xa&nbsp;l&aacute;ch trộn, c&aacute;c loại b&aacute;nh</p>

<h3><strong>Bảo quản v&agrave; lưu&nbsp; &yacute; khi sử dụng sản phẩm&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản sản phảm ở những nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t tr&aacute;nh tiếp x&uacute;c trực tiếp với &aacute;nh nắng hoặc ở những nơi c&oacute; nhiệt độ cao</p>
	</li>
	<li>
	<p>Sử dụng hết khi đ&atilde; th&aacute;o bao b&igrave; sản phẩm</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng bột khi đ&atilde; hết hạn</p>
	</li>
	<li>
	<p>Kh&ocirc;ng n&ecirc;n uống qu&aacute; nhiều c&ugrave;ng một l&uacute;c</p>
	</li>
</ul>

<h3><strong>Ưu điểm khi mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH&nbsp;</strong></h3>
Khi mua bột ngũ cốc tại B&aacute;ch h&oacute;a XANH bạn sẽ nhận được sản phẩm chất lượng, nguồn gốc xuất xứ r&otilde; r&agrave;ng. Ngo&agrave;i ra, bạn c&oacute; thể truy cập v&agrave;o bachhoaxanh.com chọn mua để được giao h&agrave;ng tận nơi với độ ngũ nh&acirc;n vi&ecirc;n nhiệt t&igrave;nh, chu đ&aacute;o.</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (168, 'Ngũ cốc dinh dưỡng Yumfood 500g', 62000, 0, 'store/images/ngu-coc-dinh-duong/ngu-coc-dinh-duong-yumfood-goi-500g-202205211012204774_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-yumfood-ngu-coc-dinh-duong">Ngũ cốc dinh dưỡng Yumfood</a> với c&ocirc;ng thức đặc biệt &iacute;t calo, &iacute;t chất b&eacute;o, nhiều chất xơ. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/ngu-coc-dinh-duong-yumfood-goi-500g">Ngũ cốc dinh dưỡng Yumfood g&oacute;i 500g</a> tiện lợi, mang đến nguồn dinh dưỡng qu&yacute; gi&aacute; từ <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">ngũ cốc</a>,&nbsp;gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng một c&aacute;ch hiệu quả mang lại cho bạn cơ thể khỏe mạnh v&agrave; v&oacute;c d&aacute;ng thon thả.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Ngũ cốc dinh dưỡng</div>
	</li>
	<li>Khối lượng
	<div>25g x 20 g&oacute;i</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>D&ugrave;ng cho trẻ từ 3 tuổi trở l&ecirc;n v&agrave; người lớn</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột kem kh&ocirc;ng sữa, đạm sữa, đường, bột gạo, bột đậu n&agrave;nh , tinh bột bắp, canxi, gạo lứt (10%), muối, vảy ngũ cốc,...</div>
	</li>
	<li>Năng lượng
	<div>380,8 - 515,2 kcal</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>H&ograve;a 1 g&oacute;i ngũ cốc dinh dưỡng (25g) v&agrave;o 120ml nước s&ocirc;i (100 độ C), khuấy đều v&agrave; đợi khoảng 3 ph&uacute;t. Thưởng thức c&oacute; thể tăng giảm lượng nước s&ocirc;i t&ugrave;y theo khẩu vị.</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Kh&ocirc;ng sử dụng cho người c&oacute; khả năng mẫn cảm hoặc dị ứng với c&aacute;c th&agrave;nh phần trong sản phẩm. Kh&ocirc;ng d&ugrave;ng sản phẩm c&oacute; m&agrave;u sắc, m&ugrave;i vị bất thường, sản phẩm hết hạn sử dụng.</div>
	</li>
	<li>Thương hiệu
	<div>Yumfood ()</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">Yumfood l&agrave; một trong những thương hiệu ngũ cốc, yến mạch được nhiều người tin d&ugrave;ng. C&aacute;c sản phẩm yến mạch, ngũ cốc Yumfood đều được <strong>nhập khẩu trực tiếp từ &Uacute;c</strong> với <strong>gi&aacute; cả phải chăng</strong> v&agrave; <strong>chất lượng tuyệt vời</strong>.<br />
<img alt="Ngũ cốc dinh dưỡng Yumfood gói 500g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/229463/bhx/files/thuc-pham-bo-sung-ngu-coc-dinh-duong-yumfood-goi-500g-202010122202206323.jpg" style="height:450px; width:800px" /><br />
Một trong những sản phẩm được người ti&ecirc;u d&ugrave;ng y&ecirc;u th&iacute;ch từ thương hiệu n&agrave;y, đ&oacute; l&agrave; Thực phẩm bổ sung ngũ cốc dinh dưỡng Yumfood. Với những <strong>th&agrave;nh phần l&agrave;nh t&iacute;nh, an to&agrave;n cho sức khỏe</strong>, sản phẩm kh&ocirc;ng chỉ gi&uacute;p mang đến cho người d&ugrave;ng nguồn năng lượng hoạt động dồi d&agrave;o m&agrave; c&ograve;n c&oacute; cả <strong>hương vị thơm ngon, b&eacute;o ngậy</strong>, kh&ocirc;ng thua k&eacute;m g&igrave; sản phẩm của c&aacute;c thương hiệu lớn n&agrave;o.&nbsp;<br />
<img alt="Ngũ cốc dinh dưỡng Yumfood gói 500g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/229463/bhx/files/thuc-pham-bo-sung-ngu-coc-dinh-duong-yumfood-goi-500g-202010122202245743.jpg" style="height:450px; width:800px" />
<h2>Hướng dẫn sử dụng</h2>
- H&ograve;a 1 g&oacute;i ngũ cốc dinh dưỡng (25g) v&agrave;o 120ml nước s&ocirc;i (100 độ C), khuấy đều v&agrave; đợi khoảng 3 ph&uacute;t.<br />
- Thưởng thức c&oacute; thể tăng giảm lượng nước s&ocirc;i t&ugrave;y theo khẩu vị.
<h2>Lợi &iacute;ch của việc uống ngũ cốc mỗi ng&agrave;y</h2>
Ngũ cốc l&agrave; một trong những nguồn năng lượng thiết yếu, v&igrave; thế việc uống ngũ cốc mỗi buổi sang sẽ mang lại<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/an-sang-bang-ngu-coc-co-tot-khong-1042778"> những c&ocirc;ng dụng tuyệt vời cho sức khỏe</a><br />
- Cung cấp năng lượng cho cơ thể<br />
- Bổ sung kho&aacute;ng chất<br />
- Hỗ trợ c&acirc;n bằng đường huyết<br />
- Trị t&aacute;o b&oacute;n<br />
- Ph&ograve;ng ngừa ung thư</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (169, 'Ngũ cốc Nestle Nesvita 400g', 58000, 0, 'store/images/ngu-coc-dinh-duong/ngu-coc-dinh-duong-nesvita-bich-400g-202205210956595711_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-nesvita">Ngũ cốc dinh dưỡng&nbsp;Nesvita</a> với c&ocirc;ng thức đặc biệt &iacute;t calo, &iacute;t chất b&eacute;o, nhiều chất xơ, gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng một c&aacute;ch hiệu quả. Từ đ&oacute;, <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">ngũ cốc</a> gi&uacute;p mang lại cho bạn một cơ thể khỏe mạnh v&agrave; một v&oacute;c d&aacute;ng thon thả, như &yacute;. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/bot-ngu-coc-nesvita-bit-16-goi-x-25g">Ngũ cốc dinh dưỡng Nesvita bịch 400g</a> hương vị thơm ngon</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Ngũ cốc dinh dưỡng</div>
	</li>
	<li>Khối lượng
	<div>25g x 16 g&oacute;i</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, ngũ cốc 32% (l&uacute;a m&igrave; nguy&ecirc;n c&aacute;m 25%, gạo, chiết xuất từ mầm l&uacute;a mạch, đường, bắp, muối, bột kem (c&oacute; chứa đạm sữa), chất xơ thực phẩm, sữa bột t&aacute;ch kem, c&aacute;c kho&aacute;ng chất (calci carbonat, sắt sắt pyrophosphat), muối i-ốt, chất ổn định xanthan gum, hương liệu tổng hợp (hương mạch nha, hương sữa) v&agrave; c&aacute;c vitamin (vitamin C, B6, B1, B2, A, D)</div>
	</li>
	<li>Năng lượng
	<div>106kcal/25g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Đổ ngũ cốc v&agrave;o ly, r&oacute;t 140ml nước n&oacute;ng khuấy đều v&agrave; thưởng thức.</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Sản phẩm c&oacute; thể chứa đậu n&agrave;nh</div>
	</li>
	<li>Thương hiệu
	<div>Nesvita (Thụy Sỹ)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify">Nesvita l&agrave; thương hiệu được người ti&ecirc;u d&ugrave;ng biết đến với d&ograve;ng sản phẩm ngũ cốc dinh dưỡng, thuộc sở hữu của tập đo&agrave;n Nestl&eacute; c&oacute; lịch sử ph&aacute;t triển từ năm 1866. Hiện nay, Nesvita đang l&agrave; một trong những thương hiệu sản xuất v&agrave; kinh doanh ngũ cốc chất lượng h&agrave;ng đầu tại thị trường Việt Nam.</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p style="text-align:justify">Sản phẩm ngũ cốc dinh dưỡng Nesvita 400g c&oacute; chứa những gi&aacute; trị dinh dưỡng rất tốt cho sức khỏe như: Calo, đường, chất b&eacute;o, natri, đạm, canxi, chất xơ, sắt, Vitamin A. Trung b&igrave;nh trong <strong>100g ngũ cốc</strong> Nesvita c&oacute; <strong>chứa khoảng 424 kcal</strong>.</p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Ngũ cốc dinh dưỡng Nesvita c&oacute; th&agrave;nh phần ngũ cốc nguy&ecirc;n c&aacute;m từ thi&ecirc;n nhi&ecirc;n, ngo&agrave;i ra c&ograve;n được bổ sung th&ecirc;m c&aacute;c dưỡng chất như: Canxi, chất xơ, c&aacute;c loại vitamin v&agrave; chất sắt, bổ sung dinh dưỡng v&agrave; cung cấp đủ năng lượng hoạt động hằng ng&agrave;y cho người trưởng th&agrave;nh.</p>
	</li>
	<li>
	<p style="text-align:justify">Sản phẩm chứa h&agrave;m lượng dinh dưỡng cao v&agrave; dễ ti&ecirc;u h&oacute;a, l&agrave; một loại thực phẩm rất tốt cho người ốm yếu, trẻ em suy dinh dưỡng.<br />
	<img alt="Ngũ cốc dinh dưỡng Nesvita bịch 400g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/8286/155052/bhx/ngu-coc-dinh-duong-nesvita-bich-400g-202205210956595711.jpg" /></p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<p style="text-align:justify">Bạn c&oacute; thể sử dụng ngũ cốc dinh dưỡng Nesvita bằng c&aacute;ch h&ograve;a 1 g&oacute;i ngũ cốc 25g với 120 - 140ml nước ấm (60 - 65 độ C), khuấy đều v&agrave; thưởng thức.</p>

<p style="text-align:justify">N&ecirc;n sử dụng từ 1 - 2 g&oacute;i/ng&agrave;y.</p>

<h3 style="text-align:justify"><strong>C&aacute;c m&oacute;n ngon từ sản phẩm</strong></h3>

<p style="text-align:justify">Ngũ cốc l&agrave; một loại thức uống bổ sung dinh dưỡng, được sử dụng rất phổ biến hiện nay, kh&ocirc;ng chỉ d&ugrave;ng để pha chế th&agrave;nh thức uống bạn c&ograve;n c&oacute; thể sử dụng ngũ cốc để l&agrave;m th&agrave;nh những m&oacute;n ăn ngon, độc đ&aacute;o như: G&agrave; chi&ecirc;n ngũ cốc, b&aacute;nh quy ngũ cốc, sữa chua ngũ cốc tr&aacute;i c&acirc;y,...</p>

<h3 style="text-align:justify"><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Bảo quản ngũ cốc&nbsp;ở nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh &aacute;nh nắng mặt trời.</p>
	</li>
	<li>
	<p style="text-align:justify">Kh&ocirc;ng sử dụng sản phẩm hết hạn sử dụng.</p>
	</li>
	<li>
	<p style="text-align:justify">Ph&ugrave; hợp với người lớn v&agrave; trẻ tr&ecirc;n 6 tuổi.</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p style="text-align:justify">C&aacute;c sản phẩm ch&iacute;nh h&atilde;ng của Nesvita c&oacute; thể dễ d&agrave;ng t&igrave;m mua tại c&aacute;c cửa h&agrave;ng B&aacute;ch h&oacute;a XANH tr&ecirc;n to&agrave;n quốc. B&aacute;ch h&oacute;a XANH chỉ kinh doanh h&agrave;ng h&oacute;a c&oacute; nguồn gốc r&otilde; r&agrave;ng, n&ecirc;n bạn c&oacute; thể an t&acirc;m mua h&agrave;ng tại đ&acirc;y.<br />
Ngo&agrave;i ra, bạn c&oacute; thể đặt h&agrave;ng tại www.bachhoaxanh.com hoặc tr&ecirc;n ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n điện thoại để được giao h&agrave;ng nhanh ch&oacute;ng tận nh&agrave; c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (170, 'Sữa ngũ cốc Dutch Lady 300g', 65000, 0, 'store/images/ngu-coc-dinh-duong/sua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g-202205211030379751_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sữa dinh dưỡng <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-dutch-lady">ngũ cốc&nbsp;Dutch Lady</a>&nbsp;l&agrave; d&ograve;ng sản phẩm <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">ngũ cốc</a> mang đến h&agrave;m lượng dưỡng chất dồi d&agrave;o tương đương với 2 ly sữa.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/sua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g">Sữa dinh dưỡng ngũ cốc Dutch Lady t&uacute;i 300g (12 g&oacute;i x 25g)</a> thơm ngon với th&agrave;nh phần được l&agrave;m từ sữa, ngũ cốc v&agrave; trứng, đảm bảo bữa s&aacute;ng đủ đầy cho gia đ&igrave;nh.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Sữa dinh dưỡng ngũ cốc</div>
	</li>
	<li>Khối lượng
	<div>12 g&oacute;i x 25g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột sữa gầy (28,8%), đường, ngũ cốc (22,5%) (l&uacute;a m&igrave;, gạo, l&uacute;a mạch, ng&ocirc;, đậu n&agrave;nh), bột kem b&eacute;o thực vật, hương liệu tổng hợp d&ugrave;ng trong thực phẩm, bột sắn, hỗn hợp kho&aacute;ng chất (sắt pyrophotphat, kẽm sulphat, tri-canxi photphat, natri selenit, kali iođua, kali clorua, natri clorua) v&agrave; vitamin (C, B3, A, D, biotin, B1, B2, B6, folic acid, B12), chất ổn định (466), bột trứng.</div>
	</li>
	<li>Năng lượng
	<div>98 kcal/ 25g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Pha 1 g&oacute;i Sữa dinh dưỡng ngũ cốc Dutch Lady 25g v&agrave;o 135ml nước ấm (~50 độ C) rồi khuấy đều</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t. Sản phẩm chỉ cho 1 lần sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>Dutch Lady (H&agrave; Lan)</div>
	</li>
	<li>Sản xuất tại
	<div>Indonesia</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (171, 'Ca cao lúa mạch Ovaltine 400g', 66000, 0, 'store/images/ngu-coc-dinh-duong/thuc-uong-dinh-duong-ovaltine-hu-400g-202205210946341540_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-ngu-coc-dinh-duong">ngũ cốc</a>&nbsp;của thương hiệu <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-ovaltine">yến mạch, ngũ cốc&nbsp;Ovaltine</a>&nbsp;nổi tiếng với chất lượng tuyệt vời v&agrave; nguồn dinh dưỡng dồi d&agrave;o cho trẻ. Đặc biệt, <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/thuc-uong-dinh-duong-ovaltine-hu-400g">thức uống dinh dưỡng Ovaltine hũ 400g</a> gi&uacute;p ph&aacute;t triển n&atilde;o bộ nhờ cung cấp 10 loại vitamin v&agrave; nhiều dưỡng chất kh&aacute;c.

<ul>
</ul>
</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thức uống dinh dưỡng</div>
	</li>
	<li>Khối lượng
	<div>400g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>D&ugrave;ng cho trẻ từ 4 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Chiết xuất l&uacute;a v&agrave; mạch nha 24%, đường glucose, bột ca cao 13%, dầu cọ, vitamin v&agrave; kho&aacute;ng chất, (dicanxi photphat, vitamin C, sắt pyrophotphat, vitamin E, nicacin, mangan sunphat, vitamin A, axit pantothenic, vitamin B6, vitamin B1, vitamin B2, vitamin D3, vitamin B12), bột sữa bơ 5%, bột whey, chất điều chỉnh độ axit 340ii, hương giống tự nhi&ecirc;n, natri caseinat, chất nhũ h&oacute;a 471, chất ổn định 451i, muối v&agrave; maltodextrin.</div>
	</li>
	<li>Năng lượng
	<div>391 kcal/ 100g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho 4 th&igrave;a c&agrave; ph&ecirc; Ovaltine (khoảng 20g) v&agrave;o ly, th&ecirc;m 2 th&igrave;a c&agrave; ph&ecirc; sữa đặc (t&ugrave;y theo &yacute; th&iacute;ch), h&ograve;a với 120ml nước n&oacute;ng, khuấy đều v&agrave; thưởng thức. Nếu uống lạnh chỉ cần h&ograve;a với 60ml nước n&oacute;ng, khuấy đều v&agrave; sau đ&oacute; pha v&agrave;o ly đ&aacute; v&agrave; phủ th&ecirc;m tr&ecirc;n c&ugrave;ng lớp bột Ovaltine để nếm trọn vị thơm ngon v&agrave; thưởng thức.</div>
	</li>
	<li>Thương hiệu
	<div>Ovaltine (Thụy Sỹ)</div>
	</li>
	<li>Sản xuất tại
	<div>Th&aacute;i Lan</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (172, 'Yến mạch Quaker vị socola 420g', 75000, 0, 'store/images/ngu-coc-dinh-duong/thuc-uong-yen-mach-3-trong-1-vi-chocolate-quaker-bich-420g-202208160935025029_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-bot-yen-mach">Bột yến mạch</a> với c&ocirc;ng thức đặc biệt &iacute;t calo, &iacute;t chất b&eacute;o, nhiều chất xơ của <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-quaker-bot-yen-mach">yến mạch Quaker</a> gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng một c&aacute;ch hiệu quả mang lại cho bạn một cơ thể khỏe mạnh.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/thuc-uong-yen-mach-3-trong-1-quaker-vi-chocolate-bich-420g">Thức uống yến mạch 3 trong 1 vị chocolate Quaker bịch 420g</a> thơm ngon, dễ uống v&ocirc; c&ugrave;ng</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thức uống yến mạch 3 trong 1 vị chocolate</div>
	</li>
	<li>Khối lượng
	<div>15 g&oacute;i x 28g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Yến mạch nguy&ecirc;n hạt 27%, đường, kem, syrup rắn, ch&acirc;́t béo thực v&acirc;̣t (cọ), ch&acirc;́t &ocirc;̉n định, đạm sữa, ch&acirc;́t nhũ hóa, màu t&ocirc;̉ng hợp beta caroten, maltodextrin, vảy ngũ cốc, bột bắp, bột gạo, bột cacao, calci carbonat, hương li&ecirc;̣u, mu&ocirc;́i, ch&acirc;́t tạo ngọt sucralose.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho 1 g&oacute;i nhỏ v&agrave;o ly với 150ml nước n&oacute;ng, khuấy đều trước khi d&ugrave;ng.</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Sản phẩm c&oacute; chứa yến mạch, l&uacute;a m&igrave;, đậu n&agrave;nh v&agrave; sữa</div>
	</li>
	<li>Thương hiệu
	<div>Quaker (Mỹ)</div>
	</li>
	<li>Sản xuất tại
	<div>Malaysia</div>
	</li>
</ul>

<div class="description">
<div style="text-align:justify">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Quaker l&agrave; thương hiệu ngũ cốc của C&ocirc;ng ty The Quaker Oats, th&agrave;nh lập năm 1877 tại Mỹ. Hiện nay, c&ocirc;ng ty n&agrave;y đ&atilde; trực thuộc Tập đo&agrave;n Pepsico. C&aacute;c sản phẩm của Quaker mang đến cho bạn những bữa s&aacute;ng thật tiện lợi v&agrave; trọn vẹn, cho bạn đầy đủ năng lượng để c&oacute; một ng&agrave;y năng động.</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Th&agrave;nh phần dinh dưỡng trong bột yến mạch bao gồm y&ecirc;́n mạch nguy&ecirc;n hạt 30%, đường, kem, đạm sữa, maltodextrin, vảy ngũ c&ocirc;́c gi&uacute;p bổ sung canxi v&agrave; kho&aacute;ng chất.</p>
	</li>
	<li>
	<p>Trong 100g bột yến mạch c&oacute; chứa 407 calo, mỗi g&oacute;i 28g tương ứng với 114 calo.</p>
	</li>
</ul>
Thức u&ocirc;́ng y&ecirc;́n mạch 3 trong 1 Quaker vị truy&ecirc;̀n th&ocirc;́ng là loại ngũ cốc giàu dưỡng ch&acirc;́t và ti&ecirc;̣n dụng với hương vị thơm ngon, cho bạn bữa ăn b&ocirc;̉ dưỡng, hợp kh&acirc;̉u vị.

<p>&nbsp;</p>
</div>

<div style="text-align:center"><img alt="Thức uống yến mạch 3 trong 1 vị chocolate Quaker bịch 420g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2903/202289/bhx/files/quaker.gif" style="height:270px; width:480px" /></div>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p style="text-align:justify">Với vị ngon từ&nbsp;chocolate và ngu&ocirc;̀n dưỡng ch&acirc;́t d&ocirc;̀i dào từ&nbsp;yến mạch, thức u&ocirc;́ng y&ecirc;́n mạch Quaker đem đ&ecirc;́n&nbsp;nhi&ecirc;̀u lợi ích cho sức khỏe:</p>

<ul style="margin-left:40px">
	<li style="text-align:justify">
	<p>Chứa nhiều vitamin E, B6, B5 c&ugrave;ng kho&aacute;ng chất như sắt, selen, magi&ecirc;.&nbsp;Đ&acirc;y l&agrave; một trong những loại ngũ c&ocirc;́c gi&agrave;u chất xơ v&agrave; nhiều chất dinh dưỡng nhất</p>
	</li>
	<li style="text-align:justify">
	<p>Với h&agrave;m lượng chất xơ cao, ăn s&aacute;ng với yến mạch Quaker sẽ&nbsp;l&agrave;m giảm cảm gi&aacute;c th&egrave;m ăn, gi&uacute;p bạn no l&acirc;u v&agrave; cung cấp năng lượng cho cả ng&agrave;y d&agrave;i.</p>
	</li>
	<li style="text-align:justify">
	<p>Yến mạch được xem l&agrave; tốt cho cả nam v&agrave; nữ, giúp&nbsp;giảm nguy cơ ung thư v&uacute;, ruột kết, tuyến tiền liệt v&agrave; buồng trứng.</p>
	</li>
	<li style="text-align:justify">
	<p>Sản xuất năng lượng v&agrave; chức năng enzyme, thư gi&atilde;n c&aacute;c mạch m&aacute;u, cơ tim, điều chỉnh huyết &aacute;p v&agrave; ngăn ngừa đột quỵ.</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify">
	<p>Yến mạch Quaker&nbsp;với các gói nhỏ&nbsp;ti&ecirc;̣n dụng, m&ocirc;̃i gói vừa đủ cho m&ocirc;̣t l&acirc;̀n dùng, giúp bạn định lượng lượng đúng&nbsp;cho bữa ăn và d&ecirc;̃ dàng bảo quản hơn.</p>
	</li>
	<li style="text-align:justify">
	<p>Cho 1 gói nhỏ&nbsp;28g vào ly&nbsp;với 150ml nước nóng, khu&acirc;́y đ&ecirc;̀u trước khi dùng.</p>
	</li>
	<li style="text-align:justify">
	<p>Thích hợp dùng cho bữa sáng hoặc làm bữa ăn phụ trong ngày.</p>
	</li>
</ul>

<div style="text-align:center"><img alt="Thức uống yến mạch 3 trong 1 vị chocolate Quaker bịch 420g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2903/202289/bhx/files/60347065_1306380612848330_2968057705614278656_n.jpg" style="height:340px; width:820px" /></div>

<div style="text-align:justify">
<h3><strong>Lưu &yacute; khi sử dụng v&agrave; bảo quản thức uống yến mạch 3 trong 1 vị truyền thống Quaker bịch 420g</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản nơi kh&ocirc; r&aacute;o, tr&aacute;nh &aacute;nh nắng mặt trời</p>
	</li>
	<li>
	<p>Sau khi mở g&oacute;i, cần bảo quản trong hộp đựng để tr&aacute;nh bị kh&ocirc;ng kh&iacute; v&agrave;o l&agrave;m ỉu bột yến mạch.</p>
	</li>
	<li>
	<p>Thức u&ocirc;́ng y&ecirc;́n mạch Quaker dùng được cho trẻ từ 3 tu&ocirc;̉i trở l&ecirc;n</p>
	</li>
	<li>
	<p>Sản ph&acirc;̉m có th&ecirc;̉ chứa đ&acirc;̣u nành, lúa mì và sữa, kh&ocirc;ng dùng n&ecirc;́u dị ứng với các thành ph&acirc;̀n này</p>
	</li>
</ul>

<h3><strong>Ưu điểm khi mua tại B&aacute;ch h&oacute;a XANH</strong></h3>

<p>C&aacute;c sản phẩm b&aacute;n tại B&aacute;ch h&oacute;a XANH đảm bảo nguồn gốc r&otilde; r&agrave;ng, h&agrave;ng ch&iacute;nh h&atilde;ng v&agrave; được b&aacute;n với với gi&aacute; cực tốt. B&ecirc;n cạnh đ&oacute;, bạn c&oacute; thể đặt h&agrave;ng online th&ocirc;ng qua web hoặc app B&aacute;ch h&oacute;a XANH để được giao h&agrave;ng tận nơi v&ocirc; c&ugrave;ng tiện lợi v&agrave; nhanh ch&oacute;ng.</p>
</div>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (173, 'Ngũ cốc gạo lứt Best Choice 450g', 80000, 0, 'store/images/ngu-coc-dinh-duong/thuc-pham-bo-sung-ngu-coc-gao-lut-huyet-rong-best-choice-goi-450g-202205211017030685_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-best-choice">Ngũ cốc Best Choice</a> th&iacute;ch hợp d&agrave;nh cho trẻ em lớn hơn 3 tuổi v&agrave; người lớn. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Bột ngũ cốc</a> d&ugrave;ng để bổ sung th&ecirc;m chất đạm, chất xơ v&agrave; canxi gi&uacute;p cho xương chắc khoẻ hơn, b&eacute; lớn nhanh hơn. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/thuc-pham-bo-sung-ngu-coc-gao-lut-huyet-rong-best-choice-goi-450g">Thực phẩm bổ sung ngũ cốc gạo lứt huyết rồng Best Choice g&oacute;i 450g</a> hương vị thơm ngon, uống kh&ocirc;ng ng&aacute;n</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thực phẩm bổ sung ngũ cốc gạo lứt huyết rồng</div>
	</li>
	<li>Khối lượng
	<div>15 g&oacute;i x 30g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột kem kh&ocirc;ng sữa, chất ổn định, đạm sữa, chất nhũ ho&aacute;, đường, yến mạch, vảy ngũ cốc, bột gạo, đường, tinh bột bắp, bột đậu n&agrave;nh, muối ăn, gạo lứt, sữa bột,...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho 1 g&oacute;i ngũ cốc (30g) v&agrave;o ly v&agrave; cho v&agrave;o 130ml nước s&ocirc;i 100 độ C khuấy đều khoảng 4 ph&uacute;t l&agrave; d&ugrave;ng được. C&oacute; thể tăng giảm lượng nước s&ocirc;i tuỳ theo khẩu vị</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Kh&ocirc;ng sử dụng cho người c&oacute; khả năng mẫn cảm hoặc dị ứng với c&aacute;c th&agrave;nh phần trong sản phẩm. Kh&ocirc;ng d&ugrave;ng sản phẩm c&oacute; m&agrave;u sắc, m&ugrave;i vị bất thường, sản phẩm hết hạn sử dụng.</div>
	</li>
	<li>Thương hiệu
	<div>Best Choice ()</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (174, 'Yến mạch hạt chia Best Choice 240g', 48000, 0, 'store/images/ngu-coc-dinh-duong/thuc-pham-bo-sung-yen-mach-hat-chia-best-choice-goi-240g-202205211016207894_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-best-choice">Ngũ cốc Best Choice</a> th&iacute;ch hợp d&agrave;nh cho trẻ em lớn hơn 3 tuổi v&agrave; người lớn. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Bột ngũ cốc</a> d&ugrave;ng để bổ sung th&ecirc;m chất đạm, chất xơ v&agrave; canxi gi&uacute;p cho xương chắc khoẻ hơn, b&eacute; lớn nhanh hơn. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/thuc-pham-bo-sung-yen-mach-hat-chia-best-choice-goi-240g">Thực phẩm bổ sung yến mạch hạt chia Best Choice g&oacute;i 240g</a> thơm ngon, đầy dinh dưỡng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thực phẩm bổ sung yến mạch hạt chia</div>
	</li>
	<li>Khối lượng
	<div>8 g&oacute;i x 30g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột kem kh&ocirc;ng sữa, đạm sữa, chất nhũ ho&aacute;, vảy ngũ cốc, chất chống đ&ocirc;ng v&oacute;n, bột gạo, tinh bột bắp, bột đậu n&agrave;nh, muối ăn, hương vani tổng hợp, sữa bột, canxi,..</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho 1 g&oacute;i nhỏ v&agrave;o ly với 130ml nước n&oacute;ng, khuấy đều đợi 4-5 ph&uacute;t l&agrave; c&oacute; thể d&ugrave;ng. C&oacute; thể tăng giảm lượng nước s&ocirc;i tuỳ theo sở th&iacute;ch.</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Kh&ocirc;ng sử dụng cho người c&oacute; khả năng mẫn cảm hoặc dị ứng với c&aacute;c th&agrave;nh phần trong sản phẩm. Kh&ocirc;ng d&ugrave;ng sản phẩm c&oacute; m&agrave;u sắc, m&ugrave;i vị bất thường, sản phẩm hết hạn sử dụng.</div>
	</li>
	<li>Thương hiệu
	<div>Best Choice</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (175, 'Yến mạch gạo lứt Yumfood 210g', 42000, 0, 'store/images/ngu-coc-dinh-duong/thuc-pham-bo-sung-yen-mach-gao-lut-yumfood-goi-210g-202205211015244688_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-yumfood">Ngũ cốc&nbsp;Yumfood</a> với c&ocirc;ng thức đặc biệt &iacute;t calo, &iacute;t chất b&eacute;o, nhiều chất xơ. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Ngũ cốc</a>&nbsp;gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng một c&aacute;ch hiệu quả mang lại cho bạn một cơ thể khỏe mạnh v&agrave; một v&oacute;c d&aacute;ng thon thả, như &yacute;. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/thuc-pham-bo-sung-yen-mach-yumfood-gao-lut-goi-210g-30g-x-7-goi">Thực phẩm bổ sung yến mạch gạo lứt Yumfood g&oacute;i 210g</a> th&ecirc;m canxi cho xương chắc khoẻ.</div>

<ul style="margin-left:40px">
	<li>Loại ngũ cốc
	<div>Ngũ cốc dinh dưỡng</div>
	</li>
	<li>Vị
	<div>Gạo lứt</div>
	</li>
	<li>Khối lượng
	<div>30g x 7 g&oacute;i</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Th&iacute;ch hợp cho trẻ em tr&ecirc;n 3 tuổi v&agrave; người lớn</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Yến mạch (40%), bột kem kh&ocirc;ng sữa, đạm sữa, đường, sữa bột, canxi, gạo lứt (10%), muối,...</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho 01 g&oacute;i yến mạch nếp cẩm (30g) v&agrave;o ly v&agrave; cho v&agrave;o 130ml nước s&ocirc;i (100 độ C), khuấy đều khoảng 4 ph&uacute;t l&agrave; d&ugrave;ng được. C&oacute; thể tăng giảm lượng nước s&ocirc;i t&ugrave;y theo khẩu vị.</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng sử dụng cho người c&oacute; khả năng mẫn cảm hoặc dị ứng với c&aacute;c th&agrave;nh phần trong sản phẩm. Kh&ocirc;ng d&ugrave;ng sản phẩm c&oacute; m&agrave;u sắc, m&ugrave;i vị bất thường, sản phẩm hết hạn sử dụng.</div>
	</li>
	<li>Thương hiệu
	<div>Yumfood (&Uacute;c)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>

<p>Yumfood l&agrave; thương hiệu ngũ cốc c&oacute; nguồn gốc xuất xứ tại &Uacute;c chuy&ecirc;n cung cấp c&aacute;c sản phẩm ngũ cốc, yến mạch với gi&aacute; cả phải chăng, chất lượng tuyệt vời đối với người ti&ecirc;u d&ugrave;ng. Hiện nay tr&ecirc;n thị trường xuất hiện ng&agrave;y c&agrave;ng nhiều c&aacute;c loại ngũ cốc của thương hiệu&nbsp;Yumfood v&agrave; dần chiếm trọn tr&aacute;i tim, l&ograve;ng tin của người sử dụng.</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng c&oacute; trong sản phẩm&nbsp;</strong></h3>
<img alt="Thực phẩm bổ sung yến mạch gạo lứt Yumfood gói 210g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/229448/bhx/files/thuc-pham-bo-sung-yen-mach-yumfood-gao-lut-goi-210g-30g-x-7-goi-202010122216179623.jpg" style="height:768px; width:1024px" />
<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Yến mạch (40%), bột kem kh&ocirc;ng sữa, đạm sữa, đường, sữa bột, canxi, gạo lứt (10%), muối,...</p>
	</li>
	<li>
	<p>Trong 100g ngũ cốc c&oacute; chứa khoảng&nbsp;386,7 - 532,2 kcal</p>
	</li>
</ul>

<h3><strong>T&aacute;c dụng của sản phẩm đối với sức khỏe&nbsp;</strong></h3>
<img alt="Thực phẩm bổ sung yến mạch gạo lứt Yumfood gói 210g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/229448/bhx/files/thuc-pham-bo-sung-yen-mach-yumfood-gao-lut-goi-210g-30g-x-7-goi-202010122216219527.jpg" style="height:768px; width:1024px" />
<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng cho cơ thể</p>
	</li>
	<li>
	<p>Bổ sung kho&aacute;ng chất</p>
	</li>
	<li>
	<p>Hỗ trợ khả năng c&acirc;n bằng đường huyết</p>
	</li>
	<li>
	<p>Hạn chế t&igrave;nh trạng t&aacute;o b&oacute;n</p>
	</li>
	<li>
	<p>Bổ sung h&agrave;m lượng canxi, chất đạm v&agrave; chất xơ thiết yếu cho cơ thể.</p>
	</li>
</ul>

<h3><strong>Hướng dẫn sử dụng&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Cho 01 g&oacute;i yến mạch nếp cẩm (30g) v&agrave;o ly</p>
	</li>
	<li>
	<p>Cho v&agrave;o 130ml nước s&ocirc;i (100 độ C), khuấy đều khoảng 4 ph&uacute;t</p>
	</li>
</ul>

<h3><strong>C&aacute;c m&oacute;n ngon từ ngũ cốc&nbsp;</strong></h3>

<p>Ngo&agrave;i c&ocirc;ng dụng ch&iacute;nh l&agrave; pha với nước để uống th&igrave; ngũ cốc c&ograve;n c&oacute; thể chế biến ra c&aacute;c m&oacute;n ăn ngon như: Ngũ cốc sữa chua, ngũ cốc hạt nh&acirc;n &oacute;c ch&oacute; v&agrave; mật ong,..</p>

<h3><strong>Bảo quản v&agrave; lưu &yacute; khi sử dụng sản phẩm&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản sản phẩm ở những nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t tr&aacute;nh tiếp x&uacute;c trực tiếp với &aacute;nh nắng hoặc ở những nơi c&oacute; nhiệt độ cao</p>
	</li>
	<li>
	<p>Sử dụng&nbsp; hết khi x&eacute; g&oacute;i sản phẩm</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng ngũ cốc khi đ&atilde; hết hạn</p>
	</li>
</ul>

<h3><strong>Ưu điểm khi mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH</strong></h3>

<p>Khi mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH bạn sẽ nhận được sản phẩm chất lượng với gi&aacute; cả hợp l&yacute;, chất lượng v&agrave; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Ngo&agrave;i ra, bạn c&oacute; thể mua h&agrave;ng online để được giao h&agrave;ng tận nơi với đội ngũ nh&acirc;n vi&ecirc;n nhiệt t&igrave;nh, chu đ&aacute;o.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (176, 'Ca cao hoà tan 5 in 1 Gama 324g', 105000, 0, 'store/images/ngu-coc-dinh-duong/bot-ca-cao-gama-5-in-1-hop-324g-202205211009149210_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-gama">Bột cacao Gama</a> sử dụng trong chế biến thực phẩm như rau c&acirc;u, b&aacute;nh Brownie, b&aacute;nh kem, pha v&agrave;o sữa để tăng th&ecirc;m hương vị gi&uacute;p c&aacute;c b&eacute; kh&ocirc;ng bị ng&aacute;n sữa. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Bột cacao</a> thơm ngon, dễ uống v&ocirc; c&ugrave;ng.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-gama/bot-ca-cao-5in1-gama-hop-324g">Bột ca cao Gama 5 in 1 hộp 324g</a> th&ecirc;m hương nh&acirc;n s&acirc;m thơm nhẹ nh&agrave;ng m&agrave; ngon v&ocirc; c&ugrave;ng</div>

<ul style="margin-left:40px">
	<li>Ph&ugrave; hợp
	<div>Sử dụng trong chế biến thực phẩm như rau c&acirc;u, b&aacute;nh Brownie, b&aacute;nh kem, pha v&agrave;o sữa để tăng th&ecirc;m hương vị gi&uacute;p c&aacute;c b&eacute; kh&ocirc;ng bị ng&aacute;n sữa,&hellip;</div>
	</li>
	<li>Khối lượng
	<div>324g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột Cacao nguy&ecirc;n chất (40%), kem sữa (25%), đường tinh luyện (15%), mầm l&uacute;a mạch, caf&eacute; Moka (5%), hương Nh&acirc;n s&acirc;m (15%)</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Uống n&oacute;ng - Cho 18g v&agrave;o 75ml nước s&ocirc;i<br />
	Uống lạnh - Cho 36g (2 g&oacute;i) v&agrave;o 75ml nước s&ocirc;i th&ecirc;m đ&aacute; v&agrave;o</div>
	</li>
	<li>Bảo quản
	<div>Sau khi mở g&oacute;i, tr&uacute;t v&agrave;o 1 lọ kh&ocirc; v&agrave; sạch. Sau khi d&ugrave;ng, đ&oacute;ng nắp lọ thật chặt, để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.N&ecirc;n sử dụng trong v&ograve;ng 1 th&aacute;ng kể từ ng&agrave;y mở g&oacute;i.</div>
	</li>
	<li>Thương hiệu
	<div>Gama (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (177, 'Socola sữa hòa tan Miss Ede 240g', 99000, 0, 'store/images/ngu-coc-dinh-duong/socola-sua-hoa-tan-miss-ede-hop-240g-15-goi-x-16g-202205211025231623_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/socola-sua-hoa-tan-miss-ede-hop-240g">Socola sữa h&ograve;a tan Miss Ede hộp 240g (15 g&oacute;i x 16g)</a> của thương hiệu <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-miss-ede">yến mạch, ngũ cốc Miss Ede</a>, mang đến nguồn dinh dưỡng dồi d&agrave;o. Ssản phẩm c&ograve;n được đ&oacute;ng g&oacute;i dạng nhiều g&oacute;i nhỏ như bột <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">yến mạch, ngũ cốc</a> uống liền nhằm đ&aacute;p ứng th&oacute;i quen ti&ecirc;u d&ugrave;ng của kh&aacute;ch h&agrave;ng hiện nay.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Socola sữa h&ograve;a tan</div>
	</li>
	<li>Khối lượng
	<div>15 g&oacute;i x 16g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Bột ca cao Đắk Lắk - Việt Nam (với 19% bơ ca cao), Bột ca cao Cargill - Mỹ (với 12% bơ ca cao), đường tinh luyện, bột sữa kh&ocirc;ng b&eacute;o.</div>
	</li>
	<li>Năng lượng
	<div>70 kcal/ 16g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Sử dụng với 100 - 120 ml nước n&oacute;ng, khuấy đều, th&ecirc;m đ&aacute; khi uống lạnh.</div>
	</li>
	<li>Thương hiệu
	<div>Miss Ede (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (178, 'Ca cao sữa dừa Thái Bon 250g', 99000, 0, 'store/images/ngu-coc-dinh-duong/cacao-sua-dua-thai-bon-hop-250g-202210040859233390_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm hạt <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">yến mạch, ngũ cốc</a> của thương hiệu <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-thai-bon">ngũ cốc, cacao&nbsp;Th&aacute;i Bon</a>&nbsp;thơm ngon, dồi d&agrave;o vitamin v&agrave; kho&aacute;ng chất gi&uacute;p cơ thể khỏe mạnh. Đặc biệt,&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/cacao-sua-dua-thai-bon-hop-250g">Cacao sữa dừa Th&aacute;i Bon hộp 250g</a>&nbsp;với sữa dừa tự nhi&ecirc;n thơm b&eacute;o h&ograve;a quyện c&ugrave;ng cacao, mang đến hương thơm b&eacute;o v&agrave; nồng n&agrave;n, cung cấp nhiều năng lượng.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Cacao sữa dừa</div>
	</li>
	<li>Th&agrave;nh phần
	<div>42% bột cacao, 32% bột sữa, 14% bột sữa dừa, 12% đường.</div>
	</li>
	<li>Năng lượng
	<div>426 kcal/ 100g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>- UỐNG N&Oacute;NG Pha khoảng 20g cacao sữa dừa v&agrave;o 60ml nước sối, khuấy đều.<br />
	- UỐNG LẠNH Pha khoảng 40g cacao sữa dừa v&agrave;o 60ml nước s&ocirc;i, khuấy đều, th&ecirc;m đ&aacute;.&nbsp;C&oacute; thể th&ecirc;m đường, sữa,... t&ugrave;y sở th&iacute;ch.</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng sử dụng sản phẩm khi hết hạn sử dụng.</div>
	</li>
	<li>Thương hiệu
	<div>Th&aacute;i Bon (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (179, 'Ca cao Nestlé Hot Choco 240g', 95000, 0, 'store/images/ngu-coc-dinh-duong/bot-ca-cao-nestle-hot-choco-original-hop-240g-202205210959232113_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-nestle-ca-cao-dang-bot">Bột cacao Nestl&eacute;</a> l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-ca-cao-dang-bot">cacao dạng bột</a> vị thơm b&eacute;o, &iacute;t ngọt uống kh&ocirc;ng ng&aacute;n. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/bot-ca-cao-nestle-hot-choco-original-hop-240g">Bột ca cao Nestl&eacute; Hot Choco Original hộp 240g</a>&nbsp;vớị chocolate ngọt ng&agrave;o v&agrave; đậm vị cacao nguy&ecirc;n chất c&ocirc;ng thức độc quyền từ Nestle Thụy Sĩ, đem đến chất lượng cao nhất cho sản phẩm.</div>

<ul style="margin-left:40px">
	<li>Hương vị
	<div>Ca cao truy&ecirc;̀n th&ocirc;́ng</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, h&ocirc;̃n hợp sữa (sữa b&ocirc;̣t tách kem, whey b&ocirc;̣t), b&ocirc;̣t kem (siro bắp, d&acirc;̀u thực v&acirc;̣t, d&acirc;̀u nh&acirc;n cọ), protein sữa, ch&acirc;́t đi&ecirc;̀u chỉnh đ&ocirc;̣ axit 340(ii), sữa b&ocirc;̣t tách kem, whey b&ocirc;̣t), b&ocirc;̣t ca cao 13%, b&ocirc;̣t sữa tạo bọt (sữa b&ocirc;̣t tách kem, maltodextrin, đường lactose, natri caseinate, d&acirc;̀u thực v&acirc;̣t), ch&acirc;́t ch&ocirc;́ng đ&ocirc;ng vón 551</div>
	</li>
	<li>Trọng lượng/ Thể t&iacute;ch
	<div>240g</div>
	</li>
	<li>Thương hiệu
	<div>Nestl&eacute; (Thụy Sỹ)</div>
	</li>
	<li>Sản xuất tại
	<div>Hàn Qu&ocirc;́c</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 1, 25, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (180, 'Ca cao CacaoMi Premium 217g', 88000, 0, 'store/images/ngu-coc-dinh-duong/bot-ca-cao-nguyen-chat-cacaomi-premium-hop-217g-202211231531012563_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Bột cacao</a>&nbsp;của thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-cacaomi">CacaoMi</a> được tuyển chọn từ những hạt cacao nguy&ecirc;n chất theo ti&ecirc;u chuẩn UTZ nghi&ecirc;m ngặt, được d&ugrave;ng cho trẻ từ 6 tuổi trở l&ecirc;n, đảm bảo thơm ngon uống kh&ocirc;ng ng&aacute;n. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/bot-cacao-nguyen-chat-premium-cacaomi-hop-217g">Bột ca cao nguy&ecirc;n chất CacaoMi Premium hộp 217g</a> giữ lại khoảng 18 - 23% lượng bơ cacao cho hương vị thơm ngon.</div>

<ul style="margin-left:40px">
	<li>Hương vị
	<div>Ca cao nguy&ecirc;n chất kh&ocirc;ng đường</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Sử dụng trong chế biến thực phẩm như rau c&acirc;u, b&aacute;nh Brownie, b&aacute;nh kem, pha v&agrave;o sữa để tăng th&ecirc;m hương vị gi&uacute;p c&aacute;c b&eacute; kh&ocirc;ng bị ng&aacute;n sữa,&hellip;</div>
	</li>
	<li>Khối lượng
	<div>217g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>100% hạt ca cao chất lượng cao</div>
	</li>
	<li>Bảo quản
	<div>Sau khi mở g&oacute;i, tr&uacute;t v&agrave;o 1 lọ kh&ocirc; v&agrave; sạch. Sau khi d&ugrave;ng, đ&oacute;ng nắp lọ thật chặt, để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.N&ecirc;n sử dụng trong v&ograve;ng 1 th&aacute;ng kể từ ng&agrave;y mở g&oacute;i.</div>
	</li>
	<li>Thương hiệu
	<div>CacaoMi (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (181, 'Bột lúa mạch Milo Active Go 400g', 75000, 0, 'store/images/ngu-coc-dinh-duong/bot-thuc-uong-lua-mach-milo-active-go-hu-400g-202205210941056382_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-milo-ca-cao-dang-bot">Thức uống cacao l&uacute;a mạch&nbsp;Milo</a>&nbsp;nổi tiếng được l&agrave;m&nbsp;từ mầm l&uacute;a mạch&nbsp;v&agrave; <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-ngu-coc-dinh-duong">ngũ cốc</a>&nbsp;nguy&ecirc;n c&aacute;m, c&oacute; t&aacute;c dụng cung cấp nguồn năng lượng cho việc học tập, chơi thể thao v&agrave; c&aacute;c hoạt động thể chất.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/bot-thuc-uong-lua-mach-milo-active-go-hu-400g">Bột thức uống l&uacute;a mạch Milo Active Go hũ 400g</a>&nbsp;dạng bột mịn dễ h&ograve;a tan, tiện lợi để pha chế v&agrave; thưởng thức.</div>

<ul style="margin-left:40px">
	<li>Hương vị
	<div>Ca cao l&uacute;a mạch</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>D&ugrave;ng cho trẻ từ 6 tuổi trở l&ecirc;n</div>
	</li>
	<li>Khối lượng
	<div>400g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>PROTOMALT 32% (chiết xuất từ mầm l&uacute;a mạch - extract from malted barley, tinh bột sắn), đường, sữa bột t&aacute;ch kem (skimmed milk powder), bột ca cao, dầu thực vật, bột whey, c&aacute;c kho&aacute;ng chất (dicalci phosphat, dinatri phosphat, sắt pyrophosphat), dầu bơ (từ sữa - from milk), sir&ocirc; glucose, c&aacute;c vitamin (vitamin C, niacin, vitamin B6, B2, D, B12), muối i-ốt v&agrave; hương vani tổng hợp.</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Milo (Thụy Sĩ)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>

<p style="text-align:justify">Milo l&agrave; thương hiệu đồ uống dinh dưỡng c&oacute; th&agrave;nh phần từ sữa,&nbsp;kết hợp với chocolate, mạch nha đến từ Australia do Nestle sản xuất. Đến thời điểm hiện tại, thương hiệu đồ uống n&agrave;y đ&atilde; được ph&acirc;n phối tại nhiều nước như:&nbsp;Malaysia, Singapore, Trung Quốc, Nhật Bản, Ấn Độ, Việt Nam,&hellip;<br />
Milo đ&atilde; c&oacute; mặt tr&ecirc;n thị trường hơn 17 năm v&agrave; dần khẳng định vị thế của m&igrave;nh tr&ecirc;n thị trường bởi cung cấp c&aacute;c sản phẩm chất lượng, đ&aacute;p ứng được nhu cầu sử dụng của người ti&ecirc;u d&ugrave;ng.</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm&nbsp;</strong></h3>
<img alt="Bột thức uống lúa mạch Milo Active Go hũ 400g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//8286/79378/bhx/files/bot-milo-nguyen-chat-hu-400g-2.jpg" style="height:768px; width:1024px" />
<ul style="margin-left:40px">
	<li style="text-align:justify">PROTOMALT 32% (chiết xuất từ mầm l&uacute;a mạch - extract from malted barley, tinh bột sắn), đường, sữa bột t&aacute;ch kem (skimmed milk powder), bột ca cao, dầu thực vật, bột whey, c&aacute;c kho&aacute;ng chất (dicalci phosphat, dinatri phosphat, sắt pyrophosphat), dầu bơ (từ sữa - from milk), sir&ocirc; glucose, c&aacute;c vitamin (vitamin C, niacin, vitamin B6, B2, D, B12), muối i-ốt v&agrave; hương vani tổng hợp</li>
</ul>

<h3 style="text-align:justify"><strong>T&aacute;c dụng đối với sức khỏe&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify">
	<p>Sữa Milo bổ sung canxi, c&aacute;c dưỡng chất thiết yếu (vitamin B, vitamin C, sắt) v&agrave; nguồn năng lượng, cho b&eacute;&nbsp;năng lượng để khởi động ng&agrave;y mới đầy năng động</p>
	</li>
	<li style="text-align:justify">
	<p><a href="https://www.bachhoaxanh.com/sua-ca-cao-socola" target="_blank" title="Các loại thức uống dinh dưỡng có bán tại Bách hóa XANH">Thức uống&nbsp;dinh dưỡng</a> từ mầm l&uacute;a mạch nguy&ecirc;n c&aacute;m c&oacute; t&aacute;c dụng cung cấp nguồn năng lượng hoạt động l&acirc;u d&agrave;i hơn cho việc học tập, chơi thể thao v&agrave; c&aacute;c hoạt động thể chất.</p>
	</li>
	<li style="text-align:justify">
	<p>Hương vị cacao sữa thơm ngon hấp dẫn, kh&ocirc;ng chỉ được trẻ em y&ecirc;u th&iacute;ch m&agrave; người lớn cũng rất ưa chuộng.</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng sản phẩm&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify">
	<p>Đổ 150ml <a href="https://www.bachhoaxanh.com/sua-tuoi-khong-duong" target="_blank" title="Sữa tươi không đường có bán tại Bách hóa XANH">sữa tươi kh&ocirc;ng đường</a> ra ly</p>
	</li>
	<li style="text-align:justify">
	<p>Nhẹ nh&agrave;ng cho lượng đ&aacute; vi&ecirc;n vừa đủ v&agrave;o ly để t&aacute;ch lớp</p>
	</li>
	<li style="text-align:justify">
	<p>H&ograve;a tan 4 muỗng (khoảng 22g) bột Nestl&eacute; Milo với&nbsp;100ml nước n&oacute;ng v&agrave;o 1 ly ri&ecirc;ng</p>
	</li>
	<li style="text-align:justify">
	<p>Đổ phần Milo n&oacute;ng vừa pha v&agrave;o hỗn hợp sữa ban đầu, trang tr&iacute; t&ugrave;y th&iacute;ch.</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Bảo quản v&agrave; lưu &yacute; khi sử dụng sản phẩm&nbsp;</strong></h3>

<ul style="margin-left:40px">
	<li style="text-align:justify">
	<p>Bảo quản sản phẩm ở những nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t tr&aacute;nh tiếp x&uacute;c trực tiếp với &aacute;nh nắng hoặc ở những nơi c&oacute; nhiệt độ cao</p>
	</li>
	<li style="text-align:justify">
	<p>Đậy nắp kỹ sau mỗi lần sử dụng sản phẩm</p>
	</li>
	<li style="text-align:justify">
	<p>Kh&ocirc;ng sử dụng sản phẩm khi đ&atilde; hết hạn</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua h&agrave;ng tai B&aacute;ch h&oacute;a XANH&nbsp;</strong></h3>

<p style="text-align:justify">Khi mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH bạn sẽ nhận được sản phẩm ch&iacute;nh h&atilde;ng, chất lượng c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Ngo&agrave;i ra bạn c&oacute; thể mua online để được giao h&agrave;ng tận nơi với đội ngũ nh&acirc;n vi&ecirc;n nhiệt t&igrave;nh, chu đ&aacute;o.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (182, 'Yến mạch Quaker truyền thống 420g', 75000, 0, 'store/images/ngu-coc-dinh-duong/thuc-uong-yen-mach-3-trong-1-vi-truyen-thong-quaker-bich-420g-202205210957340457_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-quaker">Ngũ cốc&nbsp;Quaker</a> với c&ocirc;ng thức đặc biệt &iacute;t calo, &iacute;t chất b&eacute;o, nhiều chất xơ.&nbsp;<a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Ngũ cốc</a>&nbsp;gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng một c&aacute;ch hiệu quả mang lại cho bạn một cơ thể khỏe mạnh v&agrave; một v&oacute;c d&aacute;ng thon thả, như &yacute;. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/thuc-uong-yen-mach-3-trong-1-quaker-vi-truyen-thong-bich-420g">Thức uống yến mạch 3 trong 1 vị truyền thống Quaker bịch 420g</a> hương vị thơm ngon.</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Thức uống yến mạch 3 trong 1 vị truyền thống</div>
	</li>
	<li>Khối lượng
	<div>15 g&oacute;i x 28g</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Y&ecirc;́n mạch nguy&ecirc;n hạt 30%, đường, kem, ch&acirc;́t &ocirc;̉n định, đạm sữa, ch&acirc;́t nhũ hóa, màu t&ocirc;̉ng hợp, maltodextrin, vảy ngũ c&ocirc;́c, canxi carbonat, hương li&ecirc;̣u, mu&ocirc;́i, ch&acirc;́t tạo ngọt sucralose E955</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Cho 1 g&oacute;i nhỏ v&agrave;o ly với 150ml nước n&oacute;ng, khuấy đều trước khi d&ugrave;ng.</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Sản phẩm c&oacute; chứa yến mạch, l&uacute;a m&igrave;, đậu n&agrave;nh v&agrave; sữa</div>
	</li>
	<li>Thương hiệu
	<div>Quaker (Mỹ)</div>
	</li>
	<li>Sản xuất tại
	<div>Malaysia</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Thương hiệu Quaker được ra đời v&agrave;o năm 1877, đ&acirc;y l&agrave; thương hiệu l&acirc;u đời với c&aacute;c sản phẩm chất lượng được người ti&ecirc;u d&ugrave;ng đ&aacute;nh gi&aacute; cao. Chuy&ecirc;n sản xuất v&agrave; ph&aacute;t triển c&aacute;c sản phẩm về <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">ngũ cốc</a> nguy&ecirc;n hạt, yến mạch, c&aacute;c loại đồ uống,... thơm ngon, tốt cho sức khỏe người ti&ecirc;u d&ugrave;ng.<br />
<img alt="Thức uống yến mạch 3 trong 1 vị truyền thống Quaker bịch 420g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images//2903/202285/bhx/files/Oat_Story_Desktop.png" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Thức uống yến mạch l&agrave; nguồn cung cấp c&aacute;c chất dinh dưỡng rất tốt cho cơ thể. Cụ thể trong sản phẩm c&oacute; chứa c&aacute;c chất đạm, canxi, chất xơ, c&aacute;c vitamin v&agrave; kho&aacute;ng chất kh&aacute;c. Ngo&agrave;i ra đ&acirc;y c&ograve;n l&agrave; nguồn bổ sung năng lượng dồi d&agrave;o cho cơ thể. Trong 100g sản phẩm sẽ cung cấp cho cơ thể khoảng hơn 400 kcal</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng nổi bật của sản phẩm đối với sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng hoạt động</p>
	</li>
	<li>
	<p>Bổ sung đạm v&agrave; chất xơ</p>
	</li>
	<li>
	<p>L&agrave;m dịu nhanh cơn đ&oacute;i</p>
	</li>
	<li>
	<p>Nhuận tr&agrave;ng</p>
	</li>
	<li>
	<p>Cải thiện hệ ti&ecirc;u h&oacute;a</p>
	</li>
	<li>
	<p>Hỗ trợ giảm c&acirc;n</p>
	</li>
	<li>
	<p>Ngăn ngừa đột quỵ</p>
	</li>
	<li>
	<p>Giảm nguy cơ ung thư</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<p>Sản phẩm được chia theo từng g&oacute;i nhỏ, khi d&ugrave;ng chỉ cần x&eacute; g&oacute;i cho v&agrave;o ly, đổ khoảng 150ml nước n&oacute;ng v&agrave;o. Khuấy đều l&agrave; c&oacute; thể thưởng thức. Bạn c&oacute; thể sử dụng cho bữa s&aacute;ng, tối để bổ sung năng lượng nhanh ch&oacute;ng.</p>

<h3><strong>C&aacute;c m&oacute;n ngon từ sản phẩm</strong></h3>

<p>Bạn c&oacute; thể kết hợp thức uống yến mạch với c&aacute;c loại tr&aacute;i c&acirc;y, c&aacute;c loại hạt hoặc granola để c&oacute; ngay bữa ăn thơm ngon, đầy dinh dưỡng, hỗ trợ giảm c&acirc;n rất tốt.<br />
<img alt="Thức uống yến mạch 3 trong 1 vị truyền thống Quaker bịch 420g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images//2903/202285/bhx/files/thuc-uong-yen-mach.jpg" /></p>

<h3><strong>C&aacute;c thức uống ngon với sản phẩm</strong></h3>

<p>Nếu muốn thay đổi khẩu vị c&oacute; thể kết hợp sản phẩm với c&aacute;c loại bột ca cao, bột tr&agrave; xanh,... để tăng th&ecirc;m hương vị cho loại thức uống n&agrave;y.</p>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Sản phẩm th&iacute;ch hợp cho c&aacute;c b&eacute; từ 3 tuổi trở l&ecirc;n v&agrave; người lớn. Khi pha xong n&ecirc;n thưởng thức sớm, tr&aacute;nh để sản phẩm qua đ&ecirc;m hay bụi bẩn rơi v&agrave;o l&agrave;m ảnh hưởng đến chất lượng.<br />
Lưu &yacute;: Kh&ocirc;ng n&ecirc;n sử dụng khi sản phẩm đ&atilde; hết hạn, c&oacute; dấu hiệu hư hỏng hoặc m&ugrave;i vị lạ. Kh&ocirc;ng d&ugrave;ng khi dị ứng c&aacute;c th&agrave;nh phần của sản phẩm.</p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>B&aacute;ch h&oacute;a XANH hiện tại l&agrave; một trong &nbsp;những địa chỉ uy t&iacute;n cung cấp rất nhiều c&aacute;c sản phẩm ngũ cốc, yến mạch chất lượng đảm bảo, nguồn gốc xuất xứ r&otilde; r&agrave;ng. Khi mua sắm tại đ&acirc;y bạn sẽ y&ecirc;n t&acirc;m về gi&aacute; cả, được tham gia c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; hấp dẫn v&agrave; được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng, tận nơi.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-06-01 20:44:49', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (183, 'Bột sắn dây Sora 300g', 71000, 0, 'store/images/ngu-coc-dinh-duong/bot-san-day-sora-nguyen-chat-goi-300g-202205211019531649_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&aacute;c <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">sản phẩm bột đậu</a> của <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-sora">Sora</a> nguy&ecirc;n chất 100%, kh&ocirc;ng th&ecirc;m phụ gia v&agrave; chất bảo quản, rất tốt cho sức khoẻ. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/bot-san-day-sora-nguyen-chat-goi-300g">Bột sắn d&acirc;y Sora nguy&ecirc;n chất g&oacute;i 300g</a> sắn d&acirc;y thơm ngon, ngọt m&aacute;t, dễ d&agrave;ng pha v&agrave; thưởng thức tại nh&agrave;</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Bột sắn d&acirc;y</div>
	</li>
	<li>Khối lượng
	<div>300g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sắn d&acirc;y 100% kh&ocirc;ng d&ugrave;ng chất bảo quản, phụ gia</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Uống. Cho 100ml nước v&agrave;o 15g bột sắn d&acirc;y (tương đương 1 muỗng canh) khuấy đều, tuỳ theo sở th&iacute;ch c&oacute; thể th&ecirc;m chanh đường. Ăn, cho 15ml nước v&agrave;o 15g bột sắn d&acirc;y (tương đương 1 muỗng canh) khuấy tan, tuỳ theo sở th&iacute;ch c&oacute; thể th&ecirc;m đường v&agrave;o, sau đ&oacute; th&ecirc;m 50ml nước s&ocirc;i khuấy đều lần nữa tạo th&agrave;nh dung dịch sệt</div>
	</li>
	<li>Thương hiệu
	<div>Sora</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>C&ocirc;ng dụng của bột sắn d&acirc;y</strong></h3>

<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bot-san-day-la-gi-cong-dung-cua-bot-san-day-doi-voi-suc-khoe-1334305">C&ocirc;ng dụng của bột sắn d&acirc;y với sức khỏe</a> rất nhiều. Cụ thể, bột sắn d&acirc;y gi&uacute;p:</p>

<ul style="margin-left:40px">
	<li style="text-align:justify">Giải độc, điều trị chứng nghiện rượu</li>
	<li style="text-align:justify">Hỗ trợ ti&ecirc;u h&oacute;a</li>
	<li style="text-align:justify">L&agrave;m đẹp da, l&agrave;m mờ vết t&agrave;n nhang</li>
	<li style="text-align:justify">Giảm cảm, chống say nắng, say s&oacute;ng</li>
	<li style="text-align:justify">Cải thiện k&iacute;ch thước v&ograve;ng 1</li>
	<li style="text-align:justify">Tốt cho phụ nữ mang thai</li>
	<li style="text-align:justify">Giải kh&aacute;t</li>
</ul>

<h3 style="text-align:justify"><strong>C&aacute;ch bảo quản bột</strong></h3>

<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/cach-chon-mua-va-bao-quan-bot-san-day-973258">C&aacute;ch bảo quản bột sắn d&acirc;y</a> rất dễ. Trước hết, h&atilde;y n&ecirc;n chọn mua sản phẩm bột sắn d&acirc;y đến từ những thương hiệu c&oacute; uy t&iacute;n, v&igrave;&nbsp;nếu mua phải bột giả th&igrave; việc bảo quản dường như l&agrave;&nbsp;v&ocirc; &iacute;ch. Tiếp theo, bạn&nbsp;bảo quản bột ở nơi kh&ocirc; tho&aacute;ng th&ocirc;i nh&eacute;. C&aacute;ch bảo quản hiệu quả nhất l&agrave; đựng bột sắn d&acirc;y v&agrave;o trong lọ thủy tinh k&iacute;n hoặc trong t&uacute;i nilon th&igrave; sau mỗi lần sử dụng phải đậy nắp &nbsp;cột chặt miệng t&uacute;i lại. Phương n&agrave;y n&agrave;y sẽ gi&uacute;p&nbsp;bột kh&ocirc;ng h&uacute;t ẩm g&acirc;y mốc v&agrave;&nbsp;l&agrave;m giảm chất lượng.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (184, 'Ngũ cốc gạo lứt Xuân An 400g', 69800, 0, 'store/images/ngu-coc-dinh-duong/gao-luc-huyet-rong-xuan-an-bich-400g-202205210957192179_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc-xuan-an">Ngũ cốc dinh dưỡng Xu&acirc;n An</a> với c&ocirc;ng thức đặc biệt &iacute;t calo, &iacute;t chất b&eacute;o, nhiều chất xơ. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc">Ngũ cốc</a> gi&uacute;p bạn kiểm so&aacute;t c&acirc;n nặng một c&aacute;ch hiệu quả mang lại cho bạn một cơ thể khỏe mạnh v&agrave; một v&oacute;c d&aacute;ng thon thả, như &yacute;. <a href="https://www.bachhoaxanh.com/yen-mach-ngu-coc/gao-luc-huyet-rong-xuan-an-bich-400g">Gạo lức huyết rồng Xu&acirc;n An bịch 400g</a> bữa ăn thanh nhẹ từ thi&ecirc;n nhi&ecirc;n</div>

<ul style="margin-left:40px">
	<li>Loại sản phẩm
	<div>Gạo lức huyết rồng</div>
	</li>
	<li>Khối lượng
	<div>25g x 16 g&oacute;i</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Trẻ từ 3 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Gạo lức huyết rồng 18%, yến mạch, malt, bắp, đậu n&agrave;nh, muối đường, bột kem thực vật, canxi 0,5%, chất xơ</div>
	</li>
	<li>Năng lượng
	<div>374.4 - 457.6kcal/100g</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Đổ g&oacute;i ngũ cốc ra ly, th&ecirc;m 120 - 150ml nước n&oacute;ng, khuấy đều v&agrave; d&ugrave;ng ngay</div>
	</li>
	<li>Thương hiệu
	<div>Việt Ngũ Cốc (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify"><strong>Ngũ cốc Xu&acirc;n An</strong> l&agrave; thương hiệu của C&ocirc;ng ty TNHH Thực Phẩm Dinh Dưỡng Xu&acirc;n An, th&agrave;nh lập năm 2004. Thương hiệu chuy&ecirc;n&nbsp;sản xuất &ndash; ph&acirc;n phối c&aacute;c loại: bột ngũ cốc dinh dưỡng, bột ngũ cốc ăn ki&ecirc;ng, ngũ cốc ăn ki&ecirc;ng uống liền v&agrave; ngũ cốc dinh dưỡng uống liền&hellip; Đặc biệt năm 2014, Xu&acirc;n An tự h&agrave;o l&agrave; đơn vị đầu ti&ecirc;n sản xuất th&agrave;nh c&ocirc;ng sản phẩm ngũ cốc uống liền tại thị trường Việt Nam, với hai dạng th&agrave;nh phẩm: Ngũ cốc ăn ki&ecirc;ng uống liền v&agrave; Ngũ cốc dinh dưỡng uống liền mang thương hiệu Việt Ngũ Cốc c&aacute;c sản phẩm n&agrave;y đều được người ti&ecirc;u d&ugrave;ng y&ecirc;u th&iacute;ch.</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p style="text-align:justify">Gạo lứt huyết rồng Xu&acirc;n An&nbsp;được chế biến từ c&aacute;c th&agrave;nh phần như:&nbsp;Gạo lức huyết rồng 18%, yến mạch, malt, bắp, đậu n&agrave;nh, muối đường, bột kem thực vật, canxi 0,5%, chất xơ. Ngo&agrave;i ra, trong <strong>100g ngũ cốc</strong> gạo lứt&nbsp;Xu&acirc;n An cung cấp khoảng <strong>352 kcal</strong> v&agrave;&nbsp;chứa 5.2g protein, 58.5g carbohydrat, 10.8g lipid, 2g chất xơ v&agrave; 300mg canxi.<br />
<img alt="Ngũ cốc gạo lứt huyết rồng Xuân An bịch 400g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2687/79620/bhx/files/gao-luc-huyet-rong-xuan-an-bich-400g-202203170947471988.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p style="text-align:justify">Ngũ cốc Gạo lứt huyết rồng&nbsp;l&agrave; thức uống thơm ngon bổ dưỡng, được l&agrave;m từ gạo lứt, yến mạch v&agrave; nhiều loại ngũ cốc. Sản phẩm được bổ sung th&ecirc;m canxi v&agrave; sử dụng &iacute;t đường. Vitamin, kho&aacute;ng chất, chất xơ tự nhi&ecirc;n gi&uacute;p hấp thu dinh dưỡng tốt v&agrave; thanh lọc cơ thể.<br />
Ngo&agrave;i ra, với th&agrave;nh phần gạo lứt, sản phẩm mang đến th&ecirc;m nhiều c&ocirc;ng dụng như:</p>

<ul style="margin-left:40px">
	<li style="text-align:justify">
	<p>L&agrave;m giảm cholesterol : Nhờ trong vỏ gạo lứt nhiều chất xơ v&agrave; gi&agrave;u Omega3</p>
	</li>
	<li style="text-align:justify">
	<p>Cải thiện chức năng bộ m&aacute;y ti&ecirc;u ho&aacute;,tăng hấp thụ,ch.ống t&aacute;.o b&oacute;n v&agrave; ti.&ecirc;u c.hảy ( gạo lức qu&acirc;n b&igrave;nh &acirc;m dương )</p>
	</li>
	<li style="text-align:justify">
	<p>C&oacute; t&aacute;c dụng giảm c&acirc;n ở người b&eacute;o ph&igrave; (BMZ &gt; 25)(giảm đường huyết,giải độc ruột kết,tăng cường chuyển ho&aacute; chăt b&eacute;o).</p>
	</li>
	<li style="text-align:justify">
	<p>Giải độc cơ thể ( nhiều chất xơ -&gt; l&agrave;m sach ruột,nhiều chất AO -&gt; chống lại gốc tự do).</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Ngũ cốc dinh dưỡng l&agrave; m&oacute;n ăn bổ dưỡng ph&ugrave; hợp với mọi lứa tuổi, tiện sử dụng l&agrave;m bữa điểm t&acirc;m ở mọi nơi, mọi thời điểm trong ng&agrave;y.</p>
	</li>
	<li>
	<p style="text-align:justify">H&ograve;a 1 g&oacute;i ngũ cốc dinh dưỡng với khoảng 120ml nước n&oacute;ng, khuấy đều trước khi d&ugrave;ng.</p>
	</li>
	<li>
	<p style="text-align:justify">Sử dụng như 1 bữa ăn nhẹ.</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</p>
	</li>
	<li>
	<p style="text-align:justify">Tr&aacute;nh &aacute;nh nắng trực tiếp.</p>
	</li>
</ul>

<p style="text-align:justify"><strong><img alt="Ngũ cốc gạo lứt huyết rồng Xuân An bịch 400g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2687/79620/bhx/files/gao-luc-huyet-rong-viet-ngu-coc-bich-600g-202005082137440056.jpg" style="height:768px; width:1024px" /></strong></p>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p style="text-align:justify">Sản phẩm Gạo lứt huyết rồng Xu&acirc;n An&nbsp;đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH, đảm bảo đ&uacute;ng nguồn gốc xuất xứ v&agrave; an to&agrave;n với người sử dụng. Bạn c&oacute; thể mua sản phẩm online qua app hoặc website để nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nh&agrave; nhanh ch&oacute;ng, tiện lợi.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 9);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (185, 'Kẹo Bebeto vị nhiệt đới 36g', 6500, 10000, 'store/images/banh-keo/keo-bebeto-cool-beans-fliptop-vi-nhiet-doi-hop-36g-202205191133361144_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-cung-bebeto">Kẹo cứng Bebeto</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/keo-cung">kẹo cứng</a> rất thơm ngon, chuẩn vị, chắc chắn bạn sẽ bất ngờ đ&oacute;. <a href="https://www.bachhoaxanh.com/keo-cung/keo-cung-bebeto-cool-beans-fliptop-vi-nhiet-doi-hop-36g">Kẹo cứng Bebeto Cool Beans Fliptop vị nhiệt đới hộp 36g</a>, sản phẩm ấn tượng với vị chua ngọt th&iacute;ch miệng, k&egrave;m theo hương thơm nồng n&agrave;n của tr&aacute;i c&acirc;y v&ugrave;ng nhiệt đới thật kh&oacute; cưỡng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo cứng vị nhiệt đới</div>
	</li>
	<li>Ưu điểm
	<div>Sản phẩm ăn liền, tiện lợi</div>
	</li>
	<li>Khối lượng
	<div>36g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường 50.08%, glucose syrup, nước &eacute;p t&aacute;o c&ocirc; đặc, nước, tinh bột ng&ocirc; biến t&iacute;nh, chất tạo m&agrave;u, chất tạo b&oacute;ng, hương liệu, bột tr&aacute;i c&acirc;y</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Sản phẩm c&oacute; thể chứa Gluten</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ăn trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Bebeto (Thổ Nhĩ Kỳ)</div>
	</li>
	<li>Nơi sản xuất
	<div>Thổ Nhĩ Kỳ</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (186, 'Kẹo Bebeto vị quả mọng 36g', 6500, 10000, 'store/images/banh-keo/keo-bebeto-cool-beans-fliptop-vi-qua-mong-hop-36g-202205191134049748_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-cung">Kẹo cứng</a>&nbsp;vị quả mọng thơm ngon đầy m&ecirc; ly khiến bạn kh&ocirc;ng thể cưỡng lại. <a href="https://www.bachhoaxanh.com/keo-cung/keo-cung-bebeto-vi-qua-mong-hop-36g">Kẹo cứng Bebeto vị quả mọng hộp 36g</a>&nbsp;nhỏ gọn tiện lợi.&nbsp;<a href="https://www.bachhoaxanh.com/keo-cung-bebeto">Kẹo Bebeto</a>&nbsp;mang đến những gi&acirc;y ph&uacute;t th&uacute; vị ngọt ng&agrave;o v&agrave; thư gi&atilde;n, c&ugrave;ng chia sẻ cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo cứng Vị quả mọng</div>
	</li>
	<li>Ưu điểm
	<div>Vị quả mọng thơm ngon</div>
	</li>
	<li>Khối lượng
	<div>36g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường (48,5%), nước &eacute;p t&aacute;o đỏ c&ocirc; đặc, nước tinh bột ng&ocirc; biến tinh, chất điều chỉnh độ acid, hương liệu, chất l&agrave;m b&oacute;ng, chất l&agrave;m d&agrave;y, bột tr&aacute;i c&acirc;y (0.01%)</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Sản phẩm c&oacute; thể chứa Gluten</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>D&ugrave;ng cho người lớn v&agrave; trẻ từ 4 tuổi trở l&ecirc;n.</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>Ăn trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Bebeto (Thổ Nhĩ Kỳ)</div>
	</li>
	<li>Nơi sản xuất
	<div>Thổ Nhĩ Kỳ</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 155, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (187, 'Kẹo mút dâu Chupa Chups 60g', 23500, 27700, 'store/images/banh-keo/keo-mut-huong-dau-cay-coi-thoi-chupa-chups-goi-60g-202209171758365365_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-cung/keo-mut-huong-dau-cay-coi-thoi-chupa-chups-goi-60g">Kẹo m&uacute;t hương d&acirc;u c&acirc;y c&ograve;i thổi Chupa Chups g&oacute;i 60g</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/keo-cung">kẹo cứng</a> với vị d&acirc;u thơm thơm, vị ngọt ng&agrave;o hấp dẫn, k&iacute;ch th&iacute;ch vị gi&aacute;c. <a href="https://www.bachhoaxanh.com/keo-cung-chupa-chups">Kẹo cứng&nbsp;Chupa Chups</a> l&agrave; thương hiệu nổi tiếng được ưa chuộng bởi chất lượng v&agrave; độ an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo m&uacute;t hương d&acirc;u</div>
	</li>
	<li>Khối lượng
	<div>60g</div>
	</li>
	<li>Số lượng
	<div>4 c&acirc;y</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, siro glucoza, chất điều chỉnh độ acid (270,296, 330), hương liệu giống tự nhi&ecirc;n, chất tạo m&agrave;u tự nhi&ecirc;n (162)</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Kh&ocirc;ng d&ugrave;ng cho người dị ứng c&aacute;c th&agrave;nh phần của sản phẩm</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Chupa Chups (Bồ Đ&agrave;o Nha)</div>
	</li>
	<li>Nơi sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (188, 'Kẹo Uha đậu đỏ 105g', 46800, 52000, 'store/images/banh-keo/keo-uha-dau-do-vi-man-goi-105g-202206180942206612_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-cung/keo-uha-dau-do-vi-man-goi-105g">Kẹo Uha đậu đỏ vị mặn g&oacute;i 105g</a>&nbsp;kết hợp h&agrave;i h&oacute;a giữa c&aacute;c th&agrave;nh phần như đậu đỏ tạo độ thơm b&ugrave;i, đường tạo vị ngọt dịu v&agrave; một ch&uacute;t vị mặn từ muối tạo n&ecirc;n vi&ecirc;n <a href="https://www.bachhoaxanh.com/keo-cung">kẹo cứng</a> lạ miệng. <a href="https://www.bachhoaxanh.com/keo-cung-uha">Kẹo cứng Uha</a> c&oacute; xuất xứ từ Nhật Bản đảm bảo chất lượng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo đậu đỏ vị mặn</div>
	</li>
	<li>Khối lượng
	<div>105g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Si r&ocirc; glucose, đường, đường n&acirc;u, dầu thực vật (từ dừa), bột đậu đỏ, đường n&acirc;u (đ&atilde; chế biến), đậu đỏ, muối, m&agrave;u thực phẩm tự nhi&ecirc;n, hương đậu đỏ nh&acirc;n tạo, tinh bột bắp, chất điều vị, chiết xuất tảo bẹ,...</div>
	</li>
	<li>Th&ocirc;ng tin dị ứng
	<div>Kh&ocirc;ng d&ugrave;ng cho người bị dị ứng với c&aacute;c th&agrave;nh phần của sản phẩm</div>
	</li>
	<li>C&aacute;ch d&ugrave;ng
	<div>D&ugrave;ng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Uha (Nhật Bản)</div>
	</li>
	<li>Nơi sản xuất
	<div>Nhật Bản</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Uha l&agrave; thương hiệu kẹo c&oacute; xuất xứ từ Nhật Bản với c&aacute;c sản phẩm kẹo ngọt thơm, đa dạng hương vị mới lạ. Được th&agrave;nh lập từ khoảng năm 2008, kẹo Uha c&oacute; d&acirc;y chuyền sản xuất hiện đại, th&agrave;nh phần nguy&ecirc;n liệu được chọn lọc kỹ v&agrave; an to&agrave;n cho sức khỏe người sử dụng.<br />
<img alt="Kẹo Uha đậu đỏ vị mặn gói 105g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2687/283033/bhx/keo-uha-dau-do-vi-man-goi-105g-202206180942374407.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Kẹo được l&agrave;m từ c&aacute;c th&agrave;nh phần như bột đậu đỏ, đường n&acirc;u, đậu đỏ, muối,... Vi&ecirc;n kẹo ngọt sẽ cung cấp cho bạn nguồn năng lượng dồi d&agrave;o, b&ecirc;n cạnh đ&oacute; c&ograve;n c&oacute; c&aacute;c chất đạm, chất b&eacute;o v&agrave; một số kho&aacute;ng chất kh&aacute;c. Theo th&ocirc;ng tin được in r&otilde; tr&ecirc;n bao b&igrave; sản phẩm 100g kẹo cung cấp khoảng 386 kcal.<br />
<img alt="Kẹo Uha đậu đỏ vị mặn gói 105g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2687/283033/bhx/keo-uha-dau-do-vi-man-goi-105g-202206180942376751.jpg" /></p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng của sản phẩm đối với sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng</p>
	</li>
	<li>
	<p>Bổ sung chất dinh dưỡng</p>
	</li>
	<li>
	<p>L&agrave;m dịu cơn đ&oacute;i</p>
	</li>
	<li>
	<p>Cải thiện t&acirc;m trạng</p>
	</li>
	<li>
	<p>Nhuận tr&agrave;ng</p>
	</li>
	<li>
	<p>Điều h&ograve;a lượng đường</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Kẹo c&oacute; vị ngọt n&ecirc;n khi x&eacute; g&oacute;i bạn n&ecirc;n sớm sử dụng để tr&aacute;nh kiến v&agrave; bụi bẩn b&aacute;m v&agrave;o. Bảo quản kẹo nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh nhiệt độ cao v&agrave; &aacute;nh nắng trực tiếp từ mặt trời.<br />
Lưu &yacute;: Kh&ocirc;ng sử dụng khi kẹo bị mềm chảy, hỏng hoặc đ&atilde; hết hạn sử dụng để tr&aacute;nh l&agrave;m ảnh hưởng đến sức khỏe.<br />
<img alt="Kẹo Uha đậu đỏ vị mặn gói 105g 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2687/283033/bhx/keo-uha-dau-do-vi-man-goi-105g-202206180942371890.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Một trong những địa chỉ uy t&iacute;n kinh doanh c&aacute;c sản phẩm b&aacute;nh kẹo thơm ngon, đa dạng loại b&aacute;nh hiện nay l&agrave; B&aacute;ch h&oacute;a XANH. C&aacute;c sản phẩm tại đ&acirc;y được đảm bảo đ&uacute;ng nguồn gốc xuất xứ, chất lượng được kiểm tra nghi&ecirc;m ngặt. Khi đặt h&agrave;ng tại đ&acirc;y, bạn sẽ được giao h&agrave;ng nhanh ch&oacute;ng c&ugrave;ng nhiều ưu đ&atilde;i, khuyến m&atilde;i hấp dẫn.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-06-01 20:45:02', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (189, 'Kẹo sữa dâu Milkita 84g', 15800, 17500, 'store/images/banh-keo/keo-sua-vi-dau-milkita-goi-84g-202205191006431042_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với hương d&acirc;u thơm ngon. <a href="https://www.bachhoaxanh.com/keo-cung">Kẹo cứng</a> ngọt, b&eacute;o ngậy vị sữa, k&iacute;ch th&iacute;ch vị gi&aacute;c v&ocirc; c&ugrave;ng. <a href="https://www.bachhoaxanh.com/keo-cung/keo-sua-vi-dau-milkita-goi-84g">Kẹo sữa vị d&acirc;u Milkita g&oacute;i 84g</a> hương vị thơm ngon, hợp khẩu vị mọi lứa tuổi. <a href="https://www.bachhoaxanh.com/keo-cung-milkita">kẹo cứng Milkita</a> l&agrave; một trong những thương hiệu sản xuất kẹo được ưa chuộng, với chất lượng hảo hạng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo sữa vị d&acirc;u</div>
	</li>
	<li>Khối lượng
	<div>84g</div>
	</li>
	<li>Năng lượng
	<div>60 kcal</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, đường glucose, sữa đặc (30%), dầu dừa đ&atilde; hydro h&aacute;o, bơ, chất điều chỉnh độ acid (INS 170(i)), chất nhũ h&oacute;a thực vật (lecithin đậu n&agrave;nh (INS 322(i)), hương d&acirc;u tự nhi&ecirc;n v&agrave; tổng hợp, chiết xuất d&acirc;u (0.019%), m&agrave;u tổng hợp (INS 127)</div>
	</li>
	<li>Thương hiệu
	<div>Milkita (Indonesia)</div>
	</li>
	<li>Nơi sản xuất
	<div>Indonesia</div>
	</li>
</ul>

<div class="description">
<h3>Đ&ocirc;i n&eacute;t về thương hiệu Milkita</h3>

<p>Milkita, thương hiệu kẹo sữa dinh dưỡng rất nổi tiếng c&oacute; xuất xứ từ Indonesia, thuộc sở hữu của tập đo&agrave;n Unifam, c&aacute;c sản phẩm mang thương hiệu Mikita xuất hiện ch&iacute;nh thức tại Việt Nam từ năm 2011 v&agrave; được nhập khẩu bởi C&ocirc;ng ty TNHH United Family Food Việt Nam (c&ocirc;ng ty th&agrave;nh vi&ecirc;n của tập đo&agrave;n Unifam). Sau hơn 10 năm c&oacute; mặt tại thị trường nước ta, kẹo sữa dinh dưỡng Milkita đ&atilde; được ph&acirc;n phối khắp 63 tỉnh th&agrave;nh tr&ecirc;n cả nước, tại hơn 300.000 điểm b&aacute;n h&agrave;ng, trong đ&oacute; c&oacute; B&aacute;ch h&oacute;a XANH.</p>

<h3>Th&agrave;nh phần dinh dưỡng trong kẹo sữa vị d&acirc;u Milkita</h3>

<p>Sản phẩm kẹo sữa vị d&acirc;u Mikita ngo&agrave;i hương vị d&acirc;u thơm ngon, hấp dẫn c&ograve;n c&oacute; chứa những th&agrave;nh phần dinh dưỡng như: Năng lượng, chất b&eacute;o, đường, carbohydrate, calcium,... Theo th&ocirc;ng tin tr&ecirc;n bao b&igrave; cung cấp th&igrave; trong 100g kẹo sữa Mikita sẽ bổ sung khoảng 428.5 kcal.<br />
<img alt="Kẹo sữa vị dâu Milkita gói 84g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2687/228984/bhx/keo-sua-vi-dau-milkita-goi-84g-202205191006431042.jpg" /></p>

<h3>T&aacute;c dụng của kẹo sữa vị d&acirc;u Milkita với sức khỏe</h3>

<p>C&aacute;c sản phẩm kẹo sữa dinh dưỡng của Mikita đều được l&agrave;m từ 100% sữa b&ograve; nguy&ecirc;n chất, trải qua quy tr&igrave;nh sản xuất v&agrave; đ&oacute;ng g&oacute;i đạt ti&ecirc;u chuẩn an to&agrave;n vệ sinh, n&ecirc;n rất an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.</p>

<ul>
	<li>
	<p>Cung cấp năng lượng cho cơ thể.</p>
	</li>
	<li>
	<p>Ngăn ngừa bệnh trầm cảm.</p>
	</li>
	<li>
	<p>Chứa calcium gi&uacute;p xương chắc khỏe.</p>
	</li>
</ul>

<h3>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản kẹo sữa vị d&acirc;u Milkita</h3>

<p>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, kh&ocirc;ng đặt sản phẩm ở nơi c&oacute; nhiệt độ qu&aacute; cao hoặc dưới &aacute;nh nắng mặt trời. Lưu &yacute;, d&ugrave;ng trực tiếp ngay sau khi mở bao b&igrave; sản phẩm v&agrave; kh&ocirc;ng sử dụng sản phẩm đ&atilde; hết hạn hoặc c&oacute; c&aacute;c dấu hiệu hư hỏng để tr&aacute;nh l&agrave;m ảnh hưởng đến sức khỏe.</p>

<h3>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</h3>

<p>Nếu bạn muốn mua c&aacute;c sản phẩm kẹo sữa Milkita ch&iacute;nh h&atilde;ng h&atilde;y đến c&aacute;c cửa h&agrave;ng của B&aacute;ch h&oacute;a XANH. Tại đ&acirc;y c&aacute;c sản phẩm c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, được nh&acirc;n vi&ecirc;n giao h&agrave;ng tận nơi.</p>

<p>Đặc biệt khi mua sắm online tại trang website www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n điện thoại để được giao h&agrave;ng nhanh ch&oacute;ng tận nh&agrave; c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (190, 'Kẹo sữa Milkita 84g', 15800, 17500, 'store/images/banh-keo/keo-sua-milkita-goi-84g-202205190957294958_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-cung">Kẹo</a> ngọt, mềm lại c&oacute; hương vị beo b&eacute;o của sữa b&ograve;, cảm gi&aacute;c như tan trong miệng rất th&iacute;ch. <a href="https://www.bachhoaxanh.com/keo-cung/keo-sua-milkita-goi-84g">Kẹo mềm sữa b&ograve; Milkita g&oacute;i 84g</a> được đ&oacute;ng g&oacute;i từng vi&ecirc;n mang theo b&ecirc;n m&igrave;nh v&agrave; chia sẻ cho bạn b&egrave;. <a href="https://www.bachhoaxanh.com/keo-cung-milkita">Kẹo Mikita</a> thơm ngon, ngọt ng&agrave;o v&agrave; b&eacute;o ngậy được&nbsp; nhiều bạn y&ecirc;u th&iacute;ch.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo cứng</div>
	</li>
	<li>Khối lượng
	<div>84g</div>
	</li>
	<li>Năng lượng
	<div>60 kcal</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, đường glucose, sữa đặc (30%), dầu dừa đ&atilde; hydro h&aacute;o, bơ, chất điều chỉnh độ acid (INS 170(i)), chất nhũ h&oacute;a thực vật (lecithin đậu n&agrave;nh (INS 322(i)), hương sữa tự nhi&ecirc;n v&agrave; tổng hợp.</div>
	</li>
	<li>Thương hiệu
	<div>Milkita (Indonesia)</div>
	</li>
	<li>Nơi sản xuất
	<div>Indonesia</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (191, 'Kẹo sữa dưa lưới Milkita 84g', 15750, 17500, 'store/images/banh-keo/keo-sua-vi-dua-luoi-milkita-goi-84g-202205190957340179_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với hương dưa lưới thơm ngon. <a href="https://www.bachhoaxanh.com/keo-cung">Kẹo</a> ngọt, b&eacute;o ngậy vị sữa, k&iacute;ch th&iacute;ch vị gi&aacute;c v&ocirc; c&ugrave;ng. <a href="https://www.bachhoaxanh.com/keo-cung/keo-sua-vi-dua-luoi-milkita-goi-84g">Kẹo sữa vị dưa lưới Milkita g&oacute;i 84g</a> hương vị thơm ngon, hợp khẩu vị mọi lứa tuổi. <a href="https://www.bachhoaxanh.com/keo-cung-milkita">kẹo cứng Milkita</a> l&agrave; một trong những thương hiệu sản xuất kẹo được ưa chuộng, với chất lượng hảo hạng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo sữa vị dưa lưới</div>
	</li>
	<li>Khối lượng
	<div>84g</div>
	</li>
	<li>Năng lượng
	<div>60 kcal</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, đường glucose, sữa đặc (30%), dầu dừa đ&atilde; hydro h&aacute;o, bơ, chất điều chỉnh độ acid (INS 170(i)), chất nhũ h&oacute;a thực vật (lecithin đậu n&agrave;nh (INS 322(i)), hương dưa tự nhi&ecirc;n v&agrave; tổng hợp, chiết xuất dưa (0.019%), m&agrave;u tổng hợp (INS 102, INS 133)</div>
	</li>
	<li>Thương hiệu
	<div>Milkita (Indonesia)</div>
	</li>
	<li>Nơi sản xuất
	<div>Indonesia</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (192, 'Kẹo sữa socola Milkita 84g', 15750, 17500, 'store/images/banh-keo/keo-sua-vi-socola-milkita-goi-84g-202205191006402605_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với hương socola thơm ngon. <a href="https://www.bachhoaxanh.com/keo-cung">Kẹo</a> ngọt, b&eacute;o ngậy vị sữa, k&iacute;ch th&iacute;ch vị gi&aacute;c v&ocirc; c&ugrave;ng. <a href="https://www.bachhoaxanh.com/keo-cung/keo-sua-vi-socola-milkita-goi-84g">Kẹo sữa vị socola Milkita g&oacute;i 84g</a> hương vị thơm ngon, hợp khẩu vị mọi lứa tuổi. <a href="https://www.bachhoaxanh.com/keo-cung-milkita">kẹo cứng Milkita</a> l&agrave; một trong những thương hiệu sản xuất kẹo được ưa chuộng, với chất lượng hảo hạng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo sữa vị socola</div>
	</li>
	<li>Khối lượng
	<div>84g</div>
	</li>
	<li>Năng lượng
	<div>60 kcal</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, đường glucose, sữa đặc (30%), dầu dừa đ&atilde; hydro h&aacute;o, bơ, chất điều chỉnh độ acid (INS 170(i)), chất nhũ h&oacute;a thực vật (lecithin đậu n&agrave;nh (INS 322(i)), hương socola tự nhi&ecirc;n v&agrave; tổng hợp.</div>
	</li>
	<li>Thương hiệu
	<div>Milkita (Indonesia)</div>
	</li>
	<li>Nơi sản xuất
	<div>Indonesia</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (193, 'Kẹo dẻo Chupa Chups Panda Bears 90g', 19000, 22500, 'store/images/banh-keo/keo-deo-huong-trai-cay-tong-hop-chupa-chups-panda-bears-goi-90g-202205201402523730_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">C&oacute; 4 hương vị <a href="https://www.bachhoaxanh.com/keo-mem">kẹo mềm</a> thơm ngon hấp dẫn (hương d&acirc;u, hương cam, hương chanh, hương t&aacute;o), h&igrave;nh gấu ngộ nghĩnh, tạo cảm gi&aacute;c th&iacute;ch th&uacute; khi thưởng thức.&nbsp;<a href="https://www.bachhoaxanh.com/keo-mem/keo-deo-huong-trai-cay-tong-hop-panda-bears-chupa-chups-goi-90g">Kẹo dẻo hương tr&aacute;i c&acirc;y tổng hợp Chupa Chups Panda Bears g&oacute;i 90g</a> dai ngon đến từ <a href="https://www.bachhoaxanh.com/keo-mem-chupa-chups">kẹo&nbsp;mềm Chupa Chups</a> thương hiệu T&acirc;y Ban Nha</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo dẻo hương tr&aacute;i c&acirc;y tổng hợp</div>
	</li>
	<li>Ưu điểm
	<div>C&oacute; 4 hương vị thơm ngon hấp dẫn (hương d&acirc;u, hương cam, hương chanh, hương t&aacute;o), h&igrave;nh gấu ngộ nghĩnh, tạo cảm gi&aacute;c th&iacute;ch th&uacute; khi thưởng thức</div>
	</li>
	<li>Khối lượng
	<div>90g</div>
	</li>
	<li>Số lượng
	<div>~ 25 vi&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sir&ocirc; glucoza, đường, chất l&agrave;m dầy (tinh bột xử l&yacute; oxy ho&aacute; 1404), gelatin, chất điều chỉnh độ acid (E330), hương (d&acirc;u, cam, t&aacute;o) giống tự nhi&ecirc;n, hương chanh tự nhi&ecirc;n, chất l&agrave;m b&oacute;ng (E903), s&aacute;p ong (E901), m&agrave;u tự nhi&ecirc;n, m&agrave;u tổng hợp</div>
	</li>
	<li>Thương hiệu
	<div>Chupa Chups (T&acirc;y Ban Nha)</div>
	</li>
	<li>Sản xuất
	<div>Trung Quốc</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (194, 'Kẹo dẻo hình ly Bebeto 120g', 23000, 27000, 'store/images/banh-keo/keo-deo-bebeto-hinh-ly-soft-drinks-hu-120g-202205200933263897_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-mem-bebeto">Kẹo dẻo Bebeto</a> l&agrave; 1 trong c&aacute;c loại <a href="https://www.bachhoaxanh.com/keo-mem">kẹo dẻo</a>&nbsp;rất phổ biến, được rất nhiều c&aacute;c bạn trẻ y&ecirc;u th&iacute;ch bởi hương vị v&ocirc; c&ugrave;ng thơm ngon. Với sản phẩm <a href="https://www.bachhoaxanh.com/keo-mem/keo-deo-bebeto-hinh-ly-soft-drinks-hu-120g">kẹo dẻo h&igrave;nh ly Soft Drinks Bebeto hũ 120g</a> mang hương vị ấn tượng với hương tr&aacute;i c&acirc;y độc đ&aacute;o, dạng ly nước ngọt rất đặc biệt.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo dẻo</div>
	</li>
	<li>Ưu điểm
	<div>Sản phẩm ăn liền tiện lợi</div>
	</li>
	<li>Khối lượng
	<div>120g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Glucose syrup 44.489%, đường, tinh bột bắp, nước gelatin, chất điều chỉnh độ acid, hương liệu, chất tạo m&agrave;u</div>
	</li>
	<li>Thương hiệu
	<div>Bebeto (Thổ Nhĩ Kỳ)</div>
	</li>
	<li>HDSD
	<div>D&ugrave;ng ngay sau khi mở g&oacute;i. Trẻ em khi ăn cần c&oacute; sự gi&aacute;m s&aacute;t của người lớn.</div>
	</li>
	<li>Bảo quản
	<div>Giữ ở nơi kh&ocirc; r&aacute;o, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất
	<div>Thổ Nhĩ Kỳ</div>
	</li>
	<li>Số calo
	<div>377.000 (t&iacute;nh tr&ecirc;n 100g)</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 122, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (195, 'Kẹo dẻo trái cây Alpenliebe Jelly 90g', 20000, 23500, 'store/images/banh-keo/keo-deo-huong-trai-cay-hon-hop-alpenliebe-jelly-bien-xanh-long-lanh-goi-90g-202304081533350500_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-mem/keo-mem-huong-trai-cay-hon-hop-alpenliebe-jelly-bien-xanh-long-lanh-goi-90g">Kẹo dẻo hương tr&aacute;i c&acirc;y hỗn hợp Alpenliebe Jelly biển xanh long lanh g&oacute;i 90g</a> l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/keo-mem">kẹo dẻo</a> c&oacute; h&igrave;nh d&aacute;ng sao biển, bạch tuột, r&ugrave;a, c&aacute; hề ngộ nghĩnh đ&aacute;ng y&ecirc;u. <a href="https://www.bachhoaxanh.com/keo-mem-alpenliebe">Kẹo dẻo&nbsp;Alpenliebe</a> c&oacute; nh&acirc;n vị tr&aacute;i c&acirc;y b&ugrave;ng nổ, hương tr&aacute;i c&acirc;y chua ngọt hấp dẫn vị gi&aacute;c.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo mềm hương tr&aacute;i c&acirc;y hỗn hợp</div>
	</li>
	<li>Nh&acirc;n kẹo
	<div>Kẹo dẻo nhập khẩu</div>
	</li>
	<li>Ưu điểm
	<div>Được chiết xuất từ nước &eacute;p tr&aacute;i c&acirc;y</div>
	</li>
	<li>Khối lượng
	<div>90g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Siro glucoza, đường, chất l&agrave;m d&agrave;y, gelatin, chất điều chỉnh độ aicd, nước &eacute;p tr&aacute;i c&acirc;y c&ocirc; đặc (3%) (dứa, t&aacute;o, vải) (0.36%), hương liệu tổng hợp, dầu thực vật, chất l&agrave;m b&oacute;ng, chất tạo m&agrave;u tổng hợp,...</div>
	</li>
	<li>Thương hiệu
	<div>Alpenliebe (&Yacute;)</div>
	</li>
	<li>HDSD
	<div>D&ugrave;ng trực tiếp</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (196, 'Kẹo chanh dây hạt chia Alpenliebe 2Chew 84g', 12700, 15000, 'store/images/banh-keo/keo-mem-huong-chanh-day-hat-chia-alpenliebe-2chew-goi-84g-202304081531072339_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-mem/keo-mem-huong-chanh-day-hat-chia-alpenliebe-2chew-goi-84g">Kẹo mềm hương chanh d&acirc;y hạt chia Alpenliebe 2Chew g&oacute;i 84g</a> l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/keo-mem">kẹo mềm</a> tr&aacute;i c&acirc;y thơm ngon. <a href="https://www.bachhoaxanh.com/keo-mem-alpenliebe">Kẹo mềm&nbsp;Alpenliebe</a> c&oacute; hương chanh d&acirc;y chua ngọt kết hợp với hạt chia, sản phẩm c&oacute; th&agrave;nh phần nước &eacute;p tr&aacute;i c&acirc;y tạo hương thơm, vị chua ngọt v&agrave; hấp dẫn vị gi&aacute;c.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo mềm hương chanh d&acirc;y hạt chia</div>
	</li>
	<li>Nh&acirc;n kẹo
	<div>Kẹo dẻo nhập khẩu</div>
	</li>
	<li>Ưu điểm
	<div>Được chiết xuất từ nước &eacute;p tr&aacute;i c&acirc;y</div>
	</li>
	<li>Khối lượng
	<div>84g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, siro glucoza, dầu dừa hydro h&oacute;a, gelatin, hạt chia (1.5%), dịch quả chanh d&acirc;y ho&agrave;n nguy&ecirc;n (1%), chất điều chỉnh độ aicd, acid lactic, acid malic, chất nhũ h&oacute;a, hương liệu chanh d&acirc;y giống tự nhi&ecirc;n, chất tạo m&agrave;u tự nhi&ecirc;n,...</div>
	</li>
	<li>Thương hiệu
	<div>Alpenliebe (&Yacute;)</div>
	</li>
	<li>HDSD
	<div>D&ugrave;ng trực tiếp</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Sản xuất
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (197, 'Kẹo dẻo Amos Robot 4D 72g', 24300, 27000, 'store/images/banh-keo/keo-deo-amos-robot-4d-goi-72g-202205191553254535_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với h&igrave;nh d&aacute;ng ngộ nghĩnh, th&uacute; vị c&ugrave;ng với nh&acirc;n nước tr&aacute;i c&acirc;y,&nbsp;<a href="https://www.bachhoaxanh.com/keo-mem/keo-deo-amos-robot-4d-goi-72g">Kẹo dẻo Amos Robot 4D g&oacute;i 72g</a> khiến bạn m&ecirc; mẩn với hương tr&aacute;i c&acirc;y b&ecirc;n trong. <a href="https://www.bachhoaxanh.com/keo-mem">Kẹo mềm</a> ăn dẻo dẻo, dai dai, vừa ăn vừa vui. <a href="https://www.bachhoaxanh.com/keo-mem-amos">Kẹo mềm Amos</a> l&agrave; thương hiệu sản xuất những kẹo h&igrave;nh d&aacute;ng xinh xắn, ngộ nghĩnh</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo dẻo</div>
	</li>
	<li>Khối lượng
	<div>72g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Glucose, syrup, sugar, water, gelatin, sorbitol, malic acid, pectin, coconut oil,...</div>
	</li>
	<li>Năng lượng
	<div>80 calories</div>
	</li>
	<li>Thương hiệu
	<div>Amos</div>
	</li>
	<li>HDSD
	<div>Kẹo d&ugrave;ng ngay khi mở g&oacute;i</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Sản xuất
	<div>Trung Quốc</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (198, 'Kẹo Ferrero Confetteria Raffaello 150g', 180500, 190000, 'store/images/banh-keo/keo-ferrero-confetteria-raffaello-hop-150g-202302041052575141_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với lớp dừa kh&ocirc; được phủ bền ngo&agrave;i, b&ecirc;n trong c&oacute; một lớp kem cứng v&agrave; kẹp giữa l&agrave; một lớp vỏ gi&ograve;n tan kết hợp với nhau thật đ&uacute;ng điệu. <a href="https://www.bachhoaxanh.com/keo-mem/keo-ferrero-confetteria-raffaello-hop-150g">Kẹo Ferrero Confetteria Raffaello hộp 150g</a> tiện lợi, được đ&oacute;ng g&oacute;i từng vi&ecirc;n ri&ecirc;ng tiện lợi.&nbsp;<a href="https://www.bachhoaxanh.com/keo-mem"> Kẹo</a><a href="https://www.bachhoaxanh.com/keo-mem-ferrero">&nbsp;Ferrero</a> được sản xuất tại Ba Lan</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo bọc dừa nh&acirc;n hạnh nh&acirc;n</div>
	</li>
	<li>Khối lượng
	<div>150g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Dừa kh&ocirc; 25.5%, chất b&eacute;o thực vật, đường, hạt hạnh nh&acirc;n nguy&ecirc;n hạt 8%, sữa bột gầy, whey bột, bột m&igrave;, tinh bột sắn, hương liệu tự nhi&ecirc;n v&agrave; giống tự nhi&ecirc;n, chất nhũ ho&aacute;, chất tạo xốp</div>
	</li>
	<li>HDSD
	<div>Kẹo d&ugrave;ng ngay khi mở g&oacute;i</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Thương hiệu
	<div>Ferrero</div>
	</li>
	<li>Sản xuất
	<div>Ba Lan</div>
	</li>
</ul>

<div class="description">
<h3><strong>Th&ocirc;ng tin dinh dưỡng</strong></h3>
Kẹo Ferrero Confetteria Raffaello hộp 150g với hương vị thơm ngon, đặc biệt c&ograve;n c&oacute; dừa kh&ocirc;, bột sẵn, hạt hạnh nh&acirc;n,... cung cấp nhiều chất dinh dưỡng cho người sử dụng. Với khoảng 3 vi&ecirc;n 38g mỗi ng&agrave;y bạn đ&atilde; được cung cấp 220kcal năng lượng hoạt động cho cả ng&agrave;y, kh&ocirc;ng chỉ c&oacute; năng lượng m&agrave; c&ograve;n cung cấp 1 lượng sodium 20mg, canxi 4% v&agrave; sắt 4%, lượng vi chất dinh dưỡng n&agrave;y đến từ hạnh nh&acirc;n c&oacute; trong socola

<h3><strong>C&aacute;ch sử dụng kẹo</strong></h3>
Kẹo thơm ngon, l&agrave; m&oacute;n ăn vặt trực tiếp thơm ngon hoặc thưởng thức kẹo với tr&agrave; đem lại cảm gi&aacute;c thư th&aacute;i, dễ chịu v&agrave; đậm vị trong cuốn họng rất th&iacute;ch. Tạo cảm gi&aacute;c thoải m&aacute;i, b&igrave;nh y&ecirc;n.

<h3><strong>C&aacute;ch bảo quản kẹo</strong></h3>
Kẹo n&ecirc;n được bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Khi mở sản phẩm n&ecirc;n sử dụng liền. Tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời.</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (199, 'Kẹo dẻo hình gấu Yumearth 50g', 48000, 0, 'store/images/banh-keo/keo-deo-huu-co-hinh-gau-yumearth-goi-50g-202205191553161878_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Với vị dai, ngon v&agrave; thơm dẻo đ&atilde; m&ecirc; hoặc khẩu vị của nhiều người. Yumearth đ&atilde; cho ra sản phẩm kẹo dẻo hữu cơ h&igrave;nh gấu vị tr&aacute;i c&acirc;y Yumearth g&oacute;i 50g nhằm đ&aacute;p ứng nhu cầu của người d&ugrave;ng.&nbsp;c&oacute; h&igrave;nh d&aacute;ng ngộ nghĩnh dạng gấu, khiến trẻ th&iacute;ch th&uacute; v&agrave; kh&aacute;m ph&aacute;. M&agrave;u sắc nổi bật thu h&uacute;t trẻ.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo dẻo hữu cơ</div>
	</li>
	<li>Ưu điểm
	<div>Th&agrave;nh phần được chứng nhận hữu cơ</div>
	</li>
	<li>Ph&ugrave; hợp
	<div>Cho b&eacute;</div>
	</li>
	<li>Khối lượng
	<div>50g</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Si r&ocirc; gạo, đường m&iacute;a, hương liệu tự nhi&ecirc;n (lựu), tinh chất c&agrave; rốt... dầu thực vật</div>
	</li>
	<li>Thương hiệu
	<div>Yumearth</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Sản xuất
	<div>Mexico</div>
	</li>
</ul>

<div class="description">
<p><a href="https://www.bachhoaxanh.com/keo-mem">Kẹo dẻo</a> l&agrave; một trong những m&oacute;n ăn kho&aacute;i khẩu v&agrave; ưa th&iacute;ch của trẻ em. Với vị dai, ngon v&agrave; thơm dẻo đ&atilde; m&ecirc; hoặc khẩu vị của nhiều người. <a href="https://www.bachhoaxanh.com/keo-mem-yumearth">Kẹo mềm Yumearth</a> đ&atilde; cho ra sản phẩm <a href="https://www.bachhoaxanh.com/keo-mem/keo-deo-huu-co-hinh-gau-vi-trai-cay-yumearth-goi-50g">kẹo dẻo hữu cơ h&igrave;nh gấu vị tr&aacute;i c&acirc;y Yumearth g&oacute;i 50g</a> nhằm đ&aacute;p ứng nhu cầu của người d&ugrave;ng</p>

<p style="text-align:center"><img alt="Kẹo dẻo hữu cơ hình gấu Yumearth gói 50g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/7199/236619/bhx/keo-deo-huu-co-hinh-gau-vi-trai-cay-yumearth-goi-50g-202104031438416780.jpg" style="height:600px; width:800px" /></p>

<p>Kẹo dẻo hữu cơ h&igrave;nh gấu vị tr&aacute;i c&acirc;y Yumearth g&oacute;i 50g c&oacute; h&igrave;nh d&aacute;ng ngộ nghĩnh dạng gấu, khiến trẻ th&iacute;ch th&uacute; v&agrave; kh&aacute;m ph&aacute;. M&agrave;u sắc nổi bật thu h&uacute;t trẻ. <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/vua-hoc-vua-choi-cung-be-voi-keo-deo-vidal-1266679">C&aacute;c b&eacute; c&oacute; thể vừa học vừa chơi nữa đấy nh&eacute;</a></p>

<p style="text-align:center"><img alt="Kẹo dẻo hữu cơ hình gấu Yumearth gói 50g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/7199/236619/bhx/keo-deo-huu-co-hinh-gau-vi-trai-cay-yumearth-goi-50g-202104031438429160.jpg" style="height:600px; width:800px" /></p>

<p>Vị tr&aacute;i c&acirc;y thanh, ngọt dịu thật kh&oacute; cưỡng. G&oacute;i 50g chứa đủ một lượng d&ugrave;ng (t&ugrave;y người), gi&uacute;p cho việc sử dụng v&agrave; bảo quản được dễ d&agrave;ng hơn.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (200, 'Kẹo mềm hương trái cây Sugus 210g', 39500, 0, 'store/images/banh-keo/keo-mem-huong-trai-cay-sugus-goi-210g-202205201328416372_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/keo-mem">Kẹo mềm</a> c&oacute; hương vị thanh m&aacute;t, chua ngọt của tr&aacute;i c&acirc;y tươi ho&agrave; quyện trong vi&ecirc;n kẹo mềm dẻo, k&iacute;ch th&iacute;ch mọi gi&aacute;c quan.&nbsp;<a href="https://www.bachhoaxanh.com/keo-mem/keo-mem-sugus-trai-cay-tui-210g">Kẹo mềm hương tr&aacute;i c&acirc;y Sugus g&oacute;i 210g</a> tiện lợi, được chia th&agrave;nh nhiều vi&ecirc;n nhỏ dễ bảo quản.<a href="https://www.bachhoaxanh.com/keo-mem-sugus"> Kẹo mềm Sugus</a> mềm mềm dai ngon, ăn ngọt th&iacute;ch m&ecirc;</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo mềm hương tr&aacute;i c&acirc;y</div>
	</li>
	<li>Ưu điểm
	<div>Vị tr&aacute;i c&acirc;y tươi chua ngọt ho&agrave; quyện trong vi&ecirc;n kẹo mềm dẻo, hương thơm quyến rũ, k&iacute;ch th&iacute;ch mọi gi&aacute;c quan.</div>
	</li>
	<li>Khối lượng
	<div>210g</div>
	</li>
	<li>Số lượng
	<div>70 vi&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Đường, xiro glucose, dầu dừa, gelatin (Bovine gelatin), chất điều chỉnh độ axit (acid citric 330, acid matic 296), hương d&acirc;u, nho, cam, t&aacute;o tự nhi&ecirc;n v&agrave; tổng hợp, chất l&agrave;m d&agrave;y (Gum Arbic 414), m&agrave;u thực phẩm tổng hợp (Azorubine 122, Sunset yellow 110, Tartrazine 102, Indigoo carmine 132, Brilliant Blue 133).</div>
	</li>
	<li>Năng lượng
	<div>122kcal/30g</div>
	</li>
	<li>Thương hiệu
	<div>Sugus (Th&aacute;i Lan)</div>
	</li>
	<li>HDSD
	<div>Kẹo d&ugrave;ng ngay khi mở g&oacute;i</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Sản xuất
	<div>Th&aacute;i Lan</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Sugus</strong></h3>

<p>Sugus l&agrave; thương hiệu kẹo của Thụy Sỹ&nbsp;nổi tiếng tr&ecirc;n thế giới được th&agrave;nh lập v&agrave;o năm 1931, thuộc sở hữu của C&ocirc;ng ty Wrigley. C&aacute;c sản phẩm kẹo mang thương hiệu Sugus được rất nhiều người ti&ecirc;u d&ugrave;ng ưa chuộng, kh&ocirc;ng những trẻ em m&agrave; c&ograve;n cả người lớn bởi&nbsp;hương vị kẹo hấp dẫn v&agrave; tuyệt vời, khi ăn cảm gi&aacute;c tan chảy trong miệng.</p>

<h3><img alt="Kẹo mềm hương trái cây Sugus gói 210g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/7199/79592/bhx/keo-mem-sugus-trai-cay-tui-210g-2-org.jpg" /><br />
<strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Kẹo mềm hương tr&aacute;i c&acirc;y Sugus g&oacute;i 210g c&oacute; chứa những th&agrave;nh phần dinh dưỡng ch&iacute;nh như: Đường, c&aacute;c kho&aacute;ng chất v&agrave; vitamin cần thiết cho cơ thể.&nbsp;Trong 100g kẹo mềm Sugus tr&aacute;i c&acirc;y c&oacute; khoảng <strong>406 Kcal.</strong></p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Kh&ocirc;ng những c&oacute; hương vị ngọt thanh hấp dẫn của tr&aacute;i c&acirc;y, m&agrave; kẹo mềm Sugus c&ograve;n c&oacute; nhiều c&ocirc;ng dụng tốt cho sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng cho cơ thể.</p>
	</li>
	<li>
	<p>Bổ sung lượng đường cho m&aacute;u.</p>
	</li>
	<li>
	<p>Gi&uacute;p cơ thể hoạt động năng suất hơn.</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Sản phẩm kẹo mềm Sugus được đ&oacute;ng g&oacute;i th&agrave;nh từng vi&ecirc;n kẹo nhỏ 3g&nbsp;n&ecirc;n rất tiện lợi khi sử dụng v&agrave; dễ d&agrave;ng bảo quản.</p>

<ul style="margin-left:40px">
	<li>
	<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp của mặt trời</p>
	</li>
	<li>
	<p>Kh&ocirc;ng sử dụng sản phẩm đ&atilde; hết hạn.</p>
	</li>
	<li>
	<p>Ngo&agrave;i sử dụng trực tiếp, kẹo c&ograve;n c&oacute; thể l&agrave;m nguy&ecirc;n liệu chế biến nhiều m&oacute;n ăn kh&aacute;c.</p>
	</li>
</ul>

<h3><img alt="Kẹo mềm hương trái cây Sugus gói 210g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/7199/79592/bhx/keo-mem-sugus-trai-cay-tui-210g-4-org.jpg" /><br />
<strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Hiện nay, B&aacute;ch h&oacute;a XANH l&agrave; một trong những địa chỉ uy t&iacute;n kinh doanh c&aacute;c sản phẩm kẹo Sugus&nbsp;ch&iacute;nh h&atilde;ng, nguồn gốc xuất xứ r&otilde; r&agrave;ng. Bạn c&oacute; thể đặt h&agrave;ng tại www.bachhoaxanh.com hoặc ở ứng dụng B&aacute;ch h&oacute;a XANH tr&ecirc;n điện thoại để được giao h&agrave;ng nhanh ch&oacute;ng tận nh&agrave; c&ugrave;ng nhiều ưu đ&atilde;i hấp dẫn.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (201, 'Kẹo gum Hubba Bubba mâm xôi 56.7g', 38500, 45500, 'store/images/banh-keo/keo-sing-gum-hubba-bubba-vi-mam-xoi-hop-567g-202205201435563053_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/singum-keo-cao-su-hubba-bubba">Kẹo singum Hubba Bubba</a> được đ&oacute;ng trong hộp dẹp tr&ograve;n xinh xắn với khối lượng 56.7g, tiện lợi khi sử dụng v&agrave; c&oacute; h&igrave;nh d&aacute;ng lạ so với c&aacute;c sản phẩm c&ugrave;ng loại tạo n&ecirc;n sự th&iacute;ch th&uacute; khi ăn. <a href="https://www.bachhoaxanh.com/singum-keo-cao-su/keo-sing-gum-hubba-bubba-vi-mam-xoi-hop-567g">Kẹo sing-gum Hubba Bubba vị m&acirc;m x&ocirc;i hộp 56.7g</a> c&oacute; vị&nbsp;chua chua tự nhi&ecirc;n, thơm ngon v&agrave; k&iacute;ch th&iacute;ch vị gi&aacute;c.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo sing-gum vị m&acirc;m x&ocirc;i</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>56.7g</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Đường, chất gum nền, si r&ocirc; bắp, chất điều chỉnh độ, hương tự nhi&ecirc;n,...</div>
	</li>
	<li>Lưu ý
	<div>Sản phẩm c&oacute; chứa cốt g&ocirc;m, kh&ocirc;ng được nuốt</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; thoáng, tránh ánh nắng trực ti&ecirc;́p</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Hubba Bubba</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Hubba Bubba l&agrave; thương hiệu <a href="https://www.bachhoaxanh.com/singum-keo-cao-su">kẹo singum</a> cuộn nổi tiếng. Đ&acirc;y l&agrave; thương hiệu kẹo c&oacute; xuất xứ từ Đức, Mỹ,... v&agrave; được nhập về Việt Nam trong v&agrave;i năm trở lại đ&acirc;y. Với đa dạng hương vị c&ugrave;ng nguồn nguy&ecirc;n liệu an to&agrave;n cho sức khỏe gi&uacute;p c&aacute;c sản phẩm kẹo cao su Hubba Bubba được người ti&ecirc;u d&ugrave;ng tin tưởng lựa chọn.<br />
<img alt="Kẹo sing-gum Hubba Bubba vị mâm xôi hộp 56.7g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/4888/239236/bhx/keo-sing-gum-hubba-bubba-vi-mam-xoi-hop-567g-202105221056476743.jpg" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Kẹo cao su sẽ cung cấp cho cơ thể kh&ocirc;ng chỉ l&agrave; nguồn năng lượng m&agrave; c&ograve;n bổ sung c&aacute;c chất như đường, carbohydrate, chất đạm v&agrave; một số chất kh&aacute;c. Theo một số th&ocirc;ng tin trong 100g kẹo cao su chứa khoảng 360 kcal.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng cho sức khỏe như:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng</p>
	</li>
	<li>
	<p>Cải thiện hơi thở</p>
	</li>
	<li>
	<p>Loại sạch thức ăn thừa</p>
	</li>
	<li>
	<p>L&agrave;m sạch khoang miệng</p>
	</li>
	<li>
	<p>Bổ sung c&aacute;c chất đường, đạm,...</p>
	</li>
	<li>
	<p>Cải thiện tinh thần v&agrave; t&acirc;m trạng</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<p>Sản phẩm được đ&oacute;ng trong hộp đẹp, h&igrave;nh d&aacute;ng tr&ograve;n xinh xắn, tiện lợi khi sử dụng v&agrave; kẹo c&oacute; h&igrave;nh d&aacute;ng cuộn lạ hơn so với c&aacute;c sản phẩm c&ugrave;ng loại tạo n&ecirc;n sự th&iacute;ch th&uacute; khi ăn. Vị m&acirc;m x&ocirc;i lạ miệng, thơm ngon v&agrave; k&iacute;ch th&iacute;ch vị gi&aacute;c cho người sử dụng.</p>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>C&aacute;c sản phẩm kẹo n&agrave;y c&oacute; vị ngọt v&agrave; thơm n&ecirc;n rất dễ thu h&uacute;t kiến. Khi đ&atilde; mở hộp kẹo n&ecirc;n d&ugrave;ng sớm tr&aacute;nh để kẹo ở nơi ẩm ướt, nhiệt độ cao hay tiếp x&uacute;c trực tiếp với &aacute;nh nắng mặt trời.<br />
Lưu &yacute;: Kh&ocirc;ng n&ecirc;n sử dụng nếu dị ứng th&agrave;nh phần sản phẩm, sản phẩm c&oacute; dấu hiệu ẩm mốc, hết hạn để tr&aacute;nh g&acirc;y ảnh hưởng kh&ocirc;ng tốt đến sức khỏe.<br />
<img alt="Kẹo sing-gum Hubba Bubba vị mâm xôi hộp 56.7g 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/4888/239236/bhx/keo-sing-gum-hubba-bubba-vi-mam-xoi-hop-567g-202105221056500098.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Hiện nay một trong những địa chỉ uy t&iacute;n kinh doanh c&aacute;c sản phẩm kẹo chất lượng, đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng v&agrave; uy t&iacute;n hiện nay l&agrave; B&aacute;ch h&oacute;a XANH. Đặc biệt khi đặt h&agrave;ng tại đ&acirc;y bạn sẽ nhận được nhiều ưu đ&atilde;i giảm gi&aacute;, khuyến m&atilde;i qu&agrave; tặng v&agrave; được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh tận nơi.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (202, 'Kẹo gum Hubba Bubba dâu tây 56g', 38500, 45500, 'store/images/banh-keo/keo-sing-gum-hubba-bubba-vi-dau-tay-hop-56g-202205201452172008_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Sản phẩm được đống trong hộp dẹp tr&ograve;n xinh xắn với khối lượng 56.7g, tiện lợi khi sử dụng v&agrave; c&oacute; h&igrave;nh d&aacute;ng lạ so với c&aacute;c sản phẩm c&ugrave;ng loại tạo n&ecirc;n sự th&iacute;ch th&uacute; khi ăn. Kẹo sing-gum Hubba Bubba vị d&acirc;u t&acirc;y hộp 56g c&oacute; d&acirc;u t&acirc;y thơm ngon, k&iacute;ch th&iacute;ch vị gi&aacute;c khi ăn. Sản phẩm như một sơi d&acirc;y dẹp bản to</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo sing-gum vị d&acirc;u t&acirc;y</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>56g</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Đường, chất gum nền, si r&ocirc; bắp, chất điều chỉnh độ, hương tự nhi&ecirc;n,...</div>
	</li>
	<li>Lưu ý
	<div>Sản phẩm c&oacute; chứa cốt g&ocirc;m, kh&ocirc;ng được nuốt</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; thoáng, tránh ánh nắng trực ti&ecirc;́p</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Hubba Bubba</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>

<div class="description"><a href="https://www.bachhoaxanh.com/singum-keo-cao-su">Kẹo singum</a> được biết đến l&agrave; một loại kẹo thơm ngon từ thương hiệu <a href="https://www.bachhoaxanh.com/singum-keo-cao-su-hubba-bubba">kẹo Singum Hubba Bubba</a>, được l&agrave;m từ gum nền v&agrave; hương liệu kh&aacute;c mang đến cảm gi&aacute;c v&ocirc; c&ugrave;ng th&iacute;ch th&uacute; khi nhai. Hubba Bubba đ&atilde; ngay lập tức chiều l&ograve;ng kh&aacute;ch h&agrave;ng bằng những sản phẩm kẹo singum c&oacute; hương vị đa dạng. Sản phẩm&nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su/keo-sing-gum-hubba-bubba-vi-dau-tay-hop-56g">Kẹo sing-gum Hubba Bubba vị d&acirc;u t&acirc;y hộp 56g</a> l&agrave; một trong những sản phẩm được y&ecirc;u th&iacute;ch hiện nay.

<div style="text-align:center"><img alt="Kẹo sing-gum Hubba Bubba vị dâu tây hộp 56g 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/4888/239241/bhx/keo-sing-gum-hubba-bubba-vi-dau-tay-hop-56g-202105131624387965.jpg" style="height:500px; width:800px" /></div>
Sản phẩm được đống trong hộp dẹp tr&ograve;n xinh xắn với khối lượng 56.7g, tiện lợi khi sử dụng v&agrave; c&oacute; h&igrave;nh d&aacute;ng lạ so với c&aacute;c sản phẩm c&ugrave;ng loại tạo n&ecirc;n sự th&iacute;ch th&uacute; khi ăn. Kẹo c&oacute; d&acirc;u t&acirc;y thơm ngon, k&iacute;ch th&iacute;ch vị gi&aacute;c khi ăn. Sản phẩm như một sơi d&acirc;y dẹp bản to k&eacute;o d&agrave;i rất th&iacute;ch th&uacute;.<br />
Singum c&oacute; rất nhiều c&ocirc;ng dụng như ăn nhai nhai rất vui miệng, <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nhai-singum-nhieu-loi-hay-hai-1031981" style="color:blue;text-decoration:underline">loại sạch thức ăn thừa ở kẽ răng, l&agrave;m sạch khoang miệng, mang lại hơi thở thơm m&aacute;t,.</a>..<br />
Tuy nhi&ecirc;n khi ăn ch&uacute;ng ta kh&ocirc;ng n&ecirc;n nuốt kẹo v&igrave; dễ dẫn đến nhiều <a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nuot-keo-cao-su-co-nguy-hiem-khong-1014827" style="color:blue;text-decoration:underline">nguy hiểm</a> cho cơ thể, đặc biệt l&agrave; trẻ nhỏ.</div>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (203, 'Kẹo gum không đường Mentos dưa hấu 61.25g', 22000, 26000, 'store/images/banh-keo/keo-gum-khong-duong-mentos-pure-fresh-huong-dua-hau-hu-6125g-202304110953002592_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/singum-keo-cao-su/keo-gum-khong-duong-mentos-pure-fresh-huong-dua-hau-hu-6125g">Kẹo gum kh&ocirc;ng đường Mentos Pure Fresh hương dưa hấu hũ 61.25g</a> l&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/singum-keo-cao-su-mentos">kẹo gum Mentos</a> gi&uacute;p hơi thở thơm m&aacute;t, mang đến cảm gi&aacute;c sảng kho&aacute;i tinh thần. <a href="https://www.bachhoaxanh.com/singum-keo-cao-su">Kẹo singum</a> c&oacute; hương dưa hấu v&agrave; chiết xuất tr&agrave; xanh tự nhi&ecirc;n hấp dẫn.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo gum kh&ocirc;ng đường hương dưa hấu</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>61.25g</div>
	</li>
	<li>Đặc tính
	<div>Cho hơi thở thơm mát, giúp sảng khoái tinh th&acirc;̀n</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Chất tạo ngọt tự nhi&ecirc;n v&agrave; tổng hợp, sorbitol, siro maltitol, xylytol, cốt g&ocirc;m, chất điều chỉnh độ acid, chất l&agrave;m ẩm, hương tự nhi&ecirc;n v&agrave; giống tự nhi&ecirc;n (dưa hấu, bạc h&agrave;), chất nhũ h&oacute;a, bột dưa hấu, chất l&agrave;m d&agrave;y</div>
	</li>
	<li>Lưu ý
	<div>Sản phẩm c&oacute; chưa lecithin đậu n&agrave;nh v&agrave; kh&ocirc;ng thay thế cho việc chải răng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; thoáng, tránh ánh nắng trực ti&ecirc;́p</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Mentos (New Zealand)</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (204, 'Kẹo gum Lotte Xylitol hỗn hợp 130.5g', 64000, 0, 'store/images/banh-keo/keo-gum-khong-duong-lotte-xylitol-huong-hon-hop-hu-1305g-202301061108582093_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/singum-keo-cao-su/keo-gum-khong-duong-lotte-xylitol-huong-hon-hop-hu-1305g">Kẹo gum kh&ocirc;ng đường Lotte Xylitol hương hỗn hợp hũ 130.5g</a> với hương hỗn hợp <a href="https://www.bachhoaxanh.com/singum-keo-cao-su">kẹo singum</a> thơm ngon, gi&uacute;p ngăn ngừa s&acirc;u răng v&agrave; mang đến hơi thở thơm m&aacute;t cho bạn. <a href="https://www.bachhoaxanh.com/singum-keo-cao-su-xylitol">Kẹo singum&nbsp; Lotte Xylitol</a> l&agrave; thương hiệu nổi tiếng, chất lượng đến từ Nhật Bản được tin d&ugrave;ng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo gum kh&ocirc;ng đường hương hỗn hợp</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>130.5g</div>
	</li>
	<li>Đặc tính
	<div>Ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Chất tạo ngọt tự nhi&ecirc;n</div>
	</li>
	<li>Khuy&ecirc;n dùng
	<div>D&ugrave;ng sau bữa ăn để ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Lưu ý
	<div>Sản phẩm c&oacute; chưa lecithin đậu n&agrave;nh v&agrave; kh&ocirc;ng thay thế cho việc chải răng</div>
	</li>
	<li>Chứng nh&acirc;̣n
	<div>H&ocirc;̣i Răng Hàm Mặt Vi&ecirc;̣t Nam khuy&ecirc;n dùng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; ráo, thoáng mát, tránh ánh nắng mặt trời, tránh xóc mạnh hũ</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Lotte Xylitol (Nhật Bản)</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (205, 'Kẹo gum Lotte Xylitol Fresh Mint 137.8g', 58800, 0, 'store/images/banh-keo/keo-gum-khong-duong-lotte-xylitol-huong-fresh-mint-hu-1378g-202205201140261454_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Kẹo gum kh&ocirc;ng đường hương bạc h&agrave; the m&aacute;t mang đến cho bạn hơi thở thơm m&aacute;t.&nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su/keo-cao-su-khong-duong-xylitol-fresh-mint-145g">Kẹo gum kh&ocirc;ng đường Lotte Xylitol hương Fresh Mint hũ 137.8g</a>&nbsp;bảo vệ răng v&agrave; l&agrave;m sạch răng miệng, <a href="https://www.bachhoaxanh.com/singum-keo-cao-su">Kẹo Singum</a>&nbsp;thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su-xylitol">kẹo Singum Lotte Xylitol</a> cho tinh thần thoải m&aacute;i v&agrave; bảo vệ răng miệng</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo gum kh&ocirc;ng đường hương Fresh Mint</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>137.8g</div>
	</li>
	<li>S&ocirc;́ lượng
	<div>95 vi&ecirc;n</div>
	</li>
	<li>Đặc tính
	<div>Cho hơi thở thơm mát, ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Chất tạo ngọt Xylitol 39%, Maltitol, Aspartam; Cốt g&ocirc;m; Hương bạc h&agrave; giống tự nhi&ecirc;n v&agrave; tổng hợp; Chất l&agrave;m d&agrave;y (414), Chất l&agrave;m rắn (341ii); Chất l&agrave;m b&oacute;ng (903,901,904); M&agrave;u thực phẩm tổng hợp (133)</div>
	</li>
	<li>Khuy&ecirc;n dùng
	<div>D&ugrave;ng sau bữa ăn để ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Lưu ý
	<div>Nhai kẹo kh&ocirc;ng thay thế cho việc chải răng</div>
	</li>
	<li>Chứng nh&acirc;̣n
	<div>H&ocirc;̣i Răng Hàm Mặt Vi&ecirc;̣t Nam khuy&ecirc;n dùng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; thoáng, tránh ánh nắng trực ti&ecirc;́p</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Lotte Xylitol (Nhật Bản)</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Đ&acirc;y l&agrave; một thương hiệu quen thuộc với nhiều người ti&ecirc;u d&ugrave;ng Việt Nam, C&ocirc;ng ty TNHH Lotte Việt Nam ch&iacute;nh thức giới thiệu đến người d&ugrave;ng c&aacute;c sản phẩm kẹo Lotte Xylitol v&agrave;o năm 2006. Hương vị kẹo mang vị the đặc trưng ri&ecirc;ng, đa dạng hương vị n&ecirc;n rất được y&ecirc;u th&iacute;ch v&agrave; t&igrave;m mua. Hiện nay hệ thống ph&acirc;n phối c&aacute;c sản phẩm kẹo Lotte Xylitol rộng khắp cả nước để phục vụ như cầu ti&ecirc;u d&ugrave;ng.<br />
<img alt="Kẹo gum không đường Lotte Xylitol hương Fresh Mint hũ 137.8g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//4888/177534/bhx/files/keo-gum-khong-duong-lotte-xylitol-huong-fresh-mint-hu-1378g-201907041122087716.jpg" style="height:500px; width:800px" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Kẹo kh&ocirc;ng chỉ cung cấp năng lượng cho cơ thể m&agrave; đ&acirc;y c&ograve;n c&oacute; c&aacute;c chất kh&aacute;c như chất đạm, chất b&eacute;o, đường, carbohydrate v&agrave; một số chất kh&aacute;c. Theo một số th&ocirc;ng tin, lượng calo trung b&igrave;nh trong kẹo gum l&agrave; khoảng 360 kcal, tuy nhi&ecirc;n lượng calo n&agrave;y c&oacute; thể thay đổi t&ugrave;y thuộc v&agrave;o th&agrave;nh phần nguy&ecirc;n liệu trong sản phẩm.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Một số t&aacute;c dụng nổi bật của sản phẩm đối với sức khỏe l&agrave;:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng</p>
	</li>
	<li>
	<p>Hỗ trợ giảm c&acirc;n</p>
	</li>
	<li>
	<p>Mang đến hơi thở thơm m&aacute;t</p>
	</li>
	<li>
	<p>Gi&uacute;p tinh thần sảng kho&aacute;i</p>
	</li>
	<li>
	<p>Cải thiện t&acirc;m trạng</p>
	</li>
	<li>
	<p>Ngăn ngừa s&acirc;u răng</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>C&aacute;c loại kẹo gum rất dễ thu h&uacute;t c&aacute;c loại kiến bởi hương vị ngọt thơm n&ecirc;n khi lấy kẹo xong bạn n&ecirc;n đ&oacute;ng k&iacute;n nắp hũ. Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp từ mặt trời v&agrave; nơi c&oacute; nhiệt độ cao.<br />
Lưu &yacute;: Kh&ocirc;ng sử dụng khi sản phẩm hết hạn hoặc c&oacute; c&aacute;c dấu hiệu ẩm mốc.<br />
<img alt="Kẹo gum không đường Lotte Xylitol hương Fresh Mint hũ 137.8g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//4888/177534/bhx/files/keo-gum-khong-duong-lotte-xylitol-huong-fresh-mint-hu-1378g-201907041123258258.jpg" style="height:500px; width:800px" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Một trong những điểm nổi bật khi mua h&agrave;ng tại B&aacute;ch h&oacute;a XANH l&agrave; chất lượng c&aacute;c sản phẩm lu&ocirc;n được đảm bảo, nguồn gốc xuất xứ r&otilde; r&agrave;ng v&agrave; được kiểm tra nghi&ecirc;m ngặt. Đặc biệt khi mua sắm sản phẩm tại website bạn c&ograve;n nhận được nhiều ưu đ&atilde;i hấp dẫn v&agrave; được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng, tận nơi.</p>
</div>
</div>', 'thuc-an-nhanh', 0, 32, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (206, 'Kẹo gum Lotte Xylitol Lime Mint 137.8g', 58800, 0, 'store/images/banh-keo/keo-gum-khong-duong-lotte-xylitol-huong-lime-mint-hu-1305g-202304121447465060_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/singum-keo-cao-su">Kẹo Singum</a>&nbsp;kh&ocirc;ng đường hương bạc h&agrave; the m&aacute;t mang đến cho bạn hơi thở thơm m&aacute;t.&nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su/singum-khong-duong-lotte-xylitol-huong-lime-mint-145g">Kẹo gum kh&ocirc;ng đường Lotte Xylitol hương Lime Mint hũ 137.8g</a>&nbsp;bảo vệ răng của bạn, gi&uacute;p bạn lấy thức ăn trong kẽ răng, &nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su-xylitol">kẹo Singum Lotte Xylitol</a> cho tinh thần thoải m&aacute;i v&agrave; bảo vệ răng miệng</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo gum kh&ocirc;ng đường hương Lime Mint</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>137.8g</div>
	</li>
	<li>Đặc tính
	<div>Cho hơi thở thơm mát, ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Chất tạo ngọt Xylitol 39%, Maltitol Aspartam, cốt g&ocirc;m, hương bạc h&agrave; chanh giống tự nhi&ecirc;n v&agrave; tổng hợp, chất l&agrave;m d&agrave;y (414), chất l&agrave;m rắn (341ii), chất l&agrave;m b&oacute;ng (903,901,904), m&agrave;u thực phẩm tổng hợp (102,132)</div>
	</li>
	<li>Khuy&ecirc;n dùng
	<div>D&ugrave;ng sau bữa ăn để ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Lưu ý
	<div>Nhai kẹo kh&ocirc;ng thay thế cho việc chải răng</div>
	</li>
	<li>Chứng nh&acirc;̣n
	<div>H&ocirc;̣i Răng Hàm Mặt Vi&ecirc;̣t Nam khuy&ecirc;n dùng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; thoáng, tránh ánh nắng trực ti&ecirc;́p</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Lotte Xylitol ()</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Lotte Xylitol được th&agrave;nh lập tại Nhật v&agrave;o năm v&agrave; đặc biệt nổi bật ở thị trường Ch&acirc;u &Aacute; v&agrave;o năm 2006 sau sự th&agrave;nh c&ocirc;ng vang dội tại Nhật Bản. Thương hiệu n&agrave;y thuộc C&ocirc;ng ty TNHH Lotte Việt Nam quản l&yacute; v&agrave; ph&aacute;t triển với c&aacute;c sản phẩm kẹo gum thơm ngon v&agrave; tốt cho sức khỏe. C&aacute;c loại kẹo gum được sản xuất từ nguồn nguy&ecirc;n liệu chọn lọc với d&acirc;y chuyền sản xuất hiện đại, đảm bảo chất lượng.<br />
<img alt="Kẹo gum không đường Lotte Xylitol hương Lime Mint hũ 137.8g 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//4888/177535/bhx/files/keo-gum-khong-duong-lotte-xylitol-huong-lime-mint-hu-1378g-201907041120511559.jpg" style="height:500px; width:800px" /></p>

<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p>Kẹo gum kh&ocirc;ng chỉ cung cấp năng lượng cho cơ thể m&agrave; c&ograve;n bổ sung c&aacute;c th&agrave;nh phần dinh dưỡng như chất xơ, carbohydrate, natri, kali,... Theo một số th&ocirc;ng tin nghi&ecirc;n cứu, trong 100g kẹo gum cung cấp khoảng 360 kcal.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p>Kẹo gum kh&ocirc;ng đường đặc biệt mang đến nhiều lợi &iacute;ch cho sức khỏe, đ&acirc;y l&agrave; loại kẹo thơm ngon, dễ t&igrave;m mua lại dễ d&ugrave;ng n&ecirc;n rất được y&ecirc;u th&iacute;ch. Một số t&aacute;c dụng của kẹo gum đối với sức khỏe như sau:</p>

<ul style="margin-left:40px">
	<li>
	<p>Cung cấp năng lượng</p>
	</li>
	<li>
	<p>Giảm cơn th&egrave;m ăn</p>
	</li>
	<li>
	<p>Bảo vệ răng miệng</p>
	</li>
	<li>
	<p>L&agrave;m sạch mảng b&aacute;m trong răng</p>
	</li>
	<li>
	<p>Tăng lưu lượng m&aacute;u n&atilde;o</p>
	</li>
	<li>
	<p>Hỗ trợ giảm c&acirc;n</p>
	</li>
	<li>
	<p>&hellip;</p>
	</li>
</ul>

<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<p>Kẹo gum tuy kh&ocirc;ng ngọt như c&aacute;c nhưng cũng rất dễ thu h&uacute;t c&aacute;c loại kiến k&eacute;o đến n&ecirc;n khi lấy đủ lượng kẹo cần d&ugrave;ng xong bạn n&ecirc;n đ&oacute;ng k&iacute;n nắp để bảo quản tốt nhất. Đặt sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp hoặc nơi c&oacute; nhiệt độ qu&aacute; cao.<br />
Lưu &yacute;: Kh&ocirc;ng sử dụng khi sản phẩm c&oacute; dấu hiệu hết hạn sử dụng hoặc ẩm mốc hay c&oacute; m&ugrave;i lạ. Ngưng ngay nếu thấy c&aacute;c dấu hiệu dị ứng với sản phẩm.<br />
<img alt="Kẹo gum không đường Lotte Xylitol hương Lime Mint hũ 137.8g 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//4888/177535/bhx/files/keo-gum-khong-duong-lotte-xylitol-huong-lime-mint-hu-1378g-201907041120514889.jpg" style="height:500px; width:800px" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>C&oacute; thể n&oacute;i hiện nay, B&aacute;ch h&oacute;a XANH l&agrave; nơi chuy&ecirc;n cung cấp c&aacute;c sản phẩm kẹo gum Lotte Xylitol với chất lượng v&agrave; nguồn gốc xuất xứ đảm bảo, r&otilde; r&agrave;ng. Đặc biệt khi đặt h&agrave;ng tại đ&acirc;y bạn sẽ nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i hấp dẫn, b&ecirc;n cạnh đ&oacute; bạn sẽ được nh&acirc;n vi&ecirc;n giao h&agrave;ng nhanh ch&oacute;ng tận nơi.</p>
</div>
</div>', 'thuc-an-nhanh', 1, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (207, 'Kẹo gum Lotte Xylitol Cool 130.5g', 58800, 0, 'store/images/banh-keo/-202303250904465241_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Kẹo gum kh&ocirc;ng đường hương bạc h&agrave; the m&aacute;t mang đến cho bạn hơi thở thơm m&aacute;t.&nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su/keo-cao-su-khong-duong-xylitol-cool-145g">Kẹo gum kh&ocirc;ng đường Lotte Xylitol Cool hũ 130.5g</a>&nbsp;bảo vệ răng của bạn, gi&uacute;p trắng v&agrave; ngừa s&acirc;u răng, <a href="https://www.bachhoaxanh.com/singum-keo-cao-su">Kẹo Singum</a>&nbsp;thương hiệu&nbsp;<a href="https://www.bachhoaxanh.com/singum-keo-cao-su-xylitol">kẹo Singum Lotte Xylitol</a> cho tinh thần thoải m&aacute;i v&agrave; bảo vệ răng miệng.</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo gum kh&ocirc;ng đường</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>130.5g</div>
	</li>
	<li>Đặc tính
	<div>Cho hơi thở thơm mát, ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Chất tạo ngọt Xylitol 39%, Maltitol, Aspartam; Cốt g&ocirc;m; Hương bạc h&agrave; giống tự nhi&ecirc;n v&agrave; tổng hợp; Chất l&agrave;m d&agrave;y (414), Chất l&agrave;m rắn (Dicanxi phosphat); Chất nhũ h&oacute;a (472a); Chất l&agrave;m b&oacute;ng (903,901,904); M&agrave;u thực phẩm tổng hợp (132, 133). Sản phẩm c&oacute; lexitin đậu n&agrave;nh</div>
	</li>
	<li>Khuy&ecirc;n dùng
	<div>D&ugrave;ng sau bữa ăn để ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Lưu ý
	<div>Nhai kẹo kh&ocirc;ng thay thế cho việc chải răng</div>
	</li>
	<li>Chứng nh&acirc;̣n
	<div>H&ocirc;̣i Răng Hàm Mặt Vi&ecirc;̣t Nam khuy&ecirc;n dùng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; thoáng, tránh ánh nắng trực ti&ecirc;́p</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Lotte Xylitol ()</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (208, 'Kẹo gum Lotte Xylitol Blueberry Mint 137.8g', 58500, 0, 'store/images/banh-keo/keo-gum-khong-duong-lotte-xylitol-huong-blueberry-mint-hop-1378g-202205201452332439_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/singum-keo-cao-su">Kẹo Singum</a> kh&ocirc;ng đường gi&uacute;p loại bỏ những thức ăn thừa trong kẽ răng của bạn. <a href="https://www.bachhoaxanh.com/singum-keo-cao-su/gums-lotte-xylitol-145g">Kẹo gum kh&ocirc;ng đường Lotte Xylitol hương Blueberry Mint hũ 137.8g</a> với hương vị tr&aacute;i c&acirc;y việt quất tươi m&aacute;t, ngon miệng. <a href="https://www.bachhoaxanh.com/singum-keo-cao-su-xylitol">Kẹo singum Lotte Xylitoy</a> gi&uacute;p bạn c&oacute; hơi thở thơm m&aacute;t v&agrave; kh&ocirc;ng lo s&acirc;u răng, bảo vệ răng miệng</div>

<ul style="margin-left:40px">
	<li>Loại kẹo
	<div>Kẹo gum kh&ocirc;ng đường hương Blueberry Mint</div>
	</li>
	<li>Kh&ocirc;́i lượng
	<div>137.8g</div>
	</li>
	<li>Đặc tính
	<div>Ngăn ngừa s&acirc;u răng</div>
	</li>
	<li>Thành ph&acirc;̀n
	<div>Chất tạo ngọt tự nhi&ecirc;n, cốt g&ocirc;m, hương bạc h&agrave;, chất l&agrave;m d&agrave;y, chất l&agrave;m b&oacute;ng, chất tạo ngọt tổng hợp, m&agrave;u thực phẩm tổng hợp,...</div>
	</li>
	<li>Lưu ý
	<div>Nhai kẹo kh&ocirc;ng thay thế cho việc chải răng</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; ráo, thoáng mát, tránh ánh nắng mặt trời, tránh xóc mạnh hũ</div>
	</li>
	<li>Thương hi&ecirc;̣u
	<div>Lotte Xylitol</div>
	</li>
	<li>Nơi sản xu&acirc;́t
	<div>Vi&ecirc;̣t Nam</div>
	</li>
</ul>
</div>', 'thuc-an-nhanh', 0, 0, 0, '2023-05-03 16:30:01', 10);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (209, 'Thùng 24 bịch sữa ít đường Dutch Lady 180ml', 115500, 172000, 'store/images/sua-tuoi/thung-24-bich-sua-tiet-trung-it-duong-dutch-lady-canxi-protein-180ml-202304262236317727_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-dutch-lady">Sữa tươi Dutch Lady</a>&nbsp; sử dụng nguy&ecirc;n liệu l&agrave; <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a>&nbsp;nguy&ecirc;n chất l&agrave; nguồn bổ sung canxi v&agrave; protein thiết yếu mỗi ng&agrave;y cho b&eacute;, gi&uacute;p b&eacute; khoẻ mạnh, cao lớn hơn. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-24-bich-sua-tuoi-tiet-trung-it-duong-dutch-lady-canxi-protein-180ml">Th&ugrave;ng sữa tươi tiệt tr&ugrave;ng &iacute;t đường Dutch Lady Canxi &amp; Protein 180ml</a> &iacute;t đường, thơm ngon, uống kh&ocirc;ng ng&aacute;n.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa 93% (nước, bột sữa gầy), dầu thực vật, đường, chất nhũ ho&aacute;, chất ổn định, hương tổng hợp d&ugrave;ng trong thực phẩm</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Ngon hơn khi uống lạnh. Lắc đều trước khi sử dụng.</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li>Thương hiệu <a class="brandinfo" href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dutch-lady-tieu-chuan-ha-lan-trong-tung-ly-sua-1177286" target="_blank" title="Sữa tươi Dutch Lady">Dutch Lady (H&agrave; Lan)</a></li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify">Thương hiệu Sữa tươi Dutch Lady (hay c&ograve;n được người ti&ecirc;u d&ugrave;ng&nbsp;Việt quen gọi l&agrave; C&ocirc; G&aacute;i H&agrave; Lan) l&agrave; thương hiệu chuy&ecirc;n mang đến c&aacute;c d&ograve;ng sữa v&agrave; c&aacute;c sản phẩm từ sữa&nbsp;được l&agrave;m từ nguồn nguy&ecirc;n liệu chọn lọc, trải qua quy tr&igrave;nh sản xuất v&agrave; kiểm so&aacute;t chất lượng&nbsp;nghi&ecirc;m ngặt theo <strong>ti&ecirc;u chuẩn 4 kh&ocirc;ng</strong>&nbsp;được quốc tế c&ocirc;ng nhận.</p>

<p style="text-align:justify">Với hơn 145 năm kinh nghiệm,&nbsp;sữa tươi&nbsp;của Dutch Lady đem đ&ecirc;́n vị thơm béo thu&acirc;̀n khi&ecirc;́t, ngọt thanh dễ uống,&nbsp;đồng thời&nbsp;bổ sung nhiều dưỡng chất thiết yếu như vitamin A, vitamin D, vitamin nh&oacute;m B, đặc biệt&nbsp;canxi v&agrave; protein&nbsp;gi&uacute;p ph&aacute;t triển v&agrave; củng cố hệ xương chắc khoẻ.</p>

<p style="text-align:justify"><img alt="Thùng 24 bịch sữa tiệt trùng ít đường Dutch Lady Canxi &amp; Protein 180ml 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/79291/bhx/files/fdf854fbb479c81d99c70d93da45d7ea.jpg" style="height:700px; width:750px" /></p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>

<p style="text-align:justify">Th&agrave;nh phần ch&iacute;nh của sản phẩm bao gồm: Sữa 93% (nước, bột sữa gầy), dầu thực vật, đường, chất nhũ ho&aacute;, chất ổn định, hương tổng hợp d&ugrave;ng trong thực phẩm. Ngo&agrave;i ra,&nbsp;sản phẩm cung cấp khoảng <strong>130&nbsp;kcal</strong> trong 1 bịch&nbsp;<strong>180ml sữa</strong>, c&ugrave;ng nhiều h&agrave;m lượng vitamin v&agrave; kho&aacute;ng chất kh&aacute;c cho cơ thể.</p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p style="text-align:justify">Sữa tiệt tr&ugrave;ng Dutch Lady &iacute;t đường thơm&nbsp;ngon, dễ uống, ph&ugrave; hợp cho người muốn giảm c&acirc;n nhờ&nbsp;sử dụng nguy&ecirc;n liệu l&agrave; sữa tươi, bổ sung protein, phốt pho, Vitamin B2 v&agrave; B12 c&ugrave;ng nhiều vitamin v&agrave; kho&aacute;ng chất cần thiết cho cơ thể.<br />
Đặc biệt, sữa kh&ocirc;ng chứa chất bảo quản, kh&ocirc;ng c&oacute; dư lượng thuốc trừ s&acirc;u, thuốc kh&aacute;ng sinh cũng như m&agrave;u ho&aacute; học n&ecirc;n đảm bảo an to&agrave;n cho sức khoẻ người ti&ecirc;u d&ugrave;ng.<br />
<img alt="Thùng 24 bịch sữa tiệt trùng ít đường Dutch Lady Canxi &amp; Protein 180ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/79291/bhx/files/thung-24-bich-sua-tuoi-tiet-trung-it-duong-dutch-lady-canxi-protein-180ml-202202210753000039.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Lắc đều trước khi uống. Ngon hơn khi uống lạnh.</p>
	</li>
	<li>
	<p style="text-align:justify">N&ecirc;n uống 2 bịch mỗi ng&agrave;y.</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Kh&ocirc;ng d&ugrave;ng cho trẻ dưới <strong>1 tuổi</strong>.</p>
	</li>
	<li>
	<p style="text-align:justify">Sản phẩm sử dụng cho 1 lần uống. Sau khi mở bao b&igrave; n&ecirc;n d&ugrave;ng hết, hoặc bảo quản trong ngăn m&aacute;t tủ lạnh v&agrave; sử dụng hết trong ng&agrave;y.</p>
	</li>
	<li>
	<p style="text-align:justify">Kh&ocirc;ng n&ecirc;n&nbsp;h&acirc;m n&oacute;ng sữa&nbsp;bằng l&ograve; vi s&oacute;ng v&igrave; c&oacute; khả năng g&acirc;y bỏng.</p>
	</li>
	<li>
	<p style="text-align:justify">Bảo quản&nbsp;nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</p>
	</li>
</ul>

<p style="text-align:justify"><img alt="Thùng 24 bịch sữa tiệt trùng ít đường Dutch Lady Canxi &amp; Protein 180ml 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/79291/bhx/files/thung-24-bich-sua-tuoi-tiet-trung-it-duong-dutch-lady-canxi-protein-180ml-202107010808292755.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p style="text-align:justify">Người d&ugrave;ng c&oacute; thể đặt mua Th&ugrave;ng 24 bịch sữa tươi tiệt tr&ugrave;ng &iacute;t đường Dutch Lady Canxi &amp; Protein 180ml online tại website&nbsp;hoặc app&nbsp;với gi&aacute; th&agrave;nh cực kỳ tốt. Tại đ&acirc;y, sữa C&ocirc; g&aacute;i H&agrave; Lan đều được đảm bảo kinh doanh ch&iacute;nh h&atilde;ng, đ&uacute;ng nguồn gốc xuất xứ, c&ugrave;ng dịch vụ&nbsp;giao h&agrave;ng nhanh tận nơi nhanh ch&oacute;ng v&agrave; nhiều ưu đ&atilde;i mỗi ng&agrave;y.</p>

<p style="text-align:justify"><strong>Xem th&ecirc;m:&nbsp;</strong><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dutch-lady-tieu-chuan-ha-lan-trong-tung-ly-sua-1177286">Dutch Lady - Ti&ecirc;u chu&acirc;̉n Hà Lan trong từng ly sữa</a></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (210, 'Thùng 48 hộp sữa tươi ít đường TH true MILK 180ml', 410000, 0, 'store/images/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-it-duong-th-true-milk-180ml-202304262210306978_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-th-true-milk">Sữa tươi&nbsp;TH True Milk</a>&nbsp;đảm bảo kh&ocirc;ng sử dụng th&ecirc;m hương liệu, mang vị ngon <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> nguy&ecirc;n chất 100%,&nbsp;chứa nhiều vitamin v&agrave; kho&aacute;ng chất như Vitamin A, D, B1, B2, canxi, kẽm.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tiet-trung-th-it-duong-180ml-thung">Th&ugrave;ng 48 hộp sữa tươi tiệt tr&ugrave;ng &iacute;t đường TH true MILK 180ml</a> đ&oacute;ng th&ugrave;ng tiện lợi, tiết kiệm.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa ho&agrave;n to&agrave;n từ sữa b&ograve; tươi (97%), đường tinh luyện (2,8%), chất ổn định (E471, E418, E410) d&ugrave;ng cho thực phẩm</div>
	</li>
	<li>Thương hiệu <a class="brandinfo" href="https://www.bachhoaxanh.com/kinh-nghiem-hay/th-true-milk-va-khat-vong-sua-sach-1175283" target="_blank" title="Sữa tươi TH true MILK">TH true MILK (Việt Nam)</a></li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/sua-tuoi-sach-nguyen-chat.png" style="height:130px; width:600px" /><br />
Sữa tươi tiệt tr&ugrave;ng TH true MILK được l&agrave;m ho&agrave;n to&agrave;n từ nguồn sữa tươi sạch tại trang trại b&ograve; sữa của TH.</p>

<ul>
	<li>Ly sữa tốt nhất được tạo n&ecirc;n bởi c&aacute;c yếu tố về giống b&ograve; sữa, quy tr&igrave;nh chăm s&oacute;c, quy tr&igrave;nh th&uacute; y, quy tr&igrave;nh vắt sữa, quy tr&igrave;nh ph&aacute;t hiện v&agrave; cảnh b&aacute;o tồn dư lượng thuốc thực vật bị nghi&ecirc;m cấm, để trẻ em sẽ kh&ocirc;ng c&oacute; nguy cơ dậy th&igrave; sớm.</li>
	<li>Hi&ecirc;̉u được đi&ecirc;̀u đó, TH true MILK đ&atilde; &aacute;p dụng c&aacute;c c&ocirc;ng nghệ hiện đại nhất thế giới, trong đ&oacute; c&oacute; điểm nhấn l&agrave; <strong>đeo chip cho từng con&nbsp;b&ograve; sữa</strong>. Thiết bị n&agrave;y c&oacute; thể ph&aacute;t hiện bệnh vi&ecirc;m v&uacute; trước tới 4 ng&agrave;y, những con&nbsp;b&ograve; c&oacute; thể bị vi&ecirc;m&nbsp;sẽ được t&aacute;ch khỏi đ&agrave;n để kh&ocirc;ng lấy sữa nữa.</li>
	<li>C&ocirc;ng nghệ n&agrave;y cũng gi&uacute;p ph&aacute;t hiện&nbsp;lượng tồn dư kh&aacute;ng sinh của từng con b&ograve;. Nhờ vậy, sữa TH true MILK&nbsp;đảm bảo được chữ &quot;<strong>tươi</strong>&quot;, &quot;<strong>sạch</strong>&quot; như đúng&nbsp;định vị của thương hi&ecirc;̣u.</li>
	<li>Sử dụng c&ocirc;ng nghệ tiệt tr&ugrave;ng UTH, đảm bảo loại bỏ c&aacute;c khuẩn c&oacute; hại trong sữa, giữ được gần như trọn vẹn dưỡng chất v&agrave; hương vị đặc trưng của sữa.</li>
</ul>

<p><img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/sua-tuoi-it-duong-dau-tien-tren-thi-truong.png" style="height:130px; width:600px" /><br />
Tại Vi&ecirc;̣t Nam, TH true MILK là thương hi&ecirc;̣u ti&ecirc;n phong cho sản ph&acirc;̉m sữa tươi ít đường.<br />
Vị thơm béo đặc trưng của sữa bò tươi nguy&ecirc;n ch&acirc;́t, hòa cùng vị ngọt thanh, đem đ&ecirc;́n vị ngon hài hòa, d&ecirc;̃ u&ocirc;́ng. Lượng đường được giảm bớt nhưng vẫn đầy đủ c&aacute;c chất dinh dưỡng gi&uacute;p trẻ lu&ocirc;n ph&aacute;t triển c&acirc;n đối v&agrave; khỏe mạnh.<br />
<img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/58409168_346994946174218_5867369423482812034_n.jpg" style="height:640px; width:640px" /><br />
<img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 3" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/thanh-phan.png" style="height:130px; width:600px" /><img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 4" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/th-true-milk.png" style="height:408px; width:600px" /></p>

<h3><img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 5" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/2-loai-bao-bi.jpg" style="height:130px; width:600px" /></h3>

<p><strong>Sữa tươi TH true MILK&nbsp;hiện c&oacute; 2 loại bao b&igrave; được cung cấp bởi Tetra Pak (Thuỵ Điển) v&agrave; Combibloc (Đức)</strong>, tuy kh&aacute;c nhau về k&iacute;ch cỡ, m&agrave;u sắc v&agrave; c&aacute;ch đ&oacute;ng g&oacute;i nhưng cả hai đều c&oacute; c&ugrave;ng dung t&iacute;ch v&agrave; đạt chuẩn quốc tế, gi&uacute;p giữ trọn sự tươi ngon của sữa trong suốt 6 th&aacute;ng m&agrave; kh&ocirc;ng cần giữ lạnh hoặc d&ugrave;ng bất kỳ chất bảo quản n&agrave;o.</p>

<p style="text-align:center"><img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 180ml 6" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/85853/bhx/files/bao%20bi%cc%80%20th%20true%20milk.jpg" style="height:450px; width:600px" /></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (211, 'Thùng 48 bịch sữa tươi có đường Nutimilk 220ml', 259000, 345000, 'store/images/sua-tuoi/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202304262218000290_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-nutimilk">Sữa tươi NutiMilk</a>&nbsp;c&oacute; h&agrave;m lượng dinh dưỡng vượt trội, đạt ti&ecirc;u chuẩn tr&ecirc;n thế giới.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi">Sữa tươi</a>&nbsp;thơm ngon tự nhi&ecirc;n, dồi d&agrave;o h&agrave;m lượng dinh dưỡng tương đương sữa nhập n&ecirc;n được c&aacute;c b&agrave; mẹ ưa chuộng.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml">Th&ugrave;ng 48 bịch sữa dinh dưỡng c&oacute; đường Nutimilk 220ml</a>&nbsp;đ&oacute;ng th&ugrave;ng tiết kiệm, tiện d&ugrave;ng l&acirc;u d&agrave;i.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa dinh dưỡng c&oacute; đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>220ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa (94,3%) (nước, sữa tươi, sữa bột, chất b&eacute;o sữa), đường tinh luyện (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định d&agrave;nh cho thực phẩm, vitamin v&agrave; kho&aacute;ng chất (vitamin A, D3, kẽm sulfat)</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Lắc đều trước khi uống v&agrave; ngon hơn khi uống lạnh.</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>Nutimilk (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify">Nutimilk l&agrave; thương hiệu được ra mắt trong thời gian gần đ&acirc;y, hiện tại được sở hữu bởi C&ocirc;ng ty Cổ phần Thực phẩm Dinh dưỡng Nutifood. D&ugrave; chỉ mới ra mắt nhưng hiện nay c&aacute;c sản phẩm sữa của thương hiệu n&agrave;y đang rất được người ti&ecirc;u d&ugrave;ng quan t&acirc;m chọn lựa. Được sản xuất từ những th&agrave;nh phần tươi ngon, quy tr&igrave;nh sản xuất kh&eacute;p k&iacute;n cũng c&ocirc;ng nghệ hiện đại gi&uacute;p c&aacute;c sản phẩm đạt ti&ecirc;u chuẩn v&agrave; chất lượng như c&aacute;c sản phẩm sữa ngoại nhập kh&aacute;c.</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm</strong></h3>

<p style="text-align:justify">Sữa tươi Nutimilk c&oacute; đường&nbsp;220ml được l&agrave;m từ c&aacute;c th&agrave;nh phần ch&iacute;nh như: Sữa (94,3%) (nước, sữa tươi, sữa bột, chất b&eacute;o sữa), đường tinh luyện (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định d&agrave;nh cho thực phẩm, vitamin v&agrave; kho&aacute;ng chất (vitamin A, D3, kẽm sulfat). Ngo&agrave;i ra, sản phẩm cung cấp cho cơ thể <strong>khoảng 77 calo </strong>tr&ecirc;n <strong>100ml sữa</strong>.</p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p style="text-align:justify">Sữa tươi tiệt tr&ugrave;ng c&oacute; đường NutiMilk ch&iacute;nh l&agrave; 1 sự lựa chọn ph&ugrave; hợp cho những bạn kh&ocirc;ng th&iacute;ch uống ngọt hoặc đang trong thời kỳ giữ d&aacute;ng muốn bổ sung năng lượng nhanh cho cơ thể. Đồng thời, sữa Nutimilk c&ograve;n l&agrave; giải ph&aacute;p gi&uacute;p trẻ em ph&aacute;t triển to&agrave;n diện v&agrave; ngăn ngừa bệnh lo&atilde;ng xương cho người lớn được tiệt tr&ugrave;ng bằng c&ocirc;ng nghệ hiện đại, cam kết kh&ocirc;ng chất bảo quản hay chất tạo ngọt tổng hợp, đảm bảo an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.<br />
<img alt="Thùng 48 bịch sữa dinh dưỡng có đường Nutimilk 220ml 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2687/79620/bhx/files/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202202221718300343.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng</strong></h3>

<p style="text-align:justify">Sữa tươi l&agrave; sản phẩm c&oacute; thể sử dụng ngay sau khi mở bịch. B&ecirc;n cạnh c&aacute;ch uống th&ocirc;ng thường bạn c&ograve;n c&oacute; thể kết hợp, pha chế sữa tươi hoặc chế biến th&agrave;nh c&aacute;c m&oacute;n ăn thơm ngon, bổ dưỡng. Tuyệt đối kh&ocirc;ng sử dụng sữa đ&atilde; hết hạn hoặc c&oacute; dấu hiệu hư hỏng. Ngon hơn khi uống lạnh.</p>

<h3 style="text-align:justify"><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi d&ugrave;ng sữa tươi Nutimilk</strong></h3>

<p style="text-align:justify">Sữa tươi c&oacute; thể bảo quản ở nhiệt độ thường hoặc nếu uống lạnh bạn c&oacute; thể cho v&agrave;o ngăn m&aacute;t. Sữa khi mở hộp kh&ocirc;ng n&ecirc;n để ở nhiệt độ thường qu&aacute; l&acirc;u sẽ ảnh hưởng đến chất lượng sữa.</p>

<h3 style="text-align:justify"><strong>C&aacute;c m&oacute;n ăn ngon với sữa tươi Nutimilk</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Sữa tươi c&agrave; ph&ecirc;</p>
	</li>
	<li>
	<p style="text-align:justify">B&aacute;nh sữa tươi chi&ecirc;n</p>
	</li>
	<li>
	<p style="text-align:justify">B&aacute;nh flan sữa tươi</p>
	</li>
	<li>
	<p style="text-align:justify">B&aacute;nh khoai lang sữa tươi</p>
	</li>
	<li>
	<p style="text-align:justify">Sữa tươi vi&ecirc;n</p>
	</li>
</ul>

<p style="text-align:justify"><img alt="Thùng 48 bịch sữa dinh dưỡng có đường Nutimilk 220ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2687/79620/bhx/files/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202111040811065843.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch h&oacute;a XANH</strong></h3>

<p style="text-align:justify">Th&ugrave;ng 48 bịch sữa tươi c&oacute; đường Nutimilk 220ml v&agrave; c&aacute;c sản phẩm c&aacute;c của Nutimilk đều&nbsp;đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH, đảm bảo đ&uacute;ng nguồn gốc xuất xứ v&agrave; an to&agrave;n với người sử dụng. Bạn c&oacute; thể mua sản phẩm online qua app hoặc website để nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nh&agrave; nhanh ch&oacute;ng, tiện lợi.</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (212, 'Thùng 48 hộp sữa tươi ít đường Vinamilk 180ml', 340000, 0, 'store/images/sua-tuoi/thung-48-hop-sua-tuoi-it-duong-vinamilk-180ml-202304262156580677_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Được chế biến từ nguồn <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> 100% chứa nhiều dưỡng chất như vitamin A, D3, canxi,... tốt cho xương v&agrave; hệ miễn dịch,&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi-vinamilk">sữa tươi Vinamilk</a> l&agrave; thương hiệu được tin d&ugrave;ng h&agrave;ng đầu với chất lượng tuyệt vời.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/stt-vinamilk-it-duong-hop-180ml-48">Th&ugrave;ng 48 hộp sữa tươi &iacute;t đường Vinamilk 100% Sữa Tươi 180ml</a>&nbsp;thơm ngon tiện lợi.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi &iacute;t đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa tươi (97%), đường (2,8%), chất ổn định (471, 460(i), 407, 466), vitamin (natri ascorbat, A, D3), kho&aacute;ng chất (natri selenit)</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Thương hiệu
	<div>Vinamilk (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<p><strong>Sữa tươi tiệt tr&ugrave;ng Vinamilk 100% Sữa Tươi</strong>&nbsp;&iacute;t&nbsp;đường được l&agrave;m ho&agrave;n to&agrave;n từ sữa b&ograve; tươi, mang đến vị sữa b&eacute;o thơm, dễ uống.</p>

<p>Trong <strong>sữa</strong> c&ograve;n bổ sung vitamin D3, A, C v&agrave; Selen gi&uacute;p hỗ trợ miễn dịch, ph&aacute;t triển xương v&agrave; tốt cho thị gi&aacute;c.</p>

<p>Sản phẩm được xử l&yacute; bằng c&ocirc;ng nghệ tiệt tr&ugrave;ng UTH hiện đại, đảm bảo loại bỏ c&aacute;c vi khuẩn c&oacute; hại, gi&uacute;p bảo quản sữa l&acirc;u hơn m&agrave; vẫn giữ nguy&ecirc;n vị ngon của sữa tươi.</p>

<h3><strong>Gi&aacute; trị dinh dưỡng<br />
<br />
<img alt="Thùng 48 hộp sữa tươi ít đường Vinamilk 180ml 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/85530/bhx/stt-vinamilk-it-duong-hop-180ml-48-6-org.jpg" style="height:298px; width:340px" /><br />
<br />
Hướng dẫn sử dụng:</strong></h3>

<ul>
	<li>Sử dụng ngay sau khi mở bao b&igrave;.</li>
	<li>Ngon hơn khi d&ugrave;ng lạnh.</li>
	<li>N&ecirc;n uống 2 - 3 hộp sữa&nbsp;mỗi ng&agrave;y.</li>
	<li>Bảo quản nơi kh&ocirc;ng r&aacute;o, tho&aacute;ng m&aacute;t.</li>
	<li>N&ecirc;n d&ugrave;ng hết sau khi mở.</li>
</ul>

<h3><strong>Hai loại bao b&igrave; chuẩn quốc tế của sữa Vinamilk</strong></h3>

<p>Sữa tươi Vinamilk hiện c&oacute; 2 loại bao b&igrave; được cung cấp bởi Tetra Pak (Thuỵ Điển) v&agrave; Combibloc (Đức), tuy kh&aacute;c nhau về k&iacute;ch cỡ, m&agrave;u sắc v&agrave; c&aacute;ch đ&oacute;ng g&oacute;i nhưng cả hai đều c&oacute; c&ugrave;ng dung t&iacute;ch v&agrave; đạt chuẩn quốc tế, gi&uacute;p giữ trọn sự tươi ngon của sữa trong suốt 6 th&aacute;ng m&agrave; kh&ocirc;ng cần giữ lạnh hoặc d&ugrave;ng bất kỳ chất bảo quản n&agrave;o.</p>

<p><img alt="Thùng 48 hộp sữa tươi ít đường Vinamilk 180ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/89389/bhx/files/bao%20bi%cc%80%20vinamilk.jpg" style="height:600px; width:800px" /></p>

<h2>Lợi &iacute;ch khi mua Th&ugrave;ng 48 hộp sữa tươi &iacute;t đường Vinamilk 180ml?&nbsp;Gi&aacute; 1 Th&ugrave;ng 48 hộp sữa tươi &iacute;t đường Vinamilk 100% Sữa Tươi 180ml l&agrave; bao nhi&ecirc;u?</h2>

<p>Sữa tươi &iacute;t đường Vinamilk đang được b&aacute;n dưới dạng th&ugrave;ng v&agrave; lốc. Khi mua th&ugrave;ng, bạn sẽ nhận được 12 lốc, mỗi lốc 4 hộp sữa, <strong>tiết kiệm v&agrave; cực kỳ tiện d&ugrave;ng l&acirc;u d&agrave;i</strong>. Nếu mỗi ng&agrave;y bạn bổ sung dinh dưỡng v&agrave; năng lượng bằng 1 hộp sữa, nếu mua th&ugrave;ng lớn, <strong>bạn sẽ c&oacute; thể uống được khoảng gần 2 th&aacute;ng</strong>, kh&ocirc;ng phải tốn thời gian đi mua nhiều lần m&agrave;<strong> gi&aacute; cả mua th&ugrave;ng cũng rẻ hơn mua từng lốc rất nhiều</strong>.<br />
<br />
Gi&aacute; 1 th&ugrave;ng 48 hộp sữa tươi &iacute;t đường Vinamilk 100% sữa tươi 180ml tr&ecirc;n thị trường <strong>đang được b&aacute;n khoảng 340.000 đồng</strong>, ph&ugrave; hợp với t&uacute;i tiền v&agrave; đảm bảo bổ sung những dưỡng chất cần thiết cho sự ph&aacute;t triển của cơ thể.</p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (213, 'Thùng 48 hộp sữa tươi tiệt trùng có đường Kun 180ml', 310000, 378000, 'store/images/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-co-duong-kun-180ml-202304262227056893_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-kun">Sữa tươi Kun</a> l&agrave; h&atilde;ng <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> rất nổi tiếng tại Việt Nam, được rất nhiều kh&aacute;ch h&agrave;ng lựa chọn cho con em bởi ch&iacute;nh chất lượng thơm ngon, cao cấp v&agrave; cung cấp dưỡng chất tốt. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-co-duong-kun-180ml">Th&ugrave;ng 48 hộp sữa tươi tiệt tr&ugrave;ng c&oacute; đường Kun 180ml</a> với chất liệu sữa nguy&ecirc;n chất, vị ngon thanh ấn tượng.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng c&oacute; đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa 96%, đường 3.8% , chất ổn định, hương vị sữa tự nhi&ecirc;n d&ugrave;ng cho thực phẩm.</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t.</div>
	</li>
	<li>Lưu &yacute;
	<div>Sản phẩm c&oacute; chứa sữa.</div>
	</li>
	<li>Thương hiệu
	<div>Kun (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 88, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (214, 'Thùng 48 hộp sữa tươi có đường Nestlé NutriStrong 180ml', 318000, 360000, 'store/images/sua-tuoi/thung-48-hop-sua-tiet-trung-co-duong-nestle-nutristrong-180ml-202304262221435463_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description">Được bổ sung th&ecirc;m 25% canxi, vitamin A &amp; D, <a href="https://www.bachhoaxanh.com/sua-tuoi-nestle">sữa tươi Nestle gấu</a>&nbsp;gi&uacute;p xương bạn khoẻ hơn mỗi ng&agrave;y. <a href="https://www.bachhoaxanh.com/sua-tuoi">Sữa tươi</a> Nestle được nhiều người ưa chuộng bởi nguồn dinh dưỡng dồi d&agrave;o m&agrave; n&oacute; lu&ocirc;n cung cấp cho cơ thể. <a href="https://www.bachhoaxanh.com/sua-tuoi/stt-nestle-co-duong-180ml-thung-48">Th&ugrave;ng 48 hộp sữa tiệt tr&ugrave;ng c&oacute; đường Nestl&eacute; NutriStrong 180ml</a> th&ecirc;m đường k&iacute;ch th&iacute;ch vị ngon, dễ uống</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tiệt tr&ugrave;ng c&oacute; đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, sữa bột t&aacute;ch kem (9%), đường, dầu bơ từ sữa, Calci Phosphat tự nhi&ecirc;n từ sữa, hương liệu tự nhi&ecirc;n d&ugrave;ng cho thực phẩm v&agrave; c&aacute;c vitamin (B1, A, D, B6, B8, B9)</div>
	</li>
	<li>Thương hiệu
	<div>Nestl&eacute; (Thụy Sỹ)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify">Nestl&eacute; hiện nay l&agrave; c&aacute;i t&ecirc;n trong lĩnh vực thực phẩm dinh dưỡng h&agrave;ng đầu thế giới với m&oacute;n ăn v&agrave; thức uống. T&iacute;nh đến nay, số lượng nh&agrave; m&aacute;y của Nestl&eacute; đ&atilde; đạt gần 500 tại 86 quốc gia tr&ecirc;n to&agrave;n thế giới v&agrave; sở hữu gần 8.500 thương hiệu lớn nhỏ kh&aacute;c nhau. nổi bật của Nestl&eacute; hiện nay l&agrave; sữa tươi Nestl&eacute;, Kit Kat, ngũ cốc ăn s&aacute;ng Koko Krunch, thức uống l&uacute;a mạch Milo,...<br />
Ngo&agrave;i mang đến những sản phẩm thức ăn v&agrave; thức uống thơm ngon bổ dưỡng, Nestl&eacute; c&ograve;n được biết đến bởi sự t&ocirc;n trọng những gi&aacute; trị văn h&oacute;a cũng như lu&ocirc;n đề cao những th&oacute;i quen dinh dưỡng của từng địa phương trong c&aacute;c chiến dịch truyền th&ocirc;ng. Từ đ&oacute;, Nestl&eacute; lu&ocirc;n mang đến những trải nghiệm tốt nhất cho người ti&ecirc;u d&ugrave;ng.<br />
<img alt="Thùng 48 hộp sữa tiệt trùng có đường Nestlé NutriStrong 180ml 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/156195/bhx/files/loc-4-hop-sua-tiet-trung-co-duong-nestle-nutristrong-180ml-202202211439137108.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm</strong></h3>

<p style="text-align:justify">Th&agrave;nh phần sữa tươi Nestle c&oacute; đường bao gồm: Sữa 89% (nước, sữa bột t&aacute;ch kem - skimmed milk powder, dầu bơ từ sữa - milk fat), đường 5,2%, dầu thực vật, hương giống tự nhi&ecirc;n d&ugrave;ng cho thực phẩm (c&oacute; chứa sữa - contain milk, c&oacute; chứa l&uacute;a m&igrave; - contain wheat), calci phosphat tự nhi&ecirc;n từ sữa (from milk), chất ổn định (471, 466, 460(i), 407), v&agrave; c&aacute;c vitamin (B3, A, D, B6, B9, B8).<br />
Ngo&agrave;i ra, sản phẩm cung cấp cho cơ thể <strong>khoảng 108 kcal</strong> trong 1 hộp sữa<strong> 180ml</strong>.</p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>

<p style="text-align:justify">Đặc biệt, sữa tươi của Nestl&eacute; c&ograve;n c&oacute; c&ocirc;ng thức độc quyền Nutri Strong, gi&uacute;p bổ sung l&ecirc;n đến 25% h&agrave;m lượng canxi v&agrave;&nbsp;cung cấp cho người d&ugrave;ng nguồn năng lượng dồi d&agrave;o cho sinh hoạt hằng ng&agrave;y v&agrave; gi&uacute;p xương chắc khỏe nhờ dồi d&agrave;o dưỡng chất như canxi, vitamin B3, vitamin A,...Từ đ&oacute;, sữa tươi Nestle được coi l&agrave; một trợ thủ đắc lực của bậc phụ huynh nhờ lu&ocirc;n hỗ trợ trẻ c&oacute; tr&agrave;n đầy năng lượng d&ugrave; ở bất kỳ thời điểm n&agrave;o trong ng&agrave;y.</p>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng sữa tươi Nestl&eacute;</strong></h3>

<p style="text-align:justify">Sữa tươi Nestl&eacute; ph&ugrave; hợp d&ugrave;ng trực tiếp v&agrave; sẽ ngon hơn khi uống lạnh. Trước khi uống, bạn n&ecirc;n lắc đều sản phẩm.<br />
<img alt="Thùng 48 hộp sữa tiệt trùng có đường Nestlé NutriStrong 180ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/156195/bhx/files/loc-4-hop-sua-tiet-trung-co-duong-nestle-nutristrong-180ml-202210260909037185.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Lưu &yacute; v&agrave; c&aacute;ch bảo quản khi sử dụng sản phẩm</strong></h3>

<p style="text-align:justify">Bạn cần bảo quản sữa tươi Nestl&eacute; ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Lưu &yacute;, kh&ocirc;ng d&ugrave;ng cho người dị ứng với c&aacute;c th&agrave;nh phần của sản phẩm, ngo&agrave;i ra, sản phẩm sữa tươi Nestle kh&ocirc;ng d&ugrave;ng cho trẻ sơ sinh v&agrave; trẻ em dưới 1 tuổi.</p>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p style="text-align:justify">Sản phẩm lốc 4 hộp sữa tươi c&oacute; đường Nestl&eacute; NutriStrong 180ml đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH,&nbsp;đảm bảo đ&uacute;ng nguồn gốc xuất xứ v&agrave; an to&agrave;n với người sử dụng. Bạn c&oacute; thể&nbsp;mua sản phẩm&nbsp;online qua app hoặc website để&nbsp;nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nh&agrave; nhanh ch&oacute;ng, tiện lợi.&nbsp;<br />
<img alt="Thùng 48 hộp sữa tiệt trùng có đường Nestlé NutriStrong 180ml 2" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/156195/bhx/files/loc-4-hop-sua-tiet-trung-co-duong-nestle-nutristrong-180ml-202210260909064342.jpg" style="height:768px; width:1024px" /><br />
<strong>Xem th&ecirc;m:&nbsp;</strong></p>

<ul>
	<li>
	<p style="text-align:justify"><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/bo-sung-duong-chat-cho-be-voi-sua-tuoi-nestle-1400300">Bổ sung dưỡng chất cho b&eacute; với sữa tươi Nestl&eacute;</a></p>
	</li>
</ul>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (215, 'Thùng 48 hộp sữa tươi ít đường Dalat Milk 180ml', 385000, 0, 'store/images/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-it-duong-dalat-milk-180ml-202304262237498584_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-dalat-milk">Sữa tươi Dalat Milk</a>&nbsp;được l&agrave;m từ sữa tươi của những v&ugrave;ng chăn nu&ocirc;i b&ograve; <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a>&nbsp;nổi tiếng chất lượng theo ti&ecirc;u chuẩn Dalatmilk, cung cấp cho bạn c&aacute;c vitamin kho&aacute;ng chất. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-it-duong-dalat-milk-180ml">Th&ugrave;ng 48 hộp sữa tươi tiệt tr&ugrave;ng &iacute;t đường Dalat Milk 180ml</a> &iacute;t đường với hương vị thơm ngon dễ uống.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa ho&agrave;n to&agrave;n từ sữa b&ograve; tươi (97%), đường (2.8%), hỗn hợp chất nhũ ho&aacute; v&agrave; chất ổn định (E418, E471, E410)</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp</div>
	</li>
	<li>Thương hiệu
	<div>Dalat Milk (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>

<div class="description">
<h2 style="text-align:justify"><strong>Sữa tươi tiệt tr&ugrave;ng Dalatmilk ho&agrave;n to&agrave;n tự nhi&ecirc;n</strong></h2>

<p style="text-align:justify">Từ năm 2009&nbsp;đến nay, Dalat Milk l&agrave; một thương hiệu sữa&nbsp;lu&ocirc;n hướng tới ti&ecirc;u ch&iacute; đem đến nguồn sữa tươi chất lượng tốt nhất&nbsp;đến từ cao nguy&ecirc;n đến cho người ti&ecirc;u d&ugrave;ng c&ugrave;ng&nbsp;hương vị độc đ&aacute;o.</p>

<h3 style="text-align:justify"><strong>Giới thiệu thương hiệu Dalatmilk</strong></h3>

<p style="text-align:justify">Dalat Milk l&agrave; một thương hiệu sữa được th&agrave;nh lập năm 2009 với tiền th&acirc;n l&agrave; N&ocirc;ng trường B&ograve; sữa L&acirc;m Đồng. Tuy l&agrave; thương hiệu đi sau những &quot;&ocirc;ng lớn&quot; trong ng&agrave;nh sữa như C&ocirc; g&aacute;i H&agrave; Lan, Vinamilk,...&nbsp;nhưng Dalat Milk đến nay vẫn kh&ocirc;ng ngừng&nbsp;củng cố được chỗ đứng vững chắc tr&ecirc;n thị trường sữa Việt Nam v&agrave; lan rộng nhận diện thương hiệu của m&igrave;nh.<br />
<img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường Dalat Milk 180ml 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/223740/bhx/files/85064689_2745358448912068_9116384727928930304_n.jpg" style="height:500px; width:800px" /><br />
Với mục ti&ecirc;u m,ang đến những sản phẩm sữa chất lượng tốt v&agrave; ho&agrave;n to&agrave;n tự nhi&ecirc;n, Dalat Milk sở hữu ưu thế của ri&ecirc;ng m&igrave;nh với nguồn sữa đạt chuẩn an to&agrave;n, chất lượng vượt trội c&ugrave;ng hương vị mới lạ, độc đ&aacute;o. Th&agrave;nh phẩm n&agrave;y được l&agrave;m từ những con b&ograve; sữa tr&ecirc;n cao nguy&ecirc;n được chăm s&oacute;c cẩn thận để đảm bảo cho ra đời c&aacute;c sản phẩm từ sữa c&oacute; chất lượng tốt nhất.<br />
Hiện nay, Dalat Milk đang kinh doanh c&aacute;c sản phẩm phổ biến tr&ecirc;n thị trương như: sữa tươi tiệt tr&ugrave;ng, sữa tươi thanh tr&ugrave;ng, sữa chua ăn, sữa chua uống,...</p>

<h3 style="text-align:justify"><strong>Giới thiệu d&ograve;ng sản phẩm sữa tươi tiệt tr&ugrave;ng Dalatmilk</strong></h3>

<div style="text-align:justify">Sữa tươi tiệt tr&ugrave;ng Dalatmilk l&agrave; d&ograve;ng sản phẩm được sản xuất từ sữa tươi nguy&ecirc;n chất từ những v&ugrave;ng chăn nu&ocirc;i b&ograve; sữa nổi tiếng. Đặc biệt, c&aacute;c sản phẩm sữa tươi n&agrave;y kh&ocirc;ng hề sử dụng bất kỳ chất bảo quản hoặc nguy&ecirc;n liệu tổng hợp n&agrave;o cả.<br />
Ngo&agrave;i ra, Dalatmilk c&ograve;n ứng dụng c&ocirc;ng nghệ cao cho d&acirc;y chuyền sản xuất của m&igrave;nh để cho ra chất lượng sữa đồng nhất v&agrave; tốt nhất chuẩn Dalatmilk. Bằng c&aacute;ch lắp đặt ch&iacute;p đeo điện tử, t&igrave;nh trạng sức khỏe của đ&agrave;n b&ograve; sẽ lu&ocirc;n được theo d&otilde;i v&agrave; cập nhật kịp thời th&ocirc;ng qua m&aacute;y t&iacute;nh hoặc điện thoại th&ocirc;ng minh.<br />
Nhờ đ&oacute;, người n&ocirc;ng d&acirc;n c&oacute; thể nhận được những cảnh bảo sớm về t&igrave;nh trạng sức khỏe của b&ograve; để đưa ra những giải ph&aacute;p điều cần thiết v&agrave; kịp thời nhất, gi&uacute;p kh&ocirc;ng ảnh hưởng đến quy tr&igrave;nh sản xuất sữa.<br />
<img alt="Thùng 48 hộp sữa tươi tiệt trùng ít đường Dalat Milk 180ml 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/223740/bhx/files/images.png" style="height:500px; width:800px" /><br />
V&igrave; kh&ocirc;ng sử dụng chất bảo quản v&agrave; c&aacute;c hương liệu, nguy&ecirc;n liệu tổng hợp, sữa tươi Dalatmilk l&agrave; nguồn dinh dưỡng ho&agrave;n to&agrave;n tự nhi&ecirc;n gi&uacute;p bổ sung chất dinh dưỡng quan trọng cho mọi lứa tuổi.<br />
Ch&iacute;nh v&igrave; vậy, Dalatmilk được coi một trong những thương hiệu thực phẩm dinh dưỡng, sữa ho&agrave;n hảo nhất v&igrave; chứa đầy đủ c&aacute;c dưỡng chất cho một chế độ dinh dưỡng c&acirc;n bằng.<br />
<em>Xem th&ecirc;m:</em>&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/sua-tuoi-dalat-milk-co-tot-khong-1264397"><strong>Sữa tươi Dalat Milk c&oacute; tốt kh&ocirc;ng?</strong></a><br />
Ngo&agrave;i ra, sữa tươi tiệt tr&ugrave;ng Dalatmilk đa dạng về hương vị (c&oacute; đường, kh&ocirc;ng đường, &iacute;t đường,...) v&agrave; chủng loại, mang đến hương vị thơm ngon v&agrave; cung cấp nguồn dưỡng chất tự nhi&ecirc;n, an to&agrave;n cho sức khỏe cả gia đ&igrave;nh.</div>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (216, 'Thùng 48 hộp sữa tươi ít đường Đà Lạt True Milk 180ml', 396000, 0, 'store/images/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-it-duong-da-lat-true-milk-180ml-202304262229011390_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-da-lat-true-milk">Sữa tươi Đ&agrave; Lạt True Milk</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> c&oacute; hương vị thơm ngon, gi&agrave;u đạm sữa. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-it-duong-da-lat-true-milk-180ml">Th&ugrave;ng 48 hộp sữa tươi &iacute;t đường Đ&agrave; Lạt True Milk 180ml</a> được l&agrave;m từ sữa b&ograve; tươi nguy&ecirc;n chất, kh&ocirc;ng chất bảo quản, gi&uacute;p bổ sung vitamin, canxi v&agrave;&nbsp;hương vị sữa thơm ngon đặc biệt, cho gia đ&igrave;nh vui khoẻ mỗi ng&agrave;y.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Người lớn v&agrave; trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa b&ograve; tươi nguy&ecirc;n chất 97%, đường 2,7%, hỗn hợp chất nhũ h&oacute;a v&agrave; chất ổn định (E407, E412, E471, E401, E452i).</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>Đ&agrave; Lạt True Milk</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (217, 'Thùng 48 hộp sữa tươi có đường VPMilk 110ml', 229000, 252000, 'store/images/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-co-duong-vpmilk-grow-110ml-202304261730001695_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-vpmilk">Sữa tươi VPMilk</a> l&agrave; loại <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> mang đến hương vị thơm ngon, gi&agrave;u canxi v&agrave; đạm sữa. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-48-hop-sua-tuoi-tiet-trung-co-duong-vpmilk-grow-110ml">Th&ugrave;ng 48 hộp sữa tươi tiệt tr&ugrave;ng c&oacute; đường VPMilk Grow+ 110ml</a>&nbsp;nhỏ gọn, tiện lợi, dễ d&ugrave;ng v&agrave; kh&ocirc;ng chứa chất bảo quản, c&ugrave;ng c&ocirc;ng thức Grow+ bổ sung vi chất hỗ trợ trẻ cao lớn tinh anh v&agrave; tăng cường tr&iacute; nhớ.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng c&oacute; đường</div>
	</li>
	<li>Dung t&iacute;ch
	<div>110ml</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Người lớn v&agrave; trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Sữa 94% (Nước, bột sữa, chất b&eacute;o sữa), đường tinh luyện (3,8%), dầu thực vật, chất ổn định, hương liệu tổng hợp d&ugrave;ng cho thực phẩm,...</div>
	</li>
	<li>Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o v&agrave; tho&aacute;ng m&aacute;t</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li>Thương hiệu
	<div>VPMilk (Việt Nam)</div>
	</li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (218, '2 bịch sữa dâu Dutch Lady 210ml', 13500, 14400, 'store/images/sua-tuoi/sua-tiet-trung-huong-dau-dutch-lady-canxi-protein-bich-210ml-202305030952387660_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-dutch-lady">Sữa tươi Dutch Lady</a>&nbsp;l&agrave; nguồn bổ sung canxi v&agrave; protein thiết yếu mỗi ng&agrave;y cho b&eacute;, gi&uacute;p b&eacute; khoẻ mạnh, cao lớn hơn. <a href="https://www.bachhoaxanh.com/sua-tuoi">Sữa tươi</a>&nbsp;mang đến&nbsp;hương d&acirc;u, thơm ngon, uống kh&ocirc;ng ng&aacute;n. <a href="https://www.bachhoaxanh.com/sua-tuoi/2-bich-sua-dau-dutch-lady-canxi-protein-210ml">2 bịch sữa tiệt tr&ugrave;ng hương d&acirc;u Dutch Lady 210ml</a> bịch tiện lợi, dễ d&agrave;ng mang đi nhiều nơi.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tiệt tr&ugrave;ng hương d&acirc;u</div>
	</li>
	<li>Dung t&iacute;ch
	<div>210ml/bịch</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>Nước, sữa tươi (20%), bột sữa gầy, đường, chất b&eacute;o sữa, lactose, chất nhũ h&oacute;a (471), cholin, hướng d&acirc;u tổng hợp d&ugrave;ng trong thực phẩm, chất ổn định (407). m&agrave;u tổng hợp d&ugrave;ng trong thực phẩm (129), vitamin D3</div>
	</li>
	<li>Thương hiệu <a class="brandinfo" href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dutch-lady-tieu-chuan-ha-lan-trong-tung-ly-sua-1177286" target="_blank" title="Sữa tươi Dutch Lady">Dutch Lady (H&agrave; Lan)</a></li>
	<li>Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (219, 'Thùng 12 hộp sữa tươi nguyên kem Meadow Fresh 1 lít', 369000, 608000, 'store/images/sua-tuoi/thung-12-hop-sua-tuoi-tiet-trung-nguyen-kem-meadow-fresh-1-lit-san-xuat-tu-new-zealand-202304262225118895_300x300.jpg', '<div class="details">
<h2>Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description"><a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">Sữa tươi tiệt tr&ugrave;ng Meadow Fresh</a> với 100% <a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">sữa tươi</a> nguy&ecirc;n chất nhập khẩu từ New Zealand, kh&ocirc;ng sử dụng chất bảo quản, đảm bảo lưu giữ hương vị&nbsp;thuần khiết của sữa với 3 ti&ecirc;u ch&iacute; nguy&ecirc;n chất, tự nhi&ecirc;n v&agrave; gi&agrave;u dưỡng chất. <a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tt-meadow-fresh-nguyen-kem-1l-th12">Th&ugrave;ng 12 hộp sữa tươi nguy&ecirc;n kem Meadow Fresh 1 l&iacute;t</a> đ&oacute;ng th&ugrave;ng&nbsp;tiện lợi.</div>

<ul style="margin-left:40px">
	<li>Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng nguy&ecirc;n kem</div>
	</li>
	<li>Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li>Ph&ugrave; hợp với
	<div>Người lớn v&agrave; trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li>Th&agrave;nh phần
	<div>100% sữa tươi nguy&ecirc;n chất</div>
	</li>
	<li>C&aacute;ch mở nắp
	<div>Thiết kế t&iacute;ch hợp thanh cắt b&ecirc;n trong, chỉ cần vặn l&agrave; thanh cắt xo&aacute;y xuống, tự động cắt lớp giấy bạc bảo vệ b&ecirc;n dưới, khui hộp chỉ với một bước</div>
	</li>
	<li>Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Bảo quản lạnh ở nhiệt độ 2-4 độ C sau khi mở bao b&igrave; v&agrave; sử dụng hết trong v&ograve;ng 7 ng&agrave;y.</div>
	</li>
	<li>Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi.</div>
	</li>
	<li>Thương hiệu
	<div>Meadow Fresh (Australia)</div>
	</li>
	<li>Sản xuất tại
	<div>New Zealand</div>
	</li>
</ul>

<div class="description">
<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p>Sữa tươi Meadow Fresh l&agrave; thương hiệu thực phẩm ra đời ở New Zealand từ năm 1954. Thương hiệu hiện nay&nbsp;l&agrave; c&aacute;i t&ecirc;n chuy&ecirc;n mang đến d&ograve;ng sữa tươi nổi tiếng hiện đang được sản xuất v&agrave; đ&oacute;ng gới bởi c&ocirc;ng ty Nature Dairy tại&nbsp;&Uacute;c. Tất cả mọi sản phẩm đều đạt chuẩn chất lượng, đ&aacute;p ứng ti&ecirc;u chuẩn sản xuất, đảm bảo quy tr&igrave;nh kiểm định, mang sản phẩm đủ đầy dinh dưỡng nhất v&agrave; an to&agrave;n nhất đến tay người sử dụng.</p>

<h3><strong>Th&agrave;nh phần dinh dưỡng của&nbsp;sản phẩm</strong></h3>

<p><strong>Sữa tươi tiệt tr&ugrave;ng Meadow Fresh nguy&ecirc;n kem</strong>&nbsp;sở hữu th&agrave;nh phần ch&iacute;nh l&agrave; sữa tươi 100% được nhập khẩu ho&agrave;n to&agrave;n từ New Zealand. Ngo&agrave;i ra, sản phẩm cung cấp khoảng 62 kcal tr&ecirc;n 100ml sữa.</p>

<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe&nbsp;</strong></h3>

<p>Sản phẩm sử dụng c&ocirc;ng nghệ hiện đại để tiệt tr&ugrave;ng v&agrave; đ&oacute;ng g&oacute;i, gi&uacute;p giữ được hương vị tươi nguy&ecirc;n, b&eacute;o ngậy v&agrave; thơm ngon đặc trưng của sữa tươi, mang đến cho người ti&ecirc;u d&ugrave;ng&nbsp;dồi d&agrave;o vitamin v&agrave; kho&aacute;ng chất, đặc biệt l&agrave; protein v&agrave; canxi rất tốt cho hệ xương cũng như hệ miễn dịch của cơ thể.<img alt="Thùng 12 hộp sữa tươi tiệt trùng nguyên kem Meadow Fresh 1 lít sản xuất từ New Zealand 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179672/bhx/thung-12-hop-sua-tuoi-tiet-trung-nguyen-kem-meadow-fresh-1-lit-san-xuat-tu-uc-202304210859089856.jpg" /></p>

<h3><strong>Hướng dẫn sử dụng</strong></h3>

<ul>
	<li>
	<p>D&ugrave;ng uống trực tiếp hoặc để chế biến m&oacute;n ăn.</p>
	</li>
	<li>
	<p>Ngon hơn khi uống lạnh</p>
	</li>
</ul>

<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng sản phẩm</strong></h3>

<p>Lưu &yacute;, sữa tươi Meadow Fresh kh&ocirc;ng ph&ugrave; hợp sử dụng cho trẻ dưới 1 tuổi v&agrave; người bị dị ứng với th&agrave;nh phần của sữa. Ngo&agrave;i ra, sản phẩm đ&atilde; mở nắp th&igrave; cần được bảo quản lạnh 2 - 4 độ C v&agrave; d&ugrave;ng hết trong 7 ng&agrave;y.<br />
<img alt="Thùng 12 hộp sữa tươi tiệt trùng nguyên kem Meadow Fresh 1 lít sản xuất từ New Zealand 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179672/bhx/thung-12-hop-sua-tuoi-tiet-trung-nguyen-kem-meadow-fresh-1-lit-san-xuat-tu-uc-202304151701329838.jpg" /></p>

<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p>Sữa tươi nguy&ecirc;n kem Meadow Fresh hiện đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH, đảm bảo đ&uacute;ng&nbsp;100% nguồn gốc xuất xứ từ nh&agrave; sản xuất. Người d&ugrave;ng c&oacute; thể mua online tại website ch&iacute;nh h&atilde;ng&nbsp;hoặc đến trực tiếp mua h&agrave;ng tại hệ thống si&ecirc;u thị&nbsp;với nhiều&nbsp;ưu đ&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nơi nhanh ch&oacute;ng.<br />
<strong>Xem th&ecirc;m</strong>:&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meadow-fresh-thuong-hieu-sua-ngon-noi-tieng-cua-uc-1441413">Meadow Fresh - thương hiệu sữa ngon nổi tiếng</a></p>
</div>
</div>', 'thuc-uong', 0, 66, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (220, 'Thùng 12 hộp sữa tươi giàu canxi Meadow Fresh 1 lít', 490000, 735000, 'store/images/sua-tuoi/thung-12-hop-sua-tuoi-tiet-trung-giau-canxi-it-beo-meadow-fresh-1-lit-san-xuat-tu-new-zealand-202304262224295050_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify"><a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">Sữa tươi Meadow Fresh</a> với 100% <a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">sữa tươi</a> nguy&ecirc;n chất, kh&ocirc;ng chất bảo quản, đảm bảo lưu giữ hương vị&nbsp;thuần khiết với 3 ti&ecirc;u ch&iacute; nguy&ecirc;n chất, tự nhi&ecirc;n v&agrave; gi&agrave;u dưỡng chất.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tt-meadow-fresh-giau-canxi-1l-th12">Th&ugrave;ng 12 hộp sữa tươi gi&agrave;u canxi &iacute;t b&eacute;o Meadow Fresh 1 l&iacute;t</a>&nbsp;tiện lợi, c&ugrave;ng&nbsp;h&agrave;m lượng canxi cao hơn 50% so với sữa nguy&ecirc;n kem.</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng gi&agrave;u canxi &iacute;t b&eacute;o</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Người lớn v&agrave; trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>Sữa tươi (95%), sữa bột t&aacute;ch b&eacute;o</div>
	</li>
	<li style="text-align: justify;">C&aacute;ch mở nắp
	<div>Thiết kế t&iacute;ch hợp thanh cắt b&ecirc;n trong, chỉ cần vặn l&agrave; thanh cắt xo&aacute;y xuống, tự động cắt lớp giấy bạc bảo vệ b&ecirc;n dưới, khui hộp chỉ với một bước</div>
	</li>
	<li style="text-align: justify;">Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Bảo quản lạnh ở nhiệt độ 2-4 độ C sau khi mở bao b&igrave; v&agrave; sử dụng hết trong v&ograve;ng 7 ng&agrave;y.</div>
	</li>
	<li style="text-align: justify;">Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Meadow Fresh (Australia)</div>
	</li>
	<li style="text-align: justify;">Sản xuất tại
	<div>New Zealand</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (221, 'Sữa tươi ít đường Dutch Lady Canxi & Protein bịch 180ml', 4900, 7300, 'store/images/sua-tuoi/sua-tuoi-tiet-trung-it-duong-dutch-lady-canxi-protein-bich-180ml-202304262020411468_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify"><a href="https://www.bachhoaxanh.com/sua-tuoi-dutch-lady">Sữa tươi Dutch Lady</a>, l&agrave; nguồn bổ sung canxi v&agrave; protein thiết yếu mỗi ng&agrave;y cho b&eacute;, gi&uacute;p b&eacute; khoẻ mạnh, cao lớn hơn. <a href="https://www.bachhoaxanh.com/sua-tuoi">Sữa tươi</a> được giảm đường, thơm ngon, uống kh&ocirc;ng ng&aacute;n. <a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tiet-trung-it-duong-dutch-lady-canxi-protein-bich-180ml">Sữa tươi tiệt tr&ugrave;ng &iacute;t đường Dutch Lady Canxi &amp; Protein 180ml </a>đ&oacute;ng&nbsp;bịch tiện lợi, dễ d&agrave;ng mang đi nhiều nơi.</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t đường</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>180ml</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>Sữa 93% (nước, bột sữa gầy), dầu thực vật, đường, chất nhũ ho&aacute;, chất ổn định, hương tổng hợp d&ugrave;ng trong thực phẩm</div>
	</li>
	<li style="text-align: justify;">Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Ngon hơn khi uống lạnh. Lắc đều trước khi sử dụng.</div>
	</li>
	<li style="text-align: justify;">Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li style="text-align: justify;">Thương hiệu <a class="brandinfo" href="https://www.bachhoaxanh.com/kinh-nghiem-hay/dutch-lady-tieu-chuan-ha-lan-trong-tung-ly-sua-1177286" target="_blank" title="Sữa tươi Dutch Lady">Dutch Lady (H&agrave; Lan)</a></li>
	<li style="text-align: justify;">Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (222, 'Thùng 24 hộp sữa tươi Meadow Fresh socola 200ml', 281000, 390000, 'store/images/sua-tuoi/thung-24-hop-sua-tuoi-tiet-trung-socola-meadow-fresh-200ml-202304262224069743_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify"><a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">Sữa tươi tiệt tr&ugrave;ng Meadow Fresh</a> với 100% <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> nguy&ecirc;n chất nhập khẩu từ &Uacute;c &amp; New Zealand, kh&ocirc;ng chất bảo quản, đảm bảo lưu giữ hương vị thuần khiết của sữa với 3 ti&ecirc;u ch&iacute; nguy&ecirc;n chất, tự nhi&ecirc;n v&agrave; gi&agrave;u dưỡng chất.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tt-meadow-fresh-socola-200ml-th24">Th&ugrave;ng 24 hộp sữa tươi socola Meadow Fresh 200ml</a> tiện lợi, thơm ngon dễ d&ugrave;ng.</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng socola</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>200ml</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Người lớn v&agrave; trẻ em từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>Sữa tươi, nước, đường, Protein sữa, bột cacao,...</div>
	</li>
	<li style="text-align: justify;">Bảo quản
	<div>Bảo quản lạnh ở nhiệt độ từ 2 độ C- 4 độ C sau khi mở bao b&igrave; v&agrave; d&ugrave;ng hết trong 7 ng&agrave;y.</div>
	</li>
	<li style="text-align: justify;">Hạn sử dụng
	<div>9 th&aacute;ng kể từ ng&agrave;y sản xuất in tr&ecirc;n bao b&igrave;</div>
	</li>
	<li style="text-align: justify;">Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Hộp 200ml n&ecirc;n được d&ugrave;ng hết cho một lần sử dụng</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Meadow Fresh (&Uacute;c)</div>
	</li>
	<li style="text-align: justify;">Sản xuất tại
	<div>&Uacute;c</div>
	</li>
</ul>

<div class="description">
<p style="text-align:justify"><strong>Th&agrave;nh phần v&agrave; c&ocirc;ng dụng</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Sữa tươi tiệt tr&ugrave;ng&nbsp;Meadow Fresh hương Socola kết hợp giữa sữa tươi với vị socola thơm ngon, b&eacute;o ngậy, kh&ocirc;ng ng&aacute;n, ph&ugrave; hợp với mọi lứa tuổi.</p>
	</li>
	<li>
	<p style="text-align:justify">Th&agrave;nh phần: sữa tươi, nước, đường, protein sữa, bột cacao, hương socola tự nhi&ecirc;n, chất nhũ h&oacute;a, chất ổn định.</p>
	</li>
	<li>
	<p style="text-align:justify">Gi&uacute;p cơ thể bổ sung canxi, vitamin, kho&aacute;ng chất v&agrave; năng lượng để ph&aacute;t triển hệ xương, tăng c&acirc;n, v&agrave; khỏe mạnh suốt ng&agrave;y d&agrave;i năng động.</p>
	</li>
	<li>
	<p style="text-align:justify">Sản phẩm được sản xuất theo ti&ecirc;u chuẩn vệ sinh an to&agrave;n thực phẩm nghi&ecirc;m ngặt của New Zealand.</p>
	</li>
	<li>
	<p style="text-align:justify">Đ&oacute;ng hộp nhỏ gọn, tiện mang theo trong cặp, balo, t&uacute;i x&aacute;ch đi học, đi l&agrave;m, đi chơi&hellip;</p>
	</li>
</ul>

<p style="text-align:justify"><strong>Hướng dẫn sử dụng</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">D&ugrave;ng uống trực tiếp, ngon hơn khi uống lạnh.</p>
	</li>
	<li>
	<p style="text-align:justify">Lắc đều trước khi uống.</p>
	</li>
</ul>

<p style="text-align:justify"><strong>Lưu &yacute;:</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi.</p>
	</li>
	<li>
	<p style="text-align:justify">Kh&ocirc;ng d&ugrave;ng cho người dị ứng với c&aacute;c th&agrave;nh phần của sữa.</p>
	</li>
</ul>

<p style="text-align:justify"><strong>Bảo quản</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>
	</li>
	<li>
	<p style="text-align:justify">Khi chưa mở nắp, bảo quản được đến hết hạn d&ugrave;ng.</p>
	</li>
	<li>
	<p style="text-align:justify">Bảo quản lạnh ở nhiệt độ từ 2 độ C- 4 độ C sau khi mở bao b&igrave; v&agrave; d&ugrave;ng hết trong 7 ng&agrave;y.</p>
	</li>
</ul>

<p style="text-align:justify">H&igrave;nh ảnh Th&ugrave;ng&nbsp;Sữa tươi tiệt tr&ugrave;ng Meadow Fresh&nbsp;hương Socola 200ml (24 hộp)</p>

<p style="text-align:justify"><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 0" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-2.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 1" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-3.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 2" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-4.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 3" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-5.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 4" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-6.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 5" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-7.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 6" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-8.jpg" /><img alt="Thùng 24 hộp sữa tươi tiệt trùng socola Meadow Fresh 200ml 7" class="lazy" src="https://cdn.tgdd.vn/Products/Images/2386/179661/sua-tuoi-tt-meadow-fresh-socola-200ml-th24-9.jpg" /></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (223, 'Sữa tươi có đường Nutimilk bịch 220ml', 5700, 7600, 'store/images/sua-tuoi/sua-dinh-duong-co-duong-nutimilk-bich-220ml-202304262008345154_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify"><a href="https://www.bachhoaxanh.com/sua-tuoi-nutimilk">Sữa tươi NutiMilk</a> c&oacute; h&agrave;m lượng dinh dưỡng vượt trội, đạt ti&ecirc;u chuẩn tr&ecirc;n thế giới. <a href="https://www.bachhoaxanh.com/sua-tuoi">Sữa tươi</a> thơm ngon tự nhi&ecirc;n, dồi d&agrave;o h&agrave;m lượng dinh dưỡng tương đương sữa nhập n&ecirc;n được c&aacute;c b&agrave; mẹ ưa chuộng.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-dinh-duong-co-duong-nutimilk-bich-220ml">Sữa dinh dưỡng c&oacute; đường Nutimilk bịch 220ml</a>&nbsp;th&ecirc;m đường dễ uống, gọn nhẹ v&ocirc; c&ugrave;ng.</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa dinh dưỡng c&oacute; đường</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>220ml</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>Sữa (94,3%) (nước, sữa tươi, sữa bột, chất b&eacute;o sữa), đường tinh luyện (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định d&agrave;nh cho thực phẩm, vitamin v&agrave; kho&aacute;ng chất (vitamin A, D3, kẽm sulfat)</div>
	</li>
	<li style="text-align: justify;">Bảo quản
	<div>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Lắc đều trước khi uống v&agrave; ngon hơn khi uống lạnh.</div>
	</li>
	<li style="text-align: justify;">Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Nutimilk (Việt Nam)</div>
	</li>
	<li style="text-align: justify;">Sản xuất tại
	<div>Việt Nam</div>
	</li>
</ul>
</div>', 'thuc-uong', 0, 12, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (224, 'Sữa tươi tách béo Harvey Fresh Skim Milk hộp 1 lít', 42000, 55000, 'store/images/sua-tuoi/sua-tuoi-tiet-trung-tach-beo-harvey-fresh-skim-milk-hop-1-lit-san-xuat-tu-uc-202304262016540313_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify">L&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> được sản xuất tại &Uacute;c,&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi-harvey-fresh">sữa tươi Harvey Fresh</a>&nbsp;cung cấp cho cơ thể canxi, protein v&agrave; năng lượng dồi d&agrave;o, gi&uacute;p bạn ngập tr&agrave;n năng lượng, cơ thể khoẻ mạnh hơn.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tiet-trung-harvey-fresh-tach-beo-hop-1lit">Sữa tươi tiệt tr&ugrave;ng t&aacute;ch b&eacute;o Harvey Fresh Skim Milk hộp 1 l&iacute;t</a> th&iacute;ch hợp cho người đang ăn ki&ecirc;ng, người muốn giảm c&acirc;n</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng t&aacute;ch b&eacute;o</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>100% sữa tươi nguy&ecirc;n chất</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Harvey Fresh (&Uacute;c)</div>
	</li>
	<li style="text-align: justify;">Sản xuất tại
	<div>&Uacute;c</div>
	</li>
</ul>

<div class="description">
<p style="text-align:justify"><strong>Sữa tươi tiệt tr&ugrave;ng t&aacute;ch b&eacute;o Harvey Fresh</strong> được nhập khẩu ho&agrave;n to&agrave;n từ &Uacute;c, với th&agrave;nh phần l&agrave; sữa tươi 100% cung cấp nguồn canxi v&agrave; protein c&ugrave;ng nhiều dưỡng chất cần thiết,&nbsp;gi&uacute;p hệ xương v&agrave; răng chắc khoẻ, tăng cường sức đề kh&aacute;ng v&agrave; hệ miễn dịch cho cơ thể.</p>

<p style="text-align:justify"><strong>Sữa tươi</strong> sử dụng c&ocirc;ng nghệ tiệt tr&ugrave;ng hiện đại, gi&uacute;p loại bỏ c&aacute;c vi khuẩn c&oacute; hại trong sữa đồng thời giữ lại trọn vẹn chất dinh dưỡng v&agrave; vị sữa b&eacute;o ngậy đặc trưng. Nhờ c&ocirc;ng nghệ tiệt tr&ugrave;ng n&agrave;y, sữa tươi c&oacute; thể để được từ 6 th&aacute;ng đến 1 năm trong điều kiện tho&aacute;ng m&aacute;t m&agrave; kh&ocirc;ng cần d&ugrave;ng chất bảo quản.</p>

<p style="text-align:justify">Sữa tươi t&aacute;ch b&eacute;o Harvey Fresh chỉ <strong>chứa chưa đến 0,02%</strong> chất b&eacute;o, ph&ugrave; hợp với người ăn ki&ecirc;ng, người b&eacute;o ph&igrave; hoặc cần ki&ecirc;ng cử chất b&eacute;o.</p>

<p style="text-align:justify"><strong>Hướng dẫn sử dụng:</strong></p>

<ul style="margin-left:40px">
	<li style="text-align: justify;">D&ugrave;ng trực tiếp.</li>
	<li style="text-align: justify;">Ngon hơn khi ướp lạnh.</li>
	<li style="text-align: justify;">Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 2 tuổi.</li>
</ul>

<p style="text-align:justify"><strong>Bảo quản:</strong></p>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Đặt ở những nơi tho&aacute;ng m&aacute;t, kh&ocirc; r&aacute;o, tr&aacute;nh &aacute;nh mặt trời.</li>
	<li style="text-align: justify;">N&ecirc;n d&ugrave;ng hết sau khi mở, nếu c&ograve;n bảo quản ngăn m&aacute;t tủ lạnh, n&ecirc;n d&ugrave;ng hết sau 3 ng&agrave;y.</li>
</ul>
</div>
</div>', 'thuc-uong', 1, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (225, 'Sữa tươi ít béo Harvey Fresh hộp 1 lít', 42000, 55000, 'store/images/sua-tuoi/sua-tuoi-tiet-trung-it-beo-harvey-fresh-hop-1-lit-san-xuat-tu-uc-202304262016384852_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify">L&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> được sản xuất tại &Uacute;c,&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi-harvey-fresh">sữa tươi Harvey Fresh</a>&nbsp;cung cấp cho cơ thể canxi, protein v&agrave; năng lượng dồi d&agrave;o, gi&uacute;p bạn ngập tr&agrave;n năng lượng, cơ thể khoẻ mạnh hơn.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tiet-trung-harvey-fresh-it-beo-hop-1lit">Sữa tươi tiệt tr&ugrave;ng &iacute;t b&eacute;o Harvey Fresh hộp 1 l&iacute;t</a> giảm bớt lượng chất b&eacute;o đi v&agrave;o cơ thể</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t b&eacute;o</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Trẻ tr&ecirc;n 2 tuổi</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>100% Sữa tươi nguy&ecirc;n chất</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Harvey Fresh (&Uacute;c)</div>
	</li>
	<li style="text-align: justify;">Sản xuất tại
	<div>&Uacute;c</div>
	</li>
</ul>

<div class="description">
<p style="text-align:justify"><strong>Sữa tươi tiệt tr&ugrave;ng Harvey Fresh &iacute;t b&eacute;o</strong> được nhập khẩu ho&agrave;n to&agrave;n từ &Uacute;c với hương vị thơm ngon v&agrave; chứa nhiều dưỡng chất quan trọng như protein, canxi, c&ugrave;ng nhiều vitamin v&agrave; kho&aacute;ng chất c&oacute; lợi cho sức khoẻ xương, hệ miễn dịch v&agrave; sức đề kh&aacute;ng.</p>

<p style="text-align:justify"><strong><a href="https://www.bachhoaxanh.com/sua-tuoi">Sữa tươi</a></strong> sử dụng c&ocirc;ng nghệ t&aacute;ch b&eacute;o (chỉ c&ograve;n lại &lt; 2% chất b&eacute;o) v&agrave; tiệt tr&ugrave;ng hiện đại của &Uacute;c, gi&uacute;p loại bỏ bớt chất b&eacute;o v&agrave; c&aacute;c vi khuẩn c&oacute; hại trong sữa đồng thời giữ lại gần như trọn vẹn vị ngon v&agrave; c&aacute;c dưỡng chất của sữa.</p>

<p style="text-align:justify">Sữa b&eacute;o ngậy, thơm ngon, th&iacute;ch hợp để uống h&agrave;ng ng&agrave;y hoặc d&ugrave;ng khi chế biến đồ tr&aacute;ng miệng, m&oacute;n s&uacute;p,...</p>

<p style="text-align:justify"><strong>Hướng dẫn sử dụng:</strong></p>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Sử dụng trực tiếp sau khi mở hộp.</li>
	<li style="text-align: justify;">Ngon hơn khi uống lạnh.</li>
	<li style="text-align: justify;">D&ugrave;ng cho b&eacute; tr&ecirc;n 2&nbsp;tuổi.</li>
</ul>

<p style="text-align:justify"><strong>Bảo quản:</strong></p>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Bảo quản nơi tho&aacute;ng m&aacute;t, kh&ocirc; r&aacute;o.</li>
	<li style="text-align: justify;">Tr&aacute;nh &aacute;nh s&aacute;ng trực tiếp.</li>
</ul>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (226, 'Sữa tươi tách béo Meadow Fresh hộp 1 lít', 39000, 51000, 'store/images/sua-tuoi/sua-tuoi-tiet-trung-khong-beo-meadow-fresh-1-lit-san-xuat-tu-uc-202304262015305702_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify"><a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">Sữa tươi tiệt tr&ugrave;ng Meadow Fresh</a> với 100% <a href="https://www.bachhoaxanh.com/sua-tuoi-meadow-fresh">sữa tươi</a> nguy&ecirc;n chất nhập khẩu từ &Uacute;c &amp; New Zealand, kh&ocirc;ng sử dụng chất bảo quản, đảm bảo lưu giữ hương vị&nbsp;thuần khiết của sữa với 3 ti&ecirc;u ch&iacute; nguy&ecirc;n chất, tự nhi&ecirc;n v&agrave; gi&agrave;u dưỡng chất.&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi/sua-tuoi-tt-meadow-fresh-khong-beo-1l">Sữa tươi kh&ocirc;ng b&eacute;o Meadow Fresh 1 l&iacute;t</a> thơm ngon, gi&uacute;p giảm c&acirc;n hiệu quả.</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng kh&ocirc;ng b&eacute;o</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Người lớn v&agrave; trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>100% sữa tươi</div>
	</li>
	<li style="text-align: justify;">C&aacute;ch mở nắp
	<div>Thiết kế t&iacute;ch hợp thanh cắt b&ecirc;n trong, chỉ cần vặn l&agrave; thanh cắt xo&aacute;y xuống, tự động cắt lớp giấy bạc bảo vệ b&ecirc;n dưới, khui hộp chỉ với một bước</div>
	</li>
	<li style="text-align: justify;">Bảo quản
	<div>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Bảo quản lạnh ở nhiệt độ 2-4 độ C sau khi mở bao b&igrave; v&agrave; sử dụng hết trong v&ograve;ng 7 ng&agrave;y.</div>
	</li>
	<li style="text-align: justify;">Lưu &yacute;
	<div>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi.</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Meadow Fresh (Australia)</div>
	</li>
</ul>

<div class="description">
<h3 style="text-align:justify"><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>

<p style="text-align:justify">Meadow Fresh l&agrave; thương hiệu chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm dinh dưỡng được th&agrave;nh lập tại&nbsp;New Zealand từ năm 1954. Nh&atilde;n hiệu hiện nay được biết đến rộng r&atilde;i với&nbsp;d&ograve;ng sữa tươi nổi tiếng&nbsp;được sản xuất v&agrave; đ&oacute;ng gới bởi c&ocirc;ng ty Nature Dairy tại&nbsp;&Uacute;c. Tất cả mọi sản phẩm đều đạt chuẩn chất lượng, đ&aacute;p ứng ti&ecirc;u chuẩn sản xuất, đảm bảo quy tr&igrave;nh kiểm định,&nbsp;cung cấp đủ đầy dinh dưỡng v&agrave; an to&agrave;n nhất đến tay người sử dụng.</p>

<h3 style="text-align:justify"><strong>Th&agrave;nh phần dinh dưỡng của&nbsp;sản phẩm</strong></h3>

<p style="text-align:justify"><strong>Sữa tươi tiệt tr&ugrave;ng Meadow Fresh</strong>&nbsp;sở hữu th&agrave;nh phần ch&iacute;nh l&agrave; sữa tươi 100% t&aacute;ch b&eacute;o được nhập khẩu ho&agrave;n to&agrave;n từ &Uacute;c. Ngo&agrave;i ra, sản phẩm cung cấp khoảng <strong>36&nbsp;kcal</strong> tr&ecirc;n <strong>100ml sữa tươi</strong>.</p>

<h3 style="text-align:justify"><strong>T&aacute;c dụng của sản phẩm với sức khỏe&nbsp;</strong></h3>

<p style="text-align:justify">Sản phẩm sử dụng c&ocirc;ng nghệ hiện đại để tiệt tr&ugrave;ng v&agrave; đ&oacute;ng g&oacute;i, gi&uacute;p giữ được hương vị tươi&nbsp;thơm ngon đặc trưng của sữa tươi, mang đến cho người ti&ecirc;u d&ugrave;ng&nbsp;dồi d&agrave;o vitamin v&agrave; kho&aacute;ng chất. Đặc biệt, sản phẩm sử dụng c&ocirc;ng nghệ t&aacute;ch b&eacute;o ho&agrave;n to&agrave;n. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng&nbsp;cho người muốn nạp năng lượng v&agrave; đang trong chế độ ăn kiếng, giảm c&acirc;n, nhưng vẫn đảm bảo đầy đủ kho&aacute;ng chất&nbsp;tốt cho hệ xương cũng như hệ miễn dịch.<br />
<img alt="Sữa tươi tiệt trùng không béo Meadow Fresh 1 lít sản xuất từ Úc 0" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/179667/bhx/files/sua-tuoi-tiet-trung-khong-beo-meadow-fresh-1-lit-202207070931124408.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Hướng dẫn sử dụng</strong></h3>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">D&ugrave;ng uống trực tiếp hoặc để chế biến m&oacute;n ăn.</p>
	</li>
	<li>
	<p style="text-align:justify">Ngon hơn khi uống lạnh</p>
	</li>
</ul>

<h3 style="text-align:justify"><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi sử dụng sản phẩm</strong></h3>

<p style="text-align:justify">Lưu &yacute;, sữa tươi Meadow Fresh kh&ocirc;ng ph&ugrave; hợp sử dụng cho trẻ dưới 1 tuổi v&agrave; người bị dị ứng với th&agrave;nh phần của sữa. Ngo&agrave;i ra, sản phẩm đ&atilde; mở nắp th&igrave; cần được bảo quản lạnh 2 - 4 độ C v&agrave; d&ugrave;ng hết trong 7 ng&agrave;y.<br />
<img alt="Sữa tươi tiệt trùng không béo Meadow Fresh 1 lít sản xuất từ Úc 1" class="lazy" src="//cdn.tgdd.vn/Products/Images//2386/179667/bhx/files/sua-tuoi-tiet-trung-khong-beo-meadow-fresh-1-lit-202207070931147691.jpg" style="height:768px; width:1024px" /></p>

<h3 style="text-align:justify"><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>

<p style="text-align:justify">D&ograve;ng sản phẩm sữa tươi t&aacute;c&nbsp;b&eacute;o Meadow Fresh hiện đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH, đảm bảo 100% nguồn gốc xuất xứ từ nh&agrave; sản xuất. Bạn&nbsp;c&oacute; thể mua sản phẩm&nbsp;online tại website ch&iacute;nh h&atilde;ng&nbsp;hoặc đến trực tiếp mua h&agrave;ng tại hệ thống si&ecirc;u thị&nbsp;với nhiều&nbsp;ưu đ&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nơi nhanh ch&oacute;ng.<br />
<strong>Xem th&ecirc;m</strong>:&nbsp;<a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/meadow-fresh-thuong-hieu-sua-ngon-noi-tieng-cua-uc-1441413">Meadow Fresh - thương hiệu sữa ngon nổi tiếng của &Uacute;c</a></p>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);
INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (227, 'Thùng 12 hộp sữa tươi ít béo Harvey Fresh 1 lít', 489000, 635000, 'store/images/sua-tuoi/thung-12-hop-sua-tuoi-tiet-trung-it-beo-harvey-fresh-1-lit-san-xuat-tu-uc-202304262227321367_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify">L&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> được sản xuất tại &Uacute;c,&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi-harvey-fresh">sữa tươi Harvey Fresh</a>&nbsp;cung cấp cho cơ thể canxi, protein v&agrave; năng lượng dồi d&agrave;o, gi&uacute;p bạn ngập tr&agrave;n năng lượng, cơ thể khoẻ mạnh hơn. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-sua-tuoi-tiet-trung-harvey-fresh-it-beo-hop-1-lit-12-hop">Th&ugrave;ng 12 hộp sữa tươi tiệt tr&ugrave;ng &iacute;t b&eacute;o Harvey Fresh 1 l&iacute;t</a> giảm bớt lượng chất b&eacute;o nhưng sữa vẫn dinh dưỡng cho bạn</div>

<ul style="margin-left:40px">
	<li style="text-align: justify;">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng &iacute;t b&eacute;o</div>
	</li>
	<li style="text-align: justify;">Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li style="text-align: justify;">Ph&ugrave; hợp với
	<div>Trẻ tr&ecirc;n 2 tuổi</div>
	</li>
	<li style="text-align: justify;">Th&agrave;nh phần
	<div>100% sữa b&ograve; tươi</div>
	</li>
	<li style="text-align: justify;">Thương hiệu
	<div>Harvey Fresh (&Uacute;c)</div>
	</li>
	<li style="text-align: justify;">Sản xuất tại
	<div>&Uacute;c</div>
	</li>
</ul>

<div class="description">
<p style="text-align:justify"><strong>Sữa tươi tiệt tr&ugrave;ng Harvey Fresh &iacute;t b&eacute;o</strong> được nhập khẩu ho&agrave;n to&agrave;n từ &Uacute;c với hương vị thơm ngon v&agrave; chứa nhiều dưỡng chất quan trọng như protein, canxi, c&ugrave;ng nhiều vitamin v&agrave; kho&aacute;ng chất c&oacute; lợi cho sức khoẻ xương, hệ miễn dịch v&agrave; sức đề kh&aacute;ng.</p>

<p style="text-align:justify"><strong>Sữa tươi</strong> sử dụng c&ocirc;ng nghệ t&aacute;ch b&eacute;o (chỉ c&ograve;n lại &lt; 2% chất b&eacute;o) v&agrave; tiệt tr&ugrave;ng hiện đại của &Uacute;c, gi&uacute;p loại bỏ bớt chất b&eacute;o v&agrave; c&aacute;c vi khuẩn c&oacute; hại trong sữa đồng thời giữ lại gần như trọn vẹn vị ngon v&agrave; c&aacute;c dưỡng chất của sữa.</p>

<p style="text-align:justify">Sữa b&eacute;o ngậy, thơm ngon, th&iacute;ch hợp để uống h&agrave;ng ng&agrave;y hoặc d&ugrave;ng khi chế biến đồ tr&aacute;ng miệng, m&oacute;n s&uacute;p,...</p>

<p style="text-align:justify"><strong>Hướng dẫn sử dụng:</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Sử dụng trực tiếp sau khi mở hộp.</p>
	</li>
	<li>
	<p style="text-align:justify">Ngon hơn khi uống lạnh.</p>
	</li>
	<li>
	<p style="text-align:justify">D&ugrave;ng cho b&eacute; tr&ecirc;n 2&nbsp;tuổi.</p>
	</li>
</ul>

<p style="text-align:justify"><strong>Bảo quản:</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Bảo quản nơi tho&aacute;ng m&aacute;t, kh&ocirc; r&aacute;o.</p>
	</li>
	<li>
	<p style="text-align:justify">Tr&aacute;nh &aacute;nh s&aacute;ng trực tiếp.</p>
	</li>
</ul>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-05-03 16:30:01', 11);

INSERT Product(id, name, price, price_origin, image, content, filter, featured, selling, view, public, subcategory_id) VALUES (228, 'Thùng 12 hộp sữa tươi tách béo Harvey Fresh Skim Milk 1 lít', 489000, 635000, 'store/images/sua-tuoi/thung-12-hop-sua-tuoi-tiet-trung-tach-beo-harvey-fresh-skim-milk-1-lit-san-xuat-tu-uc-202304262227391707_300x300.jpg', '<div class="details">
<h2 style="text-align:justify">Th&ocirc;ng tin sản phẩm</h2>

<div class="short-description" style="text-align:justify">L&agrave; sản phẩm <a href="https://www.bachhoaxanh.com/sua-tuoi">sữa tươi</a> được sản xuất tại &Uacute;c,&nbsp;<a href="https://www.bachhoaxanh.com/sua-tuoi-harvey-fresh">sữa tươi Harvey Fresh</a>&nbsp;cung cấp cho cơ thể canxi, protein v&agrave; năng lượng dồi d&agrave;o, gi&uacute;p bạn ngập tr&agrave;n năng lượng, cơ thể khoẻ mạnh hơn. <a href="https://www.bachhoaxanh.com/sua-tuoi/thung-sua-tuoi-tiet-trung-harvey-fresh-khong-beo-hop-1-lit-12-hop">Th&ugrave;ng 12 hộp sữa tươi tiệt tr&ugrave;ng t&aacute;ch b&eacute;o Harvey Fresh Skim Milk 1 l&iacute;t</a> đ&oacute;ng th&ugrave;ng tiện lợi, kh&ocirc;ng lo tăng c&acirc;n</div>

<ul style="margin-left:40px">
	<li style="text-align:justify">Loại sữa
	<div>Sữa tươi tiệt tr&ugrave;ng t&aacute;ch b&eacute;o</div>
	</li>
	<li style="text-align:justify">Dung t&iacute;ch
	<div>1 l&iacute;t</div>
	</li>
	<li style="text-align:justify">Ph&ugrave; hợp với
	<div>Trẻ từ 1 tuổi trở l&ecirc;n</div>
	</li>
	<li style="text-align:justify">Th&agrave;nh phần
	<div>100% sữa tươi</div>
	</li>
	<li style="text-align:justify">C&aacute;ch mở nắp
	<div>Thiết kế t&iacute;ch hợp thanh cắt b&ecirc;n trong, chỉ cần vặn l&agrave; thanh cắt xo&aacute;y xuống, tự động cắt lớp giấy bạc bảo vệ b&ecirc;n dưới, khui hộp chỉ với một bước</div>
	</li>
	<li style="text-align:justify">Thương hiệu
	<div>Harvey Fresh (&Uacute;c)</div>
	</li>
	<li style="text-align:justify">Sản xuất tại
	<div>&Uacute;c</div>
	</li>
</ul>

<div class="description">
<p style="text-align:justify"><strong>Sữa tươi tiệt tr&ugrave;ng t&aacute;ch b&eacute;o Harvey Fresh</strong> được nhập khẩu ho&agrave;n to&agrave;n từ &Uacute;c, với th&agrave;nh phần l&agrave; sữa tươi 100% cung cấp nguồn canxi v&agrave; protein c&ugrave;ng nhiều dưỡng chất cần thiết,&nbsp;gi&uacute;p hệ xương v&agrave; răng chắc khoẻ, tăng cường sức đề kh&aacute;ng v&agrave; hệ miễn dịch cho cơ thể.</p>

<p style="text-align:justify"><strong>Sữa tươi</strong> sử dụng c&ocirc;ng nghệ tiệt tr&ugrave;ng hiện đại, gi&uacute;p loại bỏ c&aacute;c vi khuẩn c&oacute; hại trong sữa đồng thời giữ lại trọn vẹn chất dinh dưỡng v&agrave; vị sữa b&eacute;o ngậy đặc trưng. Nhờ c&ocirc;ng nghệ tiệt tr&ugrave;ng n&agrave;y, sữa tươi c&oacute; thể để được từ 6 th&aacute;ng đến 1 năm trong điều kiện tho&aacute;ng m&aacute;t m&agrave; kh&ocirc;ng cần d&ugrave;ng chất bảo quản.</p>

<p style="text-align:justify">Sữa tươi t&aacute;ch b&eacute;o Harvey Fresh chỉ <strong>chứa chưa đến 0,02%</strong> chất b&eacute;o, ph&ugrave; hợp với người ăn ki&ecirc;ng, người b&eacute;o ph&igrave; hoặc cần ki&ecirc;ng cử chất b&eacute;o.</p>

<p style="text-align:justify"><strong>Hướng dẫn sử dụng:</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">D&ugrave;ng trực tiếp.</p>
	</li>
	<li>
	<p style="text-align:justify">Ngon hơn khi ướp lạnh.</p>
	</li>
	<li>
	<p style="text-align:justify">Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 2 tuổi.</p>
	</li>
</ul>

<p style="text-align:justify"><strong>Bảo quản:</strong></p>

<ul style="margin-left:40px">
	<li>
	<p style="text-align:justify">Đặt ở những nơi tho&aacute;ng m&aacute;t, kh&ocirc; r&aacute;o, tr&aacute;nh &aacute;nh mặt trời.</p>
	</li>
	<li>
	<p style="text-align:justify">N&ecirc;n d&ugrave;ng hết sau khi mở, nếu c&ograve;n bảo quản ngăn m&aacute;t tủ lạnh, n&ecirc;n d&ugrave;ng hết sau 3 ng&agrave;y.</p>
	</li>
</ul>
</div>
</div>', 'thuc-uong', 0, 0, 0, '2023-06-01 16:30:01', 11);