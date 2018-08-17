json.extract! message, :id, :user_id, :type, :title, :content, :create_time, :created_at, :updated_at
json.url message_url(message, format: :json)
