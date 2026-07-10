create table if not exists brothers (
  group_code text not null,
  name text not null,
  why text default '',
  age int,
  height numeric,
  start_weight numeric,
  goal_weight numeric,
  goal_waist numeric,
  protein int,
  carbs int,
  fats int,
  water numeric,
  cadence text default 'daily',
  updated_at timestamptz default now(),
  primary key (group_code, name)
);

create table if not exists logs (
  group_code text not null,
  name text not null,
  date date not null,
  tasks jsonb,
  done int default 0,
  waist numeric,
  weight numeric,
  updated_at timestamptz default now(),
  primary key (group_code, name, date)
);

alter table brothers enable row level security;
alter table logs enable row level security;

create policy "group access" on brothers for all using (group_code = 'day1s') with check (group_code = 'day1s');
create policy "group access" on logs for all using (group_code = 'day1s') with check (group_code = 'day1s');
