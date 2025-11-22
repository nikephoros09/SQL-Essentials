--ex00
--A table for change history. Only inserts are tracked automatically.
--The function is used as a trigger (called automatically)
CREATE TABLE person_audit (
    created     TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
    type_event  CHAR(1) DEFAULT 'I' NOT NULL,
    row_id      BIGINT NOT NULL,
    name        VARCHAR,
    age         INTEGER,
    gender      VARCHAR,
    address     VARCHAR,
    CONSTRAINT ch_type_event
        CHECK (type_event IN ('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (row_id, name, age, gender, address)
    VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();
--TEST
INSERT INTO person (id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;

