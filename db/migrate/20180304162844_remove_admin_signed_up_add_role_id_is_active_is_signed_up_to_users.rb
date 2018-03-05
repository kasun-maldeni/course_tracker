class RemoveAdminSignedUpAddRoleIdIsActiveIsSignedUpToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin, :boolean
    rename_column :users, :signed_up, :is_signed_up
    add_reference :users, :role, foreign_key: true
    add_column :users, :is_active, :boolean
  end
end
