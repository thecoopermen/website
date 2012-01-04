require 'spec_helper'

describe "viewing posts publicly", :vcr do

  it "should display posts that are published" do
    create(:post, title: "A Testable Title", published: true)
    get "/"
    response.body.should include("A Testable Title")
  end

  it "should not display posts that are not published" do
    create(:post, title: "A Testable Title", published: false)
    get "/"
    response.body.should_not include("A Testable Title")
  end

  it "should order posts by publication date" do
    create(:post, title: "Title 2", published: true, published_at: Time.now)
    create(:post, title: "Title 3", published: true, published_at: Time.now - 2.days)
    create(:post, title: "Title 1", published: true, published_at: Time.now + 2.days)
    get "/"
    response.body.should =~ /Title 1.*Title 2.*Title 3/m
  end
end
