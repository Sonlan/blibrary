class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :type
      t.string :title
      t.text :content
      t.datetime :create_time

      t.timestamps null: false
    end
  end
end
