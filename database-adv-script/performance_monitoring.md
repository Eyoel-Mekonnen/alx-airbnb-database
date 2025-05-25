SELECT * FROM Booking WHERE user_id = 'some-user-id';
SELECT Property.name, Property.location FROM Property WHERE pricepernight < 100 ORDER BY pricepernight;

EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'some-user-id';

Execution time: 100ms
Type: ALL (full table scan)
Possible keys: NULL


CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_property_price ON Property(pricepernight);

