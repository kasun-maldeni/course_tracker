class CreateUserGroupTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_group_tasks do |t|
      t.references :user, foreign_key: true
      t.references :group_task, foreign_key: true
      t.boolean :complete

      t.timestamps
    end
  end
end
