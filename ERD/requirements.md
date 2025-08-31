## ER Diagram (ERD/requirements.md)

**Objective:** Identify all entities and relationships, then produce a visual ER diagram (use Draw\.io or similar).

### Entities & attributes (from specification)

* **User**

  * `user_id` (UUID, PK, indexed)
  * `first_name` VARCHAR NOT NULL
  * `last_name` VARCHAR NOT NULL
  * `email` VARCHAR UNIQUE NOT NULL
  * `password_hash` VARCHAR NOT NULL
  * `phone_number` VARCHAR NULL
  * `role` ENUM (guest, host, admin) NOT NULL
  * `created_at` TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

* **Property**

  * `property_id` (UUID, PK, indexed)
  * `host_id` (UUID, FK → User.user\_id)
  * `name` VARCHAR NOT NULL
  * `description` TEXT NOT NULL
  * `location` VARCHAR NOT NULL
  * `price_per_night` DECIMAL NOT NULL
  * `created_at` TIMESTAMP DEFAULT CURRENT\_TIMESTAMP
  * `updated_at` TIMESTAMP -- ON UPDATE behavior depends on DB

* **Booking**

  * `booking_id` (UUID, PK, indexed)
  * `property_id` (UUID, FK → Property.property\_id)
  * `user_id` (UUID, FK → User.user\_id)
  * `start_date` DATE NOT NULL
  * `end_date` DATE NOT NULL
  * `total_price` DECIMAL NOT NULL
  * `status` ENUM (pending, confirmed, canceled) NOT NULL
  * `created_at` TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

* **Payment**

  * `payment_id` (UUID, PK, indexed)
  * `booking_id` (UUID, FK → Booking.booking\_id)
  * `amount` DECIMAL NOT NULL
  * `payment_date` TIMESTAMP DEFAULT CURRENT\_TIMESTAMP
  * `payment_method` ENUM (credit\_card, paypal, stripe) NOT NULL

* **Review**

  * `review_id` (UUID, PK, indexed)
  * `property_id` (UUID, FK → Property.property\_id)
  * `user_id` (UUID, FK → User.user\_id)
  * `rating` INTEGER CHECK (rating BETWEEN 1 AND 5) NOT NULL
  * `comment` TEXT NOT NULL
  * `created_at` TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

* **Message**

  * `message_id` (UUID, PK, indexed)
  * `sender_id` (UUID, FK → User.user\_id)
  * `recipient_id` (UUID, FK → User.user\_id)
  * `message_body` TEXT NOT NULL
  * `sent_at` TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

### Relationships (high-level)

* **User (1) — (N) Booking**: A user (guest) can make many bookings; each booking belongs to one user.
* **Property (1) — (N) Booking**: A property can have multiple bookings over time; each booking is for one property.
* **User (1) — (N) Property** (as host): A host (User.role = 'host') can list many properties.
* **Booking (1) — (0..1) Payment**: A booking may have one payment record (or multiple if partial payments are supported).
* **Property (1) — (N) Review** and **User (1) — (N) Review**: Users write reviews for properties.
* **User (1) — (N) Message** (as sender) and **User (1) — (N) Message** (as recipient): Users exchange messages.