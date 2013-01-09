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
  
end
