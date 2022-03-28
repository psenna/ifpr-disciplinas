# Atividade 

Vamos validar um "bloco de transação" utilizando o algoritmo de prova de trabalho como o SHA256.

Para isso, vamos encontrar um número que concatenado(como string) com o seu nome completo tenha um hash que inicie com uma quantidade de zeros.

Por exemplo, encontrei que o número 8472522 concatenado com o meu nome ("Pedro Senna de Campos8472522") gera o hash 0000000B475702A3472F2449A3B390F50BAF807C2C92358F852E76B429C4A76E , que começa com  7 zeros (como esse valor é em hexa, temos, no mínimo, 28 bits zeros no início desse hash).

Essa atividade deve ser resolvida da força bruta com um programa seguindo os seguintes parâmetros:

* O código deve ser em Java, Python, PHP ou ShellScript
* Você deve encontrar um número que, concatenado com o seu nome, tenha **8** zeros no início do HASH gerado pelo SHA256 na representação em hexadecimal (32 bits se alguem for fazer em binário).
* Devem ser enviados no classroom o código fonte e um arquivo com o seu nome concatenado com o número, a quantidade de tentativas que foram necessárias e o tempo que levou para encontrar o número.

## Pseudo código

A solução vai ser na força bruta.

1. Escolhe um número (pode ser sequencial, aleatório, ...)
2. Concatena o número com o seu nome
3. Gera o hash
4. Verifica se o hash começa com a quantidade de zeros desejada
5. Em caso negativo, volte para o passo 1


## Código em Java

Código em java para gerar os SHA256.

```
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;


class provaDeTrabalho {
    public static void main(String[] args) {
        String nome = "Seu nome completo";
        try {
            System.out.println(getSHA256(nome));
            
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public static int coutZerosStart(String hash) {
        int count;
        for(count = 0; count < hash.length(); count++) {
            if(hash.charAt(count) != '0'){
                break;
            }
        }
        return count;
    }

    public static String convertByteToHexadecimal(byte[] byteArray) {
    int len = byteArray.length;

    // storing the hexadecimal values
    char[] hexValues = "0123456789ABCDEF".toCharArray();
    char[] hexCharacter = new char[len * 2];

    // using  byte operation converting byte
    // array to hexadecimal value
    for (int i = 0; i < len; i++) {
        int v = byteArray[i] & 0xFF;
        hexCharacter[i * 2] = hexValues[v >>> 4];
        hexCharacter[i * 2 + 1] = hexValues[v & 0x0F];
    }

    return String.valueOf(hexCharacter);
}


    public static String getSHA256(String input) throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("SHA-256"); 

        return convertByteToHexadecimal(md.digest(input.getBytes(StandardCharsets.UTF_8))); 
    }
}

```

## Dicas

1. Teste com números pequenos de 0s no início, 1 por exemplo, antes de colocar para rodar com o valor do exercício.
2. Pode demorar para encontrar o número, não deixe para a última hora.
3. Teste o hash gerado [nesse site](https://emn178.github.io/online-tools/sha256.html). No meu caso, o resultado foi "Pedro Senna de Campos6579364204" e vocês podem testar e ver que o hash começa com 8 zeros na representação em hexa.
