json.array!(@users) do |user|
	json.extract! user,  :id, :name, :contact, :admin_id
	json.url user_url(user, format: :json)
end