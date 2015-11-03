class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :content
    end
  end
end
