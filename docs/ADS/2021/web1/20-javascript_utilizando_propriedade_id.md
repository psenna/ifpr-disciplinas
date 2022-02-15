# 20 - Encontrando componentes no JS

Nessa aula vamos ver outras formas de encontrar componentes do html com o JS.

## A propriedade id

Os elementos do html possui um atributo chamado id que é utilizado para identificar um elemento individualmente.  O id não deve se repetir no html.

O id pode ser utilizado tanto pelo javascript, quanto pelo CSS.

No CSS vamos criar a declaração com um # antes do nome do id.

```
#meuCabecalho {
  background-color: lightblue;
  color: black;
}
```

### Diferença entre o class e o id

A mesma classe pode ser utilizada por diversos elementos, já o id deve ser único (não deve ser repetir) no documento.

## Encontrando os elementos

Podemos encontrar os elementos pelo seu id, sua classe ou sua tag.

| Método  | Descrição |
|---------|-----------|
| document.getElementById(id) | Encontra o elemento pelo id|
| document.getElementsByTagName(name) | Encontra os elementos com a tag|
| document.getElementsByClassName(name)	| Encontra os elementos pelo nome da classe |


Nos elementos podemos alterar seu html, seus atributos e seu estilo com  os seguintes métodos:


| Método  | Descrição |
|---------|-----------|
| element.innerHTML =  new html content	 | Muda o HTMl de um elemento|
| element.attribute = new value	 | Muda o valor de um atributo do elemento|
| element.style.property = new style	| Muda o estilo do elemento |

