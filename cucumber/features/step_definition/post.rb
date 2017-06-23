Dado(/^que eu envie os parâmetros corretos para o endpoint clientes$/) do
  @body = {
    "nome": Faker::Name.name,
    "cpf": Faker::CPF.numeric,
    "endereco": Faker::StarWars.planet,
    "usuario": Faker::Pokemon.name,
    "senha": Faker::Base.numerify('inicial####')
  }.to_json
  @post_clientes = HTTParty.post 'http://localhost:3000/clientes/4',
    :body => @body,
    :headers => {
        "Content-Type" => 'application/json'
    }
end

Entao(/^um novo cliente é cadastrado com sucesso na base$/) do
  puts @post_clientes.body
  expect(@post_clientes.code).to eq 201
end
