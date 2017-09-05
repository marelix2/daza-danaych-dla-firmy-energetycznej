CREATE  or replace  TRIGGER usun_kl_um
AFTER DELETE ON klienci
FOR EACH ROW
BEGIN
    DELETE FROM umowa WHERE id_klienta = :OLD.id_klienta;

END;
/

CREATE  or replace  TRIGGER usun_kl_RACH
AFTER DELETE ON UMOWA
FOR EACH ROW
BEGIN
    DELETE FROM rachunki WHERE id_umowy = :OLD.id_umowy;

END;
/

CREATE  or replace  TRIGGER usun_pracownikow_od
AFTER DELETE ON firma for EACH ROW
BEGIN
    DELETE FROM oddzial where id_firmy = :OLD.id_firmy;
END;
/

CREATE  or replace  TRIGGER usun_pracownikow
AFTER DELETE ON oddzial
FOR EACH ROW
BEGIN
    DELETE FROM pracownicy where id_oddzialu = :OLD.id_oddzialu;

END;
/
CREATE  or replace  TRIGGER usun_pracownikow_umo
AFTER DELETE ON firma FOR EACH ROW
BEGIN
DELETE FROM umowa where id_firmy = :OLD.id_firmy;
END;
/