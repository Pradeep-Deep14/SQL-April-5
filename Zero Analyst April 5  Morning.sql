--SQL Query that calculates the total viewership for laptops and mobile devices--
--mobile - sum of tablet and phone viewership--
--Total viewership for laptops as laptop_views--
--Total viewership for mobile devices as mobile_views--


CREATE TABLE viewership(
device_type VARCHAR(255),
viewership_count INTEGER
);


INSERT INTO viewership(device_type,viewership_count)VALUES
('laptop',5000),
('tablet',3000),
('phone',7000),
('laptop',6000),
('tablet',4000),
('phone',8000),
('laptop',5500),
('tablet',3500),
('phone',7500);

select * from viewership

SELECT 
SUM(CASE WHEN device_type='laptop' then viewership_count ELSE 0 END) AS Laptop_views,
SUM(CASE WHEN device_type in ('tablet','phone') then viewership_count ELSE 0 END) as mobile_views
from viewership;

 
