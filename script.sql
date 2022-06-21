/*
--create tables
CREATE TABLE Users (
userID DECIMAL(20) NOT NULL PRIMARY KEY,
firstName VARCHAR(20) NOT NULL,
lastName varchar(20) NOT NULL,
phoneNumber CHAR(10) NOT NULL,
userEmail VARCHAR(50) NOT NULL,
userPassword VARCHAR(20) NOT NULL,
registeredDate date NOT NULL,
userType VARCHAR(20)); 

CREATE TABLE Menu (
menuID DECIMAL(12) NOT NULL PRIMARY KEY,
userID decimal(20) NOT NULL,
servingTime varchar(15) NOT NULL,
menu_content text NOT NULL,
createdDate date NOT NULL,
updatedDate date
foreign key (userID) references Users); 

CREATE TABLE tableReservation (
tableID decimal(15) NOT NULL PRIMARY KEY,
customerName VARCHAR(30) NOT NULL,
userID decimal(20) NOT NULL,
reservationDateTime smalldatetime,
foreign key (userID) references Users); 

CREATE TABLE diningTable (
tableID decimal(5) NOT NULL PRIMARY KEY,
tableStatus VARCHAR(20) NOT NULL,
capacity varchar(10) NOT NULL,
createdDate date NOT NULL,
updatedDate date,
note text);

CREATE TABLE Orders (
orderNum decimal(6) NOT NULL PRIMARY KEY,
userID decimal(20) NOT NULL,
createdDate date NOT NULL,
updatedDate date,
preTaxTotal decimal(6),
grandTotal decimal(6),
discount varchar(5),
foreign key (userID) references Users);

CREATE TABLE instoreTogoOrder (
orderNum decimal(6) NOT NULL PRIMARY KEY,
userID decimal(20),
preTaxTotal DECIMAL(6),
grandTotal decimal(6),
createdDate date NOT NULL,
updatedDate date,
foreign key (userID) references Users);
CREATE TABLE onlineOrder (
orderNum decimal(6) NOT NULL PRIMARY KEY,
sourcePlatform varchar(15),
platformOrderID varchar(20),
totalDue decimal(6),
orderDate DATE);

CREATE TABLE Item (
itemID decimal(20) NOT NULL PRIMARY KEY,
itemTitle VARCHAR(50) NOT NULL,
itemType varchar(25) NOT NULL,
userID decimal(20) not null,
itemSKU decimal(6) not null,
price decimal(6),
unit varchar(15),
recipeID decimal(20),
instructions text,
createdDate date NOT NULL,
updatedDate date,
foreign key (userID) references Users);

CREATE TABLE Recipe (
recipeID decimal(20) NOT NULL PRIMARY KEY,
userID decimal(20) NOT NULL,
createdDate date NOT NULL,
productID decimal(20),
unit varchar(15),
instruction text,
foreign key (userID) references Users);

CREATE TABLE Inventory (
productID decimal(20) NOT NULL PRIMARY KEY,
productTitle varchar(50),
createdDate date NOT NULL,
updatedDate date,
price decimal(6),
availableUnit DECIMAL(6));

CREATE TABLE Vendor (
vendorID decimal(20) NOT NULL PRIMARY KEY,
vendorName varchar(30),
phoneNumber varchar(50) NOT NULL,
vendorEmail varchar(50),
vendorAddress varchar(100));

CREATE TABLE Purchase (
purchaseID decimal(20) NOT NULL PRIMARY KEY,
vendorID decimal(20),
total VARCHAR(20) NOT NULL,
paidDate smalldatetime,
productID decimal(20),
note text,
paymentMethod varchar(30),
userID decimal(20),
foreign key (vendorID) references Vendor,
foreign key (productID) references Inventory,
foreign key (userID) references Users);

---create index
create index menuUserIdx on Menu(userID);
create index tableRsvUserIdx on tableReservation(userID);
create index rsvTableIdx on tableReservation(tableID);
create index itemUserIdx on Item(userID);
create index orderUserIdx on Orders(userID);
create index togoUserIdx on instoreTogoOrder(userID);
create index rcpUserIdx on Recipe(userID);
create index rcpProductIdx on Recipe(productID);
create index pchsVdrIdx on Purchase(vendorID);
create index pchsProductIdx on Purchase(productID);
create index pchsUserIdx on Purchase(userID);

create unique index itmRcpIdx on Item(recipeID);
create unique index togoOdnumIdx on instoreTogoOrder(orderNum);
create unique index onlineOdnumIdx on onlineOrder(orderNum);

*/

