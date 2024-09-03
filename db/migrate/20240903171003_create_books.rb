class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :genre
      t.integer :isbn
      t.text :synopsis
      t.integer :available_quantity
      t.float :price

      t.timestamps
    end
  end
end
