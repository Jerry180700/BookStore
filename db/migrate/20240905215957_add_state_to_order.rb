class AddStateToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :state, :string, default: 'pendiente'
  end
end
