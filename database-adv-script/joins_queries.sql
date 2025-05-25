 -- INNER JOIN



SELECT Booking.booking_id, Booking.property_id, Booking.start_date, Booking.end_date, Booking.status, User.first_name, User.last_name
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id;






--  Left Join => Property Left table

SELECT Property.property_id, Property.host_id, Property.name, Property.description, Property.location, Property.pricepernight, Review.review_id, Review.user_id, Review.rating, Review.comment
FROM Property
LEFT JOIN Review On Property.property_id = Review.property_id
ORDER BY Review.rating DESC;



-- FULL OUTER JOIN User and booking

SELECT User.user_id, User.first_name, User.last_name, User.email, User.phone_number, User.role,
Booking.property_id, Booking.start_date, Booking.end_date, Booking.status
FROM User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;
