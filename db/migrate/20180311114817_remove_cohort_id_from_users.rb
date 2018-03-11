class RemoveCohortIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cohort_id, :bigint
  end
end
