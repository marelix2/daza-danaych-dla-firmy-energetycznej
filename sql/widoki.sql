
drop view v_regiony;


create VIEW v_regiony
as
select  R.NAZWA_REGIONU,T.* from region R , TRANSFORMATOR T where T.ID_REGIONU = R.ID_REGIONU;

--select * from v_regiony;
------------------widok_u-----------------
drop view v_umowa;

create view v_umowa
as
SELECT  K.*, U.DATA_ZAWARCIA,U.RODZAJ_UMOWY , F.REGON, F.NIP,R.ZUZYCIE_W_KWH,R.CENA_PRADU
from Umowa U, Klienci K, Firma F, RACHUNKI R
where U.ID_KLIENTA=K.ID_KLIENTA AND U.ID_FIRMY= F.ID_FIRMY and R.ID_UMOWY = U.ID_UMOWY;

--select * from v_umowa;

------------------widok_pr_reg-----------------

drop view v_prac_reg;

create view v_prac_reg
as
select P.*, R.NAZWA_REGIONU from region R, oddzial O, PRACOWNICY P where R.ID_regionu = O.ID_REGIONU and P.ID_ODDZIALU = O.ID_ODDZIALU;


--select * from v_prac_reg;

------------------widok_ele_linie-----------------

drop view v_ele_linie;

create view v_ele_linie
as
select E.*, LL.RODZAJ_INII_PRZESYLOWEJ from ELEKTROWNIA E, LINIE_PRZESYLOWE LL where LL.ID_ELEKTROWNI=E.ID_ELEKTROWNI;



--select * from v_ele_linie;

------------------widok_transf_regio-----------------

drop view v_transf_regio;

create view v_transf_regio
as
select R.NAZWA_REGIONU, T.OBSZAR,T.RODZAJ_TRANSFORMATORA from transformator T, REGION R where T.Id_regionu = R.id_regionu;


--select * from v_transf_regio;

------------------widok_hajsy-----------------

drop view v_rachunki;

create view v_rachunki
as
select K.imie_klienta, k.nazwisko_klienta ,CAST( Cena_pradu * zuzycie_w_kwh as varchar2(10)) || ' za miesiac' Cena_za_prad
from rachunki R, umowa U, Klienci K
where U.id_umowy = R.id_umowy and U.id_klienta = K.id_klienta;

--select * from v_rachunki;
------------------widok_starzy_klienci-----------------
drop view najdawniejsi_k;

create view najdawniejsi_k
as
Select  UU.data,K.Imie_klienta,K.Nazwisko_klienta,K.Miasto from (select ID_UMOWY,Round(MONTHS_BETWEEN(SYSDATE , DATA_ZAWARCIA)) data from umowa order by data) UU, umowa U, Klienci K where ROWNUM <= 10 and K.ID_KLIENTA = U.ID_KLIENTA and  U.ID_UMOWY = UU.ID_UMOWY order by data;





                 --