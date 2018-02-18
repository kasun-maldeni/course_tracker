class CreateGroupTaskCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :group_task_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
