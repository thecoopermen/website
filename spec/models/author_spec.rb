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

require 'spec_helper'

describe Author do

  it { Author.should respond_to(:non_guest) }

  context "default scope" do

    it "should sort authors by name" do
      create(:author, name: 'Z')
      create(:author, name: 'A')
      authors = Author.all
      authors.first.name.should == 'A'
      authors.last.name.should == 'Z'
    end
  end

  context "#twitter" do

    it "should add a leading @ if one is not already there" do
      author = create(:author, twitter: 'foo')
      author.twitter.should == '@foo'
    end

    it "should not add a leading @ if one is already there" do
      author = create(:author, twitter: '@foo')
      author.twitter.should == '@foo'
    end
  end
end
