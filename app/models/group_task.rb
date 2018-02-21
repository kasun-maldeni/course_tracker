class GroupTask < ApplicationRecord
  belongs_to :group
  belongs_to :task
  belongs_to :category, class_name: 'GroupTaskCategory'
  has_many :user_group_tasks
  has_many :users, through: :user_group_tasks

  scope :recent_tasks, ->(group_id) {
    tasks_for_group(group_id)
    .where(release_date: 7.days.ago..Time.now)
    .includes(:category)
  }

  scope :warmups, ->(user) {
    by_category('warmups', user.group_id)
  }

  scope :homework, ->(user) {
    by_category('homework', user.group_id)
    .joins(:user_group_tasks)
    .includes(:user_group_tasks)
    .where(user_group_tasks: {user_id: user.id})
  }

  scope :by_category, ->(category_name, group_id) {
    tasks_for_group(group_id)
    .where(group_task_categories: {name: category_name})
  }

  scope :tasks_for_group, ->(group_id) {
    where(group_id: group_id)
    .order(release_date: :desc)
    .joins(:task, :category)
    .includes(:task)
  }
end
