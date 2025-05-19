create database Ola;
use Ola;
select * from bookings;

#1. Retrieve all successful bookings:
create view Successful_Booking as
select * from bookings where Booking_Status = 'Success';

Select * from Successful_Booking; 

#2. Find the average ride distance for each vehicle type:
create view avg_ride_distance as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by vehicle_type;

select * from avg_ride_distance;

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from bookings
where Booking_Status = "Canceled by Customer";

select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as
Select customer_id, count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5; 

select * from Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(*) from bookings where Canceled_Rides_by_Driver = "Personal & Car related issue";

select * from rides_cancelled_by_drivers; 

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view maximum_and_minimum_driver_ratings_for_Prime_Sedan as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = "Prime Sedan";

select * from maximum_and_minimum_driver_ratings_for_Prime_Sedan;

#7. Retrieve all rides where payment was made using UPI:
create view payment_by_UPI as
select * from bookings
where payment_method = "Upi";

select * from payment_by_UPI;

#8. Find the average customer rating per vehicle type:
create view avg_cust_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

select * from avg_cust_rating;

#9. Calculate the total booking value of rides completed successfully:
create view total_successfull_rides as
select sum(Booking_Value) as total_successful_ride_value
from bookings
where booking_status = "Success";

select * from total_successfull_rides;

#10. List all incomplete rides along with the reason:
create view incomplete_rides as
select booking_id, incomplete_rides_reason
from bookings
where incomplete_rides = "Yes";

select * from incomplete_rides;

















