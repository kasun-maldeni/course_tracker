class AddCreatedAtAndUpdatedAtToCohortUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :cohort_users, :created_at, :datetime, null: false
    add_column :cohort_users, :updated_at, :datetime, null: false
  end
end
