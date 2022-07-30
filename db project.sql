drop table dress;
drop table employee;
drop table makeup;
drop table package;
drop table rc_phone;
drop table rental_company;
drop table package;
drop table studio;
drop table ta_phone;
drop table ta_target;
drop table travel_agency;
drop table wc_phone;
drop table wedding_company;
drop table wedding_hall;
drop table rental_customer;
drop table review;
drop table rentalcustomer;
drop table customer;


create table Employee (
  employee_id	    number(11, 0) not null,
  employee_name		varchar2(25) not null,
  salary		      number(11, 2) not null,
  email		        varchar2(30),
  e_phone_num	    varchar2(12),
  CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);

create table Travel_Agency (
  travel_agency_id	number(11, 0) not null,
  name		varchar2(25) not null, 
  commission	number(3, 3),
  CONSTRAINT travel_agency_pk PRIMARY KEY (travel_agency_id)
);

create table TA_Target (
  travel_agency_id	number(11, 0) not null,
  target		number(2, 0) not null,
  CONSTRAINT ta_target_pk PRIMARY KEY (travel_agency_id, target),
  CONSTRAINT ta_target_fk FOREIGN KEY (Travel_Agency_ID) REFERENCES Travel_Agency(Travel_Agency_ID)
);

create table TA_Phone (
  travel_agency_id	number(11, 0) not null,
  t_phone_num	varchar2(12) not null,
  CONSTRAINT ta_phone_pk1 PRIMARY KEY (travel_agency_id, t_phone_num),
  CONSTRAINT ta_phone_fk FOREIGN KEY(Travel_Agency_ID) references Travel_Agency(Travel_Agency_ID)
);

create table Package (
  travel_agency_id	number(11, 0) not null,
  package_id	number(11, 0) not null,
  price		number(11, 2) not null,
  country		varchar2(30) not null,
  state		varchar2(20) not null,
  CONSTRAINT package_pk PRIMARY KEY (package_id),
  CONSTRAINT package_fk FOREIGN KEY(Travel_Agency_ID) references Travel_Agency(Travel_Agency_ID)
);

create table Wedding_Company (
  wedding_company_id	number(11, 0) not null,
  wcompany_name		varchar2(25) not null,
  address		varchar2(40),
  commission	number(3, 3),
  CONSTRAINT wedding_company_pk PRIMARY KEY (wedding_company_id)
);

create table WC_Phone (
wedding_company_id	number(11, 0) not null,
w_phone_num		varchar2(12) not null,
CONSTRAINT wc_phone_pk PRIMARY KEY (wedding_company_id, w_phone_num),
CONSTRAINT wc_phone_fk FOREIGN KEY(wedding_company_id) references Wedding_Company(wedding_company_id)
);

create table Wedding_Hall (
wedding_company_id	number(11, 0) not null,
hall_id			number(11, 0) not null,
acceptable_num		number(4, 0),
name		varchar2(20),
price		number(11, 2) not null,
CONSTRAINT wedding_hall_pk PRIMARY KEY (hall_id),
CONSTRAINT wedding_hall_fk FOREIGN KEY(wedding_company_id) references Wedding_Company(wedding_company_id)
);


create table Rental_Company (
rental_company_id	number(11, 0) not null,
name		varchar2(25) not null,
price		number(11, 2) not null,
commission	number(3, 3),
address		varchar2(50),
CONSTRAINT rental_company_pk PRIMARY KEY (rental_company_id)
);

create table RC_Phone (
rental_company_id	number(11, 0) not null,
r_phone_num		varchar2(12) not null,
CONSTRAINT rc_phone_pk PRIMARY KEY (rental_company_id, r_phone_num),
CONSTRAINT rc_phone_fk FOREIGN KEY(rental_company_id) REFERENCES Rental_Company(rental_company_id)
);

create table Studio (
rc_id	number(11, 0) not null,
theme		varchar2(25) not null,
CONSTRAINT studio_pk PRIMARY KEY (rc_id),
CONSTRAINT studio_fk FOREIGN KEY(rc_id) references Rental_Company(rental_company_id)
);

create table Dress (
rc_id		number(11, 0) not null,
dress_type	varchar2(25) not null,
suit_type	varchar2(25) not null,
CONSTRAINT dress_pk PRIMARY KEY (rc_id),
CONSTRAINT dress_fk FOREIGN KEY(rc_id) references Rental_Company(rental_company_id)
);



create table Makeup (
rc_id			number(11, 0) not null,
makeup_designer		varchar2(25) not null,
hair_designer		varchar2(25) not null,
CONSTRAINT makeup_pk PRIMARY KEY (rc_id),
CONSTRAINT makeup_fk FOREIGN KEY(rc_id) references Rental_Company(rental_company_id)
);

create table Customer (
  customer_id	    number(11, 0) not null,
  fname		        varchar2(11) not null, 
  lname		        varchar2(11) not null,
  gender		      varchar2(1),
  age		          number(2, 0), 
  budget		      number(11, 2) not null,
  c_phone_num	    varchar2(12),
  employee_id	    number(11, 0) not null,
  package_id	    number(11, 0) not null,
  hall_id			    number(11, 0) not null,
  date_of_wedding date,
  CONSTRAINT customer_pk PRIMARY KEY (customer_id),
  CONSTRAINT customer_fk1 FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT customer_fk2 FOREIGN KEY (hall_id) REFERENCES Wedding_Hall(hall_id),
  CONSTRAINT customer_fk3 FOREIGN KEY (package_id) REFERENCES package(package_id)
);

