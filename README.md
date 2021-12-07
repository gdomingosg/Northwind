# <p align=center>Tratamento de dados Northwind

 O conteudo aqui descrito faz parte do curso de Analytics Engineering da empresa Indicium Tech.
 
Neste repositório estão os arquivos utilizados para realizar o tratamento dos dados da <a href="https://github.com/pthom/northwind_psql">Northwind</a>
por meio da ferramenta de tratamento de dados dbt.

![image](https://user-images.githubusercontent.com/81938273/142502984-acd90ea2-41b2-4279-98b8-a84c2794e6fb.png)

Inicialmente foram realizadas algumas consultas no banco por meio de códigos SQL a fim de criar familiaridade com os dados e com a linguagem, como é o
caso do arquivo <a href="https://github.com/gdomingosg/Northwind/blob/master/pesquisa.sql">pesquisa.sql</a>, com o qual foi possível obter a quantidade 
total de pedidos do ano de 1997 e o somatório do valor dessas vendas.
 
- Na extração e carregamento dos dados foi utilizada a ferramenta Stitch data, responsável por migrar as tabelas selecionadas do banco de dados da Northwind
para o Big Query.

- No tratamento foi utilizado o dbt open source para escrever códigos SQL a fazer limpeza dos dados adicionados no Big Query.
- No momento do tratamento, as informações de produtos, funcionários, fornecedores, clientes e transportadoras foram transformadas em tabelas de dimensões,
utilizadas para alimentar a tabela de fato pedidos.
- Nos arquivos de stg foram realizadas as principas tansformação dos dados, entre elas: renomear as colunas e alterar tipos de dados.
- Nos arquivos dim e fact são utilizados para criar as versões finais das tabelas a partir da transformações realizadas nos arquivos stg.

- Por fim, foi criado o Dashboard_northwind.pbix com os dados tratados disponíveis no DW.
O dashboard pode ser vizualizado em <a href="https://github.com/gdomingosg/Northwind/blob/master/Dashboards_Northwind.pdf">Dashboards_Northwind.pdf</a>

## Conhecimentos obtidos por meio deste projeto:
- Sintaxes básicas da linguagem SQL para agregar e consultar as informações da base de dados;
- Métodos de armazenamento de dados na nuvem, mais especificamente, o Big Query;
- Apresentação as ferramentas Stitch data e dbt utilizadas no processo de ELT;
- Desenvolvimento de dashboards e elaboração de indicadores;
- A ferramenta dbt open source permite a criação de um DW com tabelas que possuem informações consolidadas que podem ser distribuidas para todos os setores
de uma empresa, servindo como uma unica fonte de verdade para a criação de dashboards;
- O processo de ELT, que permite o tratamento de dados dentro do DW, diminui drasticamente o tempo utilizado pelo analista de BI na transformação dos dados
 para criação dos dashboards.
