class Cohort < ApplicationRecord
  has_many :users
  has_many :cohort_tasks
  has_many :tasks, through: :cohort_tasks

  def create_user email
    self.users.create(email: email, uuid: SecureRandom.uuid, password: SecureRandom.hex, signed_up: false, admin: false)
  end
end
