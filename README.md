# Teste para Engenheiro de Dados - Indeorum

## Banco de Dados
Criei uma tabela para pesquisador, instituição, produção e classificação, pois cada uma delas possuem atributos únicos, onde cada entidade se diferencia.
A tabela classification foi colocada separadamente da tabela production poirque embora no teste todas produções sejam produções bibliogrficas, também existe outras três classificações: artísticas, técnicas e orientações, e cada uma dessas classificações possuem tipos, por exemplo, as produções bibliográficas podem ser: artigos, livros, outros ou trabalhos em anais/congresso.
E também as tabelas estão organizadas dessa maneira para satisfazer as regras de normalização e permitir visualizar mais facilmente a produção de um pesquisador e a produção de uma instituição, e também gerar outras informações.
Decidi fazer uma tabela só para instituição, pois apesar de ter somente o atributo com o nome da  instituição,  é mais eficiente e leve guardar apenas o id do que ficar colocando o nome repetidas vezes na tabela do pesquisador ou da produção.
E foram criadas as tabelas reserarch_prodution_institution para que seja feito o relacionamento das produções com os pesquisadores e com as instituições.
Os atributos do nome da instituição e do tipo de produção bibliográfica foram colocados como unique para que não fiquem duplicados.
O banco de dados usado foi MySQL.

## Limpeza do Arquivo de Entrada
O script.php arruma os nomes dos pesquisadores, pois alguns estão com pronomes de tratamento antes do nome (Dr., Miss, Mr., Mrs., Ms. Também arruma a data de publicação, pois em algumas linhas está formato dia-mês-ano, e não ano-mês-dia, então alterei para que fiquem padrão e também fiquem iguais as datas do campo start_end. E também arruma os dados do tipo de produção bibliográfica, pois o correto são: journal, other, book e article, porém tem algumas linhas estavam escritos errado como: artilce, jornal e Other.

## Arquivos

### conn.php
Serve para fazer a conexão com o banco de dados, nele possui o nome do banco de dados a ser conectado, usuário, senha e é nele que é feita a conexão.

### Banco.php
É uma classe que possuí a maioria das funções relacionadas ao banco de dados, nessa classe são feitos inserts, e selects.

### data_final.tsv
É o arquivo gerado pelo script.php após arrumar os dados do arquivo de entrada data_tsv.

### script.php
É onde são tratados e corrigidos os dados do arquivo de entrada e também é ele que carrega os dados do arquivo data_final.tsv no banco de dados. E também é nele que são feitos as tabelas com as informações de número de produções por pesquisador, número de produções por instituição e número de produções por tipo de produção bibliográfica.

### indeorum_alguns_dados.sql
Tem a base de dados (estrutura e dados) com apenas 10 linhas da tabela carregados no banco de dados, foi usado para teste visto que para carregar para o banco de dados mais de 150 mil linhas levaria muito tempo até que o script.php estivesse realmente pronto.

### indeorum_somente_estrutura.sql
Tem somente a estrutura do banco de dados.

## Observação
Caso queira testar o código de forma rápida, basta descomentar a linha 46 do arquivo script.php, que então o código tratará apenas as 10 primeiras linhas do arquivo.
