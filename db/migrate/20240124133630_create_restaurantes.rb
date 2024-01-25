class CreateRestaurantes < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurantes do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :post_code
      t.string :email
      t.string :telephone
      t.string :mobile
      t.string :VAT
      t.integer :NIT
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
