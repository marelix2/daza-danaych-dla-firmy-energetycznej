<?php include "head.php"; ?>

<section class="cta">
	<header>
		<article>
			<h1>Selecty</h1>
		</article>
	</header>
<p>

<form action="inserty.php" method="post">
<input type="hidden" name="elektrownia"/>
<input type="submit" class="button caval mgg" name="poszlo" value="Wybierz" />
<select class="button caval sgg" name="wybor">
    <option value="1"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='1'){echo" selected='selected'";}} ?>>Elektrownie</option>
    <option value="2"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='2'){echo" selected='selected'";}} ?>>Linie przesyłowe</option>
    <option value="3"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='3'){echo" selected='selected'";}} ?>>Region</option>
    <option value="4"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='4'){echo" selected='selected'";}} ?>>Transformator</option>
    <option value="5"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='5'){echo" selected='selected'";}} ?>>Linie</option>
    <option value="6"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='6'){echo" selected='selected'";}} ?>>Firmy</option>
    <option value="7"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='7'){echo" selected='selected'";}} ?>>Oddziały</option>
    <option value="8"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='8'){echo" selected='selected'";}} ?>>Pracownicy</option>
    <option value="9"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='9'){echo" selected='selected'";}} ?>>Klienci</option>
    <option value="10"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='10'){echo" selected='selected'";}} ?>>Umowy</option>
    <option value="11"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='11'){echo" selected='selected'";}} ?>>Rachunki</option>
</select>

</form>
</p>
<?php 
if( isset($_POST['poszlo']))
{
	$W1=NULL;
	$W2=NULL;
	$W3=NULL;
	$W4=NULL;
	$W5=NULL;
	$W6=NULL;
	$W7=NULL;
	$Tabela=NULL;
	$id_s=NULL;
	//if($_POST['test']=='aaa')
	//{
	//	echo "huj";
	//}
	include "db_connect.php";
	echo "<header>
			<article>";
			
	switch ($_POST['wybor']) {
    case '1':
        echo"<h1>Spis elektrowni</h1>";
		$W1='ID. Elektrowni';
		$W2='Rodzaj elektrowni';
		$W3='Nazwa elektrowni';
		$W4='Moc';
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$Tabela='Elektrownia';
		$id_s='Id_elektrowni';
        break;
    case '2':
        echo"<h1>Spis linii przesyłowych</h1>";
		$W1='ID. Linii przesyłowej';
		$W2='Rodzaj linii przesyłowej';
		$W3='ID. Elektrowni';
		$W4=NULL;
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$Tabela='Linie_przesylowe';
		$id_s='Id_linii_przesylowej';
        break;
    case '3':
        echo"<h1>Spis regionów</h1>";
		$W1='ID. Regionu';
		$W2='Nazwa regionu';
		$W3='ID. Linii przesyłowej';
		$W4=NULL;
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$Tabela='Region';
		$id_s='Id_regionu';
        break;
    case '4':
        echo"<h1>Spis transformatorów</h1>";
		$W1='ID. Transfor.';
		$W2='Rodzaj transformatora';
		$W3='Obszar';
		$W4='Moc';
		$W5='ID. Regionu';
		$W6=NULL;
		$W7=NULL;
		$Tabela='Transformator';
		$id_s='Id_transformatora';
        break;
    case '5':
        echo"<h1>Spis linii</h1>";
		$W1='ID. Linii';
		$W2='ID. Regionu';
		$W3='ID. Transformatora wejściowego';
		$W4='ID. Transformatora wyjściowego';
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$Tabela='Linie';
		$id_s='Id_linii';
        break;
    case '6':
        echo"<h1>Spis firm</h1>";
		$W1='ID. Firmy';
		$W2='Nazwa firmy';
		$W3='Właściciel';
		$W4='Kapitał';
		$W5='REGON';
		$W6='NIP';
		$W7=NULL;
		$Tabela='Firma';
		$id_s='Id_firmy';
        break;
    case '7':
        echo"<h1>Spis oddziałów</h1>";
		$W1='ID. Oddziału';
		$W2='Nazwa oddziału';
		$W3='ID. Regionu';
		$W4='ID. Firmy';
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$Tabela='Oddzial';
		$id_s='Id_oddzialu';
        break;
    case '8':
        echo"<h1>Spis pracowników</h1>";
		$W1='ID. Pracownika';
		$W2='Imię';
		$W3='Nazwisko';
		$W4='Pensja';
		$W5='ID. Oddziału';
		$W6=NULL;
		$W7=NULL;
		$Tabela='Pracownicy';
		$id_s='Id_pracownika';
        break;
    case '9':
        echo"<h1>Spis klientów</h1>";
		$W1='ID. Klienta';
		$W2='Imię';
		$W3='Nazwisko';
		$W4='Adres';
		$W5='Miasto';
		$W6='PESEL';
		$W7=NULL;
		$Tabela='Klienci';
		$id_s='Id_klienta';
        break;
    case '10':
        echo"<h1>Spis umów</h1>";
		$W1='ID. Umowy';
		$W2='Rodzaj';
		$W3='ID. Klienta';
		$W4='ID. Firmy';
		$W5='ID. Linii';
		$W6='Data zawarcia';
		$W7='Data końca';
		$Tabela='Umowa';
		$id_s='Id_umowy';
        break;
    case '11':
        echo"<h1>Spis rachunków</h1>";
		$W1='ID. Rachunku';
		$W2='Cena prądu';
		$W3='Zużycie';
		$W4='ID. Umowy';
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$Tabela='Rachunki';
		$id_s='Id_rachunku';
        break;
}
				
				
			echo"</article>
		</header>
	
			<table>
			<tr class='tb_white_up'>";
				if($W1!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W1."</h2></td>";}
				if($W2!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W2."</h2></td>";}
				if($W3!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W3."</h2></td>";}
				if($W4!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W4."</h2></td>";}
				if($W5!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W5."</h2></td>";}
				if($W6!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W6."</h2></td>";}
				if($W6!=NULL){echo"<td class='tb_white_up'><h2 class='bebas'>".$W7."</h2></td>";}
			echo"</tr>";
			
	$array = oci_parse($connection, "SELECT * FROM ".$Tabela." ORDER BY ".$id_s);
	
	oci_execute($array);
			
	while ($row = oci_fetch_array($array,OCI_ASSOC+OCI_RETURN_NULLS)) 
	{
		echo "<tr class='tb_orange'>\n";
		
		foreach ($row as $item) 
		{
			echo  "<td class='tb_orange'><h3>".($item )."</h3></td>\n";
			
		}
		echo "</tr>\n";

	}
	echo "</table>
		</p>";		
	oci_close($connection);
	

}
?>

</section>
<?php include "foot.php"; ?>