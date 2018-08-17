class AddStatusToBookTypes < ActiveRecord::Migration
  def change
    add_column :book_types, :status, :integer
  end
end
