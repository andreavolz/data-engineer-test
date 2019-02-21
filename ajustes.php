<?php
	$nome_arquivo = 'data.tsv';
	$nome_arquivo_novo = 'data_final.tsv';
	$modo = 'r+';
	$modo2 = 'w+';
	$n_linhas = 0;
	
	//Abre o arquivo
	$arquivo = fopen($nome_arquivo, $modo);
	$arquivo_limpo = fopen($nome_arquivo_novo, $modo2);
	
	//Verifica se o arquivo foi aberto corretamente
	if($arquivo==false){
		die("Erro ao abrir arquivo");
	}else{
		echo "";
	}
	
	//Enquanto o arquivo não terminar, conta o número de linhas
	while(!feof($arquivo)) {
		$linha = fgets($arquivo);
		$n_linhas = $n_linhas + 1;
	}
	
	//Esceve o número de linhas do arquivo original
	echo "O arquivo tem ".$n_linhas." linhas";
	echo "<br>";
	
	//Copia o arquivo cada linha para uma posição do vetor
	$array_arquivo = file($nome_arquivo);

	$i=1;
	fwrite($arquivo_limpo,$array_arquivo[0]);
	for($i;$i<$n_linhas;$i++){
		@$array_linha = explode ("\t",$array_arquivo[$i]);
		
		//Usado para arrumar o campo NAME
		echo $array_linha[0]."<br>";
		$name = explode (" ",$array_linha[0]); //Quebra a data
		if((strpos($name[0], 'Miss') !== false)||(strpos($name[0], 'Dr.') !== false)||(strpos($name[0], 'Mr.') !== false)||(strpos($name[0], 'Mrs.') !== false)||(strpos($name[0], 'Ms.') !== false)){ //precisa arrumar, pois contem pronome de tratamento
			echo "OPS: ".$name[0];
			$array_linha[0] = $name[1].$name[2].$name[3].$name[4];
			echo $array_linha[0]."<br>";
		}
		
		//Usado para arrumar o campo PUBLICATION_DATE
		$data = explode ("-",$array_linha[5]); //Quebra a data
		if($data[0]<32){ //precisa arrumar, pois não está no formato certo
			$nova_data[0] = $data[2];
			$nova_data[1] = $data[1];
			$nova_data[2] = $data[0];
			$array_linha[5] = implode("-",$nova_data);
			echo $array_linha[5]."<br>";
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
		}

		fwrite($arquivo_limpo,$array_arquivo[$i]);
		
	}
	
	fclose($arquivo);
	fclose($arquivo2);
?>