/*
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8001, 'Lil', 'Brimble', '6291718354', 'lbrimble0@google.it', 'vwUCIp36J7S', CAST('20200415' as date), 'Public relations manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8002, 'Lucienne', 'Gullivent', '8809683589', 'lgullivent1@state.gov', 'dHcQPpOra', CAST('20200415' as date), 'Counter server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8003, 'Sherill', 'Leaning', '3588200226', 'sleaning2@gov.uk', 'T2w6Coe0t9oR', CAST('20200415' as date), 'Counter server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8004, 'Karlotta', 'Veronique', '2716475223', 'kveronique3@usgs.gov', 'fjHT1y05nt', CAST('20200415' as date), 'Broiler cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8005, 'Yoshiko', 'Kleeborn', '6126405923', 'ykleeborn4@telegraph.co.uk', 'JK2IkbAM6UVd', CAST('20200415' as date), 'Pantry cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8006, 'Gaspard', 'Shuxsmith', '6577005893', 'gshuxsmith5@amazon.co.uk', 'gfUi5fH', CAST('20200415' as date), 'Banquet manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8007, 'Shaun', 'Cadreman', '5911175185', 'scadreman6@virginia.edu', 'aT8IAs5ubfGC', CAST('20200415' as date), 'Server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8008, 'Tawnya', 'Saph', '5699221685', 'tsaph7@yelp.com', 'fMnh63k', CAST('20200415' as date), 'Banquet manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8009, 'Gabriella', 'Harriott', '8059146438', 'gharriott8@tripadvisor.com', 'Ev9H69at', CAST('20200415' as date), 'Pantry cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8010, 'Layney', 'Pinare', '3926557163', 'lpinare9@nba.com', 'bFaXS7', CAST('20200415' as date), 'President/CEO');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8011, 'Maurizia', 'Queripel', '6494885305', 'mqueripela@cdbaby.com', 'BzOBSgPmm', CAST('20200415' as date), 'Broiler cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8012, 'Elihu', 'Tinner', '8679631162', 'etinnerb@wsj.com', 'SMXXVB1JJDf', CAST('20200415' as date), 'Pantry cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8013, 'Cortie', 'Dumbar', '8927309255', 'cdumbarc@wikispaces.com', '20thaU', CAST('20200415' as date), 'Baker');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8014, 'Theodor', 'Lemmon', '8056858413', 'tlemmond@miitbeian.gov.cn', '25fWIACwM', CAST('20200415' as date), 'Broiler cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8015, 'Vallie', 'Minchenton', '6953327022', 'vminchentone@wix.com', 'XbDocU8oW7', CAST('20200415' as date), 'Counter server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8016, 'Adria', 'Clayfield', '1458811228', 'aclayfieldf@nydailynews.com', 'sPunfYYrh0Vl', CAST('20200415' as date), 'Server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8017, 'Mason', 'Lawlance', '6003184365', 'mlawlanceg@wunderground.com', 'Qf1Ykzhh', CAST('20200415' as date), 'Server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8018, 'Rosanne', 'Hattigan', '8036042050', 'rhattiganh@usgs.gov', 'DVN5hlN4', CAST('20200415' as date), 'Sous chef');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8019, 'Andrus', 'Ilem', '4273019223', 'ailemi@whitehouse.gov', 'F6UI8u6ZmdbV', CAST('20200415' as date), 'Baker');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8020, 'Mord', 'Gawke', '1438399786', 'mgawkej@sogou.com', 'pO5gCoknKnOv', CAST('20200415' as date), 'Banquet manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8021, 'Pate', 'Dracksford', '5713532758', 'pdracksfordk@dmoz.org', '0JHuNizbf', CAST('20200415' as date), 'Baker');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8022, 'Alon', 'Jiggens', '4734594754', 'ajiggensl@webeden.co.uk', 'jm3cmyMWn', CAST('20200415' as date), 'Pantry cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8023, 'Nil', 'Tabor', '2235852133', 'ntaborm@etsy.com', 'D9lJTe', CAST('20200415' as date), 'Catering manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8024, 'Trudy', 'Semmence', '3849306171', 'tsemmencen@so-net.ne.jp', 'vFh2GNRx8', CAST('20200415' as date), 'General manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8025, 'Gilbert', 'Macia', '9908775706', 'gmaciao@1688.com', 'W4WalT', CAST('20200415' as date), 'Pantry cook');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8026, 'Wakefield', 'Whitter', '8726504716', 'wwhitterp@miibeian.gov.cn', 'ro4NpGi7k', CAST('20200415' as date), 'Counter server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8027, 'Hadley', 'Candlish', '7686342047', 'hcandlishq@newsvine.com', 'bxtr72', CAST('20200415' as date), 'Pastry chef');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8028, 'Redd', 'Riolfo', '6559584571', 'rriolfor@engadget.com', 'hDnc0qrCTVRz', CAST('20200415' as date), 'Kitchen manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8029, 'Ingemar', 'Champley', '7776054428', 'ichampleys@printfriendly.com', 'vzNtssMLZ2gJ', CAST('20200415' as date), 'Executive chef');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8030, 'Daron', 'De Ferrari', '7702894967', 'ddeferrarit@usa.gov', 'Bdmvby', CAST('20200415' as date), 'Expediter Food and  beverage director');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8031, 'Monica', 'Pendrick', '3728478860', 'mpendricku@dell.com', 'nxdvZNde', CAST('20200415' as date), 'General manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8032, 'Justin', 'Pudsey', '8986119371', 'jpudseyv@rediff.com', 'WzaT2KI1CBt', CAST('20200415' as date), 'Human resources manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8033, 'Estele', 'Corns', '8276424743', 'ecornsw@phpbb.com', 'pbKgxo8', CAST('20200415' as date), 'Beverage manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8034, 'Dore', 'Fillan', '5589777266', 'dfillanx@liveinternet.ru', 'Mh9xxsdgQU', CAST('20200415' as date), 'Wine steward');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8035, 'Lurlene', 'Dorgan', '6327171058', 'ldorgany@disqus.com', 'q9upe5Vycnz', CAST('20200415' as date), 'Server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8036, 'Shantee', 'Crother', '6889314200', 'scrotherz@webmd.com', 'kTDqSSVuoVZf', CAST('20200415' as date), 'Counter server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8037, 'Orren', 'Phizakarley', '5307964711', 'ophizakarley10@nbcnews.com', 'CLO0Y8SZH', CAST('20200415' as date), 'Baker');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8038, 'Eryn', 'Quenell', '2619076439', 'equenell11@ustream.tv', 'kRu0joR', CAST('20200415' as date), 'Kitchen manager');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8039, 'Lilith', 'Tidball', '7403543820', 'ltidball12@noaa.gov', '6t7trcjjQC', CAST('20200415' as date), 'Server');
insert into Users (userID, firstName, LastName, phoneNumber, userEmail, userPassword, registeredDate, userType) values (8040, 'Tonie', 'Eatherton', '3168381214', 'teatherton13@cam.ac.uk', 'iYSHpJ0q6GXD', CAST('20200415' as date), 'Baker');
*/

