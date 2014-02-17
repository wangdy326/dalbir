class Changepqty < ActiveRecord::Migration
  def up
  remove_column :agreements, :purchasedqty
    add_column :agreements, :purchasedqty, :integer
  end

  def down
  end
end
