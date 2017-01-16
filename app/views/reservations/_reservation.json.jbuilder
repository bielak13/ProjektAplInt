json.extract! reservation, :id, :date_start, :date_stop, :user_id, :room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)