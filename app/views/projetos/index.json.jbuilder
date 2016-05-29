json.array!(@projetos) do |projeto|
  json.extract! projeto, :id, :nome, :descricao, :integracao_continua
  json.url projeto_url(projeto, format: :json)
end
