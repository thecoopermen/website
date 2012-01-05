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

require 'spec_helper'

describe AdminUser, :vcr do

  it { AdminUser.should respond_to(:non_guest) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:twitter) }
  it { should validate_presence_of(:bio) }

  context "default scope" do

    it "should sort admin_users by name" do
      create(:admin_user, name: 'Z')
      create(:admin_user, name: 'A')
      admin_users = AdminUser.all
      admin_users.first.name.should == 'A'
      admin_users.last.name.should == 'Z'
    end
  end

  context "creation" do

    it "should fill in the regular HTTP version of icon_url" do
      create(:admin_user, twitter: 'mcdonalds').icon_url.should =~ /^http/
    end

    it "should fill in the HTTPS version of icon_url" do
      create(:admin_user, twitter: 'mcdonalds').icon_url_ssl.should =~ /^https/
    end
  end

  context "#twitter" do

    it "should add a leading @ if one is not already there" do
      admin_user = create(:admin_user, twitter: 'foo')
      admin_user.twitter.should == '@foo'
    end

    it "should not add a leading @ if one is already there" do
      admin_user = create(:admin_user, twitter: '@foo')
      admin_user.twitter.should == '@foo'
    end
  end

  context "#twitter_url" do

    it "should generate a link to the admin_user's twitter profile" do
      admin_user = create(:admin_user, twitter: '@foo')
      admin_user.twitter_url.should =~ /twitter\.com\/foo/
    end
  end
end
