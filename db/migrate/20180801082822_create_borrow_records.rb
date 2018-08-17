class CreateBorrowRecords < ActiveRecord::Migration
  def change
    create_table :borrow_records do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :borrow_time
      t.integer :time_limit
      t.integer :status
      t.string :book_name
      t.string :serial_code
      t.string :user_name

      t.timestamps null: false
    end
  end
end
