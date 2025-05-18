
-- insert into user

INSERT INTO User (
    user_id, first_name, last_name, email, password_hash, phone_number, role, created_at
) VALUES 
  ('123e4567-e89b-12d3-a456-426614174000', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+1-555-123-4567', 'guest', '2025-05-01 10:00:00'),
  ('223e4567-e89b-12d3-a456-426614174001', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+1-555-987-6543', 'host', '2025-05-02 12:00:00'),
  ('323e4567-e89b-12d3-a456-426614174002', 'Admin', 'User', 'admin@example.com', 'hashed_password_3', '+1-555-111-2222', 'admin', '2025-05-03 14:00:00');

-- insert into properyt


INSERT INTO Property (
  property_id, host_id, name, description, location, pricepernight, created_at, updated_at
) VALUES 
  ('423e4567-e89b-12d3-a456-426614174003', '223e4567-e89b-12d3-a456-426614174001', 'Cozy Cottage', 'A charming cottage in the woods', '123 Forest Rd, Asheville, NC', 120.50, '2025-05-04 09:00:00', '2025-05-04 09:00:00'),
  ('523e4567-e89b-12d3-a456-426614174004', '223e4567-e89b-12d3-a456-426614174001', 'City Loft', 'Modern loft in downtown', '456 Urban St, Charlotte, NC', 200.00, '2025-05-05 11:00:00', '2025-05-05 11:00:00');

-- insert into booking

INSERT INTO Booking (
  booking_id, property_id, user_id, start_date, end_date, status, created_at
) VALUES
  ('623e4567-e89b-12d3-a456-426614174005', '423e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', '2025-06-01', '2025-06-05', 'confirmed', '2025-05-06 10:00:00'),
  ('723e4567-e89b-12d3-a456-426614174006', '523e4567-e89b-12d3-a456-426614174004', '123e4567-e89b-12d3-a456-426614174000', '2025-07-01', '2025-07-03', 'pending', '2025-05-07 12:00:00');


-- insert into payment

INSERT INTO Payment (
    payment_id, booking_id, amount, payment_date, payment_method
) VALUES
('823e4567-e89b-12d3-a456-426614174007', '623e4567-e89b-12d3-a456-426614174005', 482.00, '2025-05-06 10:30:00', 'credit_card');


-- insert into  review


INSERT INTO Review (

    review_id, property_id, user_id, rating, comment, created_at
) VALUES
  ('923e4567-e89b-12d3-a456-426614174008', '423e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', 5, 'Amazing stay, highly recommend!', '2025-06-06 09:00:00');


-- insert into message

INSERT INTO Message (
    message_id, sender_id, recipient_id, message_body, sent_at
) VALUES
  ('a23e4567-e89b-12d3-a456-426614174009', '123e4567-e89b-12d3-a456-426614174000', '223e4567-e89b-12d3-a456-426614174001', 'Is the cottage available for June?', '2025-05-06 08:00:00');
