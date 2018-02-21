class Group < ApplicationRecord
  has_many :users
  has_many :group_tasks
  has_many :tasks, through: :group_tasks

  def create_user email
    self.users.create(email: email, uuid: SecureRandom.uuid, password: SecureRandom.hex, signed_up: false, admin: false)
  end
end
