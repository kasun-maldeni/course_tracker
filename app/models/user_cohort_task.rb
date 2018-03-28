class UserCohortTask < ApplicationRecord
  belongs_to :user
  belongs_to :cohort_task
  has_many :feedbacks

  scope :task_progress, ->(user_cohort_task_id) {
    joins(cohort_task: [:task], feedbacks: [:author])
    .includes(cohort_task: [:task], feedbacks: [:author])
    .where(id: user_cohort_task_id)
    .order('feedbacks.created_at DESC')
    .first
  }
end
