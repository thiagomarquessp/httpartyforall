# Verbos HTTP REST

A melhor definição que achei para API foi: "Interface de Programação de Aplicação, cujo acrônimo API provém do Inglês Application Programming Interface, é um conjunto de rotinas e padrões estabelecidos por um software para a utilização das suas funcionalidades por aplicativos que não pretendem envolver-se em detalhes da implementação do software, mas apenas usar seus serviços.". Fonte:  [wikipedia](https://pt.wikipedia.org/wiki/Interface_de_programa%C3%A7%C3%A3o_de_aplica%C3%A7%C3%B5es).

Agora que entendemos um pouco sobre o que é uma API, vamos entender um pouco sobre REST ou RESTful e também achei uma definição interessante sobre o tema: "	A REST (Transferência do Estado Representativo) é pensada como uma imagem do design da aplicação se comportará: uma rede de sítios da Teia (um estado virtual), onde o utilizador progride com uma aplicação clicando em vínculos (transições do estado), tendo como resultado a página seguinte (que representa o estado seguinte da aplicação) que está sendo transferida ao utilizador e apresentada para seu uso.". Fonte: [wikipedia](https://pt.wikipedia.org/wiki/REST).

# Ta bom, e os tais verbos HTTP?

Se são verbos nada mais são que ações que eu desejo realizar. No nosso caso, vamos tratar um endopoint chamado clientes e vamos poder inserir cliente, editar, buscar, deletar:

```ruby
Endpoint        |   Verbo   |   Ação
/clientes       |    GET    | Retorna a lista completa de clientes
/clientes       |   POST    | Insere um novo cliente
/clientes/{id}  |    GET    | Retorna o cliente com id = {id}
/clientes/{id}  |    PUT    | Edita algum paramêtro do cadastro do meu cliente com id = {id}
/clientes/{id}  |  DELETE   | Deleta algum cliente com id = {id}
```
Agora que entendemos mais ou menos como vai funcionar ou como vamos trabalhar, vamos seguir para a [configuração do nosso ecossistema](https://github.com/thiagomarquessp/httpartyforall/blob/master/Configurando_Ambiente.md).
