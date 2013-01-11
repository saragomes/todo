require 'spec_helper'

describe User do
  it { validate_uniqueness_of :username }
  it { validate_presence_of :username }
  it { validate_presence_of :crypted_password }
  it { validate_presence_of :email }
  it { have_many :tasks }
  it { have_many :categories }
  
  describe "today_task" do
    before do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @task1 = FactoryGirl.create(:task, :date => Date.yesterday, :done => false, :user => @user1)
      @task2 = FactoryGirl.create(:task, :date => Date.today, :done => false, :user => @user1)
      @task3 = FactoryGirl.create(:task, :date => Date.today, :done => true, :user => @user1)
      @task4 = FactoryGirl.create(:task, :date => Date.tomorrow, :done => false, :user => @user2)
      @task5 = FactoryGirl.create(:task, :date => Date.today, :done => false, :user => @user2)
      @task6 = FactoryGirl.create(:task, :date => Date.today, :done => true, :user => @user2)
    end
    context "When task is late" do
      it "user1 should have 1 today task" do
        @user1.today_tasks.should === [@task2]
      end
      it "should not be late" do
        @user2.today_tasks.should === [@task5]
      end
    end
  end
end
