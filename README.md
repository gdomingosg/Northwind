# <p align=center>Tratamento de dados Northwind
 
Neste repositório estão os arquivos utilizados para realizar o tratamento dos dados da <a href="https://github.com/pthom/northwind_psql">Northwind</a>
por meio da ferramenta de tratamento de dados dbt.

![image](https://user-images.githubusercontent.com/81938273/142502984-acd90ea2-41b2-4279-98b8-a84c2794e6fb.png)

### Consultas no banco de dados
 
Inicialmente foram realizadas algumas consultas no banco por meio de códigos SQL a fim de criar familiaridade com os dados e com a linguagem, como pode ser visto neste 
<a href="https://github.com/gdomingosg/Northwind/blob/master/pesquisa.sql">arquivo</a>, com o qual foi possível obter a quantidade total de pedidos do ano de 1997 e o somatório do valor desses pedidos.

### Etapa de ELT 

- Na extração e carregamento dos dados foi utilizada a ferramenta Stitch data, responsável por migrar as tabelas selecionadas do banco de dados da Northwind
para o Big Query.
- No tratamento foi utilizado o dbt open source para escrever códigos SQL a fazer limpeza dos dados adicionados no Big Query.
- No momento do tratamento, as informações de produtos, funcionários, fornecedores, clientes e transportadoras foram transformadas em tabelas de dimensões,
utilizadas para alimentar a tabela de fato pedidos.
- Os arquivos da pasta stging foram utilizados para realizar as principas tansformação dos dados, entre elas: renomear as colunas e alterar tipos de dados.
- Nos arquivos dim e fact são utilizados para criar as versões finais das tabelas a partir da transformações realizadas nos arquivos stg.

### Dashboard

Para este caso foram criados dois dashboards a partir dos dados.

#### CEO 

O primeiro, para suprir as necessidade do CEO, contém informações a respeito do faturamento durante os anos de funcionamento, o total faturado, o ticket médio, produtos mais vendidos pela empresa e total de compra por clientes e por países.

![image](https://user-images.githubusercontent.com/81938273/148555752-955b5226-9214-456b-adaa-4e59ce425a66.png)
 
A partir desse dashboard é possível obter as seguintes informações:

- 

- sdadsad

#### Gerente de Vendas

O segundo, para apresentar os dados ao gerente de vendas, contém informações sobre o vendas por país, quantidade de produtos pedidos, valor liquido vendido por categoria e por produto, total vendido por funcionário, total faturado e ticket médio.

![image](https://user-images.githubusercontent.com/81938273/148556137-aae50bd8-7a71-42d9-b3e5-0e04a8354aa3.png)



## Conhecimentos obtidos por meio deste projeto:
- Sintaxes básicas da linguagem SQL para agregar e consultar as informações da base de dados;
- Métodos de armazenamento de dados na nuvem, mais especificamente, o Big Query;
- Apresentação as ferramentas Stitch data e dbt utilizadas no processo de ELT;
- Desenvolvimento de dashboards e elaboração de indicadores;
- A ferramenta dbt open source permite a criação de um DW com tabelas que possuem informações consolidadas que podem ser distribuidas para todos os setores
de uma empresa, servindo como uma unica fonte de verdade para a criação de dashboards;
- O processo de ELT, que permite o tratamento de dados dentro do DW, diminui drasticamente o tempo utilizado pelo analista de BI na transformação dos dados
 para criação dos dashboards.
