create or replace function sample_schema1.accept_invite_to_list(userId integer, userVersion integer, inviteId integer)
  returns boolean
language plpgsql
as $$