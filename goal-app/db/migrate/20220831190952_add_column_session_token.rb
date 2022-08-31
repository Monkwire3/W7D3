class AddColumnSessionToken < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :session_token, :string, null: false, index: { unique: true }
  end
end
