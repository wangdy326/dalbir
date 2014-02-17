class AddAgreementdateToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :agreementdate, :string
  end
end
