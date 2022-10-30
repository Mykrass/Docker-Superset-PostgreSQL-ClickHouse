DROP TABLE jinni;

CREATE TABLE jinni (
  candidate_id INT,
  hire_reported TEXT,
  primary_keyword_candidate TEXT,
  candidates_city TEXT,
  candidates_country TEXT,
  experience_years FLOAT,
  en_level_candidate TEXT,
  hire_salary FLOAT,
  company_type TEXT
  );
  
COPY jinni(
  candidate_id,
  hire_reported,
  primary_keyword_candidate,
  candidates_city,
  candidates_country,
  experience_years,
  en_level_candidate,
  hire_salary,
  company_type
  ) FROM '/Users/Shared/test_jinni.csv'
DELIMITER ',' CSV HEADER;

ALTER TABLE jinni ALTER COLUMN hire_reported TYPE TIMESTAMP WITH TIME ZONE USING hire_reported::timestamptz;
