class Student < ApplicationRecord
  belongs_to :user
  has_many :user_cohort_tasks
  has_many :cohort_tasks, through: :user_cohort_tasks
end
