class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :content
      t.timestamps
    end
  end
end
