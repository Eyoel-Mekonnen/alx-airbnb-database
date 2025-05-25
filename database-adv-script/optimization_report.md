🔎 Step 1: Initial Query & Analysis
Initial Query:

sql
Copy
Edit
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.user_id,
    User.first_name,
    User.last_name,
    Property.property_id,
    Property.name,
    Property.location,
    Payment.amount
FROM Booking
JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;
Performance Issue Observed (Using EXPLAIN):

Full table scans on large tables

Joins not using indexes

High cost in execution

🛠️ Step 2: Indexing
Created Indexes:

sql
Copy
Edit
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
Why?
These columns are frequently used in JOIN conditions — indexing helps the database quickly find matching rows.

🔄 Step 3: Query Refactoring
Refactored Query:

sql
Copy
Edit
SELECT 
    B.booking_id,
    B.start_date,
    B.end_date,
    U.first_name,
    U.last_name,
    P.name AS property_name,
    P.location,
    Pay.amount
FROM Booking B
JOIN User U ON B.user_id = U.user_id
JOIN Property P ON B.property_id = P.property_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id;
Why?

Selected only necessary columns

Used table aliases for better readability

📈 Step 4: Performance Comparison
StepDescriptionType of Join UsedIndex UsedCost Estimate
BeforeNo indexALL (full scan)❌High
After IndexWith indexref/index✅Lower
After RefactorOptimized columnsref/index✅Lowest

✅ Conclusion
Indexes greatly improved JOIN performance

Query refactoring reduced unnecessary data processing

The combination resulted in a faster, more scalable query
