class AddDepartmentToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :department, :string
  end
end
