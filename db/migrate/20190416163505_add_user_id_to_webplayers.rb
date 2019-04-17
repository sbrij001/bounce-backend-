class AddUserIdToWebplayers < ActiveRecord::Migration[5.2]
  def change
    add_column :webplayers, :user_id, :integer
  end
end
