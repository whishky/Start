module LawyersHelper
	def gravatar_for(lawyer)
		gravatar_id = Digest::MD5::hexdigest(lawyer.email_id.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url)
	end
end
