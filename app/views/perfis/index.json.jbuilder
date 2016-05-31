json.array!(@perfis) do |perfil|
  json.extract! perfil, :id, :identificador, :nome
  json.url perfil_url(perfil, format: :json)
end
