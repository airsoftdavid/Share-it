json.array!(@admins) do |admin|
	json.extract! admin, :id, :username, :email
	json.url admin_url(admin, format: :json)
	json.array!(admin.users.each) do |user|
	  json.extract! user,  :id, :name, :contact, :admin_id
	end
end