class GroupTask < ApplicationRecord
  belongs_to :group
  belongs_to :task

  scope :recent_tasks, ->(user) {
    where({
      group_id: user.group_id,
      release_date: 7.days.ago..Time.now
    })
    .order(release_date: :desc)
    .joins(:task)
    .includes(:task)
  }
end
