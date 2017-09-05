DROP SEQUENCE pracownik_seq;
 create SEQUENCE pracownik_seq
minvalue 60
maxvalue 9999
start with 61
increment by 1
;

 create or replace procedure dod_pracow(

    imie PRACOWNICY.IMIE_PRACOWNIKA%type,
    nazwisko PRACOWNICY.NAZWISKO_PRACOWNIKA%type,
    pensja PRACOWNICY.pensja%type,
    id_o  PRACOWNICY.id_oddzialu%type
  )
  is

  begin


    insert into pracownicy values(pracownik_seq.nextval, imie, nazwisko, pensja, id_o);
  end;
/