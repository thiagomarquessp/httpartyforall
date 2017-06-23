# Se Jesus Salva ... HTTParty DELETA

Para completar essa pequena apresentação sobre HTTParty, vou falar um pouco sobre o verbo DELETE, e como o próprio nome diz, ele deleta registros e a forma de escrita de features e steps são semelhantes ao vebo PUT.

Bem, como vimos nos outros arquivos, eu vou precisar do meu arquivo endpoints.json com alguns registros só para entender o contexto ta rsrs. Então sugiro para que possa começar voltando e aplicando o conceito do verbo [POST](https://github.com/thiagomarquessp/httpartyforall/blob/master/Exemplo_POST_feature_steps.md) e voltar aqui, só pra garantir que temos registros salvos. Vamos ter algo mais ou menos assim no endpoints.json:

```ruby
{
  "clientes": [
    {
      "id": 1,
      "nome": "Nome Teste",
      "cpf": "123.456.789-0",
      "endereco": "Rua Teste dos teste",
      "usuario": "usuario",
      "senha": "senha"
    },
    {
      "nome": "Brooks Rolfson",
      "cpf": "86567651245",
      "endereco": "Naboo",
      "usuario": "Zapdos",
      "senha": "inicial2101",
      "id": 2
    }
  ]
}
```

E dessa vez vamos deletar o registro de id 1 da nossa vida =). Então vamos criar nosso arquivo chamado delete.feature dentro da pasta specifications da seguinte maneira:

```ruby
#language: pt

Funcionalidade: Deletando registros

Eu, como QA
Desejo aprender a deletar um registro de forma automatizada
Para expurgar as coisas ruins do banco

Cenario: Deletar registro com sucesso

  Dado que eu envie um registro para delecao
  Entao o registro devera ser deletado do banco com sucesso
```

E criar o arquivo delete.rb na pasta step_definitions da seguinte maneira:

```ruby
Dado(/^que eu envie um registro para delecao$/) do
  @body_delete = {
    "id": 1
  }.to_json

  @delete = HTTParty.delete 'http://localhost:3000/clientes/1',
    :body => @body_delete,
    :headers => {
      "Content-Type" => 'application/json'
    }
end

Entao(/^o registro devera ser deletado do banco com sucesso$/) do
  expect(@delete["id"]).to eq nil
end
```

E vamos lá entender o que fizemos.

1. Assim como POST e PUT, eu criei uma variável para armazenar o corpo da requisição em formato JSON.

2. Criei também variável para armazenar a requisição com o verbo DELETE.

3. Fiz expect para saber se o retorno do item que eu acabei de deletar ainda está lá. Nil significa que o código executado não tem um valor de retorno definido, ou seja, se eu deletei, ele não tem que retornar, e se retornar algo diferente de nil o delete não deu certo. O nil é == o Null em outras linguagens.


Bem, chegamos ao fim ... =(

Sei que temos outros verbos HTTP para explorar, mas com esses 4 qualquer pessoa consegue pegar o conceito e aplicar para qualquer verbo, pois não muda. E com isso deixamos de fazer os testes via postman, rodar na mão, etc. E garantimos um feedback mais rápido que o testes abrindo o navegador.

Bem, queria agradecer a paciência até aqui e sei que cada QA é um talento, mas que temos alguns bloqueios que são necessários trabalhar de forma precisa para removê-los, principalmente no tema automação de testes. Se vocês observarem, não foi necessário criar uma classe sequer para automatizar 4 verbos. É o ideal? Não ... mas é suficiente para pegar gosto pela automação vendo que é algo super fácil de lidar sem ter que se preocupar em orientação a objetos ou coisas do tipo.

Um abraço a todos.
