DELIMITER $$

CREATE PROCEDURE POPULATE_TABLES()
BEGIN

    INSERT INTO GENDERS (GENDER_CODE, DESCRIPTION)
    SELECT DISTINCT b.GENDER_CODE,
        CASE 
            WHEN b.GENDER_CODE = 1 THEN 'Male'
            WHEN b.GENDER_CODE = 2 THEN 'Female'
            ELSE 'Unknown'
        END
    FROM beneficiaries b
    WHERE b.GENDER_CODE IS NOT NULL
      AND NOT EXISTS (
            SELECT 1 
            FROM GENDERS g 
            WHERE g.GENDER_CODE = b.GENDER_CODE
      );

    INSERT INTO RACES (RACE_CODE, DESCRIPTION)
    SELECT DISTINCT b.RACE_CODE,
        CASE 
            WHEN b.RACE_CODE = 1 THEN 'White'
            WHEN b.RACE_CODE = 2 THEN 'Black'
            WHEN b.RACE_CODE = 3 THEN 'Other'
            ELSE 'Unknown'
        END
    FROM beneficiaries b
    WHERE b.RACE_CODE IS NOT NULL
      AND NOT EXISTS (
            SELECT 1 
            FROM RACES r 
            WHERE r.RACE_CODE = b.RACE_CODE
      );

    INSERT INTO STATES (STATE_CODE, STATE_NAME)
    SELECT DISTINCT c.STATE_CODE,
           c.STATE_CODE
    FROM coverage c
    WHERE c.STATE_CODE IS NOT NULL
      AND NOT EXISTS (
            SELECT 1
            FROM STATES s
            WHERE s.STATE_CODE = c.STATE_CODE
      );

    INSERT INTO COUNTIES (COUNTY_CODE, COUNTY_NAME, STATE_CODE)
    SELECT DISTINCT c.COUNTY_CODE,
           c.COUNTY_CODE,
           c.STATE_CODE
    FROM coverage c
    WHERE c.COUNTY_CODE IS NOT NULL
      AND NOT EXISTS (
            SELECT 1
            FROM COUNTIES co
            WHERE co.COUNTY_CODE = c.COUNTY_CODE
      );

END$$

DELIMITER ;