/*
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1001, 8029, 'Dinner', 'Steak Tartare, Frisee Salad with Lardons and Pouched Eggs, Roasted Carrot Nicoise, 
Ratatouille, Onion Soup, Salmon Rellettes, Smoked Mackerel Cucumber and Potato Salad, Cold Potato-Leak Soup, Duck Confit, Selections of Oysters, Grand Plateau, Black River Ossetra Caviar, Bistro de Didi Caviar, 
Arugla and Endive, Roasted Cod, Petite Plateau, Ricotta Pancakes, Omelette, Salmon Benedict, Prosciutto Benedict, Croque Monsicur, Heirlom Beet Lyonnaise, Fruit Pie, Vanilla Bean Cream Brulee, 
Valrhona Chocolate Marquise, Maple Poarched Pear, Artisanal Cheese Board, Framboise Souffle, Fresh Juice, Beer, Cocktails, Red Wine, White Wine', CAST('20200709' as date), CAST('20210820' as date));
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1002, 8029,'Bistro', 'Roasted Carrot Nicoise, Ratatouille, Onion Soup, Salmon Rellettes, 
Smoked Mackerel Cucumber and Potato Salad, Cold Potato-Leak Soup, Duck Confit, Selections of Oysters, Grand Plateau, Black River Ossetra Caviar, Bistro de Didi Caviar, Arugla and Endive, 
Roasted Cod, Petite Plateau, Ricotta Pancakes, Omelette, Salmon Benedict, Prosciutto Benedict, Croque Monsicur, Heirlom Beet Lyonnaise, Maple Poarched Pear, Artisanal Cheese Board, 
Framboise Souffle, Fresh Juice, Beer, Cocktails, Red Wine, White Wine', CAST('20200501' as date), CAST('20210605' as date));
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1003, 8029,'Brunch', 'Steak Tartare, 
Frisee Salad with Lardons and Pouched Eggs, Roasted Carrot Nicoise, Ratatouille, Onion Soup, Salmon Rellettes, Smoked Mackerel Cucumber and Potato Salad, Valrhona Chocolate Marquise, 
Maple Poarched Pear, Artisanal Cheese Board, Framboise Souffle, Fresh Juice, Beer, Cocktails, Red Wine, White Wine', CAST('20200401' as date), CAST('20210401' as date));
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1004, 8029,'Lunch', 'Steak Tartare, 
Frisee Salad with Lardons and Pouched Eggs, Roasted Carrot Nicoise, Ratatouille, Onion Soup, Salmon Rellettes, Smoked Mackerel Cucumber and Potato Salad, 
Cold Potato-Leak Soup, Duck Confit, Selections of Oysters, Grand Plateau, Black River Ossetra Caviar, Bistro de Didi Caviar, Arugla and Endive, Roasted Cod, Petite Plateau, 
Ricotta Pancakes, Omelette, Salmon Benedict, Prosciutto Benedict, Croque Monsicur, Heirlom Beet Lyonnaise; Fruit Pie, Vanilla Bean Cream Brulee, Fresh Juice, Red Wine, White Wine', 
CAST('20200321' as date), CAST('20220415' as date));

insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1001, 8029, 'Dinner', 'Steak Tartare, Frisee Salad with Lardons and Pouched Eggs, Roasted Carrot Nicoise, 
Ratatouille, Onion Soup, Salmon Rellettes, Smoked Mackerel Cucumber and Potato Salad, Cold Potato-Leak Soup, Duck Confit, Selections of Oysters, Grand Plateau, Black River Ossetra Caviar, Bistro de Didi Caviar, 
Arugla and Endive, Roasted Cod, Petite Plateau, Ricotta Pancakes, Omelette, Salmon Benedict, Prosciutto Benedict, Croque Monsicur, Heirlom Beet Lyonnaise, Fruit Pie, Vanilla Bean Cream Brulee, 
Valrhona Chocolate Marquise, Maple Poarched Pear, Artisanal Cheese Board, Framboise Souffle, Fresh Juice, Beer, Cocktails, Red Wine, White Wine', CAST('20200709' as date), CAST('20210820' as date));
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1002, 8029,'Bistro', 'Roasted Carrot Nicoise, Ratatouille, Onion Soup, Salmon Rellettes, 
Smoked Mackerel Cucumber and Potato Salad, Cold Potato-Leak Soup, Duck Confit, Selections of Oysters, Grand Plateau, Black River Ossetra Caviar, Bistro de Didi Caviar, Arugla and Endive, 
Roasted Cod, Petite Plateau, Ricotta Pancakes, Omelette, Salmon Benedict, Prosciutto Benedict, Croque Monsicur, Heirlom Beet Lyonnaise, Maple Poarched Pear, Artisanal Cheese Board, 
Framboise Souffle, Fresh Juice, Beer, Cocktails, Red Wine, White Wine', CAST('20200501' as date), CAST('20210605' as date));
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1003, 8029,'Brunch', 'Steak Tartare, 
Frisee Salad with Lardons and Pouched Eggs, Roasted Carrot Nicoise, Ratatouille, Onion Soup, Salmon Rellettes, Smoked Mackerel Cucumber and Potato Salad, Valrhona Chocolate Marquise, 
Maple Poarched Pear, Artisanal Cheese Board, Framboise Souffle, Fresh Juice, Beer, Cocktails, Red Wine, White Wine', CAST('20200401' as date), CAST('20210401' as date));
insert into Menu (menuID, userID, servingTime, menu_content, createdDate, updatedDate) values (1004, 8029,'Lunch', 'Steak Tartare, 
Frisee Salad with Lardons and Pouched Eggs, Roasted Carrot Nicoise, Ratatouille, Onion Soup, Salmon Rellettes, Smoked Mackerel Cucumber and Potato Salad, 
Cold Potato-Leak Soup, Duck Confit, Selections of Oysters, Grand Plateau, Black River Ossetra Caviar, Bistro de Didi Caviar, Arugla and Endive, Roasted Cod, Petite Plateau, 
Ricotta Pancakes, Omelette, Salmon Benedict, Prosciutto Benedict, Croque Monsicur, Heirlom Beet Lyonnaise; Fruit Pie, Vanilla Bean Cream Brulee, Fresh Juice, Red Wine, White Wine', 
CAST('20200321' as date), CAST('20220415' as date));

insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2001, 'Nari', 8007, cast('20220415 18:00' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2002, 'Gabi', 8017, cast('20220418 19:00' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2003, 'Kimbell', 8007, cast('20220417 17:30' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2004, 'Cheston', 8039, cast('20220419 19:15' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2005, 'Albie', 8016, cast('20220420 20:00' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2006, 'Chancey', 8016, cast('20220305 17:00' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2007, 'Effie', 8007, cast('20220409 21:00' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2008, 'Faina', 8007, cast('20220510 18:30' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2009, 'Antonie', 8035, cast('20220501 18:15' as smalldatetime));
insert into tableReservation (tableID, customerName, userID, reservationDateTime) values (2010, 'Jen', 8035, cast('20220430 18:15' as smalldatetime));

select * from tableReservation

insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2001, 'Available', '2 seats', '2022-04-02 10:47:02', '2021-05-15 17:45:17', 'Needs kids chair');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2002, 'Unavailable', '16 seats', '2022-01-11 03:24:03', '2021-09-16 15:43:05', null);
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2003, 'Available', '4 seats', '2022-03-27 15:29:37', '2021-09-18 03:58:27', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2004, 'Available', '16 seats', '2021-05-24 04:24:38', '2021-10-27 10:13:18', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2005, 'Available', '2 seats', '2021-09-15 02:35:55', '2021-11-24 04:07:13', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2006, 'Available', '4 seats', '2022-04-07 14:52:19', '2021-06-01 00:43:32', null);
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2007, 'Unavailable', '10 seats', '2021-08-13 10:01:40', '2022-03-02 00:31:43', 'Accomadate accessibility');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2008, 'Available', '2 seats', '2021-12-31 10:20:03', '2021-10-22 02:17:09', null);
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2009, 'Unavailable', '2 seats', '2021-10-09 18:39:22', '2021-11-27 03:52:38', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2010, 'Available', '2 seats', '2021-07-01 19:00:53', '2022-01-20 23:04:38', null);
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2011, 'Unavailable', '16 seats', '2022-02-28 10:24:49', '2021-08-26 23:06:32', 'Accomadate accessibility');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2012, 'Available', '10 seats', '2021-12-11 03:54:51', '2021-10-10 16:09:45', 'Needs kids chair');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2013, 'Available', '16 seats', '2021-12-06 13:01:36', '2021-10-29 15:27:59', 'Needs kids chair');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2014, 'Available', '2 seats', '2021-05-19 14:27:56', '2021-09-06 06:33:22', null);
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2015, 'Unavailable', '16 seats', '2021-09-02 12:18:18', '2021-11-29 23:15:39', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2016, 'Unavailable', '10 seats', '2021-05-08 16:20:42', '2021-09-29 07:19:18', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2017, 'Unavailable', '4 seats', '2021-10-02 00:15:50', '2022-02-06 16:02:53', 'Needs kids chair');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2018, 'Available', '2 seats', '2021-05-10 14:10:59', '2021-07-04 04:32:49', 'Needs backup utensils');
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2019, 'Unavailable', '16 seats', '2021-10-27 06:34:30', '2021-08-31 00:32:50', null);
insert into diningTable (tableID, tableStatus, capacity, createdDate, updatedDate, note) values (2020, 'Unavailable', '4 seats', '2022-02-08 21:40:05', '2021-09-04 17:32:28', null);

select * from diningTable

insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10001, 8017, '2021-11-02 06:12:33', '2022-02-01 01:23:47', 637.33, 677.163125, 0.18);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10002, 8007, '2022-01-30 08:34:41', '2022-02-02 20:08:33', 554.49, 589.145625, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10003, 8035, '2022-03-04 01:24:30', '2022-03-08 03:57:53', 284.66, 302.45125, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10004, 8035, '2022-01-16 10:35:28', '2021-10-11 00:53:30', 630.62, 670.03375, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10005, 8016, '2021-10-30 22:45:15', '2021-09-30 09:34:57', 285.92, 303.79, 0.03);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10006, 8016, '2021-12-07 19:18:15', '2022-01-21 02:29:32', 229.9, 244.26875, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10007, 8035, '2021-11-15 22:11:27', '2022-03-11 16:07:30', 57.89, 61.508125, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10008, 8039, '2022-04-13 08:39:45', '2021-12-02 12:03:57', 75.94, 80.68625, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10009, 8007, '2021-12-14 17:40:21', '2021-10-14 07:31:52', 236.52, 251.3025, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10010, 8017, '2022-03-18 21:43:05', '2022-03-30 16:54:20', 972.99, 1033.801875, 0.12);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10011, 8017, '2021-09-11 09:51:16', '2022-03-15 09:06:50', 263.32, 279.7775, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10012, 8007, '2022-02-18 17:52:15', '2021-08-25 07:38:35', 575.24, 611.1925, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10013, 8007, '2021-09-12 14:17:26', '2021-11-04 19:55:06', 961.73, 1021.838125, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10014, 8039, '2021-09-14 20:19:43', '2022-01-16 03:55:48', 375.92, 399.415, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10015, 8039, '2021-12-23 16:25:00', '2022-02-06 10:40:31', 499.06, 530.25125, 0.06);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10016, 8017, '2022-01-01 10:49:04', '2022-03-21 14:13:19', 884.51, 939.791875, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10017, 8039, '2021-12-25 13:27:35', '2021-11-19 22:59:34', 635.28, 674.985, null);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10018, 8007, '2021-10-15 07:44:38', '2022-01-07 02:10:59', 795.84, 845.58, 0.09);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10019, 8007, '2021-09-06 06:37:57', '2021-11-05 22:11:44', 371.66, 394.88875, 0.05);
insert into Orders (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount) values (10020, 8039, '2022-03-05 16:16:03', '2021-10-27 12:15:59', 446.24, 474.13, null);

select * from Orders;

insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10021, 8016, '2021-08-29 08:50:37', '2021-08-29 08:50:37', 124.61, 132.4);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10022, 8007, '2022-03-20 00:48:09', '2022-03-20 00:48:09', 213.48, 226.82);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10023, 8017, '2021-10-20 15:40:35', '2021-10-20 15:40:35', 733.18, 779.0);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10024, 8039, '2022-02-17 02:05:47', '2022-02-17 02:05:47', 189.74, 201.6);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10025, 8007, '2021-10-27 06:02:05', '2021-10-27 06:02:05', 593.13, 630.2);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10026, 8016, '2022-02-18 10:35:27', '2022-02-18 10:35:27', 560.97, 596.03);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10027, 8035, '2022-04-16 16:16:57', '2022-04-16 16:16:57', 833.03, 885.09);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10028, 8035, '2022-03-09 19:04:26', '2022-03-09 19:04:26', 853.59, 906.94);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10029, 8016, '2021-11-25 00:27:33', '2021-11-25 00:27:33', 690.28, 733.42);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10030, 8007, '2021-11-11 04:55:44', '2021-11-11 04:55:44', 251.49, 267.21);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10031, 8007, '2021-12-15 11:12:07', '2021-12-15 11:12:07', 252.04, 267.79);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10032, 8017, '2021-12-07 10:39:59', '2021-12-07 10:39:59', 563.3, 598.51);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10033, 8035, '2022-03-07 01:16:02', '2022-03-07 01:16:02', 808.84, 859.39);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10034, 8039, '2021-10-04 12:27:47', '2021-10-04 12:27:47', 460.3, 489.07);
insert into instoreTogoOrder (orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal) values (10035, 8039, '2022-02-24 10:26:16', '2022-02-24 10:26:16', 704.0, 748.0);

select * from instoreTogoOrder;

insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10036, 'Carviar', '4', '2021-08-29 21:45:29', 57.1);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10037, 'Doordash', '84213', '2022-03-10 08:01:15', 240.52);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10038, 'Carviar', '9', '2021-12-26 03:07:26', 26.62);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10039, 'Doordash', '654', '2022-03-11 17:49:10', 217.46);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10040, 'GrubHub', '905', '2021-09-29 15:36:38', 17.48);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10041, 'GrubHub', '620', '2022-01-27 10:55:30', 206.51);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10042, 'Carviar', '6078', '2022-02-11 09:59:02', 147.74);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10043, 'GrubHub', '550', '2021-10-16 12:47:44', 153.62);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10044, 'Carviar', '0349', '2021-10-09 14:27:47', 39.1);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10045, 'GrubHub', '90', '2022-02-10 19:43:08', 282.61);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10046, 'Carviar', '658', '2022-01-13 06:08:34', 206.7);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10047, 'Doordash', '1904', '2021-10-21 12:31:50', 232.96);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10048, 'GrubHub', '522', '2022-02-25 04:00:56', 119.55);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10049, 'Doordash', '897', '2021-12-05 03:25:08', 181.72);
insert into onlineOrder (orderNum, sourcePlatform, platformOrderID, orderDate, totalDue) values (10050, 'GrubHub', '716', '2021-10-21 20:30:30', 199.21);

select * from onlineOrder;


insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5001, 'Steak Tartare', 'Appetizer', 8010, 43, '1 unit', 6001, 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', '2021-05-30 07:24:50', '2022-01-22 03:43:08');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5002, 'Frisee Salad with Lardons and Pouched Eggs', 'Entree', 8029, 41, '1 set', 6002, 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', '2021-07-19 20:02:18', '2021-10-10 04:06:18');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5003, 'Roasted Carrot Nicoise', 'Appetizer', 8029, 36, '1 unit', 6003, 'vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', '2020-09-20 18:44:07', '2020-12-10 00:36:51');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5004, 'Ratatouille', 'Dessert', 8010, 45, '1 set', 6004, 'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio', '2020-10-31 07:20:21', '2021-06-12 04:09:35');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5005, 'Onion Soup', 'Dessert', 8010, 33, '1 unit', 6005, 'eget congue eget semper rutrum nulla nunc purus phasellus in felis donec', '2022-02-02 23:07:32', '2020-11-14 07:41:56');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5006, 'Salmon Rellettes', 'Beverage', 8010, 22, '1 set', 6006, 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', '2022-02-01 08:26:35', '2020-07-04 12:51:59');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5007, 'Smoked Mackerel Cucumber and Potato Salad', 'Entree', 8010, 15, '1 set', 6007, 'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient', '2020-07-02 01:15:18', '2022-04-04 08:24:03');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5008, 'Cold Potato-Leak Soup', 'Beverage', 8029, 4, '1 unit', 6008, 'sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae', '2020-10-10 22:12:59', '2022-02-06 17:44:01');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5009, 'Duck Confit', 'Entree', 8029, 11, '1 unit', 6009, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', '2020-06-07 05:56:54', '2020-05-27 04:27:12');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5010, 'Selections of Oysters', 'Appetizer', 8029, 18, '1 set', 6010, 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta', '2022-04-08 14:09:48', '2020-11-10 20:07:47');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5011, 'Grand Plateau', 'Entree', 8029, 48, '1 set', 6011, 'nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit', '2020-09-10 18:52:44', '2020-09-27 10:15:49');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5012, 'Black River Ossetra Caviar', 'Appetizer', 8029, 13, '1 set', 6012, 'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum', '2021-01-16 12:40:04', '2020-11-08 13:37:51');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5013, 'Bistro de Didi Caviar', 'Appetizer', 8010, 3, '1 unit', 6013, 'mi integer ac neque duis bibendum morbi non quam nec dui luctus', '2021-10-11 15:01:56', '2021-11-19 22:06:19');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5014, 'Arugla and Endive', 'Appetizer', 8010, 42, '1 unit', 6014, 'eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', '2020-07-31 10:51:40', '2021-12-06 08:31:38');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5015, 'Roasted Cod', 'Beverage', 8029, 48, '1 set', 6015, 'ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu', '2021-12-19 13:03:25', '2021-12-18 02:51:41');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5016, 'Petite Plateau', 'Dessert', 8010, 25, '1 set', 6016, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', '2021-05-20 14:44:19', '2020-12-30 11:42:59');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5017, 'Ricotta Pancakes', 'Appetizer', 8029, 22, '1 set', 6017, 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu', '2021-10-23 09:03:19', '2022-01-05 07:46:59');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5018, 'Omelette', 'Entree', 8029, 3, '1 unit', 6018, 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor', '2021-07-21 06:21:22', '2020-05-09 20:17:40');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5019, 'Salmon Benedict', 'Beverage', 8010, 27, '1 unit', 6019, 'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis', '2021-05-22 21:18:58', '2021-04-05 21:59:08');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5020, 'Prosciutto Benedict', 'Entree', 8010, 37, '1 set', 6020, 'consequat in consequat ut nulla sed accumsan felis ut at dolor quis', '2022-03-14 22:43:57', '2020-08-29 10:24:32');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5021, 'Croque Monsicur', 'Dessert', 8029, 14, '1 set', 6021, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', '2021-04-29 02:34:57', '2020-09-15 13:22:06');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5022, 'Heirlom Beet Lyonnaise', 'Dessert', 8010, 15, '1 unit', 6022, 'lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', '2020-05-29 02:35:35', '2020-05-28 06:32:26');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5023, 'Fruit Pie', 'Beverage', 8010, 20, '1 set', 6023, 'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum', '2022-04-12 11:35:35', '2020-11-08 04:33:59');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5024, 'Vanilla Bean Cream Brulee', 'Entree', 8029, 49, '1 unit', 6024, 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat', '2021-12-19 03:34:31', '2021-05-16 18:50:03');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5025, 'Valrhona Chocolate Marquise', 'Dessert', 8029, 23, '1 set', 6025, 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', '2020-05-02 20:50:54', '2020-10-04 18:14:01');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5026, 'Maple Poarched Pear', 'Beverage', 8010, 34, '1 unit', 6026, 'neque duis bibendum morbi non quam nec dui luctus rutrum', '2021-09-09 00:28:38', '2020-09-21 20:27:36');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5027, 'Artisanal Cheese Board', 'Dessert', 8010, 19, '1 set', 6027, 'sit amet erat nulla tempus vivamus in felis eu sapien', '2020-05-11 09:15:16', '2021-05-29 01:02:05');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5028, 'Framboise Souffle', 'Entree', 8010, 33, '1 unit', 6028, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', '2021-04-03 10:21:43', '2020-11-05 14:01:00');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5029, 'Fresh Juice', 'Beverage', 8010, 30, '1 set', 6029, 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', '2022-02-23 03:29:31', '2020-09-12 08:25:35');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5030, 'Beer', 'Entree', 8029, 43, '1 unit', 6030, 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus', '2021-03-24 20:41:21', '2021-08-17 20:45:07');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5031, 'Cocktails', 'Dessert', 8029, 14, '1 unit', 6031, 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin', '2022-02-03 20:50:30', '2021-10-22 11:41:48');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5032, 'Red Wine', 'Beverage', 8029, 43, '1 unit', 6032, 'eleifend luctus ultricies eu nibh quisque id justo sit amet', '2021-02-26 06:12:17', '2022-03-17 15:03:38');
insert into Item (itemID, itemTitle, itemType, userID, price, unit, recipeID, instructions, createdDate, updatedDate) values (5033, 'White Wine', 'Appetizer', 8029, 9, '1 unit', 6033, 'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', '2021-11-14 08:21:32', '2020-07-20 08:30:17');

select * from Item;
*/

