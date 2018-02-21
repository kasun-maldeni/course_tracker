class UserGroupTask < ApplicationRecord
  belongs_to :user
  belongs_to :group_task
  has_many :feedbacks

  scope :task_progress, ->(user_group_task_id) {
    joins(group_task: [:task], feedbacks: [:author])
    .includes(group_task: [:task], feedbacks: [:author])
    .where(id: user_group_task_id).first
  }
end
