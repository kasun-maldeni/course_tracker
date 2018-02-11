class Group < ApplicationRecord
  has_many :users
  has_many :group_tasks
  has_many :tasks, through: :group_tasks

  private
  def create_user email
    self.users.create(email: email, uuid: SecureRandom.uuid, password: SecureRandom.hex, active: false)
  end
end
