CREATE TABLE FINANCIALS (
    BENEFICIARY_ID 			 VARCHAR(50),
    YEAR 				         INT,
    MEDICAL_REIMBURSEMENT_INPATIENT 	      DOUBLE,
    beneficiary_responsibility_inpatient      DOUBLE,
    PAYMENT_INPATIENT 			      DOUBLE,
    MEDICAL_REIMBURSEMENT_OUTPATIENT 	      DOUBLE,
    beneficiary_responsibility_outpatient     DOUBLE,
    PAYMENT_OUTPATIENT 			      DOUBLE,
    MEDICAL_REIMBURSEMENT_CARRIER 	      DOUBLE,
    beneficiary_responsibility_carrier 	      DOUBLE,
    PAYMENT_CARRIER 			      DOUBLE,
    PRIMARY KEY (BENEFICIARY_ID, YEAR), 
    CONSTRAINT FINANCIALS_BENEFICIARY_FK FOREIGN KEY (BENEFICIARY_ID) REFERENCES BENEFICIARIES(BENEFICIARY_ID)
);

COMMENT ON COLUMN FINANCIALS.MEDICAL_REIMBURSEMENT_INPATIENT  IS 'Amount reimbursed by Medicare for inpatient hospital services';
COMMENT ON COLUMN FINANCIALS.beneficiary_responsibility_inpatient  IS 'Portion of inpatient hospital costs paid by the beneficiary (copayments, coinsurance, deductibles)';
COMMENT ON COLUMN FINANCIALS.PAYMENT_INPATIENT  IS 'Total payment for inpatient hospital services including Medicare reimbursement and beneficiary responsibility';
COMMENT ON COLUMN FINANCIALS.MEDICAL_REIMBURSEMENT_OUTPATIENT  IS 'Amount reimbursed by Medicare for outpatient hospital services';
COMMENT ON COLUMN FINANCIALS.beneficiary_responsibility_outpatient  IS 'Portion of outpatient service costs paid by the beneficiary (copayments, coinsurance, deductibles)';
COMMENT ON COLUMN FINANCIALS.PAYMENT_OUTPATIENT  IS 'Total payment for outpatient services including Medicare reimbursement and beneficiary responsibility';
COMMENT ON COLUMN FINANCIALS.MEDICAL_REIMBURSEMENT_CARRIER  IS 'Amount reimbursed by Medicare for carrier claims (physicians, providers, laboratories)';
COMMENT ON COLUMN FINANCIALS.beneficiary_responsibility_carrier  IS 'Portion of carrier claim costs paid by the beneficiary (copayments, coinsurance, deductibles)';
COMMENT ON COLUMN FINANCIALS.PAYMENT_CARRIER  IS 'Total payment for carrier services including Medicare reimbursement and beneficiary responsibility';





