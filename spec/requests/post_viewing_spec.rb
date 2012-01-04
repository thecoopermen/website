require 'spec_helper'

describe "viewing posts publicly", :vcr do

  it "should display posts that are published" do
    create(:post, title: "A Testable Title", published: true)
    visit root_url
    page.should have_content("A Testable Title")
  end

  it "should not index posts that are not published" do
    create(:post, title: "A Testable Title", published: false)
    visit root_url
    page.should_not have_content("A Testable Title")
  end

  it "should not show posts that are not published" do
    post = create(:post, title: "A Testable Title", published: false)
    lambda { visit post_url(post) }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "should order posts by publication date" do
    create(:post, title: "Title 2", published: true, published_at: Time.now)
    create(:post, title: "Title 3", published: true, published_at: Time.now - 2.days)
    create(:post, title: "Title 1", published: true, published_at: Time.now + 2.days)
    get "/"
    response.body.should =~ /Title 1.*Title 2.*Title 3/m
  end
end
