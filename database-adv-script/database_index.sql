-- Create indexes to optimize performance

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Property table
CREATE INDEX idx_property_location ON Property(location);

-- Measure performance with EXPLAIN
EXPLAIN SELECT * FROM Booking WHERE user_id = 'sample-user-id';

EXPLAIN SELECT Property.name, COUNT(*)
FROM Property
JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY Property.property_id;

