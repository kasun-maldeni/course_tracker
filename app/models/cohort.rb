class Cohort < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :cohort_tasks
  has_many :tasks, through: :cohort_tasks

  def create_staff email
    self.users.create_user 'staff', email
  end

  def create_student email
    self.users.create_user 'student', email
  end
end
