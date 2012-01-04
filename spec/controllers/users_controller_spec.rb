require 'spec_helper'

describe UsersController, "show User" do
  render_views

  describe "GET 'index'" do

    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(root_path)
      end
    end
    
    describe "for signed-in-users" do
      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password}  
      end
      
     #  it "should be successful" do
     #         get :index
     #         response.should be_success
     #       end
      
      it "should have delete links for admins" do
        @user.toggle!(:admin)
        other_user = User.all.second
        get :index
        response.should have_selector('a', :href => user_path(other_user),
                                           :content => "delete")
      end

      it "should not have delete links for non-admins" do
        other_user = User.all.second
        get :index
        response.should_not have_selector('a', :href => user_path(other_user),
                                               :content => "delete")
      end
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end
  
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
  
  end
end