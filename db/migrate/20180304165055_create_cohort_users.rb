class CreateCohortUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :cohort_users do |t|
      t.references :user, foreign_key: true
      t.references :cohort, foreign_key: true
    end
  end
end
