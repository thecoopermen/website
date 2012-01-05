# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  twitter                :string(255)
#  bio                    :text
#  guest                  :boolean         default(FALSE)
#  icon_url               :string(255)
#  icon_url_ssl           :string(255)
#

class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :twitter, :bio, :guest, :icon_url

  validates_presence_of :twitter, :name, :bio

  before_validation :fetch_twitter_avatar

  default_scope order('name ASC')
  scope :non_guest, where(:guest => false)

  def twitter
    read_attribute(:twitter).to_s.sub(/^[^@]/, '@\0')
  end

  def twitter_url
    "http://twitter.com/" + read_attribute(:twitter).to_s.sub(/^@/, '')
  end

protected

  def password_required?
    false
  end

private

  def fetch_twitter_avatar
    if read_attribute(:twitter) && twitter_changed?
      icon_url     = Twitter.user(twitter.sub(/^@/, '').strip).profile_image_url
      icon_url_ssl = Twitter.user(twitter.sub(/^@/, '').strip).profile_image_url_https
      write_attribute(:icon_url,     icon_url)
      write_attribute(:icon_url_ssl, icon_url_ssl)
    end
  end
end
