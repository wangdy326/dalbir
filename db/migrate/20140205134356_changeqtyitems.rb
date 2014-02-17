class Changeqtyitems < ActiveRecord::Migration
  def up
	add_column :items, :qty_string, :integer
  end

  def down
  end
end
