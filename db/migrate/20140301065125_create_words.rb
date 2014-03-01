class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :word_type
      t.integer :user_id

      t.timestamps
    end
  end
end
