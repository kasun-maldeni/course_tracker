class ChangeActiveToSignedUpInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :active
    add_column :users, :signed_up, :boolean
  end
end

