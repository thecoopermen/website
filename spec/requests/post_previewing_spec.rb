require 'spec_helper'

describe "previewing posts privately" do

  it "should require authentication" do
    get "/preview"
    response.code.should == "302"
    response.location.should =~ %r"/admin/login$"
  end
end
