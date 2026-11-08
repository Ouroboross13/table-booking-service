-- Таблица столиков ресторана
CREATE TABLE tables (
    table_id SERIAL PRIMARY KEY,
    table_number INT NOT NULL UNIQUE,
    capacity INT NOT NULL CHECK (capacity > 0),
    zone VARCHAR(50) DEFAULT 'MAIN_HALL' -- MAIN_HALL, TERRACE, VIP
);

-- Таблица бронирований
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    table_id INT NOT NULL REFERENCES tables(table_id) ON DELETE RESTRICT,
    customer_phone VARCHAR(20) NOT NULL,
    booking_date DATE NOT NULL,
    start_time TIME NOT NULL,
    duration_hours INT DEFAULT 2,
    status VARCHAR(20) NOT NULL DEFAULT 'CONFIRMED',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_status CHECK (status IN ('PENDING', 'CONFIRMED', 'CANCELLED', 'SEATED', 'NO_SHOW', 'COMPLETED'))
);

CREATE INDEX idx_bookings_lookup ON bookings(table_id, booking_date, start_time);