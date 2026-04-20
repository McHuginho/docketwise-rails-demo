json.extract! evento, :id, :titulo, :descripcion, :fecha, :user_id, :created_at, :updated_at
json.url evento_url(evento, format: :json)
