# Utilizando chaves no SSH

Vamos criar uma chave para utilizarmos no SSH, dessa forma podemos conectar com máquinas sem precisar colocar a senha.

Os comandos são para o linux, mas funcionam no windows 10.

## Criando a chave

Primeiro vamos criar uma chave assimétrica para utilizarmos, vamos fazer isso com o comando *ssh-keygen*:

```
 ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
 ```

Essa chave vai ser criada na pasta sua pasta .ssh na pasta do seu usuário. É só ir seguindo as instruções que vão aparecendo no terminal.

Para que a chave seja utilizada pelo cliente do SSH, temos que cadastrar ela utilizando o comando ssh-add com a chave privada como parâmetro.

Se você rodou o comando com os valores padrões, vai ser o comando abaixo:

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

## Adicionando em um servidor

Agora temos que cadastrar a sua chave pública onde queremos que essa máquina se conecte sem senha. Pode ser em outra máquina que tenho o servidor de SSH ou no github.

Para fazer em outra máquina, vamos fazer ssh nela(com senha ainda) e cadastrar a chave pública.

 Para isso, vamos escolher o usuário que queremos que seja utilizado no SSH e na pasta de usuário dele criar uma pasta .ssh (se não existir) e um arquivo authorized_keys (se não existir).

```
mkdir .ssh
cd .ssh
touch authorized_keys
```

Nesse arquivo vamos colocar o conteúdo da chave pública que geramos (id_rsa.pub) e salvar.

Depois disso, a conexão ssh do nosso pc para o outro utilizando esse usuário não vai precisar de senha para funcionar.


Referência: [GitHub](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)