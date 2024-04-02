-- Copyright (c) 2017, Oracle.
--
-- You may modify, use, reproduce, or distribute this software

--
-- author: Selomon
--

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `eshopstore` ;
CREATE SCHEMA IF NOT EXISTS `eshopstore` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `eshopstore` ;


-- -----------------------------------------------------
-- Table `eshopstore`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`user` ;

CREATE TABLE IF NOT EXISTS `eshopstore`.`user`(
       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
       username VARCHAR (20) NOT NULL ,
       password VARCHAR (20) NOT NULL ,
       PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'maintains user details';



-- -----------------------------------------------------
-- Table `eshopstore`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`admin` ;

CREATE TABLE IF NOT EXISTS `eshopstore`.`admin`(
       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
       username VARCHAR (20) NOT NULL ,
       password VARCHAR (20) NOT NULL ,
       role VARCHAR (20) NOT NULL ,
       PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'maintains admin details';

-- -----------------------------------------------------
-- Table `eshopstore`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`customer` ;

CREATE  TABLE IF NOT EXISTS `eshopstore`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NOT NULL ,
  `last_name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `phone` VARCHAR(16) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  `city` VARCHAR(35) NOT NULL ,
  `post_code` VARCHAR(10) NOT NULL ,
  `county` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'maintains customer details';


-- -----------------------------------------------------
-- Table `eshopstore`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`customer_order` ;

CREATE  TABLE IF NOT EXISTS `eshopstore`.`customer_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `amount` DECIMAL(6,2) NOT NULL ,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `confirmation_number` INT UNSIGNED NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_customer_order_customer` (`customer_id` ASC) ,
  CONSTRAINT `fk_customer_order_customer`
    FOREIGN KEY (`customer_id` )
    REFERENCES `eshopstore`.`customer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'maintains customer order details';


-- -----------------------------------------------------
-- Table `eshopstore`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`category` ;

CREATE  TABLE IF NOT EXISTS `eshopstore`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'contains product categories, e.g., electronics, clothes, etc.';


-- -----------------------------------------------------
-- Table `eshopstore`.`subcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`subcategory` ;

CREATE  TABLE IF NOT EXISTS `eshopstore`.`subcategory` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'contains product subcategories, e.g., mobiles, cameras, etc.';



-- -----------------------------------------------------
-- Table `eshopstore`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`product` ;

CREATE  TABLE IF NOT EXISTS `eshopstore`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `price` DECIMAL(5,2) NOT NULL ,
  `description` LONGTEXT NOT NULL ,
  `brand` VARCHAR(45) NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `subcategory_id` INT UNSIGNED NOT NULL ,
  `category_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_category` (`category_id` ASC) ,
  INDEX `fk_product_subcategory` (`subcategory_id` ASC),
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id` )
    REFERENCES `eshopstore`.`category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_product_subcategory`
    FOREIGN KEY (`subcategory_id` )
    REFERENCES `eshopstore`.`subcategory` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'contains product details';


-- -----------------------------------------------------
-- Table `eshopstore`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshopstore`.`ordered_product` ;

CREATE  TABLE IF NOT EXISTS `eshopstore`.`ordered_product` (
  `customer_order_id` INT UNSIGNED NOT NULL ,
  `product_id` INT UNSIGNED NOT NULL ,
  `quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`customer_order_id`, `product_id`) ,
  INDEX `fk_ordered_product_customer_order` (`customer_order_id` ASC) ,
  INDEX `fk_ordered_product_product` (`product_id` ASC) ,
  CONSTRAINT `fk_ordered_product_customer_order`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `eshopstore`.`customer_order` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product`
    FOREIGN KEY (`product_id` )
    REFERENCES `eshopstore`.`product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- --------------------------------------------------------

--
-- Data for table `user`
--

INSERT INTO `user` (`username`, password)VALUES ('selo', 'pass');

--
-- Sample data for table `category`
--

INSERT INTO `category` (name) VALUES ('Electronics'),('Clothes'),('Sportswear'),('Bags'),('Jewellery'),('Watches'),('Shoes');


