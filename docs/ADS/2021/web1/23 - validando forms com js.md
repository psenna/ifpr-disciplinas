# Validando Forms com JS

Quando o usuário digita informações nos formulários para enviar para a nossa aplicação, ele pode colocar informações inválidas ou em formatos errados.

Por exemplo, quando um usuário está digitando a quantidade de um produto que ele quer comprar no carrinho de uma loja, ele não pode colocar um número negativo.

Outro exemplo comum é a formatação de email ou de cpf.

Para evitar que o usuário envie informações inválidas para a aplicação, podemos fazer a validação dos dados que estão no form.

Temos algumas formas de fazer isso, uma delas é utilizando o JS.


## Criando o nosso form

Vamos começar com o nosso formulário em HTML.

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
    <script defer src="scripts/validacao.js"></script>
</head>
<body>
    <div class="container">
        <form id="formularioUsuario" onsubmit="validaFormulario()">
            <div class="form-group">
              <label for="nomeInput">Nome</label>
              <input type="text" name="nome" class="form-control" id="nomeInput" placeholder="Digite o seu nome">
            </div>
            <div class="form-group">
              <label for="emailInput">Email</label>
              <input type="text" name="email" class="form-control" id="emailInput" placeholder="O seu email">
            </div>
            <div class="form-group">
                <label for="passwordInput">Senha</label>
                <input type="password" name="senha" class="form-control" id="passwordInput" placeholder="Digite a sua senha">
            </div>
            <div class="form-group">
                <label for="passwordConfirmacaoInput">Confirmação da senha</label>
                <input type="password" class="form-control" id="passwordConfirmacaoInput" placeholder="Confirme a sua senha">
            </div>
            <button onclick="validaFormulario()" class="btn btn-primary">Submit</button>
          </form>
        <div id="resultadoOutput"></div>
    </div>
</body>
</html>
```

Vamos agora criar um arquivo js na pasta scripts e criar a função **validaFormulario**.

```
function validaFormulario(e) {
    e = e || window.event;
    var erro = false
    var nome = document.getElementById("nomeInput")
    var email = document.getElementById("emailInput")
    var senha = document.getElementById("passwordInput")
    var confirmacaoSenha = document.getElementById("passwordConfirmacaoInput")
    var formulario = document.getElementById("formularioUsuario")

    limpaResultado()

    if(nome.value == "") {
        adicionaErro("O nome não pode estar vazio")
        erro = true
    }

    if(erro) {
        e.preventDefault()
    }
}


function limpaResultado() {
    resultado = document.getElementById('resultadoOutput')

    resultado.innerHTML = ""
}

function adicionaErro(mensagemDeErro) {
    resultado = document.getElementById('resultadoOutput')

    resultado.innerHTML += "<p>"+ mensagemDeErro +"</p>"
}
```

Também criamos duas funções para mostrar o resultado da validação para o usuário.

Nesse código, a função verifica se o nome está vazio e, caso esteja, coloca uma mensagem de erro e colocar verdadeiro na variável erro.

No final da função, caso erro seja verdadeiro, o código *e.preventDefault()* vai evitar que a requisição seja realizada. Caso não seja encontrado nenhum erro, a requisição pode ser feita.

## Atividade

Utilizando o código acima, modifique a função de validação para que:

1. Mostre um erro caso algum dos campos não tenha sido preenchido.

2. Mostre um erro caso o email não seja válido (vamos considerar aqui que o email é válido se tiver 1 @) [dica](https://www.w3schools.com/jsref/jsref_includes.asp)

3. Mostre um erro caso a pessoa tenha digitado uma senha diferente na confirmação de senha. (== funciona)