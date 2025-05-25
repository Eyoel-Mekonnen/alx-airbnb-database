-- Create indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_location ON Property(location);

-- Measure performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-user-id';

EXPLAIN ANALYZE
SELECT Property.property_id, COUNT(*) AS booking_count
FROM Property
JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY Property.property_id;

