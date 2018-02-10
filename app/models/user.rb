class User < ApplicationRecord
  has_secure_password
  belongs_to :group

  private
  def self.generate_user email, group_id
    User.create(email: email, uuid: SecureRandom.uuid, password: SecureRandom.hex, active: false, group_id: group_id)
  end
end

