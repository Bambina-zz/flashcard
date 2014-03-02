class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :content
      t.integer :word_id
      t.integer :user_id

      t.timestamps
    end
  end
end