/*
alter table Inventory alter column productTitle varchar(50);
*/

/*
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (701, 'Pork Casing', '2021-07-30 05:49:46', '2021-04-20 23:37:30', 137.18, 47);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (702, 'Wine - White, Concha Y Toro', '2021-06-01 11:35:02', '2021-09-02 20:07:14', 144.41, 5);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (703, 'Shark - Loin', '2020-07-08 18:46:58', '2020-06-19 17:48:17', 126.09, 69);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (704, 'Wine - Clavet Saint Emilion', '2020-07-04 11:05:43', '2020-06-08 20:07:42', 20.15, 63);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (705, 'Taro Leaves', '2020-09-03 18:15:17', '2020-12-05 07:38:50', 133.01, 91);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (706, 'Juice - Orange, Concentrate', '2020-07-07 08:56:12', '2021-05-17 01:35:07', 65.53, 69);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (707, 'Wine - Zinfandel California 2002', '2021-08-06 07:00:40', '2022-03-17 10:20:57', 51.66, 52);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (708, 'Parasol Pick Stir Stick', '2021-02-22 21:10:53', '2021-05-11 01:12:51', 94.6, 20);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (709, 'Momiji Oroshi Chili Sauce', '2022-01-25 09:39:46', '2020-04-17 17:49:54', 43.44, 90);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (710, 'Muffin - Zero Transfat', '2021-04-16 06:13:34', '2020-11-20 07:40:38', 145.53, 52);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (711, 'Food Colouring - Pink', '2022-03-01 05:06:44', '2020-06-26 06:10:11', 126.88, 20);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (712, 'Bacardi Mojito', '2021-02-03 15:45:31', '2021-08-18 06:02:54', 11.88, 100);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (713, 'Ecolab - Medallion', '2021-03-08 09:18:36', '2021-01-29 23:36:09', 92.79, 61);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (714, 'Rice - Jasmine Sented', '2022-01-21 05:18:47', '2021-07-16 22:06:12', 107.88, 74);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (715, 'Avocado', '2021-10-20 13:58:28', '2021-10-19 11:03:10', 74.62, 50);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (716, 'Pork - European Side Bacon', '2021-09-12 12:08:36', '2020-12-21 12:06:14', 30.91, 20);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (717, 'Cleaner - Pine Sol', '2021-05-28 20:02:16', '2022-02-10 09:54:38', 84.6, 55);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (718, 'Cake - Mini Cheesecake', '2020-06-09 05:43:23', '2020-04-13 22:18:58', 95.93, 21);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (719, 'Extract - Almond', '2020-12-28 21:24:55', '2021-07-29 01:19:09', 96.37, 90);
insert into Inventory (productID, productTitle, createdDate, updatedDate, price, availableUnit) values (720, 'Quail - Jumbo', '2020-08-12 18:29:59', '2022-03-24 20:32:03', 125.95, 71);

select * from Inventory;

insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6001, 8010, '2022-01-26 12:30:35', 708, 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6002, 8010, '2021-10-06 03:22:02', 720, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6003, 8029, '2021-08-27 13:19:08', 718, 'cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6004, 8029, '2021-03-23 19:28:26', 704, 'aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6005, 8029, '2022-02-26 10:28:54', 717, 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6006, 8010, '2021-12-29 03:42:29', 710, 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6007, 8029, '2020-10-23 12:45:06', 710, 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6008, 8029, '2021-04-07 19:05:03', 712, 'diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6009, 8010, '2020-06-15 23:25:27', 717, 'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6010, 8010, '2021-06-30 11:01:40', 708, 'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6011, 8010, '2020-08-25 23:41:05', 718, 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6012, 8010, '2021-11-08 16:01:26', 711, 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6013, 8010, '2021-01-19 14:54:04', 717, 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6014, 8029, '2020-12-13 04:26:15', 710, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6015, 8010, '2021-01-03 08:11:33', 714, 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6016, 8010, '2021-12-14 02:24:05', 720, 'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6017, 8010, '2020-07-29 01:53:58', 710, 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6018, 8010, '2021-04-13 12:26:30', 713, 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6019, 8010, '2022-01-21 10:03:26', 706, 'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6020, 8029, '2021-12-18 22:39:04', 705, 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6021, 8010, '2020-10-18 00:43:59', 716, 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6022, 8029, '2021-08-01 18:28:35', 708, 'faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6023, 8029, '2020-10-28 03:19:31', 720, 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6024, 8029, '2021-08-20 14:03:17', 705, 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6025, 8010, '2021-05-27 10:14:13', 719, 'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6026, 8029, '2021-04-07 04:01:16', 714, 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6027, 8010, '2020-12-25 03:07:44', 720, 'at velit eu est congue elementum in hac habitasse platea dictumst');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6028, 8029, '2020-06-01 17:10:57', 717, 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6029, 8010, '2020-10-20 08:33:56', 706, 'mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at');
insert into Recipe (recipeID, userID, createdDate, productID, instruction) values (6030, 8029, '2021-01-24 12:12:45', 711, 'pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed');

select * from Recipe;
*/
/*
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (901, 'Ledner-Schaefer', '6146668171', 'wmatfield0@list-manage.com', '5095 Farmco Place');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (902, 'Cole Group', '2088502106', 'pjex1@alibaba.com', '4385 Carey Trail');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (903, 'Muller, O''Kon and Jenkins', '1869225106', 'dbeachem2@weather.com', '82 Barnett Avenue');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (904, 'Bahringer, Larson and Doyle', '2592448429', 'cinwood3@uiuc.edu', '43 Forest Junction');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (905, 'Hayes, Reilly and Schowalter', '8298210624', 'salleway4@xing.com', '55366 Northland Point');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (906, 'Upton, Pacocha and Friesen', '5235147738', 'jmccoole5@yahoo.co.jp', '18 Claremont Court');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (907, 'Mosciski Inc', '3979758436', 'fplayden6@cnet.com', '31 Maywood Plaza');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (908, 'Collins LLC', '2224823065', 'gwaghorn7@yahoo.co.jp', '434 Elka Plaza');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (909, 'Torphy-Hermann', '2814077110', 'nburborough8@freewebs.com', '98 Hintze Point');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (910, 'Toy LLC', '6877177091', 'avanns9@bloomberg.com', '71799 Straubel Alley');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (911, 'Hintz LLC', '1545376771', 'tpatilloa@geocities.jp', '6079 Sachtjen Crossing');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (912, 'Abshire and Anderson', '8643500887', 'cerangyb@odnoklassniki.ru', '330 Longview Plaza');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (913, 'Block-Kreiger', '5931554307', 'tridewoodc@uiuc.edu', '426 Moose Alley');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (914, 'Langworth and Goodwin', '2085808214', 'tstrafend@amazonaws.com', '5 Buena Vista Parkway');
insert into Vendor (vendorID, vendorName, phoneNumber, vendorEmail, vendorAddress) values (915, 'Weissnat Inc', '7491680630', 'cbuddlee@ovh.net', '084 Dayton Circle');

select * from Vendor;
*/
/*
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9501, 901, 641.3, '2021-02-02 06:54:11', '2021-12-24 09:00:45', 710, 'et', 'Check', 8038);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9502, 902, 662.53, '2020-08-05 22:58:35', '2022-01-06 20:48:41', 712, null, 'Bank transfer', 8038);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9503, 903, 918.36, '2020-07-17 22:25:26', null, 709, 'ut massa volutpat', 'Cash', 8031);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9504, 904, 485.49, '2021-03-22 05:57:13', null, 702, 'ultricies eu nibh quisque id justo', 'Cash', 8031);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9505, 905, 520.69, '2021-03-20 12:34:37', '2021-06-24 22:54:31', 704, null, 'Cash', 8028);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9506, 906, 317.45, '2020-06-04 04:28:47', null, 706, null, 'Bank transfer', 8028);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9507, 907, 808.52, '2020-04-20 06:14:47', '2021-08-11 15:14:46', 706, 'neque', 'Cash', 8031);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9508, 908, 394.31, '2021-01-27 04:54:32', null, 704, null, 'Check', 8031);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9509, 909, 439.76, '2020-09-02 08:33:52', '2021-10-19 22:06:18', 702, 'pede posuere nonummy integer non velit donec diam', 'Bank transfer', 8038);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9510, 910, 411.66, '2021-02-13 06:06:47', '2022-04-22 12:49:51', 714, 'nisl venenatis lacinia aenean sit amet justo morbi ut odio', 'Bank transfer', 8028);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9511, 911, 889.85, '2020-04-11 06:05:53', '2021-06-28 18:15:31', 704, null, 'Check', 8038);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9512, 912, 774.86, '2021-03-20 20:27:30', null, 709, null, 'Check', 8028);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9513, 913, 128.18, '2021-01-06 09:30:29', null, 716, null, 'Check', 8028);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9514, 914, 310.4, '2020-09-29 19:34:46', '2022-03-06 04:53:40', 704, null, 'Bank transfer', 8028);
insert into Purchase (purchaseID, vendorID, total, purchaseDate, paidDate, productID, note, paymentMethod, userID) values (9515, 915, 551.72, '2021-03-24 17:02:53', null, 714, null, 'Check', 8024);
select * from Purchase;
*/

