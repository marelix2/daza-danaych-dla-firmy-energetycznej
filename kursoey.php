<?php include "head.php"; ?>
<section class="cta">
	<header>
		<article>
			<h1>Kursory</h1>
		</article>
	</header>
	
</section>

<p>

<form action="kursoey.php" method="post">
<input type="hidden" name="elektrownia"/>
<input type="submit" class="button caval mgg" name="poszlo" value="Wybierz" />
<select class="button caval sgg" name="wybor">
    <option value="1"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='1'){echo" selected='selected'";}} ?>>Zmiana ceny prądu dla klienta (+/- złotówki)</option>
    <option value="2"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='2'){echo" selected='selected'";}} ?>>Podwyżka pensji pracownikowi z oddziału (%)</option>
    <option value="3"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='3'){echo" selected='selected'";}} ?>>Zmiana ceny prądu dla miasta (+/- złotówki)</option>
    <option value="4"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='4'){echo" selected='selected'";}} ?>>Przedłużenie umowy (lata)</option>
</select>

<input type="text" placeholder="ID/Nazwa" id="id" name="id" class="edyt mgg caval"/>
<input type="text" placeholder="Wartość" id="wartosc" name="wartosc" class="edyt mgg caval"/>
</form>
</p>

<?php include "db_connect.php" ?>
		<?php 
		if( (isset($_POST['poszlo']))&&(isset($_POST['id']))&&(isset($_POST['wartosc'])))
		{
			echo "<header>
			<article>";

			$id=$_POST['id'];
			$wartosc=$_POST['wartosc'];
			
			if(is_numeric($wartosc))
			{
			
				switch ($_POST['wybor']) 
				{
					case '1':
						if(is_numeric($id))
						{
							echo"<h1>Zmieniono cenę dla klienta o ID: ".$id." o ".$wartosc.". zł</h1>";
							$wartosc=$wartosc*100;
							$stid = oci_parse($connection, 'begin zniz('.$id.','.$wartosc.'); end;');
							oci_execute($stid);
							echo "<table>
							<tr class='tb_white_up'>
								<td class='tb_white_up'><h2 class='bebassmall'>ID. Klienta</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Imię</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Nazwisko</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Adres</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Miasto</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>PESEL</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Data zawarcia</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Rodzaj umowy</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>REGON</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>NIP</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Zużycie</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Cena</h2></td>
							</tr>";
			
							$array = oci_parse($connection, "SELECT * FROM v_umowa WHERE ID_klienta=".$id);

							oci_execute($array);
							
							while ($row = oci_fetch_array($array,OCI_ASSOC+OCI_RETURN_NULLS)) 
							{
								echo "<tr class='tb_orange'>\n";
								foreach ($row as $item) 
								{
									echo  "<td class='tb_orange'><h4>".($item )."</h4></td>\n";
									
								}
								echo "</tr>\n";

							}
							echo "</table>";		
							oci_close($connection);
							
							
							
						}
						else
						{
							echo"<h1>ID nie jest liczbą!</h1>";
						}
						echo"</article>
						</header>
						<section>";
						break;
					case '2':
						
						if(is_numeric($id))
						{
							echo"<h1>Podwyżka dla oddziału o ID: ".$id." o ".$wartosc."%</h1>";
							//$wartosc=$wartosc*100;
							$stid = oci_parse($connection, 'begin pen_s('.$id.','.$wartosc.'); end;');
							oci_execute($stid);
							
							echo "<table>
							<tr class='tb_white_up'>
								<td class='tb_white_up'><h2 class='bebassmall'>ID. Pracownika</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Imię</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Nazwisko</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Pensja</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>ID. Oddziału</h2></td>
		
							</tr>";
			
							$array = oci_parse($connection, "SELECT * FROM pracownicy WHERE ID_oddzialu=".$id);

							oci_execute($array);
							
							while ($row = oci_fetch_array($array,OCI_ASSOC+OCI_RETURN_NULLS)) 
							{
								echo "<tr class='tb_orange'>\n";
								foreach ($row as $item) 
								{
									echo  "<td class='tb_orange'><h4>".($item )."</h4></td>\n";
									
								}
								echo "</tr>\n";

							}
							echo "</table>";		
							
							oci_close($connection);
						}
						else
						{
							echo"<h1>ID nie jest liczbą!</h1>";
						}
						echo"</article>
						</header>
						<section>";
						break;
					case '3':
						//echo"<h1>Zmiana cen prądu dla: ".$id." o ".$wartosc."</h1>";
						//if(is_numeric($wartosc))
						//{
							echo"<h1>Zmieniono cenę prądu dla: ".$id." o ".$wartosc."</h1>";
							$wartosc=$wartosc*100;
							$stid = oci_parse($connection, "begin miasto_transfF('".$id."',".$wartosc."); end;");
							oci_execute($stid);
							
							echo "<table>
							<tr class='tb_white_up'>
								<td class='tb_white_up'><h2 class='bebassmall'>ID. Klienta</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Imię</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Nazwisko</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Adres</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Miasto</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>PESEL</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Data zawarcia</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Rodzaj umowy</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>REGON</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>NIP</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Zużycie</h2></td>
								<td class='tb_white_up'><h2 class='bebassmall'>Cena</h2></td>
		
							</tr>";
			
							$array = oci_parse($connection, "SELECT * FROM v_umowa WHERE Miasto='".$id."'");

							oci_execute($array);
							
							while ($row = oci_fetch_array($array,OCI_ASSOC+OCI_RETURN_NULLS)) 
							{
								echo "<tr class='tb_orange'>\n";
								foreach ($row as $item) 
								{
									echo  "<td class='tb_orange'><h4>".($item )."</h4></td>\n";
									
								}
								echo "</tr>\n";

							}
							echo "</table>";		
							
							oci_close($connection);
						
						//}
						//else
						//{
						//	echo"<h1>Miasto nie występuje w bazie!</h1>";
						//}
						echo"</article>
						</header>
						<section>";
						break;
					case '4':
						if(is_numeric($id))
						{
							echo"<h1>Przedłużenie umowy dla klienta o ID: ".$id." o ".$wartosc." lat </h1>";
							for ($i = 0; $i < $wartosc; $i++)
							{
								$stid = oci_parse($connection, 'begin umowa_rok_dluzej('.$id.'); end;');
								oci_execute($stid);
							}
							
							echo "<table>
							<tr class='tb_white_up'>
								<td class='tb_white_up'><h2 class='bebas'>ID. Umowy</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>Rodzaj</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>ID. Klienta</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>ID. Firmy</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>ID. Linii</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>Data zawarcia</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>Data końca</h2></td>
		
							</tr>";
			
							$array = oci_parse($connection, "SELECT * FROM umowa WHERE ID_klienta=".$id);

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
							echo "</table>";		
							
							oci_close($connection);
						}
						else
						{
							echo"<h1>ID nie jest liczbą!</h1>";
						}
						echo"</article>
						</header>
						<section>";
						break;
				}
				
			}
			else
			{
				echo"<h1>Wartość nie jest liczbą!</h1>";
				echo"</article>
				</header>
				<section>";
			}
;
		}
		
			//$array = oci_parse($connection, "SELECT * FROM najdawniejsi_k ");


			
			//oci_close($connection);
			?>
			</section>
			<p>
			</p>
<div class="clr"></div>
<?php include "foot.php"; ?>