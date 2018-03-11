class AddIndexOnReleaseDateForCohortTasks < ActiveRecord::Migration[5.1]
  def change
    add_index :cohort_tasks, :release_date
  end
end
