require 'spec_helper'

describe UserSessionsController do

=begin 
  describe "GET 'new'" do
    it "should only get new if logged out" do
      get :new
      response.should == "200"
    end
  end

  describe "Post Connection" do
    context "When user credentials are valid " do
      before do
        @user = FactoryGirl.create(:user) 
        post :create, :user_session => {:username => @user.username, :password => @user.password }
      end
      it { response.should == :success }
      it { redirect_to tasks_path }
    end

    context "When user credentials are  not valid " do
      before do
        @user = FactoryGirl.create(:user, :username => "test", :password => "test", :password_confirmation => "test") 
        post :create, :user_session => {:username => @user.username, :password => "invalid" }
      end
      specify {response.should render_template :new}
    end
  end
=end

  describe "Get disconnect" do
    before do
      @user = FactoryGirl.create(:user) 
      login @user
      delete :destroy
    end
    it { should render_template(:new) }
  end

end
