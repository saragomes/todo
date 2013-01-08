class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.date :date
      t.boolean :done

      t.timestamps
    end
  end
end
