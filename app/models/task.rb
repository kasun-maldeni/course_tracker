class Task < ApplicationRecord
  has_many :cohort_tasks
  has_many :cohorts, through: :cohort_tasks

  validates :name, :question_link, presence: true
end
