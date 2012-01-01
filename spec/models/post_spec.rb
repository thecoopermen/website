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

require 'spec_helper'

describe Post do
  before do
    @post = create(:post)
  end

  context "#html_content" do

    it "should generate HTML content" do
      @post.content = "&"
      @post.html_content.should match(/&amp;/)
    end

    it "should produce an HTML safe string" do
      @post.html_content.html_safe?.should be_true
    end
  end
end
