class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :quantity
      t.integer :price
      t.integer :sum
      t.string :unit
      t.string :comment
      t.string :supplier

      t.timestamps
    end
  end
end
