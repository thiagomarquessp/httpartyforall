## Configurando nosso ambiente de trabalho!!

Bom, para aqueles que estão vindo pela primeira vez, estou escrevendo do meu Mac, é aplicável no Windows e no Linux, mas não vou ficar reinventando a roda explicando as coisas ano Windows OK, não gosto e também não quero! Quando a Linux e Mac, na parte de configuração, Ok, consigo criar motivação para ajudar =).

Enfim, vamos precisar do ruby instalado na versão 2.2.2 ou superior. Para instalar o ruby:

Windows:

Necessário: [rubyinstaller](http://rubyinstaller.org/downloads/).

Obs.: Quando se instala o ruby, será necessário a instalação do DevKit correspondente da versão que você instalou.

Mac:

Necessário: Baixar o Xcode pelo [link:](https://developer.apple.com/xcode/downloads/). Aprendi que sempre que instalar o SO, a primeira coisa será instalar o Xcode.

Bem, depois do Xcode, vamos baixar o Homebrew via terminal com o comando:

```ruby
ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)” .
```

Para explicar o que é o homebrew basta dizer: “O Homebrew instala as coisas que você precisa que a Apple não forneceu para você.” - [fonte:](http://brew.sh/index_pt-br.html). Ou seja, é um gerenciador de pacotes.

Reinicie a máquina (isso mesmo, para “completar as instalações”).

Com o Homebrew instalado, será necessário instalar o “Qt” - Framework multiplataforma para desenvolvimento de interfaces gráficas - [fonte:](http://pt.wikipedia.org/wiki/Qt) e serve basicamente para podermos utilizar o selenium como driver padrão de execução para os testes. Para instalar o Qt, é bem simples:

```ruby
brew install qt
```

Instalar o gerenciador de versões RVM (eu gosto), mas tem também o rbenv. Para instalar o rvm:

```ruby
1. gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
2. curl -sSL https://get.rvm.io | bash -s stable
3. Reiniciar o terminal
4. rvm install 2.2.2

Caso o "curl" não estiver instalado, basta "brew install curl".
```

Ubuntu:

Instalar o gerenciador de versões RVM (eu gosto), mas tem também o rbenv. Para instalar o rvm:

```ruby
1. gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
2. curl -sSL https://get.rvm.io | bash -s stable
3. Reiniciar o terminal
4. rvm install 2.2.2

Caso o "curl" não estiver instalado, basta "brew install curl".
```
Bom, com o ruby instalado, vamos instalar as principais gems para nosso contexto rsrs, a bundler e cucumber:

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
gem "rspec"

Agora, vamos rodar o comando "bundle install" para instalar as gems que farão parte do nosso projeto.
```
Faker eu vou usar para criar dados aleatórios: ver [Faker no Capybara For All](https://goo.gl/6TWqyP) para entendê-lo.

Obs.: Para entender o contexto do bundler basta entender que ele vai ler o arquivo Gemfile e vai procurar no rubygems as gems que eu citei e vai instalá-las com as suas dependências. O comando a seguir fara isso:

Com as gems já instaladas, agora sim vamos começar a trabalhar.

Se vocês repararem quando o comando init é dado, um arquivo chamado env.rb é criado na pasta support e esse arquivo nada mais é que um arquivo de configuração para os testes, e nele deve conter TODAS as gems que você quer utilizar, antecedidos de um require e também alguma configuração específica para que TODA vez que eu rodar o comando cucumber, ele olhe nesse arquivo, verifica as gems e as configurações para poder seguir com o teste. Segue o exemplo que vamos utilizar:

```ruby
require "cucumber"
require "httparty"
require "httparty/request"
require "httparty/response/headers"
require "faker"
require "rspec"
```
Onde, require "gem a ser utilizada" eu estou falando que para rodar esse projeto, eu estou utilizando essa gem.

Dica: Tem os requires no arquivo env.rb eu tenho que ter TODAS as gems instaladas no meu computador e/ou ambiente de trabalho.

Agora podemos ir para o próximo [tópico](https://github.com/thiagomarquessp/httpartyforall/blob/master/Fake_api.md), onde vamos falar sobre criar um endpoint para que possamos estudar e aplicar os conceitos.
