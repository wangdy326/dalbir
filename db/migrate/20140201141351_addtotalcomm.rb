class Addtotalcomm < ActiveRecord::Migration
  def up
	add_column :agreements, :total_qty, :string
  end

  def down
  end
end
