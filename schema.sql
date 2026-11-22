-- Purrfect Questions: responses table
-- Run this in the Supabase SQL Editor.

create table if not exists responses (
  id bigint generated always as identity primary key,
  created_at timestamptz default now(),
  cat_name text check (char_length(cat_name) <= 10),
  vibe text,
  pet_count int,
  answers jsonb check (char_length(answers::text) <= 5000)
);

-- Visitors can add rows but cannot read them.
alter table responses enable row level security;

create policy "anyone can submit"
  on responses for insert to anon
  with check (true);

-- You read responses in the Supabase dashboard (Table Editor).
