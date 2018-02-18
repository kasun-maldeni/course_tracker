class User < ApplicationRecord
  has_secure_password
  validates :password, confirmation: true,
                       length: {minimum: 8}

  belongs_to :group
  has_many :user_group_tasks
  has_many :group_tasks, through: :user_group_tasks
end

