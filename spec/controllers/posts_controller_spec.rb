require 'spec_helper'

describe PostsController do
  
  describe "GET 'show'" do
    before(:each) do
      @post = Factory(:post)
    end
  
    it "should be successful" do
      get :show, :id => @post
      response.should be_success
    end
  
  end
end