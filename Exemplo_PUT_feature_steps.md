# O bom e velho Update chamado PUT

Pra ser bem claro, o verbo PUT faz alteração em algum registro existente, no nosso caso, vamos alterar um cliente que criamos lá atrás no verbo POST =).

Bem, mas vamos relembrar uma coisinha, quando criamos o nosso arquivo "endpoints.json" vai aparecer da seguinte forma (após os testes do verbo POST):

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
      "id": 2,
      "nome": "Bla bla bla ",
      "cpf": "213.232.344-5",
      "endereco": "Xpto",
      "usuario": "teste",
      "senha": "inicial1234"
    }
  ]
}
```

Olhe apenas para o id nesse caso, porque o restante eu usei Faker, então no exemplo acima foi só para mostrar como o arquivo fica quando passamos o POST.

Obs.: Quando eu executo mais de uma vez, ele vai incluindo nesse arquivo, que nada mais é que nosso banco de dados OK.

Bom, considerando que temos apenas o usuário de id 1 e 2, nós vamos trabalhar o verbo PUT no usuário de id 2, mas conceitualmente serve pra qualquer um! Então, vamos criar o arquivo "put.feature" dentro da pasta specifications da seguinte maneira:

```ruby
#language: pt

Funcionalidade: Aprendendo a automatizar o verbo PUT

Eu, como QA
Desejo autoamtizar o verbo PUT
Para conseguir fazer meus updates no endpoint clientes

Cenario: Alterar clientes

Dado que eu altere os parametros do meu cliente de um cliente específico
Entao esse cliente devera ser atualizado com sucesso
```

E então criar o arquivo "put.rb" dentro da pasta step_definitions da seguinte maneira:

```ruby
Dado(/^que eu altere os parametros do meu cliente de um cliente específico$/) do
  @nome_alterado = Faker::Name.name
  @cpf_alterado = Faker::CPF.numeric
  @endereco_alterado = Faker::StarWars.planet
  @usuario_alterado = Faker::Pokemon.name
  @senha_alterada = Faker::Base.numerify('inicial####')
  @body_put = {
    "nome": @nome_alterado,
    "cpf": @cpf_alterado,
    "endereco": @endereco_alterado,
    "usuario": @usuario_alterado,
    "senha": @senha_alterada
  }.to_json

  @put = HTTParty.put 'http://localhost:3000/clientes/4',
    :body => @body_put,
    :headers => {
      "Content-Type" => 'application/json'
    }
end

Entao(/^esse cliente devera ser atualizado com sucesso$/) do
  expect(@put.code).to eq 200
  expect(@put["nome"]).to eq @nome_alterado
  expect(@put["cpf"]).to eq @cpf_alterado
  expect(@put["endereco"]).to eq @endereco_alterado
  expect(@put["usuario"]).to eq @usuario_alterado
  expect(@put["senha"]).to eq @senha_alterada
end
```

O que eu fiz de diferente nesse caso comparado aos outros é que nesse caso, eu coloquei os Fakers em variáveis apenas para mostrar pra vocês que eu posso deixar o código mais clean (colocando essas variáveis dentro de Hooks Before ou métodos ou sei lá onde) e também para que eu consiga fazer o expect passando o valor armazenado nela.

No expect repare que eu passei atributo a atributo que eu alterei entre [ ], ficando assim "@variavel["atributo"]" e com isso eu consigo dar um to eq passando exatamente o valor exato daquele registro naquele atriuto que eu defini.

Então, depois de tudo isso, bora pro último [verbo http](https://github.com/thiagomarquessp/httpartyforall/blob/master/Exemplo_DELETE_feature_steps.md)
