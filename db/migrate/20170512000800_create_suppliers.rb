class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :title
      t.string :address
      t.string :comment

      t.timestamps
    end
  end
end
