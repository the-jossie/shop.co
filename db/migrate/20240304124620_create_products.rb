class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :currency
      t.float :former_price
      t.float :percentage_discount
      t.integer :rating
      t.string :colors, array: true, default: [].to_yaml
      t.integer :sizes, array: true, default: [].to_yaml
      t.integer :count
      t.integer :noOfSales

      t.timestamps
    end
  end
end
