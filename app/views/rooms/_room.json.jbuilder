json.extract! room, :id, :number, :type_id, :room_id, :created_at, :updated_at
json.url room_url(room, format: :json)