class Feedback < ApplicationRecord
  belongs_to :user_group_task
  belongs_to :author, class_name: 'User'
end

