class CohortTask < ApplicationRecord
  belongs_to :cohort
  belongs_to :task
  belongs_to :category, class_name: 'CohortTaskCategory'
  has_many :user_cohort_tasks, dependent: :destroy
  has_many :users, through: :user_cohort_tasks

  scope :recent_tasks, ->(cohort_id) {
    tasks_for_cohort(cohort_id)
    .where(release_date: 7.days.ago..Time.now)
    .includes(:category)
  }

  scope :warmups, ->(user) {
    by_category('warmup', user.cohorts.first.id)
  }

  scope :homework, ->(user) {
    by_category('homework', user.cohorts.first.id)
    .joins(:user_cohort_tasks)
    .includes(:user_cohort_tasks)
    .where(user_cohort_tasks: {user_id: user.id})
  }

  scope :by_category, ->(category_name, cohort_id) {
    tasks_for_cohort(cohort_id)
    .where(cohort_task_categories: {name: category_name})
    .where('release_date < ?', Time.now)
  }

  scope :tasks_for_cohort, ->(cohort_id) {
    where(cohort_id: cohort_id)
    .order(release_date: :desc)
    .joins(:task, :category)
    .includes(:task)
  }
end