/*--procedure 1: new order
CREATE PROCEDURE NewOrder @orderNum DECIMAL(6), @userID decimal(6), @createdDate date,
@updatedDate date, @preTaxTotal decimal(6), @grandTotal decimal(6), @discount varchar(5)
AS
BEGIN
 INSERT INTO Orders(orderNum, userID, createdDate, updatedDate, preTaxTotal, grandTotal, discount)
 VALUES(@orderNum, @userID, @createdDate, @updatedDate, @preTaxTotal, @grandTotal, @discount);

END*/

/*BEGIN TRANSACTION NewOrder;
EXECUTE NewOrder 10023, 8035, '2021-11-29 12:41:50', '2022-01-17 16:03:45', 
998.19, 1060.576875, 0.20;
COMMIT TRANSACTION NewOrder;*/ 

/*--procedure 2: unpaid vendor purchase 
CREATE PROCEDURE UnpaidPurchases @paidDate date
AS
BEGIN
SELECT * FROM Purchase where paidDate=@paidDate
end;
GO*/
/*
--procedure 2: userID and password validation
CREATE PROCEDURE Verify @userID decimal(20), @userPassword varchar(20)
AS
BEGIN
IF EXISTS(SELECT * FROM Users where UserID=@userID and userPassword=@userPassword)
	PRINT('Valid user')
ELSE
	PRINT('Invalid user or password')
END;
GO

execute Verify @userID='8040', @userPassword='iYSHpJ0q6GXD'
GO*/

