# Triggers 1

Triggers (gatilhos) são códigos que são executados quando alguma ação acontece (INSERT, UPDATE, DELETE) em uma tabela. Eles podem ser chamados antes ou depois da ação ser realizada.

Para cada evento em uma tabela, só pode existir um trigger.

O trigger fica salvo no banco.

## Banco

Para essa aula, vamos utilizar o banco [banco.sql](./sql/banco.sql)).

Nele temos um cliente que possui uma conta. Nessa conta podemos fazer operações de debito e crédito e operações de investimento e resgate desse invertimento.

Na conta temos os campos saldo e saldo_investimentos.

## Sintaxe da Trigger

```
CREATE TRIGGER nome momento evento
ON tabela
FOR EACH ROW
BEGIN
/*corpo do código*/
END
```

## NEW e OLD

No corpo da trigger temos acesso a dois conjuntos de valores, os valores antigos da linha que o trigger está agindo, e os valores novos, após a execução da trigger.

Acessamos eles utilizando o NEW e o OLD.

## Atualizando os valores do saldo quando uma nova operação acontecer.

Vamos criar um trigger para atualizar o saldo da conta quando acontecer uma operação de crédito ou débito.

**Em Sala**

## Atividades

* Fazer um trigger que atualize o saldo de invertimentos da conta quando acontecer um novo investimento.

* Fazer um trigger que atualize o saldo de investimentos da conta quando acontecer um resgate.

* Fazer um trigger que marque o cliente como especial caso a soma do seu saldo em conta com o saldo de investimentos for maior que 50 mil.



