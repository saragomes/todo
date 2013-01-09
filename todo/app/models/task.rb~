class Task < ActiveRecord::Base
  attr_accessible :date, :done, :name, :user_id, :category_id
  belongs_to :user
  belongs_to :category
  
  validates_presence_of :name, :user, :category, :date
  
  def late?
    self.date <= Date.today && !self.done
  end
  
  def destroy_category?
    return false if self.category.nil?
    return self.category.destroy if self.category.tasks.empty?
    false
  end
end
