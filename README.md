# HTTParty For All

## Iniciativa Automation For All - Dessa vez na camada de serviços com HTTParty.

Pessoal, dessa vez a iniciativa Automation for All vai além dos testes em camada funcional ou mobile, e sim, vamos atuar um pouco na camada de serviços.

<<<<<<< HEAD
Há algum tempo venho estudando e me especializando um pouco em testes na camada de serviços, e com HTTParty eu venho sendo bem feliz rsrs, apesar de estar estudando FrisbyJS, mas esse eu vou deixar mais pra frente =).

Eu vou focar aqui a automação em serviços REST e vou focar nos mais comuns (GET, POST, PUT, DELETE), mas conceitualmente falando, se aplica também para todos os verbos Ok.

A estrutura desse artigo vai ser dividida da seguinte maneira:

1. Conhecendo os serviços REST;
2. Configurando o ambiente de trabalho;
3. Criando arquivos de Feature;
4. Criando arquivos de steps;
5. Executando os os testes.
=======
Há algum tempo venho estudando e me especializando um pouco em testes na camada de serviços, e com HTTParty eu venho sendo bem feliz rsrs, apesar de estar estudando FrisbyJS, mas esse eu vou deixar mais pra frente =). 

Obs.: Por se tratar de algo mais avançado, não vou ficar perdendo tempo com configuração no Windows, esse artigo se passa no Linux ou Mac Ok.

## Configuração do ambiente

Dado que estamos com ruby instalado (acima da versão 2.2.2), pode usar o [rvm] (rvm.io) para instalar a versão mais estável, vamos instalar algumas gems básicas (no caso o bundler e o cucumber). Para instalar, basta rodar o seguinte comando:

```ruby
gem install bundler
gem install cucumber
```

Após a instalação dessas gems, vamos criar a estrutura básica para começar nosso projeto. Executar o seguinte comando: 

```ruby
cucumber --init
```

A estrutura vai ficar assim: 

```ruby
create   features
create   features/step_definitions
create   features/support
create   features/support/env.rb
```
Eu gosto de trabalhar com duas pastas a mais, que seria cucumber e a pasta specifications e ficaria da seguinte maneira:

```ruby
cucumber
cucumber/features
cucumber/features/specifications
cucumber/features/step_definitions
cucumber/features/support
cucumber/features/support/env.rb
```
Cucumber será a base da nossa automação, utilizando Gherkin para escrita dos arquivos .features (veremos mais pra frente).

HTTParty será o framework de desenvolvimento dos testes na camada de serviços (foco em POST, GET, PUT e DELETE).

Vamos criar um arquivo chamado Gemfile da seguinte maneira: 

```ruby
source "https://rubygems.org"

gem "cucumber"
gem "faker"
gem "httparty"

Agora, vamos rodar o comando "bundle install" para instalar as gems que farão parte do nosso projeto.
```
Faker eu vou usar para criar dados aleatórios: ver [Faker no Capybara For All] (https://goo.gl/6TWqyP) para entendê-lo.

Obs.: Para entender o contexto do bundler basta entender que ele vai ler o arquivo Gemfile e vai procurar no rubygems as gems que eu citei e vai instalá-las com as suas dependências. O comando a seguir fara isso:

Com as gems já instaladas, agora sim vamos começar a trabalhar.

Se vocês repararem quando o comando init é dado, um arquivo chamado env.rb é criado na pasta support e esse arquivo nada mais é que um arquivo de configuração para os testes, e nele deve conter TODAS as gems que você quer utilizar, antecedidos de um require e também alguma configuração específica para que TODA vez que eu rodar o comando cucumber, ele olhe nesse arquivo, verifica as gems e as configurações para poder seguir com o teste. Segue o exemplo que vamos utilizar:

```ruby
require "cucumber"
require "httparty"
require "httparty/request"
require "httparty/response/headers"
require "faker"
```
Onde, require "gem a ser utilizada" eu estou falando que para rodar esse projeto, eu estou utilizando essa gem.

Dica: Tem os requires no arquivo env.rb eu tenho que ter TODAS as gems instaladas no meu computador e/ou ambiente de trabalho.
>>>>>>> 9644bbe7cd53478c91f8aaddf8b996b6e088450e
