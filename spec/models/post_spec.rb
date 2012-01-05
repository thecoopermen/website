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

require 'spec_helper'

describe Post, :vcr do
  before do
    @post = create(:post)
  end

  it { should validate_presence_of(:permalink) }
  it { should validate_presence_of(:title) }

  context "instantiating a new post" do
    before do
      @post = Post.new
    end

    it "should initialize the publish date to the current date/time" do
      # hard to assert but running this spec should never take more than 5 seconds
      @post.published_at.to_i.should > Time.now.to_i - 5
      @post.published_at.to_i.should < Time.now.to_i + 5
    end
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

  context "#published_date" do
    it "should return a date object" do
      @post.published_date.should be_an_instance_of(Date)
    end

    it "should default to today" do
      @post.published_date.should == Time.now.to_date
    end

    it "should reflect the date portion of the published_at field" do
      @post = create(:post, published_at: 2.days.ago)
      @post.published_date.should == 2.days.ago.to_date
    end
  end

  context "#published_time" do
    it "should return a time object" do
      @post.published_time.should be_an_instance_of(Time)
    end

    it "should default to the current time" do
      @post.published_time.to_i.should > Time.now.to_i - 5
      @post.published_time.to_i.should < Time.now.to_i + 5
    end

    it "should reflect the time portion of the published_at field" do
      time  = 2.days.ago
      @post = create(:post, published_at: time)
      @post.published_time.to_s.should == time.to_s
    end
  end

  context "#published_date and #published_time setters" do
    before do
      @post = create(:post, published_at: Time.zone.parse("1984-01-22 08:15:00"))
    end

    it "#published_date= should update the date but not the time" do
      @post.published_date = "1/1/1999"
      @post.published_at.to_s.should =~ /^1999-01-01 08:15:00/
    end

    it "#published_time= should update the time but not the date" do
      @post.published_time = '3:00pm'
      @post.published_at.to_s.should =~ /1984-01-22 15:00:00/
    end

    it "should work properly from an initializer" do
      @post = Post.new(published_date: '1/1/1999', published_time: '12:30pm')
      @post.published_at.to_s.should =~ /1999-01-01 12:30:00/
    end
  end
end
