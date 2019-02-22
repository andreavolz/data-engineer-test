# Teste para Engenheiro de Dados - Indeorum

## Banco de Dados
Criei uma tabela para pesquisador, instituição, produção e classificação, pois cada uma delas possuem atributos únicos, onde cada entidade se diferencia.
A tabela classification foi colocada separadamente da tabela production poirque embora no teste todas produções sejam produções bibliogrficas, também existe outras três classificações: artísticas, técnicas e orientações, e cada uma dessas classificações possuem tipos, por exemplo, as produções bibliográficas podem ser: artigos, livros, outros ou trabalhos em anais/congresso.
E também as tabelas estão organizadas dessa maneira para satisfazer as regras de normalização e permitir visualizar mais facilmente a produção de um pesquisador e a produção de uma instituição, e também gerar outras informações.
Decidi fazer uma tabela só para instituição, pois apesar de ter somente o atributo com o nome da  instituição,  é mais eficiente e leve guardar apenas o id do que ficar colocando o nome repetidas vezes na tabela do pesquisador ou da produção.
E foram criadas as tabelas reserarch_prodution_institution para que seja feito o relacionamento das produções com os pesquisadores e com as instituições.
Os atributos do nome da instituição e do tipo de produção bibliográfica foram colocados como unique para que não fiquem duplicados.

## Limpeza do Arquivo de Entrada
O script.php arruma os nomes dos pesquisadores, pois alguns estão com pronomes de tratamento antes do nome (Dr., Miss, Mr., Mrs., Ms. Também arruma a data de publicação, pois em algumas linhas está formato dia-mês-ano, e não ano-mês-dia, então alterei para que fiquem padrão e também fiquem iguais as datas do campo start_end. E também arruma os dados do tipo de produção bibliográfica, pois o correto são: journal, other, book e article, porém tem algumas linhas estavam escritos errado como: artilce, jornal e Other.

## Arquivos

