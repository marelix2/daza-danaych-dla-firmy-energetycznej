<?php include "head.php"; ?>


	<section class="cta">
		
			<header>
				<article>
					<h1>Inserty</h1>
				</article>
			</header>

			<p>

			<form action="dodaj.php" method="post">
			<input type="submit" class="button caval mgg" name="poszlo" value="Wybierz" />
			<select class="button caval sgg" name="wybor">
				<option value="1"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='1'){echo" selected='selected'";}} ?>>Dodaj klienta</option>
				<option value="2"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='2'){echo" selected='selected'";}} ?>>Dodaj pracownika</option>
			</select>

			</form>
			</p>
			
			<?php include "db_connect.php" ?>
			<?php 
			if( isset($_POST['poszlo']))
			{
				switch ($_POST['wybor']) 
				{
					case '1':
					echo "			
					<p>
						<form action='dodaj.php' method='post'>
						<input type='text' placeholder='Imię' id='imie' name='imie' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Nazwisko' id='nazwisko' name='nazwisko' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Adres' id='adres' name='adres' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Miasto' id='miasto' name='miasto' class='edyt mgg caval'/>
						</br><input type='text' placeholder='PESEL' id='pesel' name='pesel' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Rodzaj umowy' id='rodzaj' name='rodzaj' class='edyt mgg caval'/>
						</br><input type='text' placeholder='ID. Firmy' id='idfirmy' name='idfirmy' class='edyt mgg caval'/> 
						</br><input type='text' placeholder='ID. Linii' id='idlinii' name='idlinii' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Cena prądu' id='cena' name='cena' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Zużycie' id='zuzycie' name='zuzycie' class='edyt mgg caval'/>
						</br><input type='submit' class='button caval mgg' name='kliencik' value='Dodaj' />
						</form>
					</p>
						";
						
					break;
					
					case '2':
										echo "			
					<p>
						<form action='dodaj.php' method='post'>
						<input type='text' placeholder='Imię' id='imie' name='imie' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Nazwisko' id='nazwisko' name='nazwisko' class='edyt mgg caval'/>
						</br><input type='text' placeholder='Pensja' id='pensja' name='pensja' class='edyt mgg caval'/>
						</br><input type='text' placeholder='ID. Oddzału' id='ido' name='ido' class='edyt mgg caval'/>
						
						</br><input type='submit' class='button caval mgg' name='pracus' value='Dodaj' />
						</form>
					</p>
						";
					break;
					
				}
			}
			
			if( isset($_POST['kliencik']))
			{
				$imie=$_POST['imie'];
				$nazwisko=$_POST['nazwisko'];
				$adres=$_POST['adres'];
				$miasto=$_POST['miasto'];
				$pesel=$_POST['pesel'];
				$rodzaj=$_POST['rodzaj'];
				$idfirmy=$_POST['idfirmy'];
				$idlinii=$_POST['idlinii'];
				$cena=$_POST['cena'];
				$zuzycie=$_POST['zuzycie'];
			$array = oci_parse($connection, "begin dod_kl('".$imie."','".$nazwisko."','".$adres."','".$miasto."','".$pesel."','".$rodzaj."',".$idfirmy.",".$idlinii.",".$cena.",".$zuzycie."); end;");
				oci_execute($array);
			
			
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
			
							$array = oci_parse($connection, "SELECT * FROM v_umowa WHERE PESEL='".$pesel."'");

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
			}
			else if( isset($_POST['pracus']))
			{
				$imie=$_POST['imie'];
				$nazwisko=$_POST['nazwisko'];
				$pensja=$_POST['pensja'];
				$ido=$_POST['ido'];
			$array = oci_parse($connection, "begin dod_pracow('".$imie."','".$nazwisko."',".$pensja.",".$ido."); end;");
				oci_execute($array);
			
			
			echo "<table>
							<tr class='tb_white_up'>
								<td class='tb_white_up'><h2 class='bebas'>ID. Pracownika</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>Imię</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>Nazwisko</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>Pensja</h2></td>
								<td class='tb_white_up'><h2 class='bebas'>ID. Oddziału</h2></td>
		
							</tr>";
			
							$array = oci_parse($connection, "SELECT * FROM Pracownicy WHERE Id_pracownika IN (SELECT MAX(Id_pracownika) FROM Pracownicy)");

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
			}
			oci_close($connection);
			?>
			<div class="clr"></div>
	</section>
<?php include "foot.php"; ?>	
