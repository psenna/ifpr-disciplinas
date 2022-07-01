# Revisão para prova

Depois de muito estudo, você conseguiu um estágio no promissor estúdio de jogos GamesSoft do Bill Portões e está trabalhando junto a um time de jovens estagiários promissores para entregar o primeiro e disruptivo jogo dessa empresa, o Empire of Ages.

No dia da estreia do jogo, inadiável pois a empresa gastou 1000 reais em marketing, descobriram que os estagiários do teste estavam vendo Naruto no horário de serviço, e não testando o jogo. Assim, foram descobertos diversos erros no jogo, a maioria facilmente corrigíveis pelo código. 

Mas a vida é uma caixinha de surpresas, e os estagiários que sabiam como fazer o deploy do sistema foram em um Happy Hour no dia anterior e não estão em condições de trabalhar.

Nesse caos, sobrou para o estagiário que mexe com o banco, no caso você, salvar o dia. As correções devem ser realizadas direto no banco com triggers e views. A sua promoção para estagiário Sênior, o futuro da GamesSoft e uma pizza grande de sabores promocionais estão na sua mão.

PS: Bill Portões nunca entendeu os joins, por isso ele os acha ruins. Você não pode utilizar joins nas suas soluções.

## Banco

Para essa aula, vamos utilizar o banco [empire_ages.sql](./sql/empire_ages.sql)).

Olhe a definição dele e resolva as questões a seguir.

Ele contém um usuário, seus recursos, suas unidades e suas construções.

## Primeira lista de correções.

* Uma unidade viva deve estar com o ativo como true e uma unidade que foi derrotada deve estar com o ativo como falso. O sistema deveria tornar inativa qualquer unidade com vida menor ou igual a 0, mas esqueceram de colocar essa condição. Você deve criar uma solução para inativar automagicamente as unidades que estiverem sem vida.

* Para mostrar os dados do jogo no painel, o sistema esperava que existisse uma "tabela" com nome "status_por_jogador" que deve trazer a quantidade de unidades ativas, a quantidade de construções ativas e a quantidade dos recursos ouro e madeira que o usuário possui. Corrija esse problema sem usar joins.

* O mesmo problema que ocorria com as unidades está ocorrendo com as construções, elas não estão sendo removidas (inativadas) quando sua vida está abaixo de 0. Corrija esse problema.

* Em testes, perceberam que o sistema não está impedindo que unidades sejam criadas, mesmo que o usuário não possua os recursos necessários para cria-las (na tabela tipos_unidades tem a quantidade de recursos necessários para cada uma). Verifique se o usuário possui os recursos necessários e impeça a criação da unidade caso não tenha.

* Após criar uma unidade, o sistema não está removendo os recursos do usuário (dinheiro infinito). Para resolver isso, crie alguma solução que após a criação da unidade, remova os recursos do jogador (lançando entradas em recursos com valores negativos).