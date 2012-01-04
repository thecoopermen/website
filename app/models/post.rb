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
#  published    :boolean         default(FALSE)
#

class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'AdminUser'

  before_validation :generate_permalink,   :if => :new_record?
  after_initialize  :default_published_at, :if => :new_record?

  validates_presence_of :author_id, :permalink, :title

  def html_content
    @html_content ||= RedCloth.new(content).to_html.html_safe
  end

  def to_param
    "#{id}-#{permalink}"
  end

  def published_date
    published_at.to_date
  end

  def published_date=(string)
    midnight  = published_at.midnight
    time_secs = published_at.to_i - midnight.to_i
    write_attribute(:published_at, Chronic.parse(string + ' 00:00:00') + time_secs)
  end

  def published_time
    published_at.localtime
  end

  def published_time=(string)
    time_secs = Time.zone.parse(string).to_i - Time.zone.now.midnight.to_i
    write_attribute(:published_at, published_at.midnight + time_secs)
  end

  def published_at
    read_attribute(:published_at) || Time.now
  end

private

  def generate_permalink
    write_attribute(:permalink, title.to_s.parameterize) if permalink.blank?
  end

  def default_published_at
    write_attribute(:published_at, Time.now) if published_at.blank?
  end
end
