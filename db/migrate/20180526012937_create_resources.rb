class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
     t.integer :topic_id
     t.string :title
     t.string :content
    end
  end
end
