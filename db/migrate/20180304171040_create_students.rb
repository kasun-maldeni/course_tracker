class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :user, foreign_key: true
      t.integer :homework_completion_percentage

      t.timestamps
    end
  end
end
