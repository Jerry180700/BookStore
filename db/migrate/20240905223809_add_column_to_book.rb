class AddColumnToBook < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :img_url, :string
  end
end
