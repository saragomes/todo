class User < ActiveRecord::Base
  acts_as_authentic
  validates_uniqueness_of :username
  validates_presence_of :username, :crypted_password, :email
  attr_accessible :crypted_password, :email, :password_salt, :persistence_token, :username, :password, :password_confirmation
  has_many :tasks
  has_many :categories
end
