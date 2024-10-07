json.extract! post, :id, :title, :body, :published, :tracking_id, :created_at, :updated_at
json.url post_url(post, format: :json)
