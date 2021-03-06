require 'spec_helper'

describe Task do
  it { belong_to :user }
  it { belong_to :category }
  it { validate_presence_of :name }
  it { validate_presence_of :user }
  it { validate_presence_of :category }
  it { validate_presence_of :date }
  
  describe "late" do
    context "When task is late" do
      before do
        @task1 = FactoryGirl.create(:task, :date => Date.yesterday, :done => false)
        @task2 = FactoryGirl.create(:task, :date => Date.today, :done => false)
      end
      it "should be late" do
        @task1.late?.should be_true
        @task2.late?.should be_true
      end
      it "should not be late" do
        @task1.update_attribute(:done, true)
        @task1.late?.should be_false
      end
      
      it "should not be late" do
        @task2.update_attribute(:done, true)
        @task2.late?.should be_false
      end
    end
    
    context "When task is not late" do
      before do
        @task3 = FactoryGirl.create(:task, :date => Date.tomorrow, :done => false)
      end
      it "should not be late" do
        @task3.late?.should be_false
      end
      it "should not be late" do
        @task3.update_attribute(:done, true)
        @task3.late?.should be_false
      end
    end
  end
  
  describe "destroy_category?" do
   before do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @category1 = FactoryGirl.create(:category, :user => @user1, :name => "Category")
      @category2 = FactoryGirl.create(:category, :user => @user2, :name => "Category")
      @task1 = FactoryGirl.create(:task, :category => @category1, :user => @user1)
      @task2 = FactoryGirl.create(:task, :category => @category2, :user => @user2)
      @task3 = FactoryGirl.create(:task, :category => @category2, :user => @user2)
    end
    context "When Category should be destroyed" do
      before do
        @task1.destroy
        @result = @task1.destroy_category?
      end
      
      it "should return the category task" do
        @result.should === @category1
      end
      
      it "should destroy Category1" do
        @user1.categories.should be_empty
      end
      
    end

    context "When Category should not be destroyed" do
      before do
        @task2.destroy
        @result = @task2.destroy_category?
      end
      
      it "should be true" do
        @result.should be_false
      end
      
      it "destroy Category1" do
        @user2.categories.should === [@category2]
      end
    end

  end
  
end
