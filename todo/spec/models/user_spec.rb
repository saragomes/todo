require 'spec_helper'

describe User do
  it { validate_uniqueness_of :username }
  it { validate_presence_of :crypted_password }
  it { validate_presence_of :email }
  it { have_many :tasks }
  it { have_many :categories }
end