/*--procedure 3: erase wrong records
CREATE PROCEDURE DeleteData @orderNum decimal(6)
AS
BEGIN
DELETE FROM Orders WHERE orderNum = @orderNum;
END;
GO
*/
/*
execute DeleteData @orderNum = 10022
go

select * from Orders where orderNum=10022;
*/
/*
create table priceChangeChecker (
itemPriceChangeID decimal(20) not null primary key,
oldPrice decimal(6) not null,
newPrice decimal(6) not null,
itemID decimal(20) not null,
updatedDate date not null,
foreign key (itemID) references Item(itemID));
*/
/*
select * from priceChangeChecker;
*/
/*
--create trigger
CREATE TRIGGER PriceChangeTrigger
ON Item
AFTER UPDATE
AS
BEGIN
 DECLARE @oldPrice decimal(6) = (SELECT price FROM DELETED);
 DECLARE @newPrice decimal(6) = (SELECT price FROM INSERTED);

 IF (@oldPrice <> @newPrice)
 INSERT INTO priceChangeChecker(itemPriceChangeID,oldPrice,newPrice,itemID,updatedDate)
 VALUES(ISNULL((SELECT MAX(itemPriceChangeID)+1 FROM PriceChange), 1),
		@OldPrice,
		@NewPrice,
		(SELECT CarID FROM INSERTED),
		GETDATE());
END;
*/

