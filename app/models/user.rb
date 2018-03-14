class User < ApplicationRecord
  has_and_belongs_to_many :cohorts
  belongs_to :role

  has_secure_password
  validates :email, :first_name, :last_name, :github_username, presence: true, on: :update
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true,
                       length: {minimum: 8},
                       format: {
                         with: /(?=.*[A-Z])(?=.*[\d])/,
                         message: 'must include at least one number and capital letter'
                       }, on: :update

  def self.create_admin email
    create_user 'admin', email
  end

  def create_cohort name
    self.cohorts.create(name: name) if self.role.name == 'admin'
  end

  def self.create_user role_name, email
    role_id = Role.find_by(name: role_name).id
    User.create(email: email, uuid: SecureRandom.uuid, password: SecureRandom.hex, is_signed_up: false, is_active: true, role_id: role_id)
  end
end
