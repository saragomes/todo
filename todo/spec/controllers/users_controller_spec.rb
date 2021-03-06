require 'spec_helper'

describe UsersController do

  before do
    @user = FactoryGirl.create(:user) 
    @valid_attributes = FactoryGirl.attributes_for(:user)
   end

  describe "GET new" do
    it "should render template new" do
      get :new
      response.should render_template :new
    end
  end
  
  describe "GET 'edit'" do
    before do
      get 'show', :id => @user.id
    end
    
    it "returns http success" do
      response.should be_redirect
    end
  end
  
  
  describe "POST create" do
    describe "with valid params" do
      
      it "creates a new User" do
        expect {
          post :create, {:user => @valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => @valid_attributes}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end
 
      it "redirects to the created user" do
        post :create, {:user => @valid_attributes}
        response.should redirect_to tasks_url
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "username" => "invalid value" }}
        assigns(:user).should be_a_new(User)
      end
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "username" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before do
      login @user
    end
    
    describe "with valid params" do
      it "updates the requested user" do
        put :update, {:id => @user.id, :user => { "username" => "MyNewString" }}
      end

      it "assigns the requested user as @user" do
        put :update, {:id => @user.id, :user => @valid_attributes}
        assigns(:user).should eq(@user)
      end

      it "redirects to the user" do
        put :update, {:id => @user.id, :user => @valid_attributes}
        response.should redirect_to(@user)
      end
    end
    
    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! @valid_attributes
        put :update, {:id => user.id, :user => { "email" => "invalid value" }}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! @valid_attributes
        put :update, {:id => user.id, :user => { "email" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end
end
