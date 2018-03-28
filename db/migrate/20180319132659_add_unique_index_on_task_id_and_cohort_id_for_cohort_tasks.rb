class AddUniqueIndexOnTaskIdAndCohortIdForCohortTasks < ActiveRecord::Migration[5.1]
  def change
    add_index :cohort_tasks, [:cohort_id, :task_id], unique: true
  end
end
