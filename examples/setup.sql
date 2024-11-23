CREATE TABLE IF NOT EXISTS examples (
  id SERIAL PRIMARY KEY,
  description TEXT
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM examples WHERE description = 'Mattias BRENL, Caillou DUCHAUDRON, Fahid DAHERF, Jujute MATIN') THEN
        INSERT INTO examples (description)
        VALUES ('Mattias BRENL, Caillou DUCHAUDRON, Fahid DAHERF, Jujute MATIN');
    END IF;
END $$;