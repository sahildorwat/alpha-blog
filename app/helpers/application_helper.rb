module ApplicationHelper
    def gravtar_for(user, options = {size: 90})
        gravtar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravtar_url = "https://secure.gravatar.com/avatar/#{gravtar_id}?s#{:size}"
        image_tag(gravtar_url, alt: user.username, class: 'img-circle')
    end
end
