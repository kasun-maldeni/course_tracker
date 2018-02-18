class UserGroupTask < ApplicationRecord
  belongs_to :user
  belongs_to :group_task
  has_many :feedbacks
end
