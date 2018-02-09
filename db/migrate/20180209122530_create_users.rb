class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.text :password_digest
      t.string :first_name
      t.string :last_name
      t.string :github_username
      t.boolean :active
      t.string :uuid

      t.timestamps
    end
  end
end
