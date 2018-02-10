class Group < ApplicationRecord
  has_many :users
  has_many :group_tasks
  has_many :groups, through: :group_tasks
end

