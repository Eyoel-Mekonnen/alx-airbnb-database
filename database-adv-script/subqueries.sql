-- create sub query

SELECT Property.name, Property.property_id, Property.host_id, Property.description,
Property.location, Property.pricepernight
FROM Property
WHERE Property.property_id IN (
    SELECT Review.property_id
    FROM Review
    GROUP BY Review.property_id
    HAVING AVG(Review.rating) > 4.0
);

-- the outer qury is iterating on each row the command with is is being executed

SELECT User.user_id, User.first_name, User.last_name, User.email
FROM User
WHERE (
    SELECT COUNT(*)
    FROM Booking
    WHERE Booking.user_id = User.user_id
) > 3;

