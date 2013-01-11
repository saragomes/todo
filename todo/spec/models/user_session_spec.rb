require 'spec_helper'

describe UserSession do

  before(:each) do
    @current_user = FactoryGirl.create :user
    login(@current_user)
  end

end
