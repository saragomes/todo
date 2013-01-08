require 'spec_helper'

describe UserSession do
=begin
  before(:each) do
    @current_user = FactoryGirl.build :user
    login(@current_user)
  end
=end

  before(:each) do
    activate_authlogic
    UserSession.create(@user)
  end

end
