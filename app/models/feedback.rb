class Feedback < ApplicationRecord
  belongs_to :user_cohort_task
  belongs_to :author, class_name: 'User'
end
