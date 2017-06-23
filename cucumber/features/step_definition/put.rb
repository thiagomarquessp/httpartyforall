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
