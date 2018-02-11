class User < ApplicationRecord
  has_secure_password
  validates :password, confirmation: true,
                       length: {minimum: 8}

  belongs_to :group
end
