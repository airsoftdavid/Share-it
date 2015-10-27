module AdminsHelper
	 # Returns the Gravatar for the given user.
  def gravatar_for(admin, options= { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(admin.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: admin.username, class: "gravatar")
  end
end