create table Review (
  customer_id	number(11, 0) not null,
  review_num	number(11, 0) not null,
  rating		number(1, 0), 
  CONSTRAINT review_pk PRIMARY KEY (customer_id, review_num),
  CONSTRAINT review_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

create table Rental_customer(
  customer_id	number(11, 0) not null,
  rental_company_id	number(11, 0) not null,
  CONSTRAINT rentalcustomer_pk PRIMARY KEY (rental_company_id, customer_id),
  CONSTRAINT rentalcustomer_fk1 FOREIGN KEY (rental_company_id) REFERENCES rental_company(rental_company_id),
  CONSTRAINT rentalcustomer_fk2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

--insert travel_agency
insert into travel_agency values (501, 'Happy Travel', 0.09);
insert into travel_agency values (502, 'Tour Click', 0.07);
insert into travel_agency values (503, 'Honny Process', 0.06);
insert into travel_agency values (504, 'Memory Food', 0.08);
insert into travel_agency values (505, 'Abroad', 0.08);
insert into travel_agency values (506, 'Anywhere', 0.05);
insert into travel_agency values (507, 'JTS', 0.07);
insert into travel_agency values (508, 'Family', 0.06);
insert into travel_agency values (509, 'TAmerica', 0.04);
insert into travel_agency values (510, 'R-Asia', 0.06);
insert into travel_agency values (511, 'Memory-E', 0.07);
insert into travel_agency values (512, 'Hurb Tour', 0.09);
insert into travel_agency values (513, 'Toursun', 0.08);
insert into travel_agency values (514, 'Joy road', 0.06);
insert into travel_agency values (515, 'Cross market', 0.05);
insert into travel_agency values (516, 'Future Travel', 0.05);
insert into travel_agency values (517, 'E-A', 0.04);

--insert ta_phone
insert into ta_phone values (501, '025558888');
insert into ta_phone values (501, '025558887');
insert into ta_phone values (502, '026561111');
insert into ta_phone values (503, '027776363');
insert into ta_phone values (504, '028994567');
insert into ta_phone values (505, '021235678');
insert into ta_phone values (505, '021235679');
insert into ta_phone values (506, '024456667');
insert into ta_phone values (507, '026668899');
insert into ta_phone values (508, '021114444');
insert into ta_phone values (508, '021114443');
insert into ta_phone values (509, '026587474');
insert into ta_phone values (510, '029876543');
insert into ta_phone values (511, '029876536');
insert into ta_phone values (512, '024569922');
insert into ta_phone values (513, '025442316');
insert into ta_phone values (514, '025422319');
insert into ta_phone values (514, '025422320');
insert into ta_phone values (514, '025422321');
insert into ta_phone values (515, '026698521');
insert into ta_phone values (516, '021264598');
insert into ta_phone values (517, '029968574');

--insert ta_target
insert into ta_target values (501, 30);
insert into ta_target values (501, 40);
insert into ta_target values (502, 20);
insert into ta_target values (502, 30);
insert into ta_target values (503, 20);
insert into ta_target values (504, 30);
insert into ta_target values (505, 30);
insert into ta_target values (505, 40);
insert into ta_target values (506, 20);
insert into ta_target values (506, 30);
insert into ta_target values (506, 40);
insert into ta_target values (507, 40);
insert into ta_target values (507, 50);
insert into ta_target values (507, 60);
insert into ta_target values (508, 20);
insert into ta_target values (508, 30);
insert into ta_target values (509, 20);
insert into ta_target values (509, 30);
insert into ta_target values (509, 40);
insert into ta_target values (510, 20);
insert into ta_target values (511, 30);
insert into ta_target values (512, 40);
insert into ta_target values (513, 20);
insert into ta_target values (514, 20);
insert into ta_target values (515, 30);
insert into ta_target values (516, 40);
insert into ta_target values (517, 20);

--insert package
insert into package values (501, 601, 6987000, 'USA', 'Hawaii');
insert into package values (501, 602, 7872140, 'France', 'Paris');
insert into package values (502, 603, 6654710, 'USA', 'Hawaii');
insert into package values (502, 604, 6263200, 'USA', 'New York');
insert into package values (503, 605, 8872140, 'UK', 'London');
insert into package values (503, 606, 3250000, 'Japan', 'Tyoko');
insert into package values (503, 607, 3100000, 'China', 'Beijing');
insert into package values (504, 608, 6821400, 'USA', 'Guam');
insert into package values (504, 609, 7187000, 'USA', 'Hawaii');
insert into package values (504, 610, 2987100, 'Tailand', 'Bangkok');
insert into package values (504, 611, 3287100, 'Philippines', 'Cebu');
insert into package values (505, 612, 7563500, 'UK', 'Manchester');
insert into package values (506, 613, 7389540, 'USA', 'Hawaii');
insert into package values (506, 614, 7265800, 'Italy', 'Rome');
insert into package values (507, 615, 3687200, 'Japan', 'Tyoko');
insert into package values (507, 616, 7836540, 'Italy', 'Milan');
insert into package values (508, 617, 2986700, 'Japan', 'Tyoko');
insert into package values (508, 618, 6985710, 'France', 'Paris');
insert into package values (508, 619, 7021540, 'UK', 'Manchester');
insert into package values (509, 620, 6678920, 'USA', 'Hawaii');
insert into package values (509, 621, 6785200, 'USA', 'Guam');
insert into package values (510, 622, 3689210, 'Russia', 'Vladivostok');
insert into package values (510, 623, 2876510, 'Philippines', 'Cebu');
insert into package values (510, 624, 2768500, 'Tailand', 'Bangkok');
insert into package values (511, 625, 6981320, 'USA', 'Hawaii');
insert into package values (511, 626, 3458920, 'China', 'Beijing');
insert into package values (511, 627, 3006580, 'Philippines', 'Cebu');
insert into package values (512, 628, 6598743, 'USA', 'Hawaii');
insert into package values (512, 629, 7025982, 'USA', 'New York');
insert into package values (513, 630, 7896580, 'UK', 'London');
insert into package values (514, 631, 6687200, 'USA', 'New York');
insert into package values (515, 632, 7985803, 'Italy', 'Milan');
insert into package values (515, 634, 3985680, 'Russia', 'Vladivostok');
insert into package values (516, 635, 2387500, 'Korea', 'Jeju');
insert into package values (516, 636, 1769580, 'Korea', 'Ulleungdo');
insert into package values (517, 637, 2156980, 'Korea', 'Jeju');
insert into package values (517, 638, 1987000, 'Korea', 'Ulleungdo');


insert into employee values (101,'Sodam Park',3840000,'sodaaam@naver.com','01053203035');
insert into employee values (102,'Siwon Choi',2600000,'swchoi12@naver.com','01012532300');
insert into employee values (103,'Yujeong Han',2960000,'jeong01@naver.com','01057884035');
insert into employee values (104,'Dahun Jung',3120000,'jungda@gmail.com','01099201245');
insert into employee values (105,'Yuna Kim',2305000,'imyunakim@naver.com','01025761105');
insert into employee values (106,'Ajeong Kim',2833000,'rladkwjd@gmail.com','01059926475');
insert into employee values (107,'Jaemin Sin',1920000,'sinjamjam@naver.com','01045219492');
insert into employee values (108,'Jongmin Han',2400000,'hahahjm1004@naver.com','01003921135');
insert into employee values (109,'Taeyeon Park',2870000,'urfine7@daum.net','01049305235');
insert into employee values (110,'Seojun Lee',1880000,'lsjisme@naver.com','01066602350');
insert into employee values (111,'Gangmin Choi',2507000,'30choigang@naver.com','01043792745');
insert into employee values (112,'Nayun Kim',2600000,'na0127yun@gmail.com','01044932032');
insert into employee values (113,'Jisu Jang',2950000,'joyjoy@naver.com','01092204385');
insert into employee values (114,'Jieun Lee',1908000,'iujieun99@naver.com','01018569234');
insert into employee values (115,'Donghyeon Yu',2100000,'dbehdgus2911@naver.com','01048402911');
insert into employee values (116,'Suji Bae',3840000,'missa3suji@daum.net','01045696540');
insert into employee values (117,'Gyuri Min',2180000,'mingyurrrri@gmail.com','01012335203');



insert into Wedding_Company values(301, 'WeddingQuick', 'Seoul Seodaemun-gu Yeonhui-ro 32-gil 90', 0.06);
insert into Wedding_Company values(302, 'WeddingBook', 'Seoul Seodaemun-gu Yeonhui-ro 36-gil 49', 0.04);
insert into Wedding_Company values(303, 'SpingWedding', 'Seoul Seodaemun-gu Yeonhui-ro 248', 0.04);
insert into Wedding_Company values(304, 'Jwedd', 'Seoul Eunpyoeng-gu 35-gill 31', 0.1);
insert into Wedding_Company values(305, 'DesignWedding', 'Seoul Eunpyoeng-gu 39-gill 128', 0.08);
insert into Wedding_Company values(306, 'HelenJoy', 'Seoul Eunpyoeng-gu Eunpyeong-ro 256', 0.05);
insert into Wedding_Company values(307, 'BeautifulWedding', 'Seoul sonpa-gu Sonpa-dareo 38-gil 1', 0.12);
insert into Wedding_Company values(308, 'Weddingfriend', 'Seoul sonpa-gu Sonpa-dareo 21-gil 58', 0.11);
insert into Wedding_Company values(309, 'PlanMaju', 'Seoul sonpa-gu Sonpa-dareo 230', 0.07);
insert into Wedding_Company values(310, 'HowtoWedding', 'Seoul Gangnam-gu  Seolleung-ro 76-gil', 0.11);
insert into Wedding_Company values(311, 'WeddingHighSchool', 'Seoul Gangnam-gu  Seolleung-ro 35-gil 3', 0.05);
insert into Wedding_Company values(312, 'EUstyle', 'Seoul Gangnam-gu  Seolleung-ro 256', 0.07);
insert into Wedding_Company values(313, 'Jeongeonga', 'Seoul Mapo-gu Sinsu-ro 58', 0.09);
insert into Wedding_Company values(314, 'Deuwedding', 'Seoul Mapo-gu Sinsu-ro 123', 0.08);
insert into Wedding_Company values(315, 'WithusWedding', 'Seoul Mapo-gu Gayang-daero 3', 0.1);
insert into Wedding_Company values(316, 'Coldflower', 'Seoul Jongno-gu Pyeongchangmunhwa-ro 50', 0.12);
insert into Wedding_Company values(317, 'Modacollection', 'Seoul Jongno-gu Tongil-ro 18na-gil 19', 0.1);


insert into Wedding_Hall values(301, 350, 100, 'Scalidium', 10000000 );
insert into Wedding_Hall values(302, 351, 50, 'Herituz', 8000000 );
insert into Wedding_Hall values(303, 352, 150, 'Guilan', 13000000 );
insert into Wedding_Hall values(304, 353, 100, 'Duilan', 10000000 );
insert into Wedding_Hall values(305, 354, 200, 'Casady', 20000000 );
insert into Wedding_Hall values(305, 369, 400, 'Rasady', 40000000 );
insert into Wedding_Hall values(306, 355, 100, 'Suabis', 9000000 );
insert into Wedding_Hall values(307, 356, 50, 'Laruje', 5000000 );
insert into Wedding_Hall values(307, 370, 100, 'Arua', 12000000 );
insert into Wedding_Hall values(307, 371, 150, 'Oroloa', 16000000 );
insert into Wedding_Hall values(308, 357, 150, 'Chinestone', 14000000 );
insert into Wedding_Hall values(309, 358, 50, 'Vivaladium', 7000000 );
insert into Wedding_Hall values(310, 359, 200, 'Eston', 21000000 );
insert into Wedding_Hall values(311, 360, 300, 'Goudorn', 30000000 );
insert into Wedding_Hall values(312, 361, 100, 'Sukumi', 11000000 );
insert into Wedding_Hall values(313, 362, 50, 'Grand', 5000000 );
insert into Wedding_Hall values(313, 372, 150, 'FRrand', 17000000 );
insert into Wedding_Hall values(314, 363, 150, 'Brider', 13000000 );
insert into Wedding_Hall values(315, 364, 250, 'Shower', 25000000 );
insert into Wedding_Hall values(316, 365, 150, 'Bibian', 14000000 );
insert into Wedding_Hall values(316, 367, 100, 'Cician', 12000000 );
insert into Wedding_Hall values(316, 368, 200, 'Didian', 21000000 );
insert into Wedding_Hall values(317, 366, 100, 'Valvula', 10000000 );



insert into Rental_Company values (801, 'Gaeul Studio', 300000, 0.13, 'Seoul Songpa-gu Baekjegobun-ro 435');
insert into Rental_Company values (802, 'Guho Studio', 275000, 0.13, 'Seoul Seongdong-gu Achasan-ro 15-gil 47-38');
insert into Rental_Company values (803, 'When He Loves You', 250000, 0.07, 'Seoul Gangnam-gu Hakdong-ro 42-gil 17');
insert into Rental_Company values (804, 'When She Loves You', 250000, 0.07, 'Seoul Gangnam-gu Nonhyeon-ro 662');
insert into Rental_Company values (805, 'Gray Scale', 270000, 0.1, 'Seoul Gangnam-gu Seolleung-ro 132-gil 19-10');
insert into Rental_Company values (806, 'The Way', 289000, 0.13, 'Seoul Gangnam-gu Dosan-daero 233');
insert into Rental_Company values (807, 'The Face', 269000, 0.05, 'Seoul Mapo-gu Donggyo-ro 142-8');
insert into Rental_Company values (808, 'Lali Studio', 260000, 0.08, 'Seoul Gangnam-gu Dosan-daero 57-gil 24');
insert into Rental_Company values (809, 'Roy Studio', 299000, 0.05, 'Gyeonggi-do Hanam-si 40beon-gil Misadong-ro 178-35');
insert into Rental_Company values (810, 'Luna Studio', 310000, 0.13, 'Seoul Gangnam-gu 11 Seolleung-ro 152-gil');
insert into Rental_Company values (811, 'Lilac Wedding', 300000, 0.07, 'Seoul Gangnam-gu Eonju-ro 170-gil 25');
insert into Rental_Company values (812, 'Rose Square', 300000, 0.05, 'Seoul Gangnam-gu Dosan-daero 57-gil 20');
insert into Rental_Company values (813, 'The White Dress', 300000, 0.06, 'Seoul Gangnam-gu Hakdong-ro 55-gil 12-3');
insert into Rental_Company values (814, 'Monica Blanche', 300000, 0.07, 'Seoul Gangnam-gu Seolleung-ro 158-gil 15');
insert into Rental_Company values (815, 'Jane Dress', 300000, 0.04, 'Gyeonggi-do Suwon-si Paldal-gu Gyeongsu-daero 442');
insert into Rental_Company values (816, 'About Wedding', 300000, 0.05, 'Gyeonggi-do Suwon-si Paldal-gu Gyeongsu-daero 442');
insert into Rental_Company values (817, 'Dear Crystal', 300000, 0.1, 'Seoul Gangdong-gu Seongnae-ro 12-gil 20');
insert into Rental_Company values (818, 'From Here Wedding', 300000, 0.08, 'Gyeonggi-do Suwon-si Paldal-gu Jungbu-daero 131');
insert into Rental_Company values (819, 'Nouvelle de Blanc', 300000, 0.13, 'Seoul Gangnam-gu Apgujeong-ro 80-gil 38');
insert into Rental_Company values (820, 'KimSunjin Cloe', 320000, 0.1, 'Seoul Gangnam-gu Samseong-ro 772');
insert into Rental_Company values (821, 'KimCheongkyeong HairFace', 299000, 0.13, 'Seoul Gangnam-gu Dosan-daero 75-gil 21');
insert into Rental_Company values (822, 'MEPCI', 285000, 0.13, 'Seoul Gangnam-gu Eonju-ro 157-gil 5');
insert into Rental_Company values (823, 'Salon6', 305000, 0.1, 'Seoul Gangnam-gu Bongeunsa-ro 44-gil 81');
insert into Rental_Company values (824, 'A Concept', 310000, 0.12, 'Seoul Gangnam-gu Dosan-daero 70-gil 11');
insert into Rental_Company values (825, 'Small Difference', 255000, 0.09, 'Seoul Gangnam-gu Eonju-ro 174-gil 29');
insert into Rental_Company values (826, 'Joy187', 255000, 0.07, 'Seoul Gangnam-gu Seolleung-ro 152-gil 30');
insert into Rental_Company values (827, 'RaRaPM', 255000, 0.1, 'Seoul Gangnam-gu Dosan-daero 81-gil 33-2');


insert into Studio values (801, 'modern');
insert into Studio values (802, 'classic');
insert into Studio values (803, 'natural');
insert into Studio values (804, 'summer');
insert into Studio values (805, 'beach');
insert into Studio values (806, 'modern');
insert into Studio values (807, 'garden');
insert into Studio values (808, 'natural');
insert into Studio values (809, 'flower');
insert into Studio values (810, 'white');

insert into Dress values (811, 'B103', 'S209');
insert into Dress values (812, 'B330', 'S102');
insert into Dress values (813, 'M14', 'S23');
insert into Dress values (814, 'B003', 'S201');
insert into Dress values (815, 'M540', 'S410');
insert into Dress values (816, 'A122', 'S008');
insert into Dress values (817, 'B06', 'S53');
insert into Dress values (818, 'B6103', 'S3170');
insert into Dress values (819, 'M228', 'S104');

insert into Makeup values (820, 'Lina', 'Jin');
insert into Makeup values (821, 'Suji', 'Kyeong');
insert into Makeup values (822, 'Hyeon', 'Hyeok');
insert into Makeup values (823, 'Seunghi', 'Minju');
insert into Makeup values (824, 'Hyerim', 'Jihi');
insert into Makeup values (825, 'Hana', 'MinJeong');
insert into Makeup values (826, 'Sujeong', 'Seok');
insert into Makeup values (827, 'Juweon', 'Jinsol');


insert into customer values (201, 'Lee', 'cheolsu', 'M', 35, 50000000, 0106589745, 101, 610, 350, '2021-12-12');
insert into customer values (202, 'Park', 'seonyeong', 'F', 28, 40000000, 01024568975, 102, 608, 356, '2021-12-31');
insert into customer values (203, 'Choi', 'usiki', 'M', 34, 60000000, 01012345678, 115, 606, 355, '2021-12-10');
insert into customer values (204, 'Lee', 'Myeonghun', 'M', 31, 30000000, 01013568974, 103, 630, 370, '2021-12-9');
insert into customer values (205, 'Kang', 'siyeong', 'F', 44, 60000000, 01045698235, 106, 601, 359, '2021-12-25');
insert into customer values (206, 'Jang', 'jiu', 'F', 65, 60000000, 01075468215, 108, 624, 366, '2021-12-24');
insert into customer values (207, 'Han', 'Sohee', 'F', 25, 40000000, 0103692581, 112, 609, 367, '2021-11-30');
insert into customer values (208, 'Kim', 'yuseong', 'M', 29, 30000000, 01014725836, 111, 611, 372, '2021-10-30');
insert into customer values (209, 'Goo', 'jaegyeong', 'M', 27, 30000000, 01020569874, 105, 622, 358, '2021-11-19');
insert into customer values (210, 'Gong', 'minji', 'F', 36, 70000000, 01041253698, 115, 613, 359, '2021-11-21');
insert into customer values (211, 'Cha', 'Jiyeon', 'F', 39, 50000000, 01048569236, 101, 631, 360, '2021-11-07');
insert into customer values (212, 'Jung', 'eunu', 'M', 27, 40000000, 01045698585, 107, 615, 369, '2021-11-15');
insert into customer values (213, 'Kim', 'Mina', 'F', 36, 55000000, 01063295847, 110, 617, 354, '2021-11-19');
insert into customer values (214, 'Lee', 'hyeonjun', 'M', 37, 45000000, 01016458791, 103, 638, 362, '2021-12-19');
insert into customer values (215, 'Jang', 'Geonju', 'M', 28, 30000000, 01036254656, 109, 607, 368, '2021-12-16');
insert into customer values (216, 'Han', 'mira', 'F', 27, 31000000, 01095685685, 110, 604, 367, '2021-12-15');
insert into customer values (217, 'Jun', 'Ji-hyun', 'F', 49, 31000000, 01023562356, 104, 619, 367, '2021-12-10');

select * from dress;
select * from studio;
select * from makeup;
delete from Rental_customer;

insert into Rental_customer values (201, 812);
insert into Rental_customer values (201, 801);
insert into Rental_customer values (201, 820);

insert into Rental_customer values (202, 817);
insert into Rental_customer values (202, 802);
insert into Rental_customer values (202, 821);

insert into Rental_customer values (203, 818);
insert into Rental_customer values (203, 803);
insert into Rental_customer values (203, 826);

insert into Rental_customer values (204, 819);
insert into Rental_customer values (204, 804);
insert into Rental_customer values (204, 824);

insert into Rental_customer values (205, 814);
insert into Rental_customer values (205, 805);
insert into Rental_customer values (205, 826);

insert into Rental_customer values (206, 815);
insert into Rental_customer values (206, 806);
insert into Rental_customer values (206, 823);

insert into Rental_customer values (207, 816);
insert into Rental_customer values (207, 807);
insert into Rental_customer values (207, 824);

insert into Rental_customer values (208, 819);
insert into Rental_customer values (208, 808);
insert into Rental_customer values (208, 827);

insert into Rental_customer values (209, 813);
insert into Rental_customer values (209, 809);
insert into Rental_customer values (209, 825);

insert into Rental_customer values (210, 814);
insert into Rental_customer values (210, 810);
insert into Rental_customer values (210, 824);

insert into Rental_customer values (211, 815);
insert into Rental_customer values (211, 808);
insert into Rental_customer values (211, 825);

insert into Rental_customer values (212, 816);
insert into Rental_customer values (212, 805);
insert into Rental_customer values (212, 822);

insert into Rental_customer values (213, 812);
insert into Rental_customer values (213, 807);
insert into Rental_customer values (213, 820);

insert into Rental_customer values (214, 818);
insert into Rental_customer values (214, 806);
insert into Rental_customer values (214, 825);

insert into Rental_customer values (215, 813);
insert into Rental_customer values (215, 804);
insert into Rental_customer values (215, 826);

insert into Rental_customer values (216, 815);
insert into Rental_customer values (216, 802);
insert into Rental_customer values (216, 825);

insert into Rental_customer values (217, 811);
insert into Rental_customer values (217, 809);
insert into Rental_customer values (217, 823);

insert into review values (201, 1, 5);
insert into review values (203, 2, 4);
insert into review values (204, 3, 5);
insert into review values (206, 4, 5);
insert into review values (209, 5, 3);
insert into review values (210, 6, 5);
insert into review values (211, 7, 1);
insert into review values (213, 8, 4);
insert into review values (216, 9, 4);



--------------------------------------------------------------------
select * from employee;

select * from customer;

--employee 중에서 customer를 맡고 있는 employee의 customer 명 수 
select employee_id, count(*) as number_of_customer
from employee
natural join customer
group by employee_id
order by employee_id;
select * from wedding_hall;
select * from customer;

--customer가 원한 budget과 실제 들어간 realpay
select customer.customer_id, budget, sum(package.price + wedding_hall.price + rental_company.price) as realPay
from  customer, wedding_hall, rental_company, package, rental_customer
where customer.hall_id = wedding_hall.hall_id
and customer.customer_id = rental_customer.customer_id
and rental_customer.rental_company_id = rental_company.rental_company_id
and customer.package_id = package.package_id
group by customer.customer_id, budget;

--여성 고객을 상담한 employee
select employee_id
from employee
where employee_id in
(select employee_id
from customer
where gender = 'F');

select rental_company_id, name, commission
from rental_company
where commission>0.07
order by commission;
select * from rental_company;
select * from rc_phone;

select rental_company.rental_company_id, name, address, r_phone_num
from rental_company, rc_phone
where rental_company.rental_company_id = rc_phone.rental_company_id
and price < 700000;

select * from rental_customer;
select age, rental_company.rental_company_id
from customer, rental_company, rental_customer
where customer.customer_id = rental_customer.customer_id
and rental_company.rental_company_id = rental_customer.rental_company_id
and age > 20 and age < 30
order by rental_company.rental_company_id;



select * from wedding_hall;
delete from wedding_hall;




insert into Wedding_Hall values(301, 350, 100, 'Scalidium', 5000000 );
insert into Wedding_Hall values(302, 351, 50, 'Herituz', 4000000 );
insert into Wedding_Hall values(303, 352, 150, 'Guilan', 3900000 );
insert into Wedding_Hall values(304, 353, 100, 'Duilan', 5200000 );
insert into Wedding_Hall values(305, 354, 200, 'Casady', 6200000 );
insert into Wedding_Hall values(305, 369, 400, 'Rasady', 7000000 );
insert into Wedding_Hall values(306, 355, 100, 'Suabis', 8100000 );
insert into Wedding_Hall values(307, 356, 50, 'Laruje', 4800000 );
insert into Wedding_Hall values(307, 370, 100, 'Arua', 6300000 );
insert into Wedding_Hall values(307, 371, 150, 'Oroloa', 5400000 );
insert into Wedding_Hall values(308, 357, 150, 'Chinestone', 3000000 );
insert into Wedding_Hall values(309, 358, 50, 'Vivaladium', 6700000 );
insert into Wedding_Hall values(310, 359, 200, 'Eston', 6000000 );
insert into Wedding_Hall values(311, 360, 300, 'Goudorn', 4000000 );
insert into Wedding_Hall values(312, 361, 100, 'Sukumi', 4600000 );
insert into Wedding_Hall values(313, 362, 50, 'Grand', 6000000 );
insert into Wedding_Hall values(313, 372, 150, 'FRrand', 5000000 );
insert into Wedding_Hall values(314, 363, 150, 'Brider', 7000000 );
insert into Wedding_Hall values(315, 364, 250, 'Shower', 8200000 );
insert into Wedding_Hall values(316, 365, 150, 'Bibian', 6000000 );
insert into Wedding_Hall values(316, 367, 100, 'Cician', 7900000 );
insert into Wedding_Hall values(316, 368, 200, 'Didian', 7500000 );
insert into Wedding_Hall values(317, 366, 100, 'Valvula', 6000000 );


insert into Rental_Company values (801, 'Gaeul Studio', 400000, 0.13, 'Seoul Songpa-gu Baekjegobun-ro 435');
insert into Rental_Company values (802, 'Guho Studio', 500000, 0.13, 'Seoul Seongdong-gu Achasan-ro 15-gil 47-38');
insert into Rental_Company values (803, 'When He Loves You', 600000, 0.07, 'Seoul Gangnam-gu Hakdong-ro 42-gil 17');
insert into Rental_Company values (804, 'When She Loves You', 400000, 0.07, 'Seoul Gangnam-gu Nonhyeon-ro 662');
insert into Rental_Company values (805, 'Gray Scale', 700000, 0.1, 'Seoul Gangnam-gu Seolleung-ro 132-gil 19-10');
insert into Rental_Company values (806, 'The Way', 430000, 0.13, 'Seoul Gangnam-gu Dosan-daero 233');
insert into Rental_Company values (807, 'The Face', 560000, 0.05, 'Seoul Mapo-gu Donggyo-ro 142-8');
insert into Rental_Company values (808, 'Lali Studio', 730000, 0.08, 'Seoul Gangnam-gu Dosan-daero 57-gil 24');
insert into Rental_Company values (809, 'Roy Studio', 6800000, 0.05, 'Gyeonggi-do Hanam-si 40beon-gil Misadong-ro 178-35');
insert into Rental_Company values (810, 'Luna Studio', 460000, 0.13, 'Seoul Gangnam-gu 11 Seolleung-ro 152-gil');


insert into Rental_Company values (811, 'Lilac Wedding', 800000, 0.07, 'Seoul Gangnam-gu Eonju-ro 170-gil 25');
insert into Rental_Company values (812, 'Rose Square', 990000, 0.05, 'Seoul Gangnam-gu Dosan-daero 57-gil 20');
insert into Rental_Company values (813, 'The White Dress', 1050000, 0.06, 'Seoul Gangnam-gu Hakdong-ro 55-gil 12-3');
insert into Rental_Company values (814, 'Monica Blanche', 1200000, 0.07, 'Seoul Gangnam-gu Seolleung-ro 158-gil 15');
insert into Rental_Company values (815, 'Jane Dress', 903000, 0.04, 'Gyeonggi-do Suwon-si Paldal-gu Gyeongsu-daero 442');
insert into Rental_Company values (816, 'About Wedding', 1090000, 0.05, 'Gyeonggi-do Suwon-si Paldal-gu Gyeongsu-daero 442');
insert into Rental_Company values (817, 'Dear Crystal', 900000, 0.1, 'Seoul Gangdong-gu Seongnae-ro 12-gil 20');
insert into Rental_Company values (818, 'From Here Wedding', 809000, 0.08, 'Gyeonggi-do Suwon-si Paldal-gu Jungbu-daero 131');
insert into Rental_Company values (819, 'Nouvelle de Blanc', 1040000, 0.13, 'Seoul Gangnam-gu Apgujeong-ro 80-gil 38');



insert into Rental_Company values (820, 'KimSunjin Cloe', 380000, 0.1, 'Seoul Gangnam-gu Samseong-ro 772');
insert into Rental_Company values (821, 'KimCheongkyeong HairFace', 840000, 0.13, 'Seoul Gangnam-gu Dosan-daero 75-gil 21');
insert into Rental_Company values (822, 'MEPCI', 540000, 0.13, 'Seoul Gangnam-gu Eonju-ro 157-gil 5');
insert into Rental_Company values (823, 'Salon6', 460000, 0.1, 'Seoul Gangnam-gu Bongeunsa-ro 44-gil 81');
insert into Rental_Company values (824, 'A Concept', 640000, 0.12, 'Seoul Gangnam-gu Dosan-daero 70-gil 11');
insert into Rental_Company values (825, 'Small Difference', 520000, 0.09, 'Seoul Gangnam-gu Eonju-ro 174-gil 29');
insert into Rental_Company values (826, 'Joy187', 460000, 0.07, 'Seoul Gangnam-gu Seolleung-ro 152-gil 30');
insert into Rental_Company values (827, 'RaRaPM', 680000, 0.1, 'Seoul Gangnam-gu Dosan-daero 81-gil 33-2');


desc rc_phone;
desc employee;
desc Travel_agency;


create table Package (
  package_id	number(11, 0) not null,
  price		number(11, 2) not null,
  country		varchar2(30) not null,
  city		varchar2(20) not null,
  travel_agency_id	number(11, 0) not null,
  CONSTRAINT package_pk PRIMARY KEY (package_id),
  CONSTRAINT package_fk FOREIGN KEY(Travel_Agency_ID) references Travel_Agency(Travel_Agency_ID)
);


insert into package values (601, 6987000, 'USA', 'Hawaii', 501);
insert into package values (602, 7872140, 'France', 'Paris',501);
insert into package values (603, 6654710, 'USA', 'Hawaii',502);
insert into package values (604, 6263200, 'USA', 'New York',502);
insert into package values (605, 8872140, 'UK', 'London',503);
insert into package values (606, 3250000, 'Japan', 'Tyoko',503);
insert into package values (607, 3100000, 'China', 'Beijing',503);
insert into package values (608, 6821400, 'USA', 'Guam',504);
insert into package values (609, 7187000, 'USA', 'Hawaii',504);
insert into package values (610, 2987100, 'Tailand', 'Bangkok',504);
insert into package values (611, 3287100, 'Philippines', 'Cebu',504);
insert into package values (612, 7563500, 'UK', 'Manchester',505);
insert into package values (613, 7389540, 'USA', 'Hawaii',506);
insert into package values (614, 7265800, 'Italy', 'Rome',506);
insert into package values (615, 3687200, 'Japan', 'Tyoko',507);
insert into package values (616, 7836540, 'Italy', 'Milan',507);
insert into package values (617, 2986700, 'Japan', 'Tyoko',508);
insert into package values (618, 6985710, 'France', 'Paris',508);
insert into package values (619, 7021540, 'UK', 'Manchester',508);
insert into package values (620, 6678920, 'USA', 'Hawaii',509);
insert into package values (621, 6785200, 'USA', 'Guam',509);
insert into package values (622, 3689210, 'Russia', 'Vladivostok',510);
insert into package values (623, 2876510, 'Philippines', 'Cebu',510);
insert into package values (624, 2768500, 'Tailand', 'Bangkok',510);
insert into package values (625, 6981320, 'USA', 'Hawaii',511);
insert into package values (626, 3458920, 'China', 'Beijing',511);
insert into package values (627, 3006580, 'Philippines', 'Cebu',511);
insert into package values (628, 6598743, 'USA', 'Hawaii',512);
insert into package values (629, 7025982, 'USA', 'New York',512);
insert into package values (630, 7896580, 'UK', 'London',513);
insert into package values (631, 6687200, 'USA', 'New York',514);
insert into package values (632, 7985803, 'Italy', 'Milan',515);
insert into package values (634, 3985680, 'Russia', 'Vladivostok',515);
insert into package values (635, 2387500, 'Korea', 'Jeju',516);
insert into package values (636, 1769580, 'Korea', 'Ulleungdo',516);
insert into package values (637, 2156980, 'Korea', 'Jeju',517);
insert into package values (638, 1987000, 'Korea', 'Ulleungdo',517);



select employee_id, count(distinct customer_Id) as number_of_customer
from employee
natural join customer
group by employee_id
order by employee_id;





create table Employee (
  employee_id	    number(11, 0) not null,
  employee_name		varchar2(25) not null,
  salary		      number(11, 2) not null,
  email		        varchar2(30),
  e_phone_num	    varchar2(12),
  CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);

create table Travel_Agency (
  travel_agency_id	number(11, 0) not null,
  travel_agency_name		varchar2(25) not null, 
  commission	number(3, 3),
  CONSTRAINT travel_agency_pk PRIMARY KEY (travel_agency_id)
);

create table TA_Target (
  travel_agency_id	number(11, 0) not null,
  target		number(2, 0) not null,
  CONSTRAINT ta_target_pk PRIMARY KEY (travel_agency_id, target),
  CONSTRAINT ta_target_fk FOREIGN KEY (Travel_Agency_ID) REFERENCES Travel_Agency(Travel_Agency_ID)
);

create table TA_Phone (
  travel_agency_id	number(11, 0) not null,
  t_phone_num	varchar2(12) not null,
  CONSTRAINT ta_phone_pk PRIMARY KEY (travel_agency_id, t_phone_num),
  CONSTRAINT ta_phone_fk FOREIGN KEY(Travel_Agency_ID) references Travel_Agency(Travel_Agency_ID)
);

create table Package (
  package_id	number(11, 0) not null,
  price		number(11, 2) not null,
  country		varchar2(30) not null,
  city		varchar2(20) not null,
  travel_agency_id	number(11, 0) not null,
  CONSTRAINT package_pk PRIMARY KEY (package_id),
  CONSTRAINT package_fk FOREIGN KEY(Travel_Agency_ID) references Travel_Agency(Travel_Agency_ID)
);

create table Wedding_Company (
  wedding_company_id	number(11, 0) not null,
  wcompany_name		varchar2(25) not null,
  address		varchar2(50),
  commission	number(3, 3),
  CONSTRAINT wedding_company_pk PRIMARY KEY (wedding_company_id)
);

create table WC_Phone (
wedding_company_id	number(11, 0) not null,
w_phone_num		varchar2(12) not null,
CONSTRAINT wc_phone_pk PRIMARY KEY (wedding_company_id, w_phone_num),
CONSTRAINT wc_phone_fk FOREIGN KEY(wedding_company_id) references Wedding_Company(wedding_company_id)
);

create table Wedding_Hall (
hall_id            number(11, 0) not null,
wedding_company_id    number(11, 0) not null,
acceptable_num        number(4, 0),
hall_name        varchar2(20),
price        number(11, 2) not null,
CONSTRAINT wedding_hall_pk PRIMARY KEY (hall_id),
CONSTRAINT wedding_hall_fk FOREIGN KEY(wedding_company_id) references Wedding_Company(wedding_company_id)
);


create table Rental_Company (
rental_company_id	number(11, 0) not null,
rental_company_name		varchar2(25) not null,
price		number(11, 2) not null,
commission	number(3, 3),
address		varchar2(50),
CONSTRAINT rental_company_pk PRIMARY KEY (rental_company_id)
);

create table RC_Phone (
rental_company_id	number(11, 0) not null,
r_phone_num		varchar2(12) not null,
CONSTRAINT rc_phone_pk PRIMARY KEY (rental_company_id, r_phone_num),
CONSTRAINT rc_phone_fk FOREIGN KEY(rental_company_id) REFERENCES Rental_Company(rental_company_id)
);

create table Studio (
rc_id	number(11, 0) not null,
theme		varchar2(25) not null,
CONSTRAINT studio_pk PRIMARY KEY (rc_id),
CONSTRAINT studio_fk FOREIGN KEY(rc_id) references Rental_Company(rental_company_id)
);

create table Dress (
rc_id		number(11, 0) not null,
dress_id	varchar2(25) not null,
suit_id	varchar2(25) not null,
CONSTRAINT dress_pk PRIMARY KEY (rc_id),
CONSTRAINT dress_fk FOREIGN KEY(rc_id) references Rental_Company(rental_company_id)
);



create table Makeup (
rc_id			number(11, 0) not null,
makeup_designer		varchar2(25) not null,
hair_designer		varchar2(25) not null,
CONSTRAINT makeup_pk PRIMARY KEY (rc_id),
CONSTRAINT makeup_fk FOREIGN KEY(rc_id) references Rental_Company(rental_company_id)
);

create table Customer (
  customer_id	    number(11, 0) not null,
  fname		        varchar2(11) not null, 
  lname		        varchar2(11) not null,
  gender		      varchar2(1),
  age		          number(2, 0), 
  budget		      number(11, 2) not null,
  c_phone_num	    varchar2(12),
  employee_id	    number(11, 0) not null,
  package_id	    number(11, 0),
  hall_id			    number(11, 0),
  date_of_wedding date,
  CONSTRAINT customer_pk PRIMARY KEY(customer_id),
  CONSTRAINT customer_fk1 FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT customer_fk2 FOREIGN KEY (hall_id) REFERENCES Wedding_Hall(hall_id),
  CONSTRAINT customer_fk3 FOREIGN KEY (package_id) REFERENCES package(package_id)
);


create table Review (
  customer_id	number(11, 0) not null,
  review_num	number(11, 0) not null,
  rating		number(1, 0), 
  CONSTRAINT review_pk PRIMARY KEY (customer_id, review_num),
  CONSTRAINT review_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

create table Rental_customer(
  customer_id	number(11, 0) not null,
  rental_company_id	number(11, 0) not null,
  CONSTRAINT rentalcustomer_pk PRIMARY KEY (rental_company_id, customer_id),
  CONSTRAINT rentalcustomer_fk1 FOREIGN KEY (rental_company_id) REFERENCES rental_company(rental_company_id),
  CONSTRAINT rentalcustomer_fk2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

--insert travel_agency
insert into travel_agency values (501, 'Happy Travel', 0.09);
insert into travel_agency values (502, 'Tour Click', 0.07);
insert into travel_agency values (503, 'Honny Process', 0.06);
insert into travel_agency values (504, 'Memory Food', 0.08);
insert into travel_agency values (505, 'Abroad', 0.08);
insert into travel_agency values (506, 'Anywhere', 0.05);
insert into travel_agency values (507, 'JTS', 0.07);
insert into travel_agency values (508, 'Family', 0.06);
insert into travel_agency values (509, 'TAmerica', 0.04);
insert into travel_agency values (510, 'R-Asia', 0.06);
insert into travel_agency values (511, 'Memory-E', 0.07);
insert into travel_agency values (512, 'Hurb Tour', 0.09);
insert into travel_agency values (513, 'Toursun', 0.08);
insert into travel_agency values (514, 'Joy road', 0.06);
insert into travel_agency values (515, 'Cross market', 0.05);
insert into travel_agency values (516, 'Future Travel', 0.05);
insert into travel_agency values (517, 'E-A', 0.04);

--insert ta_phone
insert into ta_phone values (501, '025558888');
insert into ta_phone values (501, '025558887');
insert into ta_phone values (502, '026561111');
insert into ta_phone values (503, '027776363');
insert into ta_phone values (504, '028994567');
insert into ta_phone values (505, '021235678');
insert into ta_phone values (505, '021235679');
insert into ta_phone values (506, '024456667');
insert into ta_phone values (507, '026668899');
insert into ta_phone values (508, '021114444');
insert into ta_phone values (508, '021114443');
insert into ta_phone values (509, '026587474');
insert into ta_phone values (510, '029876543');
insert into ta_phone values (511, '029876536');
insert into ta_phone values (512, '024569922');
insert into ta_phone values (513, '025442316');
insert into ta_phone values (514, '025422319');
insert into ta_phone values (514, '025422320');
insert into ta_phone values (514, '025422321');
insert into ta_phone values (515, '026698521');
insert into ta_phone values (516, '021264598');
insert into ta_phone values (517, '029968574');

--insert ta_target
insert into ta_target values (501, 30);
insert into ta_target values (501, 40);
insert into ta_target values (502, 20);
insert into ta_target values (502, 30);
insert into ta_target values (503, 20);
insert into ta_target values (504, 30);
insert into ta_target values (505, 30);
insert into ta_target values (505, 40);
insert into ta_target values (506, 20);
insert into ta_target values (506, 30);
insert into ta_target values (506, 40);
insert into ta_target values (507, 40);
insert into ta_target values (507, 50);
insert into ta_target values (507, 60);
insert into ta_target values (508, 20);
insert into ta_target values (508, 30);
insert into ta_target values (509, 20);
insert into ta_target values (509, 30);
insert into ta_target values (509, 40);
insert into ta_target values (510, 20);
insert into ta_target values (511, 30);
insert into ta_target values (512, 40);
insert into ta_target values (513, 20);
insert into ta_target values (514, 20);
insert into ta_target values (515, 30);
insert into ta_target values (516, 40);
insert into ta_target values (517, 20);

--insert package
insert into package values (601, 6987000, 'USA', 'Hawaii', 501);
insert into package values (602, 7872140, 'France', 'Paris',501);
insert into package values (603, 6654710, 'USA', 'Hawaii',502);
insert into package values (604, 6263200, 'USA', 'New York',502);
insert into package values (605, 8872140, 'UK', 'London',503);
insert into package values (606, 3250000, 'Japan', 'Tokyo',503);
insert into package values (607, 3100000, 'China', 'Beijing',503);
insert into package values (608, 6821400, 'USA', 'Guam',504);
insert into package values (609, 7187000, 'USA', 'Hawaii',504);
insert into package values (610, 2987100, 'Tailand', 'Bangkok',504);
insert into package values (611, 3287100, 'Philippines', 'Cebu',504);
insert into package values (612, 7563500, 'UK', 'Manchester',505);
insert into package values (613, 7389540, 'USA', 'Hawaii',506);
insert into package values (614, 7265800, 'Italy', 'Rome',506);
insert into package values (615, 3687200, 'Japan', 'Tokyo',507);
insert into package values (616, 7836540, 'Italy', 'Milan',507);
insert into package values (617, 2986700, 'Japan', 'Tyoko',508);
insert into package values (618, 6985710, 'France', 'Paris',508);
insert into package values (619, 7021540, 'UK', 'Manchester',508);
insert into package values (620, 6678920, 'USA', 'Hawaii',509);
insert into package values (621, 6785200, 'USA', 'Guam',509);
insert into package values (622, 3689210, 'Russia', 'Vladivostok',510);
insert into package values (623, 2876510, 'Philippines', 'Cebu',510);
insert into package values (624, 2768500, 'Tailand', 'Bangkok',510);
insert into package values (625, 6981320, 'USA', 'Hawaii',511);
insert into package values (626, 3458920, 'China', 'Beijing',511);
insert into package values (627, 3006580, 'Philippines', 'Cebu',511);
insert into package values (628, 6598743, 'USA', 'Hawaii',512);
insert into package values (629, 7025982, 'USA', 'New York',512);
insert into package values (630, 7896580, 'UK', 'London',513);
insert into package values (631, 6687200, 'USA', 'New York',514);
insert into package values (632, 7985803, 'Italy', 'Milan',515);
insert into package values (634, 3985680, 'Russia', 'Vladivostok',515);
insert into package values (635, 2387500, 'Korea', 'Jeju',516);
insert into package values (636, 1769580, 'Korea', 'Ulleungdo',516);
insert into package values (637, 2156980, 'Korea', 'Jeju',517);
insert into package values (638, 1987000, 'Korea', 'Ulleungdo',517);


insert into employee values (101,'Sodam Park',3840000,'sodaaam@naver.com','01053203035');
insert into employee values (102,'Siwon Choi',2600000,'swchoi12@naver.com','01012532300');
insert into employee values (103,'Yujeong Han',2960000,'jeong01@naver.com','01057884035');
insert into employee values (104,'Dahun Jung',3120000,'jungda@gmail.com','01099201245');
insert into employee values (105,'Yuna Kim',2305000,'imyunakim@naver.com','01025761105');
insert into employee values (106,'Ajeong Kim',2833000,'rladkwjd@gmail.com','01059926475');
insert into employee values (107,'Jaemin Sin',1920000,'sinjamjam@naver.com','01045219492');
insert into employee values (108,'Jongmin Han',2400000,'hahahjm1004@naver.com','01003921135');
insert into employee values (109,'Taeyeon Park',2870000,'urfine7@daum.net','01049305235');
insert into employee values (110,'Seojun Lee',1880000,'lsjisme@naver.com','01066602350');
insert into employee values (111,'Gangmin Choi',2507000,'30choigang@naver.com','01043792745');
insert into employee values (112,'Nayun Kim',2600000,'na0127yun@gmail.com','01044932032');
insert into employee values (113,'Jisu Jang',2950000,'joyjoy@naver.com','01092204385');
insert into employee values (114,'Jieun Lee',1908000,'iujieun99@naver.com','01018569234');
insert into employee values (115,'Donghyeon Yu',2100000,'dbehdgus2911@naver.com','01048402911');
insert into employee values (116,'Suji Bae',3840000,'missa3suji@daum.net','01045696540');
insert into employee values (117,'Gyuri Min',2180000,'mingyurrrri@gmail.com','01012335203');



insert into Wedding_Company values(301, 'WeddingQuick', 'Seoul Seodaemun-gu Yeonhui-ro 32-gil 90', 0.06);
insert into Wedding_Company values(302, 'WeddingBook', 'Seoul Seodaemun-gu Yeonhui-ro 36-gil 49', 0.04);
insert into Wedding_Company values(303, 'SpingWedding', 'Seoul Seodaemun-gu Yeonhui-ro 248', 0.04);
insert into Wedding_Company values(304, 'Jwedd', 'Seoul Eunpyoeng-gu 35-gill 31', 0.1);
insert into Wedding_Company values(305, 'DesignWedding', 'Seoul Eunpyoeng-gu 39-gill 128', 0.08);
insert into Wedding_Company values(306, 'HelenJoy', 'Seoul Eunpyoeng-gu Eunpyeong-ro 256', 0.05);
insert into Wedding_Company values(307, 'BeautifulWedding', 'Seoul sonpa-gu Sonpa-dareo 38-gil 1', 0.12);
insert into Wedding_Company values(308, 'Weddingfriend', 'Seoul sonpa-gu Sonpa-dareo 21-gil 58', 0.11);
insert into Wedding_Company values(309, 'PlanMaju', 'Seoul sonpa-gu Sonpa-dareo 230', 0.07);
insert into Wedding_Company values(310, 'HowtoWedding', 'Seoul Gangnam-gu  Seolleung-ro 76-gil', 0.11);
insert into Wedding_Company values(311, 'WeddingHighSchool', 'Seoul Gangnam-gu  Seolleung-ro 35-gil 3', 0.05);
insert into Wedding_Company values(312, 'EUstyle', 'Seoul Gangnam-gu  Seolleung-ro 256', 0.07);
insert into Wedding_Company values(313, 'Jeongeonga', 'Seoul Mapo-gu Sinsu-ro 58', 0.09);
insert into Wedding_Company values(314, 'Deuwedding', 'Seoul Mapo-gu Sinsu-ro 123', 0.08);
insert into Wedding_Company values(315, 'WithusWedding', 'Seoul Mapo-gu Gayang-daero 3', 0.1);
insert into Wedding_Company values(316, 'Coldflower', 'Seoul Jongno-gu Pyeongchangmunhwa-ro 50', 0.12);
insert into Wedding_Company values(317, 'Modacollection', 'Seoul Jongno-gu Tongil-ro 18na-gil 19', 0.1);


insert into Wedding_Hall values(350, 301, 100, 'Scalidium', 5000000 );
insert into Wedding_Hall values(351, 302, 50, 'Herituz', 4000000 );
insert into Wedding_Hall values(352, 303, 150, 'Guilan', 3900000 );
insert into Wedding_Hall values(353, 304, 100, 'Duilan', 5200000 );
insert into Wedding_Hall values(354, 305, 200, 'Casady', 6200000 );
insert into Wedding_Hall values(369, 305, 400, 'Rasady', 7000000 );
insert into Wedding_Hall values(355, 306, 100, 'Suabis', 8100000 );
insert into Wedding_Hall values(356, 307, 50, 'Laruje', 4800000 );
insert into Wedding_Hall values(370, 307, 100, 'Arua', 6300000 );
insert into Wedding_Hall values(371, 307, 150, 'Oroloa', 5400000 );
insert into Wedding_Hall values(357, 308, 150, 'Chinestone', 3000000 );
insert into Wedding_Hall values(358, 309, 50, 'Vivaladium', 6700000 );
insert into Wedding_Hall values(359, 310, 200, 'Eston', 6000000 );
insert into Wedding_Hall values(360, 311, 300, 'Goudorn', 4000000 );
insert into Wedding_Hall values(361, 312, 100, 'Sukumi', 4600000 );
insert into Wedding_Hall values(362, 313, 50, 'Grand', 6000000 );
insert into Wedding_Hall values(372, 313, 150, 'FRrand', 5000000 );
insert into Wedding_Hall values(363, 314, 150, 'Brider', 7000000 );
insert into Wedding_Hall values(364, 315, 250, 'Shower', 8200000 );
insert into Wedding_Hall values(365, 316, 150, 'Bibian', 6000000 );
insert into Wedding_Hall values(367, 316, 100, 'Cician', 7900000 );
insert into Wedding_Hall values(368, 316, 200, 'Didian', 7500000 );
insert into Wedding_Hall values(366, 317, 100, 'Valvula', 6000000 );


--studio
insert into Rental_Company values (801, 'Gaeul Studio', 400000, 0.13, 'Seoul Songpa-gu Baekjegobun-ro 435');
insert into Rental_Company values (802, 'Guho Studio', 500000, 0.13, 'Seoul Seongdong-gu Achasan-ro 15-gil 47-38');
insert into Rental_Company values (803, 'When He Loves You', 600000, 0.07, 'Seoul Gangnam-gu Hakdong-ro 42-gil 17');
insert into Rental_Company values (804, 'When She Loves You', 400000, 0.07, 'Seoul Gangnam-gu Nonhyeon-ro 662');
insert into Rental_Company values (805, 'Gray Scale', 700000, 0.1, 'Seoul Gangnam-gu Seolleung-ro 132-gil 19-10');
insert into Rental_Company values (806, 'The Way', 430000, 0.13, 'Seoul Gangnam-gu Dosan-daero 233');
insert into Rental_Company values (807, 'The Face', 560000, 0.05, 'Seoul Mapo-gu Donggyo-ro 142-8');
insert into Rental_Company values (808, 'Lali Studio', 730000, 0.08, 'Seoul Gangnam-gu Dosan-daero 57-gil 24');
insert into Rental_Company values (809, 'Roy Studio', 6800000, 0.05, 'Gyeonggi-do Hanam-si 40beon-gil Misadong-ro 178-35');
insert into Rental_Company values (810, 'Luna Studio', 460000, 0.13, 'Seoul Gangnam-gu 11 Seolleung-ro 152-gil');

--dress
insert into Rental_Company values (811, 'Lilac Wedding', 800000, 0.07, 'Seoul Gangnam-gu Eonju-ro 170-gil 25');
insert into Rental_Company values (812, 'Rose Square', 990000, 0.05, 'Seoul Gangnam-gu Dosan-daero 57-gil 20');
insert into Rental_Company values (813, 'The White Dress', 1050000, 0.06, 'Seoul Gangnam-gu Hakdong-ro 55-gil 12-3');
insert into Rental_Company values (814, 'Monica Blanche', 1200000, 0.07, 'Seoul Gangnam-gu Seolleung-ro 158-gil 15');
insert into Rental_Company values (815, 'Jane Dress', 903000, 0.04, 'Gyeonggi-do Suwon-si Paldal-gu Gyeongsu-daero 442');
insert into Rental_Company values (816, 'About Wedding', 1090000, 0.05, 'Gyeonggi-do Suwon-si Paldal-gu Gyeongsu-daero 442');
insert into Rental_Company values (817, 'Dear Crystal', 900000, 0.1, 'Seoul Gangdong-gu Seongnae-ro 12-gil 20');
insert into Rental_Company values (818, 'From Here Wedding', 809000, 0.08, 'Gyeonggi-do Suwon-si Paldal-gu Jungbu-daero 131');
insert into Rental_Company values (819, 'Nouvelle de Blanc', 1040000, 0.13, 'Seoul Gangnam-gu Apgujeong-ro 80-gil 38');


--makeup
insert into Rental_Company values (820, 'KimSunjin Cloe', 380000, 0.1, 'Seoul Gangnam-gu Samseong-ro 772');
insert into Rental_Company values (821, 'KimCheongkyeong HairFace', 840000, 0.13, 'Seoul Gangnam-gu Dosan-daero 75-gil 21');
insert into Rental_Company values (822, 'MEPCI', 540000, 0.13, 'Seoul Gangnam-gu Eonju-ro 157-gil 5');
insert into Rental_Company values (823, 'Salon6', 460000, 0.1, 'Seoul Gangnam-gu Bongeunsa-ro 44-gil 81');
insert into Rental_Company values (824, 'A Concept', 640000, 0.12, 'Seoul Gangnam-gu Dosan-daero 70-gil 11');
insert into Rental_Company values (825, 'Small Difference', 520000, 0.09, 'Seoul Gangnam-gu Eonju-ro 174-gil 29');
insert into Rental_Company values (826, 'Joy187', 460000, 0.07, 'Seoul Gangnam-gu Seolleung-ro 152-gil 30');
insert into Rental_Company values (827, 'RaRaPM', 680000, 0.1, 'Seoul Gangnam-gu Dosan-daero 81-gil 33-2');

insert into Studio values (801, 'modern');
insert into Studio values (802, 'classic');
insert into Studio values (803, 'natural');
insert into Studio values (804, 'summer');
insert into Studio values (805, 'beach');
insert into Studio values (806, 'modern');
insert into Studio values (807, 'garden');
insert into Studio values (808, 'natural');
insert into Studio values (809, 'flower');
insert into Studio values (810, 'white');

insert into Dress values (811, 'B103', 'S209');
insert into Dress values (812, 'B330', 'S102');
insert into Dress values (813, 'M14', 'S23');
insert into Dress values (814, 'B003', 'S201');
insert into Dress values (815, 'M540', 'S410');
insert into Dress values (816, 'A122', 'S008');
insert into Dress values (817, 'B06', 'S53');
insert into Dress values (818, 'B6103', 'S3170');
insert into Dress values (819, 'M228', 'S104');

insert into Makeup values (820, 'Lina', 'Jin');
insert into Makeup values (821, 'Suji', 'Kyeong');
insert into Makeup values (822, 'Hyeon', 'Hyeok');
insert into Makeup values (823, 'Seunghi', 'Minju');
insert into Makeup values (824, 'Hyerim', 'Jihi');
insert into Makeup values (825, 'Hana', 'MinJeong');
insert into Makeup values (826, 'Sujeong', 'Seok');
insert into Makeup values (827, 'Juweon', 'Jinsol');


insert into rc_phone values (801, '025125960');
insert into rc_phone values (802, '025104230');
insert into rc_phone values (803, '0210229503');
insert into rc_phone values (804, '050713482043');
insert into rc_phone values (805, '050713137924');
insert into rc_phone values (806, '025194955');
insert into rc_phone values (807, '050714007643');
insert into rc_phone values (808, '025125960');
insert into rc_phone values (809, '021102694');
insert into rc_phone values (810, '021039485');
insert into rc_phone values (811, '022049482');
insert into rc_phone values (812, '050712209482');
insert into rc_phone values (813, '020394829');
insert into rc_phone values (814, '021039485');
insert into rc_phone values (815, '0312266669');
insert into rc_phone values (816, '020329221');
insert into rc_phone values (817, '0315468777');
insert into rc_phone values (818, '029032284');
insert into rc_phone values (819, '027775234');
insert into rc_phone values (820, '022003842');
insert into rc_phone values (821, '021392012');
insert into rc_phone values (822, '023345532');
insert into rc_phone values (823, '0310029384');
insert into rc_phone values (824, '050713220599');
insert into rc_phone values (825, '024040213');
insert into rc_phone values (826, '023221107');
insert into rc_phone values (827, '0319382280');

insert into customer values (201, 'Lee', 'cheolsu', 'M', 35, 50000000, 0106589745, 101, 610, 350, '2021-12-12');
insert into customer values (202, 'Park', 'seonyeong', 'F', 28, 40000000, 01024568975, 102, 608, 356, '2021-12-31');
insert into customer values (203, 'Choi', 'usiki', 'M', 34, 60000000, 01012345678, 115, 606, 355, '2021-12-10');
insert into customer values (204, 'Lee', 'Myeonghun', 'M', 31, 30000000, 01013568974, 103, 630, 370, '2021-12-9');
insert into customer values (205, 'Kang', 'siyeong', 'F', 44, 60000000, 01045698235, 106, 601, 359, '2021-12-25');
insert into customer values (206, 'Jang', 'jiu', 'F', 65, 60000000, 01075468215, 108, 624, 366, '2021-12-24');
insert into customer values (207, 'Han', 'Sohee', 'F', 25, 40000000, 0103692581, 112, 609, 367, '2021-11-30');
insert into customer values (208, 'Kim', 'yuseong', 'M', 29, 30000000, 01014725836, 111, 611, 372, '2021-10-30');
insert into customer values (209, 'Goo', 'jaegyeong', 'M', 27, 30000000, 01020569874, 105, 622, 358, '2021-11-19');
insert into customer values (210, 'Gong', 'minji', 'F', 36, 70000000, 01041253698, 115, 613, 359, '2021-11-21');
insert into customer values (211, 'Cha', 'Jiyeon', 'F', 39, 50000000, 01048569236, 101, 631, 360, '2021-11-07');
insert into customer values (212, 'Jung', 'eunu', 'M', 27, 40000000, 01045698585, 107, 615, 369, '2021-11-15');
insert into customer values (213, 'Kim', 'Mina', 'F', 36, 55000000, 01063295847, 110, 617, 354, '2021-11-19');
insert into customer values (214, 'Lee', 'hyeonjun', 'M', 37, 45000000, 01016458791, 103, 638, 362, '2021-12-19');
insert into customer values (215, 'Jang', 'Geonju', 'M', 28, 30000000, 01036254656, 109, 607, 368, '2021-12-16');
insert into customer values (216, 'Han', 'mira', 'F', 27, 31000000, 01095685685, 110, 604, 367, '2021-12-15');
insert into customer values (217, 'Jun', 'Ji-hyun', 'F', 49, 31000000, 01023562356, 104, 619, 367, '2021-12-10');


insert into Rental_customer values (201, 812);
insert into Rental_customer values (201, 801);
insert into Rental_customer values (201, 820);

insert into Rental_customer values (202, 817);
insert into Rental_customer values (202, 802);
insert into Rental_customer values (202, 821);

insert into Rental_customer values (203, 818);
insert into Rental_customer values (203, 803);
insert into Rental_customer values (203, 826);

insert into Rental_customer values (204, 819);
insert into Rental_customer values (204, 804);
insert into Rental_customer values (204, 824);

insert into Rental_customer values (205, 814);
insert into Rental_customer values (205, 805);
insert into Rental_customer values (205, 826);

insert into Rental_customer values (206, 815);
insert into Rental_customer values (206, 806);
insert into Rental_customer values (206, 823);

insert into Rental_customer values (207, 816);
insert into Rental_customer values (207, 807);
insert into Rental_customer values (207, 824);

insert into Rental_customer values (208, 819);
insert into Rental_customer values (208, 808);
insert into Rental_customer values (208, 827);

insert into Rental_customer values (209, 813);
insert into Rental_customer values (209, 809);
insert into Rental_customer values (209, 825);

insert into Rental_customer values (210, 814);
insert into Rental_customer values (210, 810);
insert into Rental_customer values (210, 824);

insert into Rental_customer values (211, 815);
insert into Rental_customer values (211, 808);
insert into Rental_customer values (211, 825);

insert into Rental_customer values (212, 816);
insert into Rental_customer values (212, 805);
insert into Rental_customer values (212, 822);

insert into Rental_customer values (213, 812);
insert into Rental_customer values (213, 807);
insert into Rental_customer values (213, 820);

insert into Rental_customer values (214, 818);
insert into Rental_customer values (214, 806);
insert into Rental_customer values (214, 825);

insert into Rental_customer values (215, 813);
insert into Rental_customer values (215, 804);
insert into Rental_customer values (215, 826);

insert into Rental_customer values (216, 815);
insert into Rental_customer values (216, 802);
insert into Rental_customer values (216, 825);

insert into Rental_customer values (217, 811);
insert into Rental_customer values (217, 809);
insert into Rental_customer values (217, 823);

insert into review values (201, 1, 5);
insert into review values (203, 2, 4);
insert into review values (204, 3, 5);
insert into review values (206, 4, 5);
insert into review values (209, 5, 3);
insert into review values (210, 6, 5);
insert into review values (211, 7, 1);
insert into review values (213, 8, 4);
insert into review values (216, 9, 4);

select * from customer;

select * from package;


select customer.customer_id, budget, sum(package.price + wedding_hall.price + rental_company.price) as realPay
from  customer, wedding_hall, rental_company, package, rental_customer
where customer.hall_id = wedding_hall.hall_id
and customer.customer_id = rental_customer.customer_id
and rental_customer.rental_company_id = rental_company.rental_company_id
and customer.package_id = package.package_id
group by customer.customer_id, budget
having sum(package.price + wedding_hall.price + rental_company.price)>budget;
;

select * from review;
select * from customer;
select employee_id, count(*) as number_of_customer
from employee
natural join customer
group by employee_id
order by employee_id;
select * from wedding_hall;
select * from customer;

select customer.customer_id, budget, sum(package.price + wedding_hall.price + rental_company.price) as realPay
from  customer, wedding_hall, rental_company, package, rental_customer
where customer.hall_id = wedding_hall.hall_id
and customer.customer_id = rental_customer.customer_id
and rental_customer.rental_company_id = rental_company.rental_company_id
and customer.package_id = package.package_id
group by customer.customer_id, budget;

select employee_id
from employee
where employee_id in
(select employee_id
from customer
where gender = 'F');

select rental_company_id, name, commission
from rental_company
where commission>0.07
order by commission;

select * from rental_customer;
select age, rental_company.rental_company_id
from customer, rental_company, rental_customer
where customer.customer_id = rental_customer.customer_id
and rental_company.rental_company_id = rental_customer.rental_company_id
and age > 20 and age < 30
order by rental_company.rental_company_id;

Select * 
from Wedding_Company
Where address like 'Seoul Seodaemun%';


Select hall_name, Price, Acceptable_Num, Count(Customer_Id) as SumofCustomer 
from Wedding_Hall, Customer
where Wedding_Hall.Hall_Id = Customer.Hall_Id
Group by hall_name, Price, Acceptable_Num;
select * from wedding_hall;

Select wcompany_name,address, hall_name, price, wedding_hall.wedding_company_id,acceptable_num, commission
from wedding_Hall, Wedding_Company
where wedding_hall.wedding_company_id = Wedding_Company.wedding_company_id
and price<(select avg(price) from wedding_hall)
and commission<(select avg(commission) from wedding_company);
intersect
Select wcompany_name,address, hall_name,price, wedding_hall.wedding_company_id, acceptable_num 
from wedding_Hall, Wedding_Company
where wedding_hall.wedding_company_id = Wedding_Company.wedding_company_id
and wedding_company.commission < 0.08;

select rental_company.rental_company_id, rental_company_name, address, r_phone_num
from rental_company, rc_phone
where rental_company.rental_company_id = rc_phone.rental_company_id
and price < (select avg(price) from rental_company);

select target, country, city, price from travel_agency natural join package, ta_target where target = 20 and price < 4000000 group by target, country, city, price;



select * from package;

select package.package_id, age, city, price
from customer, package
where customer.package_id = package.package_id
and age >20 and age <30
order by package.package_id;


select age, rental_company.rental_company_id
from customer, rental_company, rental_customer
where customer.customer_id = rental_customer.customer_id
and rental_company.rental_company_id = rental_customer.rental_company_id
and age > 20 and age < 30
order by rental_company.rental_company_id;
select * from ta_target;



select distinct travel_agency.travel_agency_id, travel_agency_name, city, price, avg(target) as average_Age
from travel_agency, package, ta_target
where travel_agency.travel_agency_id = package.travel_agency_id
and travel_agency.travel_agency_id = ta_target.travel_agency_id
and city = 'Hawaii'
group by travel_agency.travel_agency_id, travel_agency_name, city, price
order by travel_agency.travel_agency_id;

Select distinct  Wedding_hall.hall_id, acceptable_num, hall_name, price, date_of_wedding, customer_id, Fname, lname
from Wedding_hall, customer
where wedding_hall.hall_id = customer.hall_id
group by Wedding_hall.hall_id, acceptable_num, hall_name, price, date_of_wedding, customer_id, Fname, lname
having date_of_wedding between '2021-09-01' and '2021-11-30';

--insert package
insert into package values (601, 'USA Memoery',6987000, 'USA', 'Hawaii', 501);
insert into package values (602,' HAPPY FRANCE', 7872140, 'France', 'Paris',501);
insert into package values (603, 'Welcome Hawaii',6654710, 'USA', 'Hawaii',502);
insert into package values (604, 'I Love NY',6263200, 'USA', 'New York',502);
insert into package values (605, 'Cool London',8872140, 'UK', 'London',503);
insert into package values (606, 'Love in Tokyo',3250000, 'Japan', 'Tokyo',503);
insert into package values (607, 'Romance Beijing',3100000, 'China', 'Beijing',503);
insert into package values (608, 'Beach Guam',6821400, 'USA', 'Guam',504);
insert into package values (609, 'Memory Hawaii',7187000, 'USA', 'Hawaii',504);
insert into package values (610, 'Sea Bangkok',2987100, 'Tailand', 'Bangkok',504);
insert into package values (611, 'Swim in Cebu',3287100, 'Philippines', 'Cebu',504);
insert into package values (612, 'Play in Manchester',7563500, 'UK', 'Manchester',505);
insert into package values (613, 'Waikiki Hawaii',7389540, 'USA', 'Hawaii',506);
insert into package values (614, 'Rome History',7265800, 'Italy', 'Rome',506);
insert into package values (615, 'Love Tokyo City',3687200, 'Japan', 'Tokyo',507);
insert into package values (616, 'Fashion in Milan',7836540, 'Italy', 'Milan',507);
insert into package values (617, 'Romantic Tyoko',2986700, 'Japan', 'Tyoko',508);
insert into package values (618, 'I love Paris',6985710, 'France', 'Paris',508);
insert into package values (619, 'Romantic Manchester',7021540, 'UK', 'Manchester',508);
insert into package values (620, 'Romantic Hawaii',6678920, 'USA', 'Hawaii',509);
insert into package values (621, 'Romantic Guam',6785200, 'USA', 'Guam',509);
insert into package values (622, 'Toy Vladivostok',3689210, 'Russia', 'Vladivostok',510);
insert into package values (623, 'Cebu love you',2876510, 'Philippines', 'Cebu',510);
insert into package values (624, 'Bangkok in Romance',2768500, 'Tailand', 'Bangkok',510);
insert into package values (625, 'Romance with Hawaii',6981320, 'USA', 'Hawaii',511);
insert into package values (626, 'Romance with Beijing',3458920, 'China', 'Beijing',511);
insert into package values (627, 'Romance with Beijing',3006580, 'Philippines', 'Cebu',511);
insert into package values (628, 'aroha Hawaii',6598743, 'USA', 'Hawaii',512);
insert into package values (629, 'Romance city',7025982, 'USA', 'New York',512);
insert into package values (630, 'London like you',7896580, 'UK', 'London',513);
insert into package values (631, 'NYCity',6687200, 'USA', 'New York',514);
insert into package values (632, 'Milan Milan',7985803, 'Italy', 'Milan',515);
insert into package values (634, 'Vladivostok Vladivostok',3985680, 'Russia', 'Vladivostok',515);
insert into package values (635, 'Jeju beautiful',2387500, 'Korea', 'Jeju',516);
insert into package values (636, 'go to dokdo',1769580, 'Korea', 'Ulleungdo',516);
insert into package values (637, 'beautiful Jeju',2156980, 'Korea', 'Jeju',517);
insert into package values (638, 'beautiful korea sea',1987000, 'Korea', 'Ulleungdo',517);
