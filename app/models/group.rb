class Group < ApplicationRecord
  has_many :users
  has_many :group_tasks
  has_many :tasks, through: :group_tasks
end
