-- 1. Retrieve all successful bookings:

SELECT * FROM bookings;
Create view Successful_Bookings AS
select * from bookings
where Booking_Status = 'Success'
select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle as

SELECT
    Vehicle_Type,
    ROUND(AVG(Ride_Distance), 2) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;

select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:

CREATE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_rides
FROM bookings
WHERE booking_status = 'Canceled by Customer';

SELECT * 
FROM canceled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW top_5_customers AS
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

SELECT * 
FROM top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW driver_personal_car_issue AS
SELECT COUNT(*) AS total_cancellations
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT *
FROM driver_personal_car_issue;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW prime_sedan_driver_ratings AS
SELECT
    MAX(Driver_Ratings) AS max_driver_rating,
    MIN(Driver_Ratings) AS min_driver_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT *
FROM prime_sedan_driver_ratings;

-- 7. Retrieve all rides where payment was made using UPI:

CREATE VIEW upi_rides AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

SELECT *
FROM upi_rides;

-- 8. Find the average customer rating per vehicle type:

CREATE VIEW avg_customer_rating_per_vehicle AS
SELECT
    Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

SELECT *
FROM avg_customer_rating_per_vehicle;

9. Calculate the total booking value of rides completed successfully:

CREATE VIEW successful_rides_booking_value AS
SELECT
    Booking_Status,
    SUM(Booking_Value) AS total_booking_value
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Booking_Status
ORDER BY total_booking_value DESC;

SELECT * FROM successful_rides_booking_value;

CREATE VIEW incomplete_rides AS
SELECT
    Booking_ID,
    Customer_ID,
    Vehicle_Type,
    Booking_Status,
    Canceled_Rides_by_Customer,
    Canceled_Rides_by_Driver
FROM bookings
WHERE Booking_Status <> 'Success';

SELECT *
FROM incomplete_rides;

