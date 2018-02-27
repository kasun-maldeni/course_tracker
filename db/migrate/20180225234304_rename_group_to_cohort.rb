class RenameGroupToCohort < ActiveRecord::Migration[5.1]
  def change
    rename_table :groups, :cohorts
    rename_table :group_task_categories, :cohort_task_categories
    rename_table :group_tasks, :cohort_tasks
    rename_column :cohort_tasks, :group_id, :cohort_id
    rename_table :user_group_tasks, :user_cohort_tasks
    rename_column :user_cohort_tasks, :group_task_id, :cohort_task_id
    rename_column :feedbacks, :user_group_task_id, :user_cohort_task_id
    rename_column :users, :group_id, :cohort_id
  end
end
