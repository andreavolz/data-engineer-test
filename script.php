<?php
	
	include("conn.php"); //Conexão com o banco de dados
	include("Banco.php"); //Classe com as funções do banco de dados
	$banco = new Banco(); //Instanciando a classe para usar as funções relacianadas ao banco usando o formato $retorno = $banco->nome_da_funcao($parametro);
	
		
	$nome_arquivo = 'data.tsv';
	$nome_arquivo_novo = 'data_final.tsv';
	
	//Abre o arquivo
	$arquivo = fopen($nome_arquivo, 'r+');
	$arquivo_limpo = fopen($nome_arquivo_novo, 'w+');
	
	//Verifica se o arquivo foi aberto corretamente
	if($arquivo==false){
		die("Erro ao abrir arquivo");
	}else{
		echo "";
	}
	
	//Enquanto o arquivo não terminar, conta o número de linhas
	$n_linhas = 0;
	while(!feof($arquivo)) {
		$linha = fgets($arquivo);
		$n_linhas = $n_linhas + 1;
	}
	
	//Copia o arquivo cada linha para uma posição do vetor
	$array_arquivo = file($nome_arquivo);
	
	//DESCOMENTAR PARA CARREGAR DADOS PARA O BANCO E CORRIGIR OS DADOS
	$i=1;
	fwrite($arquivo_limpo,$array_arquivo[0]);
	
	//Popular dados da tabela CLASSIFICATION
	$sql = $banco->popula_classification('other');
	$conn->query($sql);
	$sql = $banco->popula_classification('journal');
	$conn->query($sql);
	$sql = $banco->popula_classification('article');
	$conn->query($sql);
	$sql = $banco->popula_classification('book');
	$conn->query($sql);
	
	$n_linhas = 11; //Comentar para que use todo o arquivo
	for($i;$i<$n_linhas;$i++){
		@$array_linha = explode ("\t",$array_arquivo[$i]);
		
		//Usado para arrumar o campo NAME
		$name = explode (" ",$array_linha[0]); //Quebra a data
		if((strpos($name[0], 'Miss') !== false)||(strpos($name[0], 'Dr.') !== false)||(strpos($name[0], 'Mr.') !== false)||(strpos($name[0], 'Mrs.') !== false)||(strpos($name[0], 'Ms.') !== false)){ //precisa arrumar, pois contem pronome de tratamento
			@$array_linha[0] = $name[1].$name[2].$name[3].$name[4];
		}
			
		//Usado para arrumar o campo PUBLICATION_DATE
		$data = explode ("-",$array_linha[5]); //Quebra a data
		if($data[0]<32){ //precisa arrumar, pois não está no formato certo
			$nova_data[0] = $data[2];
			$nova_data[1] = $data[1];
			$nova_data[2] = $data[0];
			$array_linha[5] = implode("-",$nova_data);
		}
		
		//Usado para arrumar as incosistências no campo TYPE
		if (strpos($array_linha[6], 'Other') !== false) {
			$array_linha[6] = 'other';
			$array_arquivo[$i] = implode("\t",$array_linha);
			$array_arquivo[$i] = $array_arquivo[$i]."\r\n";
		}
		else if (strpos($array_linha[6], 'jornal') !== false) {
			$array_linha[6] = 'journal';
			$array_arquivo[$i] = implode("\t",$array_linha);
			$array_arquivo[$i] = $array_arquivo[$i]."\r\n";
		}
		else if (strpos($array_linha[6], 'artilce') !== false) {
			$array_linha[6] = 'article';
			$array_arquivo[$i] = implode("\t",$array_linha);
			$array_arquivo[$i] = $array_arquivo[$i]."\r\n";
		}
		else{
			$array_arquivo[$i] = implode("\t",$array_linha);
			if (strpos($array_linha[6], 'article') !== false) {
				$array_linha[6] = 'article';
			}
			if (strpos($array_linha[6], 'other') !== false) {
				$array_linha[6] = 'other';
			}
			if (strpos($array_linha[6], 'book') !== false) {
				$array_linha[6] = 'book';
			}
			if (strpos($array_linha[6], 'journal') !== false) {
				$array_linha[6] = 'journal';
			}
		}

		//Popular dados da tabela INSTITUTION
		$name_institution = $array_linha[3];
		$sql = $banco->popula_institution($name_institution);		
		$conn->query($sql);
		
		//Popula tabela RESEARCHER
		$start_end = explode("|",$array_linha[2]);
		$temp1 = $array_linha[0];
		$temp2 = $array_linha[1];
		$temp3 = $start_end[0];
		$temp4 = $start_end[1];
		if(strpos($start_end[1], 'nill') !== false){
			$sql = $banco->popula_research($temp1,$temp2, $temp3);
		}else{
			$sql = "INSERT INTO tb_researcher (res_name, res_job, res_dt_start, res_dt_end) VALUES ('$temp1','$temp2', '$temp3', '$temp4')";
			$sql = $banco->popula_research2($temp1,$temp2, $temp3, $temp4);
		}
		$conn->query($sql);
		
		//Popular dados da tabela PRODUTION
		$nome_production = $array_linha[4];
		$data_production = $array_linha[5];
		$sql = $banco->popula_production($nome_production, $data_production);
		$conn->query($sql);
		
		
		//Popular dados da tabela RESEARCHER_PRODUCTION_INSTITUTION
		$sql = $banco->select_researcher_id($temp1,$temp2,$temp3);
		$result = $conn->query($sql);
		$row = mysqli_fetch_array($result);
		$res_id = $row['res_id'];
		$sql = $banco->select_production_id($nome_production,$data_production);
		$result = $conn->query($sql);
		$row = mysqli_fetch_array($result);
		$prod_id = $row['prod_id'];
		$sql = $banco->select_institution_id($name_institution);
		$result = $conn->query($sql);
		$row = mysqli_fetch_array($result);
		$inst_id = $row['inst_id'];
		$sql = $banco->popula_researcher_production_institution($res_id,$prod_id,$inst_id);
		$conn->query($sql);
		
		//Popular dados da tabela PRODUCTION_CLASSIFICATION
		$temp6 = $array_linha[6];
		$sql = $banco->select_classification_id($temp6);
		$result = $conn->query($sql);
		$row = mysqli_fetch_array($result);
		$clas_id = $row['clas_id'];
		$sql = $banco->popula_production_classification($prod_id,$clas_id);
		$conn->query($sql);
		
		fwrite($arquivo_limpo,$array_arquivo[$i]);
	}
	
	
	//Mostra na página o número de publicações por instituição
	$sql = "SELECT * FROM tb_institution"; //Pega os ids das instituições
	$result = $conn->query($sql);
	echo "<table border='1'>";
	echo "<caption>"."Produções por Instituição"."</caption>";
	echo "<thead>"."<tr>"."<th>"."Nome da Instituição"."</th>"."<th>"."Número de Publicações"."</th>"."</tr>"."</thead>";
	while($row = mysqli_fetch_array($result)){ //Intera os ids das instituições
		$inst_id = $row['inst_id'];
		$sql2 = "SELECT COUNT(*) as numero FROM tb_researcher_production_institution WHERE inst_id = '$inst_id' "; //Pega os ids das instituições
		$result2 = $conn->query($sql2);
		$row2 = mysqli_fetch_assoc($result2);
		$num_publicacoes = $row2['numero'];
		echo "<tr>";
            echo "<td>" . $row['inst_name'] . "</td>";
            echo "<td>" . $num_publicacoes . "</td>";
        echo "</tr>";
	}
	echo "</table>";
	echo "<br>";
	echo "<br>";
	
	//Mostra na página o número de publicações por pesquisador
	$sql3 = "SELECT * FROM tb_researcher ORDER BY res_name"; //Pega os ids das instituições
	$result3 = $conn->query($sql3);
	echo "<table border='1'>";
	echo "<caption>"."Produções por Pesquisador *Considerando que os nomes podem se repetir"."</caption>";
	echo "<thead>"."<tr>"."<th>"."Nome do Pesquisador"."</th>"."<th>"."Número de Publicações"."</th>"."</tr>"."</thead>";
	while($row3 = mysqli_fetch_array($result3)){ //Intera os ids das instituições
		$res_id = $row3['res_id'];
		$sql4 = "SELECT COUNT(*) as numero FROM tb_researcher_production_institution WHERE res_id = '$res_id' "; //Pega os ids das instituições
		$result4 = $conn->query($sql4);
		$row4 = mysqli_fetch_assoc($result4);
		$num_publicacoes = $row4['numero'];
		//echo "<option value='$num_publicacoes'>".$row3['res_name']."</option>";
		echo "<tr>";
            echo "<td>" . $row3['res_name'] . "</td>";
            echo "<td>" . $num_publicacoes . "</td>";
        echo "</tr>";
	}
	echo "</table>";
	echo "<br>";
	
	//Mostra na página o número de publicações por tipo
	$sql3 = "SELECT * FROM tb_classification ORDER BY clas_subtype"; //Pega os ids das instituições
	$result3 = $conn->query($sql3);
	echo "<table border='1'>";
	echo "<caption>"."Número de Produções por Subtipo"."</caption>";
	echo "<thead>"."<tr>"."<th>"."Tipo de produção"."</th>"."<th>"."Subtipo de produção"."</th>"."<th>"."Número de Publicações"."</th>"."</tr>"."</thead>";
	while($row3 = mysqli_fetch_array($result3)){ //Intera os ids das instituições
		$clas_id = $row3['clas_id'];
		$sql4 = "SELECT COUNT(*) as numero FROM tb_production_classification WHERE clas_id = '$clas_id' "; //Pega os ids das instituições
		$result4 = $conn->query($sql4);
		$row4 = mysqli_fetch_assoc($result4);
		$num_publicacoes = $row4['numero'];
		echo "<tr>";
            echo "<td>" . $row3['clas_type'] . "</td>";
			echo "<td>" . $row3['clas_subtype'] . "</td>";
            echo "<td>" . $num_publicacoes . "</td>";
        echo "</tr>";
	}
	echo "</table>";
	
	
	fclose($arquivo);
	fclose($arquivo_limpo);
	
?>
