class AddSolutionLinkAndQuestionLinkColumnsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :question_link, :text
    add_column :tasks, :solution_link, :text
    remove_column :tasks, :link
  end
end
