# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  subtitle     :string(255)
#  content      :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  author_id    :integer
#

class Post < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :author_id

  def html_content
    @html_content ||= RedCloth.new(content).to_html.html_safe
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
