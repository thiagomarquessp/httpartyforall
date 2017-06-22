## Criando nossos arquivos de Feature.

Como eu sou entusiasta em cucumber por uma questão totalmente filosófica, onde eu almejo um dia termos Product Owners mais técnicos para que eles possam em cada review, rodar os critérios de aceite que ele definiu em cada estória. E para que isso possa ser possível, é necessário que tenhamos cada critério de aceite escrito em formato Cucumber com linguagem Gherkin.

É bom porque eu mantenho uma especificação viva do meu sistema, onde eu posso simplesmente gerar códigos através dessa documentação, e indo além, é uma forma de desenvolver por comportamento. É necessário para a camada de serviços? Não, mas como eu gosto de cucumber, e quando eu comecei a estudar HTTParty, achei interessante, e segui assim mesmo, mas se aplica com rspec se vocês acharem melhor, e desse jeito, abstrai da camada do Cucumber.

Partindo do princípio que você leu o arquivo [Configurando Ambiente](https://github.com/thiagomarquessp/httpartyforall/blob/master/Configurando_Ambiente.md), vamos lá:

```ruby
1. Dentro da pasta specifications vamos criar um arquivo chamado get.feature e nele vai conter o seguinte conteúdo:

#language: pt

Funcionalidade: Aprendendo o verbo GET

Eu, como interessado em automação
Desejo aprender como automatizar o verbo GET
Para ser um QA melhor.

@executa_get
Cenario: Automatizando GET

  Dado que eu faça um GET no endpoint clientes
  Entao o retorno dele será todos os clientes cadastrados
```

Considerando que vocês já conheçam cucumber e que eu tenha que executar esse arquivo e copiar o resultado e criar meus arquivos de step, vou pular essa explicação chata, mas pode ver [aqui](https://github.com/thiagomarquessp/capybaraforall/blob/master/Executando_seus_arquivos_Feature.md).

Obs.: Para que o teste faça sentido, vai ser necessário ter seguido o [fakeapi](https://github.com/thiagomarquessp/httpartyforall/blob/master/Fake_api.md) e executar o comando json-server --watch clientes.json OK.

```ruby
2. Criar um arquivo chamado get.rb dentro da pasta step_definitions da seguinte maneira:

Dado(/^que eu faça um GET no endpoint clientes$/) do
  @get_clientes = HTTParty.get 'http://localhost:3000/clientes'
end

Entao(/^o retorno dele será todos os clientes cadastrados$/) do
  puts @get_clientes.body
  puts @get_clientes.code
  expect(@get_clientes.code).to eq 200
end
```

Bom, vamos entender o que fizemos:

1. Criei uma variável chamada @get_clientes e dentro dela armazenei o verbo GET através do comando "HTTParty.get" + 'endpoint', ou seja, HTTParty.get 'http://localhost:3000/clientes' e esse é o conceito inicial, onde o verbo eu chamo dessa maneira no HTTParty, então vamos ter:

```ruby
HTTParty.get 'endpoint'
HTTParty.post 'endpoint'
HTTParty.put 'endpoint'
HTTParty.delete 'endpoint'
HTTParty.patch 'endpoint'
HTTParty.xpto 'endpoint'
```
O verbo GET é o mais simples de todos, pois basta informar o endpoint que ele trás pra ti o resultado. Nos próximos verbos vamos ter detalhes a mais, mas isso fica pra depois, vamos nos concentrar aqui, nesse verbo.

2. Eu coloquei pra printar na tela o body (corpo) da request só por osmoze e pra poder explicar aqui como a request vem =), que aliás, é igual vc colocando no postman, assim como printei o código da requisição, que no caso, vem 200 quando sucesso, 404 (Not found) ou 400 (Bad Request).

3. Agora vem a validação com o expect, só que nesse caso, eu to validando o código da requisição, colocando na espera o valor esperado, que nesse caso é 200 e por isso o "eq 200" para que qualquer código diferente de 200 o teste passe a quebrar. Por isso a importância de você chamar o verbo e deixá-lo dentro de uma variável =).

Apenas com isso, tu já consegue automatizar TODOS os verbos GET do lugar onde vc trabalha. Mas não para por aí, vamos para o verbo [POST](https://github.com/thiagomarquessp/httpartyforall/blob/master/Exemplo_POST_feature_steps.md)
