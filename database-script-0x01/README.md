# Booking App Database Schema

This document explains the design of the database schema for a simple booking application (similar to Airbnb).  
It covers the main entities, their attributes, and how they relate to each other.

---

## 1. Users

- **id SERIAL PRIMARY KEY**: Each user gets a unique ID.
- **name, email, password**: Store personal information.
- **email UNIQUE**: No duplicate emails are allowed.
- **role**: User can be `guest`, `host`, or `admin`.
- **created_at**: Timestamp of when the user registered.

---

## 2. Properties

- **host_id REFERENCES users(id)**: Linked to a host.
- **title, description, address, price, max_guests**: Core property details.
- **ON DELETE CASCADE**: If a host is deleted, their properties are deleted too.
- **created_at**: Timestamp of when the property was listed.

---

## 3. Bookings

- **property_id REFERENCES properties(id)**: Linked to a property.
- **guest_id REFERENCES users(id)**: Linked to the guest who made the booking.
- **start_date, end_date**: The reservation period.
- **status**: Can be `pending`, `confirmed`, or `cancelled`.
- **ON DELETE CASCADE**: If a property or user is deleted, associated bookings are deleted.
- **created_at**: Timestamp of when the booking was made.

---

## 4. Payments

- **booking_id REFERENCES bookings(id)**: Linked to a booking.
- **amount**: How much is paid.
- **status**: Can be `pending`, `completed`, or `failed`.
- **payment_date**: When the payment was made.

---

## Entity Relationships

- A **User** can be a **Guest** (making bookings) or a **Host** (listing properties).
- A **Host (User)** can have many **Properties**.
- A **Guest (User)** can make many **Bookings**.
- Each **Booking** is linked to one **Property** and one **Guest**.
- Each **Booking** can have one or more **Payments**.
