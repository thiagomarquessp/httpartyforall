## Configurando nosso ambiente de trabalho!!

Bom, para aqueles que estão vindo pela primeira vez, estou escrevendo do meu Mac, é aplicável no Windows e no Linux, mas não vou ficar reinventando a roda explicando as coisas ano Windows OK, não gosto e também não quero! Quando a Linux e Mac, na parte de configuração, Ok, consigo criar motivação para ajudar =).

Enfim, vamos precisar do ruby instalado na versão 2.2.2 ou superior. Para instalar o ruby:

Windows:

Necessário: rubyinstaller (http://rubyinstaller.org/downloads/).

Obs.: Quando se instala o ruby, será necessário a instalação do DevKit correspondente da versão que você instalou.

Mac:

Necessário: Baixar o Xcode pelo link: https://developer.apple.com/xcode/downloads/. Aprendi que sempre que instalar o SO, a primeira coisa será instalar o Xcode.

Bem, depois do Xcode, vamos baixar o Homebrew via terminal com o comando:

```ruby
ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)” .
```

Para explicar o que é o homebrew basta dizer: “O Homebrew instala as coisas que você precisa que a Apple não forneceu para você.” - fonte: http://brew.sh/index_pt-br.html. Ou seja, é um gerenciador de pacotes.

Reinicie a máquina (isso mesmo, para “completar as instalações”).

Com o Homebrew instalado, será necessário instalar o “Qt” - Framework multiplataforma para desenvolvimento de interfaces gráficas - fonte: (http://pt.wikipedia.org/wiki/Qt) e serve basicamente para podermos utilizar o selenium como driver padrão de execução para os testes. Para instalar o Qt, é bem simples:

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
