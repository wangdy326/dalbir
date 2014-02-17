class AddUnitPriceEToItems < ActiveRecord::Migration
  def change
    add_column :items, :unit_price_e, :string
  end
end
