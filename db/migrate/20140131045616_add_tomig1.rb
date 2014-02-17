class AddTomig1 < ActiveRecord::Migration
  def up
	add_column :agreements, :agreement_customer, :string
  	add_column :agreements, :agreement_vendor, :string
  	remove_column :agreements, :customer
  	remove_column :agreements, :vendor_id

  end

  def down
  end
end
