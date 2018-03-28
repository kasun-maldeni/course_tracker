class Cohort < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :cohort_tasks
  has_many :tasks, through: :cohort_tasks

  validates :name, presence: true

  def create_staff email
    self.users.create(User.create_params 'staff', email)
  end

  def create_student email
    self.users.create(User.create_params 'student', email)
  end
end
