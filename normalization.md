## Normalization (normalization.md)

**Objective:** Ensure the database schema is normalized to Third Normal Form (3NF).

### Summary of normalization steps (to record in `normalization.md`)

1. **First Normal Form (1NF)** — Ensure each column holds atomic values and each row is unique (primary key present). Example: no comma-separated phone numbers.
2. **Second Normal Form (2NF)** — Remove partial dependencies on a composite key. In our design most tables use a single-column PK (UUID), so 2NF violations are unlikely; however check join tables if added.
3. **Third Normal Form (3NF)** — Remove transitive dependencies. Example: if `location` were storing city/state/country in one field and also storing `country_tax_rate`, consider splitting `Location` into its own table.

**Common redundancy checks & resolutions:**

* Repeated address/location strings across many properties → consider `Location` table if you need structured address or to reuse locations.
* Payment info embedded in Booking (e.g., `payment_method`) → keep payments in a separate `Payment` table.
* Denormalized aggregates (average rating stored in `Property`) → compute on demand or maintain with triggers carefully.
