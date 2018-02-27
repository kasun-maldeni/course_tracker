class AddOptionalAndAdvancedFieldsToCohortTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :cohort_tasks, :optional, :boolean
    add_column :cohort_tasks, :advanced, :boolean
  end
end

