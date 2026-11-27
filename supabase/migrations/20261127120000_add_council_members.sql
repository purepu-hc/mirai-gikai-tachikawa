-- ----------------------------------------
-- 議員ページ用のテーブル（立川市版）
-- 設計: docs/20261127_1041_議員ページ_テーブル設計案.md
--
-- 方針
-- - 会派の所属・役職・議席は変わるので、期間つきで持つ（履歴を残す）
-- - 一般質問の件名・小項目は原文のまま保存し、出典URLと取得日を持たせる
-- - 回数・スコアなど、議員を比べるための列は作らない
-- - RLS は有効にし、ポリシーは定義しない（アクセスは Service Role 経由）
-- ----------------------------------------

-- 議員
CREATE TABLE council_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    name_kana TEXT NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    official_profile_url TEXT,
    homepage_url TEXT,
    x_url TEXT,
    links_checked_at DATE,
    is_current BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE council_members ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_council_members_updated_at
    BEFORE UPDATE ON council_members
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX idx_council_members_current_sort
    ON council_members (is_current, sort_order);

-- 任期・議席
CREATE TABLE council_member_terms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    member_id UUID NOT NULL REFERENCES council_members(id) ON DELETE CASCADE,
    term_start DATE NOT NULL,
    term_end DATE,
    seat_number INTEGER,
    end_reason TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (member_id, term_start),
    CHECK (term_end IS NULL OR term_end >= term_start)
);

ALTER TABLE council_member_terms ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_council_member_terms_updated_at
    BEFORE UPDATE ON council_member_terms
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- 会派の所属の履歴
CREATE TABLE council_member_factions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    member_id UUID NOT NULL REFERENCES council_members(id) ON DELETE CASCADE,
    faction_id UUID NOT NULL REFERENCES factions(id) ON DELETE RESTRICT,
    start_date DATE NOT NULL,
    end_date DATE,
    source_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (member_id, faction_id, start_date),
    CHECK (end_date IS NULL OR end_date >= start_date)
);

ALTER TABLE council_member_factions ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_council_member_factions_updated_at
    BEFORE UPDATE ON council_member_factions
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX idx_council_member_factions_member_id
    ON council_member_factions (member_id);
CREATE INDEX idx_council_member_factions_faction_id
    ON council_member_factions (faction_id);

-- 役職（議長・副議長など）
CREATE TABLE council_member_roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    member_id UUID NOT NULL REFERENCES council_members(id) ON DELETE CASCADE,
    role TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    source_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (member_id, role, start_date),
    CHECK (end_date IS NULL OR end_date >= start_date)
);

ALTER TABLE council_member_roles ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_council_member_roles_updated_at
    BEFORE UPDATE ON council_member_roles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- 一般質問（議員×会期で1件）
CREATE TABLE general_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    member_id UUID NOT NULL REFERENCES council_members(id) ON DELETE CASCADE,
    council_session_id UUID NOT NULL REFERENCES council_sessions(id) ON DELETE CASCADE,
    order_number INTEGER NOT NULL,
    seat_number INTEGER,
    faction_label TEXT,
    question_style TEXT,
    aids TEXT[] NOT NULL DEFAULT '{}',
    question_date DATE,
    source_url TEXT NOT NULL,
    source_fetched_at DATE NOT NULL,
    minutes_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (council_session_id, member_id)
);

ALTER TABLE general_questions ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_general_questions_updated_at
    BEFORE UPDATE ON general_questions
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX idx_general_questions_member_id ON general_questions (member_id);

-- 件名（parent_id が null）と小項目（parent_id に件名の id）
CREATE TABLE general_question_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    question_id UUID NOT NULL REFERENCES general_questions(id) ON DELETE CASCADE,
    parent_id UUID REFERENCES general_question_items(id) ON DELETE CASCADE,
    item_number INTEGER NOT NULL,
    text TEXT NOT NULL,
    sort_order INTEGER NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE general_question_items ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_general_question_items_updated_at
    BEFORE UPDATE ON general_question_items
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX idx_general_question_items_question_id
    ON general_question_items (question_id, sort_order);

-- 掲げたテーマ（本人が掲げているもの。出典つき）
CREATE TABLE council_member_pledges (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    member_id UUID NOT NULL REFERENCES council_members(id) ON DELETE CASCADE,
    text TEXT NOT NULL,
    source_type TEXT NOT NULL,
    source_url TEXT NOT NULL,
    checked_at DATE NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE council_member_pledges ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_council_member_pledges_updated_at
    BEFORE UPDATE ON council_member_pledges
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE INDEX idx_council_member_pledges_member_id
    ON council_member_pledges (member_id, sort_order);

-- 選挙期間中の非公開
-- member_id が null なら議員ページ全体を閉じる（市議選）。値があればその議員のページだけ閉じる
CREATE TABLE election_blackouts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    election_name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    member_id UUID REFERENCES council_members(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CHECK (end_date >= start_date)
);

ALTER TABLE election_blackouts ENABLE ROW LEVEL SECURITY;

CREATE TRIGGER set_election_blackouts_updated_at
    BEFORE UPDATE ON election_blackouts
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
