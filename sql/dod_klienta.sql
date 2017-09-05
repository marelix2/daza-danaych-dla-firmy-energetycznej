DROP SEQUENCE klient_seq;
create SEQUENCE klient_seq
minvalue 70
maxvalue 9999
start with 71
increment by 1
;

DROP SEQUENCE umowa_seq;
create SEQUENCE umowa_seq
minvalue 90
maxvalue 9999
start with 91
increment by 1
;
DROP SEQUENCE rachunek_seq;
create SEQUENCE rachunek_seq
minvalue 90
maxvalue 9999
start with 91
increment by 1
;



 create or replace procedure dod_kl(

    imie klienci.imie_klienta%type,
    nazwisko klienci.nazwisko_klienta%type,
    adres klienci.adres_klienta%type,
    miastoo klienci.miasto%type,
    pes klienci.pesel%type,
    rodzaj_u umowa.rodzaj_umowy%type,
    id_f umowa.ID_FIRMY%type,
    id_lin UMOWA.ID_LINII%type,
    cena_p rachunki.cena_pradu%type,
    zuzycie rachunki.zuzycie_w_kwh%type

  )
  is
  begin
    insert into klienci values(klient_seq.nextval, imie, nazwisko, adres, miastoo, pes);
    insert into umowa values(umowa_seq.nextval,rodzaj_u, klient_seq.currval,id_f,id_lin,sysdate, sysdate + INTERVAL '2' YEAR);
    insert into rachunki values(rachunek_seq.nextval, cena_p, zuzycie,umowa_seq.currval);
  end;
/

