class GroupTask < ApplicationRecord
  belongs_to :group
  belongs_to :task
  belongs_to :category, class_name: 'GroupTaskCategory', foreign_key: 'category_id'

  def release_date_user_time
    release_date.in_time_zone('Melbourne').strftime('%d %b, %I:%M %p')
  end

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
