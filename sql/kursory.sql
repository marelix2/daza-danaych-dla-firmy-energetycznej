  CREATE OR REPLACE procedure zniz(
      idd  number,
      hajs rachunki.cena_pradu%type
     )
IS
zmienna number;
i umowa%rowtype;
CURSOR ln1 IS
SELECT U.id_umowy FROM klienci K, umowa U, rachunki R  where K.ID_klienta = idd and U.ID_KLIENTA = K.ID_KLIENTA and R.ID_UMOWY = U.ID_UMOWY ;
BEGIN
  zmienna := hajs / 100;
  FOR i IN ln1 LOOP

    UPDATE rachunki set CENA_PRADU = CENA_PRADU + zmienna where ID_UMOWY = i.ID_UMOWY ;
  END LOOP;
END;
/

CREATE OR REPLACE procedure pen_s(
      odd NUMBER,
       hajs pracownicy.pensja%type)

IS
zmienna NUMBER;
i pracownicy%rowtype;
CURSOR ln1 IS
SELECT P.id_pracownika FROM  oddzial O, PRACOWNICY P , (select avg(pensja) srednia  from PRACOWNIcy) PP  where O.ID_ODDZIALU = odd and O.ID_ODDZIALU = P.ID_ODDZIALU;
BEGIN
zmienna := hajs / 100;

  FOR i IN ln1 LOOP
    UPDATE PRACOWNICY set pensja = pensja+(pensja * zmienna) where ID_PRACOWNIKA = i.id_pracownika ;
  END LOOP;
END;
/

CREATE OR REPLACE procedure miasto_transfF(
      miastoo VARCHAR2,
      hajs rachunki.cena_pradu%TYPE
 )
IS
i klienci%rowtype;
zmienna NUMBER;
CURSOR ln1 IS
SELECT U.id_umowy FROM  Klienci K, Umowa U where K.id_klienta = U.id_klienta and  K.miasto = miastoo;
BEGIN
zmienna := hajs / 100;

  FOR i IN ln1 LOOP
    UPDATE Rachunki set CENA_PRADU = CENA_PRADU + zmienna  where id_umowy = i.id_umowy ;
  END LOOP;

END;

/


create or replace procedure umowa_rok_dluzej(
  idd  klienci.id_klienta%type
  )
  is
  i umowa%rowtype;
  CURSOR dataa is
  select U.id_umowy from klienci K, umowa U where K.id_klienta = U.id_klienta and K.id_klienta = idd ;
  begin
  for i in dataa LOOP
    update Umowa set data_konca = (data_konca + INTERVAL '1' YEAR) where id_umowy = i.id_umowy;
    --DBMS_OUTPUT.put_line(i.id_klienta );
    end loop;
    end;
    /