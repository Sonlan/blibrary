class ChangeTypeToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :type
    add_column :messages, :msg_type, :integer
  end
end
