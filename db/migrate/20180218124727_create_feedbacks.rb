class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.references :user_group_task, foreign_key: true
      t.text :message
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
