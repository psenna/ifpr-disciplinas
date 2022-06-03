# Triggers com condições

Nessa aula vamos ver triggers com estruturas condicionais (IF).

## IF em SQL

Estrutura do IF:

```
IF condição THEN 
   declarações;
END IF;
```

Estutura do IF ELSE:


```
IF condição THEN
   declarações;
ELSE
   declarações-else;
END IF;
```


```
IF condição THEN
   statements;
ELSEIF condição-elseif THEN
   declarações-elseif;
...
ELSE
   declarações-else;
END IF;
```

## Parando a execução de uma query

Para pararmos uma query, utilizamos o [signal](https://dev.mysql.com/doc/refman/8.0/en/signal.html).


## Validações com triggers

O valor de uma transação (débito, crédito, investimento ou resgate) deve ser maior que zero. 

**Resolver em Sala**

O nome do cliente deve ter um espaço em branco.

**Resolver em Sala**

## Atividades

* Nesse banco, o cliente não tem cheque especial, então ele deve possuir saldo em conta para realizar um débito. Crie um trigger para gartir que um débito só seja salvo se o cliente tiver saldo em conta suficiente.

* Um cliente é especial para o banco caso tenha mais do que 50 mil reais em saldo de investimento ou 60 mil reais somando o saldo de investimento com o saldo da conta. Faça uma trigger que atualiza se o cliente é especial quando ocorrerem mudanças em sua conta.