/*update Item set price=20 where itemID = 5001;*/

/*create table PurchasePayoff(
balancePayoffID decimal(12) not null primary key,
oldBalance decimal(7,2) not null,
newBalance decimal(7,2) not null,
purchaseID decimal(20) not null,
paidDate date not null,
foreign key (purchaseID) references Purchase(purchaseID));

select * from PurchasePayoff;*/

/*
create trigger PurchasePayoffTrigger
on Purchase
after update
as 
begin
	declare @oldBalance decimal(7,2) = (select total from deleted);
	declare @newBalance decimal(7,2) = (select total from inserted);

	if(@oldBalance<> @newBalance)
		insert into PurchasePayoff(balancePayoffID,oldBalance,newBalance,purchaseID,paidDate) 
		values(ISNULL((select max(balancePayoffID)+1 from PurchasePayoff),1),
		@oldBalance,
		@newBalance,
		(select purchaseID from inserted),
		GETDATE());
end;
*/
/*
update Purchase set paidDate = '2022-4-23' where purchaseID = 9512;*/

/*select Users.userID, firstName, lastName, userType from Users 
join Purchase on Users.userID = Purchase.userID
group by userType, firstName, lastName, Users.userID*/

/*select min(price) as least_spend, itemTitle, itemType from Item 
group by itemTitle, itemType, price
order by price asc*/

/*select Users.userID, firstName, lastName from Users
join tableReservation on Users.userID = tableReservation.userID
group by Users.userID, firstName, lastName;*/

select Purchase.paidDate, total, Purchase.userID, Users.firstName, Users.lastName from Purchase 
join purchasePayoff on Purchase.paidDate = purchasePayoff.paidDate
join Users on users.userID = Purchase.userID
where purchasePayoff.paidDate > '2022-04-01'

