class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :title
      t.string :address
      t.integer :tin

      t.timestamps
    end
  end
end
