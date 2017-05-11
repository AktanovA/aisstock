class AddUnitToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :unit, :integer
  end
end
