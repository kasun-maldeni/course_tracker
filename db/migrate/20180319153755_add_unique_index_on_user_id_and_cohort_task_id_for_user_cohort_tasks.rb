class AddUniqueIndexOnUserIdAndCohortTaskIdForUserCohortTasks < ActiveRecord::Migration[5.1]
  def change
    add_index :user_cohort_tasks, [:user_id, :cohort_task_id], unique: true
  end
end
