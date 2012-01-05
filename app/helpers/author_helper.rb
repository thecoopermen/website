module AuthorHelper

  def icon_for(author)
    url = (request.protocol.match(/^https/i)) ? author.icon_url_ssl : author.icon_url
    image_tag url unless url.blank?
  end
end
