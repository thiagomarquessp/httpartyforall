# Ahhhh o Verbo POST

O verbo POST é uma ação de inclusão, no nosso caso, vamos incluir um novo cliente no nosso endpoint /clientes. Só que no caso do POST eu necessito de alguns parâmetros para que ele faça sentido, que seriam o HEADER (cabeçalho) da requisição e o BODY (corpo) da requisição, esse no formato JSON. Vamos trabalhar com o simples para entender o conceito, e como falei, é trazer o Postman para dentro da automação. O HEADER que vamos usar é:

```ruby
'Content-Type: application/json'
```

A tradução "porca" para isso é: Quando eu der start na minha requisição, o servidor vai entender que 'Contém o tipo JSON', logo, o BODY deve estar no modelo JSON:

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
    }
  ]
}
```

Isso é o que faríamos no Postman por exemplo e executar. Agora, voltando ao nosso contexto, de trabalhar com a automação, vamos criar um arquivo chamado post.feature dentro da pasta specifications da seguinte maneira:

```ruby
#language: pt

Funcionalidade: Aprendendo a automatizar o verbo POST

Eu, como QA
Desejo aprender a automatizar o verbo POST
Para ser o lindo da mamãe na empresa

Cenario: Enviar com sucesso um novo cliente

  Dado que eu envie os parâmetros corretos para o endpoint clientes
  Entao um novo cliente é cadastrado com sucesso na base
```

E agora, criar o arquivo chamado post.rb dentro da pasta step_definitions da seguinte maneira:

```ruby
Dado(/^que eu envie os parâmetros corretos para o endpoint clientes$/) do
  @body = {
    "nome": Faker::Name.name,
    "cpf": Faker::CPF.numeric,
    "endereco": Faker::StarWars.planet,
    "usuario": Faker::Pokemon.name,
    "senha": Faker::Base.numerify('inicial####')
  }.to_json
  @post_clientes = HTTParty.post 'http://localhost:3000/clientes',
    :body => @body,
    :headers => {
        "Content-Type" => 'application/json'
    }
end

Entao(/^um novo cliente é cadastrado com sucesso na base$/) do
  puts @post_clientes.body
  expect(@post_clientes.code).to eq 201
end
```

Vamos entender rsrsr.

1. Variável para armazenar o BODY da requisição. Nesse caso, os registros eu utilizei a gem [Faker](https://github.com/stympy/faker). E de novo, trazendo o Postman para a realidade da automação, pois eu defino o corpo da requisição da mesma forma (menos com o Faker) e no final eu defini o tipo de arquivo (.to_json) só pra não se perder e considerar a estrutura.

2. Variável que armazena o verbo POST e nesse caso temos que definir o :body => @body, :headers => {"Content-Type" => 'application/json'}, ou seja, defino o tipo de requisição que estou mandando, no caso, application/json (e olha que legal, igual no Postman) rsrs.

3. Como no GET, printei o corpo da requisição só pra mostrar como fica.

4. E assim como no GET dei um expect na requisição, esperando 201 (created), ou seja, qualquer código diferente disso, vai quebrar o teste e vai colocar no log o código que ta vindo. =)

Podemos concluir que a ordem base seria:

@variavel = HTTParty.VERBO, {body e headers} e executar o role :) 

Obs.: Para os chatos de plantão, eu sei que eu poderia colocar a variável do body em um outro arquivo e chamar, ou criar um metodo e bla bla bla .. mas para quem ta no início, entender o contexto dessa forma faz muito mais sentido.

Dica: Baseado na Obs acima, podemos colocar dentro um Hook Before. Não sabe como trabalhar com os Hooks, olha [aqui](https://github.com/thiagomarquessp/capybara_for_all_p4)

Bom, agora bora pro verbo [PUT](https://github.com/thiagomarquessp/httpartyforall/blob/master/Exemplo_PUT_feature_steps.md)
