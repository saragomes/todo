class Task < ActiveRecord::Base
  attr_accessible :date, :done, :name, :user_id, :category_id
  belongs_to :user
  belongs_to :category
  
  validates_uniqueness_of :name
  validates_presence_of :name, :user, :category, :date, :done
end
