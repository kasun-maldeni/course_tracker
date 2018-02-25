class Task < ApplicationRecord
  has_many :group_tasks
  has_many :groups, through: :group_tasks

  validates :name, :question_link, presence: true
end
