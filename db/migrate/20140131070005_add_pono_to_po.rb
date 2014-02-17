class AddPonoToPo < ActiveRecord::Migration
  def change
    add_column :pos, :pono, :string
  end
end
