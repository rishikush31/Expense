CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS expenses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    owner_id UUID NOT NULL,
    title VARCHAR(120) NOT NULL,
    currency VARCHAR(3) NOT NULL DEFAULT 'INR',
    total_amount NUMERIC(12,2) NOT NULL CHECK (total_amount >= 0),
    note TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS expense_share (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    expense_id UUID NOT NULL ,
    participant_id UUID NOT NULL ,
    owed_to_user_id UUID NOT NULL,
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
    status VARCHAR(120) DEFAULT 'PENDING',
    created_at TIMESTAMPTZ DEFAULT now()
);