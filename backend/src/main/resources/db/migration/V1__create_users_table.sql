CREATE TABLE users (
    id            BIGSERIAL PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone         VARCHAR(15),
    role          VARCHAR(20)  NOT NULL
                  CHECK (role IN ('CITIZEN', 'OFFICER', 'ADMIN')),
    created_at    TIMESTAMP    NOT NULL DEFAULT NOW()
);