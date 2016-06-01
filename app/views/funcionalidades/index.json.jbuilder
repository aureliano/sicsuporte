json.array!(@funcionalidades) do |funcionalidade|
  json.extract! funcionalidade, :id, :identificador, :nome, :descricao
  json.url funcionalidade_url(funcionalidade, format: :json)
end
