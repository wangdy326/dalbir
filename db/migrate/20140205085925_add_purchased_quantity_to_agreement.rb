class AddPurchasedQuantityToAgreement < ActiveRecord::Migration
  def change
  	remove_column :agreements, :purchasedqty
    add_column :agreements, :purchasedqty, :integer
  end
end
