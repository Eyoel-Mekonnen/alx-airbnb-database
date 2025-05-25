-- Initial complex query
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_method
FROM Booking
JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;

-- Analyze performance
EXPLAIN
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_method
FROM Booking
JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;

-- Optimized indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Optimized query
SELECT 
    B.booking_id,
    B.start_date,
    B.end_date,
    U.first_name,
    U.last_name,
    P.name AS property_name,
    Pay.amount
FROM Booking B
JOIN User U ON B.user_id = U.user_id
JOIN Property P ON B.property_id = P.property_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id;

