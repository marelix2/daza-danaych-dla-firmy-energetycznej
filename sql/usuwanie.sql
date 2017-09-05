create or replace procedure us_kl(
    idd klienci.id_klienta%type
  )
  is
  begin
  delete from klienci where id_klienta = idd;
  end;
/


create or replace procedure us_pr(
    idd pracownicy.id_pracownika%type
  )
  is
  begin
  delete from pracownicy where id_pracownika = idd;
  end;
/

create or replace procedure us_fi(
    idd firma.id_firmy%type
  )
  is
  begin
  delete from firma where id_firmy = idd;
  end;
/