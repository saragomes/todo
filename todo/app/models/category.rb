class Category < ActiveRecord::Base
  attr_accessible :name, :user_id
  validates_uniqueness_of :name, :scope => :user_id
  validates_presence_of :name, :user
  has_many :tasks
  belongs_to :user
end
