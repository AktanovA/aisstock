class AddSupplerRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :supplier, foreign_key: true
  end
end
