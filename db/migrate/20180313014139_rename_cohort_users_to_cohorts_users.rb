class RenameCohortUsersToCohortsUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :cohort_users, :cohorts_users
  end
end
