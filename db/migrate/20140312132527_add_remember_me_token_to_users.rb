class AddRememberMeTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_me_token, :string
    add_column :users, :remember_me_token_expires_at, :datetime
  end
end
