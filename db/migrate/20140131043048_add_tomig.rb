class AddTomig < ActiveRecord::Migration
  def up
  	remove_column :agreements, :agreement_customer
  	remove_column :agreements, :agreement_vendor
  	add_column :agreements, :customer, :string
  end

  def down
  end
end
