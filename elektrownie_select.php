<?php
include "db_connect.php";


			echo "<header>
				<article><h1>Spis elektrowni</h1></article>
			</header>";
			echo "<p>
			<table>
			<tr class='tb_white_up'>
				<td class='tb_white_up'><h2 class='bebas'>ID. Elektrowni</h2></td>
				<td class='tb_white_up'><h2 class='bebas'>Rodzaj elektrowni</h2></td>
				<td class='tb_white_up'><h2 class='bebas'>Nazwa elektrowni</h2></td>
				<td class='tb_white_up'><h2 class='bebas'>Moc</h2></td>
			</tr>";
			$array = oci_parse($connection, "SELECT * FROM elektrownia ORDER BY id_elektrowni");

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

?>