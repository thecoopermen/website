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

require 'spec_helper'

describe Post do
  before do
    @post = create(:post)
  end

  it { should validate_presence_of(:permalink) }
  it { should validate_presence_of(:title) }

  context "#html_content" do

    it "should generate HTML content" do
      @post.content = "&"
      @post.html_content.should match(/&amp;/)
    end

    it "should produce an HTML safe string" do
      @post.html_content.html_safe?.should be_true
    end
  end

  context "#to_param" do
    before do
      @post = create(:post, title: 'Foo Bar')
    end

    it "should include parameterized version of the post title by default" do
      @post.to_param.should =~ /foo-bar/
    end

    it "should not change when the title of the post changes" do
      @post.update_attributes(title: 'Bar Foo')
      @post.to_param.should =~ /foo-bar/
    end
  end
end
