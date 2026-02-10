json.extract! solicitante, :id, :nombre, :aprobado, :email, :created_at, :updated_at
json.url solicitante_url(solicitante, format: :json)
