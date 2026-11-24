CREATE TABLE applications (
    id            BIGSERIAL PRIMARY KEY,
    reference_no  VARCHAR(20)   NOT NULL UNIQUE,
    applicant_id  BIGINT        NOT NULL REFERENCES users(id),
    type          VARCHAR(30)   NOT NULL
                  CHECK (type IN ('BIRTH_CERTIFICATE', 'INCOME_CERTIFICATE',
                                  'RESIDENCE_CERTIFICATE', 'PENSION_ENROLLMENT')),
    status        VARCHAR(20)   NOT NULL
                  CHECK (status IN ('SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED')),
    details       VARCHAR(2000),
    created_at    TIMESTAMP     NOT NULL DEFAULT NOW(),
    updated_at    TIMESTAMP     NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_applications_applicant ON applications (applicant_id);
CREATE INDEX idx_applications_status    ON applications (status);