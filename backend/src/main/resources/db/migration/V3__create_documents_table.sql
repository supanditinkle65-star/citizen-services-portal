CREATE TABLE documents (
    id              BIGSERIAL PRIMARY KEY,
    application_id  BIGINT        NOT NULL
                    REFERENCES applications(id) ON DELETE CASCADE,
    document_type   VARCHAR(30)   NOT NULL
                    CHECK (document_type IN ('ID_PROOF', 'ADDRESS_PROOF',
                                             'INCOME_PROOF', 'PHOTO', 'OTHER')),
    file_name       VARCHAR(255)  NOT NULL,
    content_type    VARCHAR(100)  NOT NULL,
    size_bytes      BIGINT        NOT NULL,
    storage_key     VARCHAR(500)  NOT NULL UNIQUE,
    uploaded_at     TIMESTAMP     NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_documents_application ON documents (application_id);