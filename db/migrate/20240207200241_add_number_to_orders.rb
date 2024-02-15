class AddNumberToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :number, :integer
  end
end
