<?php include "head.php"; ?>

<section class="cta">
		
			<header>
				<article>
					<h1>Delete</h1>
				</article>
			</header>

			<p>

			<form action="delety.php" method="post">
			<input type="submit" class="button caval mgg" name="poszlo" value="Wybierz" />
			<select class="button caval sgg" name="wybor">
				<option value="1"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='1'){echo" selected='selected'";}} ?>>Usuń klienta</option>
				<option value="2"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='2'){echo" selected='selected'";}} ?>>Usuń pracownika</option>
				<option value="3"<?php if( isset ($_POST['poszlo'])){if($_POST['wybor']=='3'){echo" selected='selected'";}} ?>>Usuń firmę</option>
			</select>
			<input type="text" placeholder="ID" id="id" name="id" class="edyt mgg caval"/>
			</form>
			</p>
			<?php include "db_connect.php" ?>
			<?php 
			
			if( (isset($_POST['poszlo'])))
			{
				if(is_numeric($_POST['id']))
				{
					switch ($_POST['wybor']) 
					{
						case '1':
						$array = oci_parse($connection, "begin us_kl(".$_POST['id']."); end;");
						oci_execute($array);
							
						break;
						
						case '2':
						$array = oci_parse($connection, "begin us_pr(".$_POST['id']."); end;");
						oci_execute($array);
						break;
						
						case '3':
						$array = oci_parse($connection, "begin us_fi(".$_POST['id']."); end;");
						oci_execute($array);
						break;
						
					}
				}
				else
				{
					echo"<p><h1>Złe dane</h1></p>";
				}
			}
			
			
			
			
			oci_close($connection);
			?>
			<div class="clr"></div>

<?php include "foot.php"; ?>