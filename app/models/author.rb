# == Schema Information
#
# Table name: authors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  twitter    :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#  guest      :boolean         default(FALSE)
#  icon_url   :string(255)
#

class Author < ActiveRecord::Base
  has_many :posts

  validates_presence_of :twitter, :name, :bio

  before_validation :fetch_twitter_avatar, :if => :twitter_changed?

  default_scope order('name ASC')
  scope :non_guest, where(:guest => false)

  def twitter
    read_attribute(:twitter).to_s.sub(/^[^@]/, '@\0')
  end

private

  def fetch_twitter_avatar
    unless twitter.blank?
      icon_url = Twitter.user(twitter.sub(/^@/, '').strip).profile_image_url
      write_attribute(:icon_url, icon_url)
    end
  end
end
