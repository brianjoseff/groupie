require 'spec_helper'

describe SessionsController do
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create" do
    describe "failure"do
      before(:each) do
        @attr = {:email => "", :password => ""}
      end
      
      it "should re-render the page" do
        post :create, :session => @attr
        response.should render_template('new')
      end
    end
    
    describe "with valid email and password" do
      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password}  
      end
      
      it "should sign the user in" do
        post :create, :session => @attr
      end
      
      it "should redirect to the user show page" do
        post :create, :session => @attr
        response.should redirect_to(user_path(@user))
      end
    end
  end
end