<?php include "head.php"; ?>
<section class="cta">
	<header>
		<article>
			<h1>Widoki</h1>
		</article>
	</header>
<p>

<form action="widoki.php" method="post">
<input type="hidden" name="elektrownia"/>
<input type="submit" class="button caval mgg" name="poszlo" value="Wybierz" />
<select class="button caval sgg" name="wybor">
    <option value="1"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='1'){echo" selected='selected'";}} ?>>Transformatory dla regionu</option>
    <option value="2"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='2'){echo" selected='selected'";}} ?>>Umowa klienta</option>
    <option value="3"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='3'){echo" selected='selected'";}} ?>>Pracownicy z regionu</option>
    <option value="4"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='4'){echo" selected='selected'";}} ?>>Linie przesyłowe elektrowni</option>
    <option value="5"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='5'){echo" selected='selected'";}} ?>>Transformatory w danym regionie</option>
    <option value="6"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='6'){echo" selected='selected'";}} ?>>Rachunki klienta</option>
    <option value="7"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='7'){echo" selected='selected'";}} ?>>Najnowsi klienci</option>
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
	$W8=NULL;
	$W9=NULL;
	$W10=NULL;
	$W11=NULL;
	$W12=NULL;
	$Tabela=NULL;
	$id_s=NULL;
	$small=false;
	//if($_POST['test']=='aaa')
	//{
	//	echo "huj";
	//}
	include "db_connect.php";
	echo "<header>
			<article>";
			
	switch ($_POST['wybor']) {
    case '1':
        echo"<h1>Transformatory dla regionu</h1>";
		$W1='Region';
		$W2='ID. Transformatora';
		$W3='Rodzaj transformatora';
		$W4='Obszar';
		$W5='Moc';
		$W6='ID. Regionu';
		$W7=NULL;
		$W8=NULL;
		$W9=NULL;
		$W10=NULL;
		$W11=NULL;
		$W12=NULL;
		$Tabela='v_regiony';
		$id_s='nazwa_regionu';
		$small=true;
        break;
    case '2':
        echo"<h1>Umowy klientów</h1>";
		$W1='ID. Klienta';
		$W2='Imię';
		$W3='Nazwisko';
		$W4='Adres';
		$W5='Miasto';
		$W6='PESEL';
		$W7='Data zawarcia';
		$W8='Rodzaj umowy';
		$W9='REGON';
		$W10='NIP';
		$W11='Zużycie';
		$W12='Cena';
		$Tabela='v_umowa';
		$id_s='ID_klienta';
		$small=true;
        break;
    case '3':
        echo"<h1>Pracownicy z regionu</h1>";
		$W1='ID. Pracownika';
		$W2='Imie';
		$W3='Nazwisko';
		$W4='Pensja';
		$W5='Id. Oddziały';
		$W6='Nazwa regionu';
		$W7=NULL;
		$W8=NULL;
		$W9=NULL;
		$W10=NULL;
		$W11=NULL;
		$W12=NULL;
		$Tabela='v_prac_reg';
		$id_s='ID_Pracownika';
		$small=false;
        break;
    case '4':
        echo"<h1>Linie przesyłowe elektrowni</h1>";
		$W1='ID. Elektrowni';
		$W2='Rodzaj';
		$W3='Nazwa';
		$W4='Moc';
		$W5='Rodzaj linii';
		$W6=NULL;
		$W7=NULL;
		$W8=NULL;
		$W9=NULL;
		$W10=NULL;
		$W11=NULL;
		$W12=NULL;
		$Tabela='v_ele_linie';
		$id_s='ID_elektrowni';
		$small=false;
        break;
    case '5':
        echo"<h1>Transformatory w danym regionie</h1>";
		$W1='Region';
		$W2='Obszar';
		$W3='Rodzaj transformatora';
		$W4=NULL;
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$W8=NULL;
		$W9=NULL;
		$W10=NULL;
		$W11=NULL;
		$W12=NULL;
		$Tabela='v_transf_regio';
		$id_s='nazwa_regionu';
		$small=false;
        break;
    case '6':
        echo"<h1>Rachunki klienta</h1>";
		$W1='Imię';
		$W2='Nazwisko';
		$W3='Cena za prąd';
		$W4=NULL;
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$W8=NULL;
		$W9=NULL;
		$W10=NULL;
		$W11=NULL;
		$W12=NULL;
		$small=false;
		$Tabela='v_rachunki';
		$id_s='imie_klienta';
        break;
    case '7':
        echo"<h1>Najnowsi klienci</h1>";
		$W1='Upłynęło miesięcy';
		$W2='Imię';
		$W3='Nazwisko';
		$W4='Miasto';
		$W5=NULL;
		$W6=NULL;
		$W7=NULL;
		$W8=NULL;
		$W9=NULL;
		$W10=NULL;
		$W11=NULL;
		$W12=NULL;
		$Tabela='najdawniejsi_k';
		$id_s='data';
		$small=false;
        break;
}
				
				
			echo"</article>
		</header>
	
			<table>
			<tr class='tb_white_up'>";
				if($W1!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W1."</h2></td>";}
				if($W2!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W2."</h2></td>";}
				if($W3!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W3."</h2></td>";}
				if($W4!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W4."</h2></td>";}
				if($W5!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W5."</h2></td>";}
				if($W6!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W6."</h2></td>";}
				if($W7!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W7."</h2></td>";}
				if($W8!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W8."</h2></td>";}
				if($W9!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W9."</h2></td>";}
				if($W10!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W10."</h2></td>";}
				if($W11!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W11."</h2></td>";}
				if($W12!=NULL){echo"<td class='tb_white_up'><h2 class='";if($small==true){echo "bebassmall";}else{echo"bebas";}echo"'>".$W12."</h2></td>";}
			echo"</tr>";
			
	$array = oci_parse($connection, "SELECT * FROM ".$Tabela." ORDER BY ".$id_s);
	
	oci_execute($array);
			
	while ($row = oci_fetch_array($array,OCI_ASSOC+OCI_RETURN_NULLS)) 
	{
		echo "<tr class='tb_orange'>\n";
		
		foreach ($row as $item) 
		{
			echo  "<td class='tb_orange'>";if($small==true){echo "<h4>";}else{echo"<h3>";}echo $item ;if($small==true){echo "</h4>";}else{echo"</h3>";}echo"</td>\n";
			
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