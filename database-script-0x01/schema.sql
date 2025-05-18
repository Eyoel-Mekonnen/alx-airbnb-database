-- Create a database


CREATE DATABASE IF NOT EXISTS AIRBNB;

-- Create users

CREATE USER IF NOT EXISTS eyoel@localhost IDENTIFIED BY 'eyoel';

-- GRANT priviliges

GRANT ALL PRIVILEGES ON AIRBNB .* TO eyoel@localhost;

-- Lets GIVE performance schema so that user is able to read this metrics

GRANT SELECT ON performance_schema .* TO eyoel@localhost;





-- Create table User


CREATE TABLE User (

    user_id                 UUID                                  NOT NULL,
    first_name              VARCHAR(50)                           NOT NULL,
    last_name               VARCHAR(50)                           NOT NULL,
    email                   VARCHAR(255)                          NOT NULL, UNIQUE,
    password_hash           VARCHAR(255)                          NOT NULL
    phone_number            VARCHAR(20) 
    role                    ENUM('guest', 'host', 'admin')        NOT NULL,
    created_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  NOT NULL,
    PRIMARY KEY (user_id)     
);

-- this might be redundant but i just created it
CREATE INDEX useridx ON User(user_id);


-- create property table


CREATE TABLE Property (
    property_id     UUID                  NOT NULL,
    host_id         UUID                  NOT NULL,
    name            VARCHAR(50)           NOT NULL,
    description     TEXT                  NOT NULL,
    location        VARCHAR(255)          NOT NULL,
    pricepernight   DECIMAL(10, 2)        NOT NULL,
    created_at      TIMESTAMP             DEFAULT   CURRENT_TIMESTAMP, NOT NULL,
    updated_at      TIMESTAMP             DEFAULT   ON UPDATE CURRENT_TIMESTAMP, NOT NULL,

    PRIMARY KEY (property_id),
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- creating index

CREATE INDEX propertyid ON Property(property_id);

-- create booking table applied normalization

CREATE TABLE Booking (

    booking_id    UUID      NOT NULL,
    property_id   UUID      NOT NULL,
    user_id       UUID      NOT NULL,
    start_date    DATE      NOT NULL,
    end_date      DATE      NOT NULL,
    status        ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT start_endCK CHECK (end_date >= start_date)
);

-- create index

CREATE INDEX bookingidx ON Booking(booking_id);

CREATE TABLE Payment (

    payment_id      UUID      NOT NULL,
    booking_id      UUID      NOT NULL,
    amount          DECIMAL   NOT NULL,
    payment_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    payment_method  ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);


-- create table Review

CREATE TABLE Review (

    review_id         UUID      NOT NULL,
    property_id       UUID      NOT NULL,
    user_id           UUID      NOT NULL,
    rating            INTEGER   NOT NULL,
    comment           TEXT      NOT NULL,
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (review_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT ratingCK CHECK(rating >= 1 AND rating <= 5)
);

-- create index

CREATE INDEX reviewidx ON Review(review_id);



CREATE TABLE Message (
      message_id      UUID    NOT NULL,
      sender_id       UUID    NOT NULL,
      recipient_id    UUID    NOT NULL,
      message_body    TEXT    NOT NULL,
      sent_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

      PRIMARY KEY (message_id),
      FOREIGN KEY (sender_id) REFERENCES User(user_id),
      FOREIGN KEY (recipient_id) REFERENCES User(user_id),
      CONSTRAINT messagCK CHECK(sender_id != reciepient_id)
);



-- Indexes


CREATE INDEX emailidx               ON User(email);
CREATE INDEX propertyidxbooking     ON Booking(property_id);
CREATE INDEX bookingidxpayment      ON Payment(booking_id);
