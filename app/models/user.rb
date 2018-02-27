class User < ApplicationRecord
  belongs_to :cohort
  has_many :user_cohort_tasks
  has_many :cohort_tasks, through: :user_cohort_tasks

  has_secure_password
  validates :email, :first_name, :last_name, :github_username, presence: true
  validates :password, confirmation: true,
                       length: {minimum: 8},
                       format: {
                         with: /(?=.*[A-Z])(?=.*[\d])/,
                         message: 'must include at least one number and capital letter'
                       }
end
