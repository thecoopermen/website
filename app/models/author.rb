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
#

class Author < ActiveRecord::Base
  has_many :posts
end
