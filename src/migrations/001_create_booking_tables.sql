-- Migration for Booking System Tables

CREATE TABLE users (
    id UUID PRIMARY KEY,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shows (
    id UUID PRIMARY KEY,
    movie_id UUID,
    theatre_id UUID,
    start_time TIMESTAMP,
    price DECIMAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE seats (
    id UUID PRIMARY KEY,
    show_id UUID,
    seat_number VARCHAR(10),
    row_number VARCHAR(10),
    status ENUM('AVAILABLE', 'BOOKED', 'LOCKED'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bookings (
    id UUID PRIMARY KEY,
    user_id UUID,
    show_id UUID,
    total_price DECIMAL,
    status ENUM('PENDING', 'CONFIRMED', 'CANCELLED'),
    payment_id UUID,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE booking_seats (
    id UUID PRIMARY KEY,
    booking_id UUID,
    seat_id UUID,
    show_id UUID,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payments (
    id UUID PRIMARY KEY,
    booking_id UUID,
    amount DECIMAL,
    status ENUM('PENDING', 'SUCCESS', 'FAILED'),
    payment_gateway VARCHAR(255),
    transaction_id VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);