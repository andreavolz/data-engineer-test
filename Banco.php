<?php

class Banco {
    
	public function popula_classification($subtype){
		$type = "bibliograficas";
		$sql = "INSERT INTO tb_classification (clas_type, clas_subtype) VALUES ('$type','$subtype')";
		return $sql;
	}
	
	public function popula_institution($name){
		$sql = "INSERT INTO tb_institution (inst_name) VALUES ('$name')";
		return $sql;
	}
	
	public function popula_research($temp1, $temp2, $temp3){
		$sql = "INSERT INTO tb_researcher (res_name, res_job, res_dt_start) VALUES ('$temp1','$temp2', '$temp3')";
		return $sql;
	}
	
	public function popula_research2($temp1, $temp2, $temp3, $temp4){
		$sql = "INSERT INTO tb_researcher (res_name, res_job, res_dt_start, res_dt_end) VALUES ('$temp1','$temp2', '$temp3', '$temp4')";
		return $sql;
	}
	
	public function popula_production($nome_production, $data_production){
		$sql = "INSERT INTO tb_production (prod_name, prod_dt_publication) VALUES ('$nome_production', '$data_production')";
		return $sql;
	}
	
	public function select_researcher_id($temp1,$temp2,$temp3){
		$sql = "SELECT res_id FROM tb_researcher WHERE res_name='$temp1' AND res_job='$temp2' AND res_dt_start='$temp3' ";
		return $sql;
	}
	
	public function select_production_id($nome_production,$data_production){
		$sql = "SELECT prod_id FROM tb_production WHERE prod_name='$nome_production' AND prod_dt_publication ='$data_production' ";
		return $sql;
	}
	
	public function select_institution_id($name_institution){
		$sql = "SELECT inst_id FROM tb_institution WHERE inst_name='$name_institution' ";
		return $sql;
	}
	
	public function popula_researcher_production_institution($res_id,$prod_id,$inst_id){
		$sql = "INSERT INTO tb_researcher_production_institution (res_id, prod_id, inst_id) VALUES ('$res_id','$prod_id','$inst_id')";
		return $sql;
	}
	
	public function select_classification_id($temp6){
		$sql = "SELECT clas_id FROM tb_classification WHERE clas_subtype='$temp6' ";
		return $sql;
	}
	
	public function popula_production_classification($prod_id,$clas_id){
		$sql = "INSERT INTO tb_production_classification (prod_id, clas_id) VALUES ('$prod_id','$clas_id')";
		return $sql;
	}
	
}

?>
