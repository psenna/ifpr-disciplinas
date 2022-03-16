# Programinhas em JS

Nessa aula vamos fazer fazer 2 programinhas em js. 

## Importar o JS

Antes de começar os programas, vamos ver alguns detalhes importântes sobre a importação de scripts no HTML nesse link abaixo.

[Referência](https://www.braziljs.org/p/diferencas-entre-async-e-defer)

## Programa para calcular o gasto com combustível

Vamos fazer um programa onde o usuário vai digitar algumas informações (valor do litro de combustível, autonomia por litro e o quanto ele vai andar) e o nosso programa vai calcular quanto ele vai gastar.

Primeiro vamos criar um form para que o nosso usuário possa digitar as informações.

```
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validando formulários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script defer src="scripts/combustivel.js"></script>
</head>
<body>
    <div class="container">
        <form id="formularioUsuario">
            <div class="form-group">
              <label for="valorPorLitroInput">Valor por litro</label>
              <input type="number" step="0.01" class="form-control" id="valorPorLitroInput" placeholder="Digite o valor por litro de combustível">
            </div>
            <div class="form-group">
              <label for="autonomiaInput">Autonomia</label>
              <input type="number" step="0.01" class="form-control" id="autonomiaInput" placeholder="Digite o quanto o carro anda com 1 litro de combustível">
            </div>
            <div class="form-group">
                <label for="distanciaInput">Distancia</label>
                <input type="number" step="0.01" class="form-control" id="distanciaInput" placeholder="Digite o quanto vai andar com o veículo">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        <div id="resultadoOutput"></div>
    </div>
</body>
</html>
```

Agora vamos criar um javascript para fazer esse cálculo. Vamos criar uma pasta chamada scripts e criar um script chamada 'combustivel.js'. Nele vamos começar pegando os elementos do html que vamos precisar interagir.

```
valorCombustivel = document.getElementById('valorPorLitroInput')
autonomia = document.getElementById('autonomiaInput')
distancia = document.getElementById('distanciaInput')

resposta = document.getElementById('resultadoOutput')

formulario = document.getElementById('formularioUsuario')
```

Depois, vamos criar uma função calcule o gasto utilizando os valores do formulário.

```
function calculaValorGasto(e) {
    e = e || window.event;
    e.preventDefault()
    var gasto = valorCombustivel.value * distancia.value / autonomia.value

    resposta.innerHTML = "<p> Você vai gastar " + gasto + " reais!!! <\p>"
}
```

Por padrão, quando um formulário é enviado, a página é recarregada. O 'e.preventDefault()' serve para evitar que isso aconteça.

Por fim, vamos adicionar o evento no form, podemos fazer de duas formas, colocando um 'onsubmit' no form ou como no código abaixo.

```
formulario.addEventListener('submit', calculaValorGasto)
```

No final, o nosso script ficará assim:

```
valorCombustivel = document.getElementById('valorPorLitroInput')
autonomia = document.getElementById('autonomiaInput')
distancia = document.getElementById('distanciaInput')

resposta = document.getElementById('resultadoOutput')

formulario = document.getElementById('formularioUsuario')

function calculaValorGasto(e) {
    e = e || window.event;
    e.preventDefault()
    var gasto = valorCombustivel.value * distancia.value / autonomia.value

    resposta.innerHTML = "<p> Você vai gastar " + gasto + " reais!!! <\p>"
}


formulario.addEventListener('submit', calculaValorGasto)
```

## Calculando a sequência de fibonacci

Agora faça um programa que receba um número n e responda a número n da [sequencia de fibonacci](https://pt.wikipedia.org/wiki/Sequ%C3%AAncia_de_Fibonacci).

Você vai precisar usar um laço de repetição, [Aqui](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/for) você pode encontrar alguns exemplos de como utilizar um for.