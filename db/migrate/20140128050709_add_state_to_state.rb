class AddStateToState < ActiveRecord::Migration
  def change
    add_column :states, :state, :string
   add_column :states, :stcode, :string
  end
end
