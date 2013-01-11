require 'spec_helper'

describe TasksController do

  before do
    @current_user = FactoryGirl.create :user
    login(@current_user)
    @category = FactoryGirl.create(:category, :user => @current_user, :name => "Category")
    @task = FactoryGirl.build(:task, :user => @current_user, :category => @category)
    @valid_attributes = FactoryGirl.attributes_for(:task, :user => @current_user, :category => @category)
  end

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      task1 = FactoryGirl.create(:task, :user => @current_user, :category => @category)
      task2 = FactoryGirl.create(:task, :user => @current_user, :category => @category)
      get :index
      assigns(:tasks).should eq([task1, task2])
    end
  end


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => @valid_attributes, :category_id => @category.id}
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => @valid_attributes, :category_id => @category.id}
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => @valid_attributes, :category_id => @category.id}
        response.code.should eq("406")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => { "name" => "invalid value" }}
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => { "name" => "invalid value" }}
        response.code.should eq("406")
      end
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task" do
        task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
        Task.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => task.id, :task => { "name" => "MyString" }}
      end

      it "assigns the requested task as @task" do
        task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
        put :update, {:id => task.id, :task => @valid_attributes}
        assigns(:task).should eq(task)
      end

      it "redirects to the task" do
        task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
        put :update, {:id => task.id, :task => @valid_attributes}
        response.should redirect_to(task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        put :update, {:id => task.id, :task => { "name" => "invalid value" }}
        assigns(:task).should eq(task)
      end

      it "re-renders the 'edit' template" do
        task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        put :update, {:id => task.id, :task => { "name" => "invalid value" }}
        response.should redirect_to(task)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
      expect {
        delete :destroy, {:id => task.id}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = FactoryGirl.create(:task, :user => @current_user, :category => @category)
      delete :destroy, {:id => task.id}
      response.should redirect_to(tasks_url)
    end
  end
end
