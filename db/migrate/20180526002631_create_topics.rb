class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
    end 
  end
end