--
-- Sample data for table `subcategory`
--

INSERT INTO `subcategory` (name) VALUES ('Mobiles'),('Cameras'),('Laptop & Tablets'),('Men'),('Women'),('Kids'),('Tracksuits'),('T-Shirts'),('Shorts'),('Luggages'),
('Handbags'),('Laptop Bags'),('Necklaces'), ('Rings'), ('Sprots'),('Luxury'),('Formals'),('Casuals');



--
-- Sample data for table `product`
--

INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Fujifilm FinePix Digital Camera', 250.50, '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. 
ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included.','Fujifilm', 2, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Nikon Digital Camera', 479.50, 'Transform your photography skills with Nikon D3300 Digital SLR Camera and 18-55 mm Single Lens Kit.<br>
Thanks to Nikons DX-format imaging sensor and the superior optical performance of NIKKOR lenses, you can can capture exceptional lifelike pictures with smooth colour gradation.<br> Compact and lightweight, as well as easy to hold and simple to use, this exciting, perfectly 
balanced combination of lens and camera is designed specifically to make the joy of high-quality D-SLR photography available to all', 'Nikon', 2, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Apple MacBook with Touch Bar', 1799.00, 'The new MacBook Pro is faster and more powerful than before, yet remarkably thinner and lighter.<br> It has the brightest, most colorful Mac notebook display ever. And it introduces the revolutionary Touch Bar—a Multi-Touch– enabled strip of glass built into the keyboard 
for instant access to what you want to do, when you want to do it.<br> The new MacBook Pro is built on groundbreaking ideas.','Apple', 3, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Apple iPad', 349.00, 'Powerful, portable and personal with a gorgeous 9.7-inch Retina display in a thin, durable aluminium design that weighs less than half a kilo.<br> iPad puts incredible capabilities in your hands with a powerful A9 chip, 8MP camera, 
FaceTime HD camera, Touch ID, Apple Pay, Wi-Fi, all-day battery life, and over a million apps on the App Store.', 'Apple', 3, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Microsoft Surface Book', 1599.00, 'Built around a beautifully crafted magnesium chassis, it can be used as an extra-large tablet by simply detaching the keyboard. Weighing only 1.5kg as a taptop and 728g as a tablet, it designed for life on the move.<br>
It does whatever you want FAST thanks to an Intel® Core™ i5 processor and 8Gb RAM, with the 13.5 inch Quad HD touch screen has a market-beating 3000 x 2000 resolution that brings to life all your video and web browsing in stunning colours and rich detail.','Microsoft', 3, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Microsoft Surface Pro', 700.50, 'For a start it converts between a tablet and a laptop in seconds thanks to the detachable keyboard.<br> Enjoy a deluxe 12.3 inch tablet when you want then use the multi-position kickstand and improved keyboard for a first-class laptop experience when required – perfect for emails, social networking posts and work projects.
Slim, lightweight and stylish, it will power through everything you need to do and adapt to suit any task.','Microsoft', 3, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Apple iPhone 7', 699.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Apple', 1, 1);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Samsung Galaxy S8', 650.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Samsung', 1, 1);



INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('T-shirt', 12.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.','River Island', 4, 2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Pretty Green Shirt', 23.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.','Boss', 4, 2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Comino Couture Dress', 18.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.','Boss', 5, 2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Dress', 33.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.', 'River Island', 5,2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Girls Floral Dress', 12.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.','River Island', 5, 2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Baby Boys Jersey Suit Set', 23.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.','Boss', 6, 2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Fleece Jogger Short',14.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.','Boss', 6, 2);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Girls Textured Stripe Dress', 19.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.', 'River Island', 6, 2);


INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('California T-Shirt', 35.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Adidas', 8, 3);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Jersey Shorts', 25.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Nike', 9, 3);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Training Shorts', 29.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Adidas', 9, 3);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Sportwear Tracksuit', 72.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Nike', 7, 3);

INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Eminent Suitcase', 68.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Adidas', 10, 4);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Duffels Bag', 42.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Adidas', 11, 4);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Laptop Bag', 25.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'River Island', 12, 4);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Briefcase', 45.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Nike', 11, 4);

INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Love Diamond', 799.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Goldsmiths', 14, 5);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Hot Diamonds', 550.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Goldsmiths', 13, 5);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Star Light', 1000.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.' ,'Goldsmiths', 14, 5);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Fiorelli', 220.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Goldsmiths', 13, 5);

INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Apple Watch Series 2', 329.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Apple', 15, 6);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Luxury Watch', 329.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Rolex', 16, 6);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Samsung Gear S3 Frontier Watch', 259.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Samsung', 15, 6);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Fossil Sabo Watch', 279.00,'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.', 'Samsung', 16, 6);


INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Boot Shoes', 55.50, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Nike', 18, 7);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Sneaker Shoes', 42.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Adidas', 18, 7);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Warwick Shoes', 67.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Clarks', 17, 7);
INSERT INTO `product` (`name`, price, description, brand, subcategory_id, category_id) VALUES ('Burton Shoes', 47.00, 'All images have used only for educational purposes with the permission of free-to-use from various online sites.<br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin.','Clarks', 17, 7);


--
-- Sample data for table `customer`
--
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('Charlie', 'David', 'c.david@yahoo.com', '09676054347', '12 Beacon Road','Leicester' , 'LE11 2BA', 'Leicestershire');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('Sarah', 'Rich', 's.rich@gmail.com', '09676052675', '10 Wood Road','Oxford' , 'OX1 3BA', 'Oxfordshire');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('John', 'Smith', 'J.smith@yahoo.com', '09876054388', '17 Halsall Road','Leeds' , 'L11 4UN', 'West Yorkshire');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('Micheal', 'Jonson', 'm.jonson@gmail.com', '09416054336', '07 Helen Road','Nottingham' , 'N09 3QB', 'Nottingahamshire');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('Solomon', 'Richard', 's.richard@yahoo.co.uk', '09566054313', '11 Halsall Lane','Ormskirk' , 'LE39 2DD', 'Lancashire');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('Gemma', 'William', 'g.william@yahoo.co.uk', '09676051298', '34 Oxford Road','Canterbury' , 'C10 1AA', 'Kent');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county ) VALUES ('Daniel', 'Adam', 'd.adam@gmail.com', '09416054357', '12 Guilford Road','Cantebury' , 'CT01 5QD', 'Kent');
INSERT INTO customer (first_name, last_name, email, phone, address, city, post_code, county) VALUES ('Hugo', 'Reyes', 'hurley@mrcluck.com', '60544933678', '64 Asmara', 'Ormskirk', 'LE39 2SD', 'Lancashire');

--
-- Sample data for table `customer_order`
--

INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (24.00, '2017-06-02 20:46:13.0', 1, 247455344);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (3250.50, '2017-06-07 11:31:58.0', 2, 475644436);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (3513.50, '2017-06-14 17:20:38.0', 3, 344549009);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (1338.00, '2017-06-04 15:35:07.0', 4, 868642371);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (4155.00,'2017-06-09 16:22:03.0', 5, 244956320);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (2514.50, '2017-06-25 19:15:56.0', 6, 818358116);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (1682.50, '2017-06-16 14:11:08.0', 7, 53395157);
INSERT INTO customer_order (amount, date_created, customer_id, confirmation_number) VALUES (678.00, '2010-05-14 18:56:13.0', 8, 247455344);

--
-- Sample data for table `ordered_product`
--
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (1, 16, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (2, 15, '2');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (2, 9, '2');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (2, 4, '2');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (2, 6, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (2, 3, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (3, 15, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (3, 7, '5');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (4, 8, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (4, 1, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (4, 11, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (4, 14, '2');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (4, 4, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (4, 16, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (5, 8, '6');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (5, 1, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 4, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 16, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 11, '2');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 2, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 15, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 5, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (6, 13, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (7, 8, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (7, 10, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (7, 13, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (7, 2, '2');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (7, 12, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (8, 10, '1');
INSERT INTO ordered_product (customer_order_id, product_id, quantity) VALUES (8, 8, '1');










