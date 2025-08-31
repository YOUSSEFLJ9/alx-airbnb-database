
INSERT INTO users (id, name, email, phone, created_at)
VALUES
    (1, 'Joe smith', 'joe@example.com', '+21260000001', NOW()),
    (2, 'Bob Marlly', 'bob@example.com', '+212600000002', NOW()),
    (3, 'yasser lbassel ', 'yasser@example.com', '+212600000003', NOW()),
    (4, 'ana ana', 'www@example.com', '+212600000004', NOW());

INSERT INTO properties (id, owner_id, title, description, location, price_per_night, created_at)
VALUES
    (1, 1, 'Cozy Apartment in Casablanca', 'A modern 2-bedroom apartment near the beach.', 'Casablanca', 99.00, NOW()),
    (2, 2, 'Riad in Marrakech Medina', 'Traditional Moroccan riad with courtyard.', 'Marrakech', 1200.00, NOW()),
    (3, 3, 'Mountain Retreat in Ifrane', 'Cabin with fireplace and scenic views.', 'Ifrane', 9.00, NOW());

-- Insert Bookings
INSERT INTO bookings (id, user_id, property_id, check_in, check_out, status, created_at)
VALUES
    (1, 2, 1, '2025-09-10', '2025-09-15', 'confirmed', NOW()),
    (2, 3, 2, '2025-10-01', '2025-10-07', 'pending', NOW()),
    (3, 4, 3, '2025-11-20', '2025-11-25', 'cancelled', NOW());

-- Insert Payments
INSERT INTO payments (id, booking_id, amount, status, paid_at)
VALUES
    (1, 1, 300.00, 'completed', NOW()),
    (2, 2, 840.00, 'pending', NULL),
    (3, 3, 450.00, 'refunded', '2025-11-10');
