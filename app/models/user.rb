class User < ApplicationRecord
  belongs_to :cohort
  has_and_belongs_to_many :cohorts

  has_secure_password
  validates :email, :first_name, :last_name, :github_username, presence: true
  validates :password, confirmation: true,
                       length: {minimum: 8},
                       format: {
                         with: /(?=.*[A-Z])(?=.*[\d])/,
                         message: 'must include at least one number and capital letter'
                       }
end
