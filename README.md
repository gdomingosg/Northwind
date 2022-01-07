# Tratamento de dados Northwind
 
Neste repositório estão os arquivos utilizados para realizar o tratamento dos dados da <a href="https://github.com/pthom/northwind_psql">Northwind</a> e o dashboard construido com os dados tratados.

O esquema do bando de dados da empresa está apresentado abaixo.

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


Após o tratamento final dos dados e seleção dos dados que seriam utilizados para confecção do dashboard, as relações entre as tabelas se estabelaceu conforme apresentado abaixo.

![image](https://user-images.githubusercontent.com/81938273/148570510-eec86f80-cd97-4611-ba9b-f046e5b76d9c.png)


### Dashboard

Para este caso foram criados dois dashboards a partir dos dados.

#### CEO 

O primeiro, para suprir as necessidade do CEO, contém informações a respeito do faturamento durante os anos de funcionamento, o total faturado, o ticket médio, produtos mais vendidos pela empresa e total de compra por clientes e por países.

![image](https://user-images.githubusercontent.com/81938273/148557688-fd6d4c5f-3733-4122-9c9f-e7f462a9bf37.png)
 
A partir desse dashboard é possível obter as seguintes informações:

- Se no ano de 1998 a empresa seguir a mesma tendencia do ano de 1997, o faturamento tende a aumentar;
- Deve ser realizado um estudo sobre aumentar a rede de vendedores, o marketing ou dar mais desconto nos paises com poucas vendas, para verificar se é possível atingir mais clientes ou mais pedidos;

#### Gerente de Vendas

O segundo, para apresentar os dados ao gerente de vendas, contém informações sobre o vendas por país, quantidade de produtos pedidos, valor liquido vendido por categoria e por produto, total vendido por funcionário, total faturado e ticket médio.

![image](https://user-images.githubusercontent.com/81938273/148569013-d5882d90-98cb-41de-b784-58589b3ce061.png)

A partir desse dashboard é possível obter as seguintes informações:

- Estados Unidos é o pais com os clientes que mais compram;
- Austria é o pais com o maior Ticket médio;
- Durante todo o periodo da Northwind, Margaret Peacock foi a fucionária que mais vendeu, quando considerado o valor líquido;
- No último mês registrado, Andrew Fuller foi o funcionário que mais vendeu;
 


## Conhecimentos obtidos por meio deste projeto:
- Sintaxes básicas da linguagem SQL para agregar e consultar as informações da base de dados;
- Métodos de armazenamento de dados na nuvem, mais especificamente, o Big Query;
- Apresentação as ferramentas Stitch data e dbt utilizadas no processo de ELT;
- Desenvolvimento de dashboards e elaboração de indicadores;
- A ferramenta dbt open source permite a criação de um DW com tabelas que possuem informações consolidadas que podem ser distribuidas para todos os setores
de uma empresa, servindo como uma unica fonte de verdade para a criação de dashboards;
- O processo de ELT, que permite o tratamento de dados dentro do DW, diminui drasticamente o tempo utilizado pelo analista de BI na transformação dos dados
 para criação dos dashboards.
