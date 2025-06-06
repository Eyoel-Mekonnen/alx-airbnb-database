-- aggregation

SELECT User.user_id, User.first_name, User.last_name, COUNT(Booking.booking_id)
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id
GROUP BY User.user_id, User.first_name, User.last_name;



SELECT 
    Property.property_id,
    Property.name,
    COUNT(Booking.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS row_number_rank,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS rank_rank
FROM Property
LEFT JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY Property.property_id, Property.name
ORDER BY row_number_rank;

