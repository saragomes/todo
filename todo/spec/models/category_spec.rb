require 'spec_helper'

describe Category do
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user }
  it { should have_many :tasks }
  it { should belong_to :user }
end
