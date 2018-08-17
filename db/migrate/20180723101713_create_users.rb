class CreateUsers < ActiveRecord::Migration
  def change
    # drop_table :users
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :mail
      t.integer :permission

      t.timestamps null: false
    end
  end
end
