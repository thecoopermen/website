module AuthorHelper

  def icon_for(author)
    image_tag author.icon_url unless author.icon_url.blank?
  end
end
