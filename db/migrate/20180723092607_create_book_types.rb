class CreateBookTypes < ActiveRecord::Migration
  def change
    create_table :book_types do |t|
      t.string :book_name
      t.text :introduction
      t.text :img_paths
      t.text :catalog

      t.timestamps null: false
    end
  end
end
