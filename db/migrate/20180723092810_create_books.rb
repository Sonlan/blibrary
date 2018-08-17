class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :book_type_id
      t.string :serial_code
      t.integer :status
      t.integer :borrow_times
      t.datetime :create_time

      t.timestamps null: false
    end
  end
end
