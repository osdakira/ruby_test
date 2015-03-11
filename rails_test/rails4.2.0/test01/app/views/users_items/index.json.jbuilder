json.array!(@users_items) do |users_item|
  json.extract! users_item, :id, :user_id, :item_id
  json.url users_item_url(users_item, format: :json)
end
