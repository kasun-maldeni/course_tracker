class Cohort < ApplicationRecord
  has_many :users
  has_many :cohort_tasks
  has_many :tasks, through: :cohort_tasks

  def create_student email
    role_id = Role.find_by(name: 'student')
    self.users.create(email: email, uuid: SecureRandom.uuid, password: SecureRandom.hex, is_signed_up: false, is_active: true, role_id: role_id)
  end
end
