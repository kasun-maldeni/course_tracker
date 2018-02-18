class AddCategoryIdToGroupTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :group_tasks, :category, foreign_key: {to_table: :group_task_categories}
  end
end

