class User < ApplicationRecord
  belongs_to :group
  has_many :user_group_tasks
  has_many :group_tasks, through: :user_group_tasks
  
  has_secure_password
  validates :email, :first_name, :last_name, :github_username, presence: true
  validates :password, confirmation: true,
                       length: {minimum: 8}
end
