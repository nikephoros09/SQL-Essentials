COMMENT ON table person_discounts
    IS 'Individual discount rates for each customer in each pizzeria';

COMMENT ON COLUMN person_discounts.id
    IS 'Primary key, unique identifier for this record.';

COMMENT ON COLUMN person_discounts.person_id
    IS 'Foreign key, references the customer getting the discount.';

COMMENT ON COLUMN person_discounts.pizzeria_id
    IS 'Foreign key, references the pizzeria where the discount applies.';

COMMENT ON column person_discounts.discount
	IS 'Percentage of personal discount (0-100) for each pizzeria';
