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
#  permalink    :string(255)
#

class Post < ActiveRecord::Base
  belongs_to :author

  before_validation :generate_permalink, :if => :new_record?

  validates_presence_of :author_id, :permalink, :title

  def html_content
    @html_content ||= RedCloth.new(content).to_html.html_safe
  end

  def to_param
    "#{id}-#{permalink}"
  end

private

  def generate_permalink
    if permalink.blank?
      write_attribute(:permalink, title.to_s.parameterize)
    end
  end
end
