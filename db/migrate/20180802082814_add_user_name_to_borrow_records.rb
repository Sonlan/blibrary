class AddUserNameToBorrowRecords < ActiveRecord::Migration
  def change
    remove_column :borrow_records, :time_limit
    add_column :borrow_records, :time_limit, :datetime
  end
end
