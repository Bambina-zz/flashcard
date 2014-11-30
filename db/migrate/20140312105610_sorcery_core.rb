class SorceryCore < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false
    end
  end
end